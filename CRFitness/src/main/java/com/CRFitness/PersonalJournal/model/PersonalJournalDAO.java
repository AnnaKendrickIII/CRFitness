package com.CRFitness.PersonalJournal.model;

import java.util.List;

import javassist.bytecode.ByteArray;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import org.hibernate.type.StringType;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


@Repository("personalJournalDAO")
@Transactional(transactionManager = "transactionManager")
public class PersonalJournalDAO implements PersonalJournalDAO_interface {
	// 所有的日誌
	private static final String GET_ALL_STMT = "from PersonalJournalVO ";
	// 個人所有日誌
	private static final String GET_MYSELF_JOURNAL = 
			"select PersonalJournal.*,(select Members.Nickname from Members where Members.Member_Id = PersonalJournal.Member_Id) as JournalNickname from PersonalJournal where Member_Id=:member_Id and publicStatus != '4' order by publishTime desc";
	// 查朋友日誌										
	private static final String GET_FRIEND_JOURNAL = 
			"select PersonalJournal.*,(select Members.Nickname from Members where Members.Member_Id = PersonalJournal.Member_Id) as friendJournalNickname from PersonalJournal where Member_Id=:member_Id and publicStatus != '0' and publicStatus != '4' order by publishTime desc";
	
	// 查非好朋友日誌										
	private static final String GET_OTHER_JOURNAL = 
				"select PersonalJournal.*,(select Members.Nickname from Members where Members.Member_Id = PersonalJournal.Member_Id) as friendJournalNickname from PersonalJournal where Member_Id=:member_Id and publicStatus == '1' order by publishTime desc";
		
	private static final String UPDATE_JOURNAL = 
			"update PersonalJournalVO set contents=:contents , publicStatus=:publicStatus where journal_Id=:journal_Id";
	@Autowired
	private SessionFactory sessionFactory;

	public PersonalJournalDAO() {

	}

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public PersonalJournalVO insert(PersonalJournalVO personalJournalVO) {
		if (personalJournalVO != null) {			
			this.getSession().saveOrUpdate(personalJournalVO);
			return personalJournalVO;
		}
		return null;
	}

	@Override
	public PersonalJournalVO update(PersonalJournalVO personalJournalVO) {
		if (personalJournalVO != null) {
			this.getSession().saveOrUpdate(personalJournalVO);
			return personalJournalVO;
		}
		return null;
	}
	
	@Override
	public boolean update(
			String journal_Id,
			String contents,
			Integer publicStatus) {
		if (journal_Id != null && contents != null && publicStatus != null) {
			Query query = this.getSession().createQuery(UPDATE_JOURNAL);
			query.setParameter("journal_Id", journal_Id);
			query.setParameter("contents", contents);
			query.setParameter("publicStatus", publicStatus);
			if(query.executeUpdate()==1){
				return true;
			}
		}
		return false;
	}


	@Override
	public boolean delete(String journal_Id) {
		PersonalJournalVO personalJournalVO = (PersonalJournalVO) this
				.getSession().get(PersonalJournalVO.class, journal_Id);
		if (personalJournalVO != null) {
			this.getSession().delete(personalJournalVO);
			return true;
		}
		return false;
	}

	@Override
	public PersonalJournalVO findByPrimaryKey(String journal_Id) {
		return (PersonalJournalVO) this.getSession().get(
				PersonalJournalVO.class, journal_Id);
	}

	@Override
	public List<PersonalJournalVO> getAll() {
		Query query = this.getSession().createQuery(GET_ALL_STMT);
		return (List<PersonalJournalVO>) query.list();
	}
	
	@Override
	public List<PersonalJournalVO> select_myJournal(String member_Id) {
		Query query = this.getSession().createSQLQuery(GET_MYSELF_JOURNAL)
				.addEntity("PersonalJournal.*", PersonalJournalVO.class)
				.addScalar("JournalNickname", StringType.INSTANCE) 
				.setParameter("member_Id", member_Id);
				
		return (List<PersonalJournalVO>) query.list();
	}	
	
