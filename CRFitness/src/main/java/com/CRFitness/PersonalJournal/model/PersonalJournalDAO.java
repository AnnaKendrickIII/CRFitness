package com.CRFitness.PersonalJournal.model;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.id.IdentityGenerator.GetGeneratedKeysDelegate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.CRFitness.Member.model.MemberVO;


@Repository("personalJournalDAO")
@Transactional(transactionManager = "transactionManager")
public class PersonalJournalDAO implements PersonalJournalDAO_interface {
	// 所有的日誌
	private static final String GET_ALL_STMT = "from PersonalJournalVO ";
	// 個人所有日誌 從最近開始往後排序
	private static final String GET_MYSELF_JOURNAL = "from PersonalJournalVO where memberVO=:memberVO order by publishTime desc";
	//挑選publicStatus狀態為1的日誌
	private static final String GET_COMMON_JOURNAL = "from PersonalJournalVO where publicStatus='1' order by publishTime desc ";
	// 查朋友日誌
	private static final String GET_FRIEND_JOURNAL = "from PersonalJournalVO where memberVO=:memberVO and publicStatus != '0' order by publishTime desc ";
	
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
		if (journal_Id != null || contents != null || publicStatus != null) {
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
	public List<PersonalJournalVO> select_myJournal(MemberVO memberVO) {
		Query query =  this.getSession().createQuery(GET_MYSELF_JOURNAL).setParameter("memberVO", memberVO);
		
		return (List<PersonalJournalVO>) query.list();
	}	
	
	@Override
	public List<PersonalJournalVO> select_friendJournal(MemberVO memberVO) {
		Query query =  this.getSession().createQuery(GET_FRIEND_JOURNAL).setParameter("memberVO", memberVO);
		
		return (List<PersonalJournalVO>) query.list();
	}
	
	@Override
	public List<PersonalJournalVO> select_publicStatus( ){
		Query query = this.getSession().createQuery(GET_COMMON_JOURNAL);
		return (List<PersonalJournalVO>) query.list();
	}

//	public static void main(String[] args) {
//		ApplicationContext context = new ClassPathXmlApplicationContext("test.config.xml");
//
//		PersonalJournalDAO_interface personalJournalDAO = (PersonalJournalDAO_interface) context.getBean("personalJournalDAO");
//		String journal_Id = "journal2002";
//		String member_Id = 	"member1001";	
//				List<PersonalJournalVO> list = personalJournalDAO.select_journal(member_Id);
//		for (PersonalJournalVO data : list) {
//			System.out.println(data.getJournal_Id()+" "+data.getArchives()+" "+data.getContents()+" "+
//					data.getPublishTime()+" "+data.getPublicStatus());
//			}		
//		((ConfigurableApplicationContext) context).close();
//
//	}


}
