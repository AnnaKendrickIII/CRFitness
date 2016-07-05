package com.CRFitness.PersonalJournal.model;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
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

	private static final String GET_ALL_STMT = "from PersonalJournalVO ";
	private static final String GET_ALL_JOURNAL = "from PersonalJournalVO where memberVO=:memberVO";
	

	@Autowired
	private SessionFactory sessionFactory;

	public PersonalJournalDAO() {

	}

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public boolean insert(PersonalJournalVO journal_Id) {
		if (journal_Id != null) {
			this.getSession().saveOrUpdate(journal_Id);
			return true;
		}
		return false;
	}

	@Override
	public boolean update(PersonalJournalVO journal_Id) {
		if (journal_Id != null) {
			this.getSession().saveOrUpdate(journal_Id);
			return true;
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
	public List<PersonalJournalVO> select_journal(MemberVO memberVO) {
		Query query =  this.getSession().createQuery(GET_ALL_JOURNAL).setParameter("memberVO", memberVO);		
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
