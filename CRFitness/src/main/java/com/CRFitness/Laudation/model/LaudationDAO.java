package com.CRFitness.Laudation.model;


import org.hibernate.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import freemarker.core.Configurable;

import java.util.*;
@Transactional(transactionManager="transactionManager")
@Repository("laudationDAO")
public class LaudationDAO implements LaudationDAO_interface {

	private static final String GET_ALL_STMT = "from LaudationVO ";
	private static final String GET_ALL_LIKEJOURNAL = "from LaudationVO where lauded_Id=:lauded_Id";
	private static final String COUNT_LIKE = "select count(*) from Laudation where Journal_Id=:journal_Id";
	
	@Autowired
	private SessionFactory sessionFactory ;

	public LaudationDAO() {
		
	}

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	@Override
	public boolean insert(LaudationVO laudationVO) {
		if (laudationVO != null) {
			this.getSession().saveOrUpdate(laudationVO);
			return true;
		}
		return false;	
	}
	

	

	@Override
	public boolean update(LaudationVO laudationVO) {
		if (laudationVO != null) {
			this.getSession().saveOrUpdate(laudationVO);
			return true;
		}
		return false;	
	}
	
	
	
	@Override
	public boolean delete(String journal_Id,String lauded_Id) {
		LaudationVO laudationVO=new LaudationVO ();
		laudationVO.setJournal_Id(journal_Id);
		laudationVO.setLauded_Id(lauded_Id);
		LaudationVO laudationVOs = (LaudationVO) this.getSession().get(LaudationVO.class,
				laudationVO);
		if (laudationVOs != null) {
			this.getSession().delete(laudationVOs);
			return true;
		}
		return false;
	}
	@Override
	public LaudationVO findByPrimaryKey(String journal_Id,String lauded_Id) {
		LaudationVO laudationVO=new LaudationVO ();
		laudationVO.setJournal_Id(journal_Id);
		laudationVO.setLauded_Id(lauded_Id);
		return (LaudationVO) this.getSession().get(LaudationVO.class, laudationVO);
	}

	
	
	
	
	@Override
	public List<LaudationVO> getAll() {
			Query query = this.getSession().createQuery(GET_ALL_STMT);
		return (List<LaudationVO>) query.list();
	}
	
	
	

	@Override
	public List<LaudationVO> getJournalnumber(LaudationVO laudationVO) {
		Query query = this.getSession().createQuery(GET_ALL_LIKEJOURNAL).setParameter("lauded_Id", laudationVO.getLauded_Id());
		return (List<LaudationVO>) query.list();
	}
	
	

	@Override
	public Integer countLike(String journal_Id) {
		Query query =this.getSession().createSQLQuery(COUNT_LIKE).setParameter("journal_Id", journal_Id);
		return (Integer) query.list().get(0);
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
