package com.CRFitness.JournalCollect.model;


import org.hibernate.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


import java.util.*;
@Transactional(transactionManager="transactionManager")
@Repository("journalCollectDAO")
public class JournalCollectDAO implements JournalCollectDAO_interface  {

	private static final String GET_ALL_STMT = "from JournalCollectVO ";
	@Autowired
	private SessionFactory sessionFactory ;

	public JournalCollectDAO() {
		
	}

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	
	@Override
	public boolean insert(JournalCollectVO journalCollectVO) {
		if (journalCollectVO != null) {
			this.getSession().saveOrUpdate(journalCollectVO);
			return true;
		}
		return false;	
	}
	
	
	@Override
	public boolean update(JournalCollectVO journalCollectVO) {
		if (journalCollectVO != null) {
			this.getSession().saveOrUpdate(journalCollectVO);
			return true;
		}
		return false;	
	}
	


	@Override
	public boolean delete(String member_Id,String favorited_Journal) {
		JournalCollectVO journalCollectVO=new JournalCollectVO ();
		journalCollectVO.setMember_Id(member_Id);
		journalCollectVO.setFavorited_Journal(favorited_Journal);
		JournalCollectVO journalCollectVOs = (JournalCollectVO) this.getSession().get(JournalCollectVO.class,
				journalCollectVO);
		if (journalCollectVOs != null) {
			this.getSession().delete(journalCollectVOs);
			return true;
		}
		return false;
	}

	
	@Override
	public JournalCollectVO findByPrimaryKey(String member_Id,String favorited_Journal) {
		JournalCollectVO journalCollectVO=new JournalCollectVO ();
		journalCollectVO.setMember_Id(member_Id);
		journalCollectVO.setFavorited_Journal(favorited_Journal);
		return (JournalCollectVO) this.getSession().get(JournalCollectVO.class, journalCollectVO);
	}

	
	@Override
	public List<JournalCollectVO> getAll() {
			Query query = this.getSession().createQuery(GET_ALL_STMT);
		return (List<JournalCollectVO>) query.list();
	}

	public static void main(String[] args) {
//		ApplicationContext context=new ClassPathXmlApplicationContext("test.config.xml");
//		MessageDetailDAO memberDAO=(MessageDetailDAO)context.getBean("memberDAO");
//		 String e_mail = "aaa@iii.com";
//		 memberDAO.sessionFactory.getCurrentSession().beginTransaction();
//		 List<MessageDetailVO> list = memberDAO.select_email(e_mail);
//		 MessageDetailVO memberVO = null ;
//		 for(MessageDetailVO data:list){
//		 memberVO=data;
//		 }
//		 if(memberVO!=null)
//		 System.out.print(memberVO.getPassword() );
//		 memberDAO.sessionFactory.getCurrentSession().getTransaction().commit();
//		 ((ConfigurableApplicationContext)context).close();
	}
}