	@Override
	public List<PersonalJournalVO> select_friendJournal(String member_Id) {
		Query query =  this.getSession().createSQLQuery(GET_FRIEND_JOURNAL)
				.addEntity("PersonalJournal.*", PersonalJournalVO.class)
				.addScalar("friendJournalNickname", StringType.INSTANCE) // StringType.INSTANCE
				.setParameter("member_Id", member_Id);
		
		return (List<PersonalJournalVO>) query.list();
	}
	//挑選publicStatus狀態為1的日誌  先取六筆
	@Override
	public List<PersonalJournalVO> select_publicStatus_One( ){
		Query query = this.getSession().createSQLQuery(
				"Select *,Nickname,Members.Member_Id " 
				+"from PersonalJournal join Members "
				+"on PersonalJournal.Member_Id=Members.Member_Id "
				+"where publicStatus='1' "
				+"order by publishTime desc "  
				+"OFFSET 0 ROWS FETCH NEXT 6 ROWS ONLY")
				.addEntity(PersonalJournalVO.class)
				.addScalar("nickname", StringType.INSTANCE)
				.addScalar("Member_Id");
		return (List<PersonalJournalVO>) query.list();
	}
	//挑選publicStatus狀態為1的日誌  剩下去的取出來	
	@Override
	public List<PersonalJournalVO> select_publicStatus_Two( ){
		Query query = this.getSession().createSQLQuery(
				"Select *,Nickname,Members.Member_Id " 
				+"from PersonalJournal join Members "
				+"on PersonalJournal.Member_Id=Members.Member_Id "
				+"where publicStatus='1' "
				+"order by publishTime desc "  
				+"OFFSET 6 ROWS ")
				.addEntity(PersonalJournalVO.class)
				.addScalar("nickname", StringType.INSTANCE)
				.addScalar("Member_Id");
		return (List<PersonalJournalVO>) query.list();
	}

//	@Override
//	public List<ActivitysVO>  select_ActivityMember_One() {
//		Query query = this.getSession().createSQLQuery(
//				"SELECT DISTINCT Activitys.*,Members.Nickname,(SELECT ','+Members.Nickname "
//				+ "FROM ActivityDetail JOIN Members "
//				+ "ON ActivityDetail.Member_Id = Members.Member_Id "
//				+ "WHERE Activitys.Activity_Id = ActivityDetail.Activity_Id "
//				+ "FOR XML PATH('') ) as Nicknames "
//				+ "FROM Activitys JOIN Members "
//				+ "ON Activitys.Member_Id = Members.Member_Id "
//				+"order by activity_Day desc"	
//				+" OFFSET 0 ROWS FETCH NEXT 8 ROWS ONLY")
//				.addEntity("Activitys.*", ActivitysVO.class)
//				.addScalar("Nicknames", StringType.INSTANCE)// StringType.INSTANCE
//				.addScalar("Nickname", StringType.INSTANCE);			
//		return (List<ActivitysVO>) query.list();
//	}
	
//	public List<ActivitysVO> select_Activitys(String member_Id) {	
//		Query query = this.getSession().createSQLQuery(
//				"SELECT DISTINCT Activitys.*,Members.Nickname,(SELECT ','+Members.Nickname "
//				+ "FROM ActivityDetail JOIN Members "
//				+ "ON ActivityDetail.Member_Id = Members.Member_Id "
//				+ "WHERE Activitys.Activity_Id = ActivityDetail.Activity_Id "
//				+ "FOR XML PATH('') ) as Nicknames "
//				+ "FROM Activitys JOIN Members "
//				+ "ON Activitys.Member_Id = Members.Member_Id "
//				+ "WHERE Activitys.Member_Id = '"+member_Id+"'")
//				.addEntity("Activitys.*",ActivitysVO.class)
//				.addScalar("Nicknames", StringType.INSTANCE)// StringType.INSTANCE
//				.addScalar("Nickname", StringType.INSTANCE);
//		return (List<ActivitysVO>) query.list();	
//	}


}
