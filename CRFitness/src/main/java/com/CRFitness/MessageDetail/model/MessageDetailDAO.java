package com.CRFitness.MessageDetail.model;


import org.hibernate.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


import java.util.*;
@Transactional(transactionManager="transactionManager")
@Repository("messageDetailDAO")
public class MessageDetailDAO implements MessageDetailDAO_interface{

	private static final String GET_ALL_STMT = "from MessageDetailVO ";
	private static final String GET_JOURNAL_STMT = "from MessageDetailVO WHERE journal_Id=:journal_Id";
	@Autowired
	private SessionFactory sessionFactory ;

	public MessageDetailDAO() {
		
	}

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	

	@Override
	public boolean insert(MessageDetailVO messageDetailVO) {
		if (messageDetailVO != null) {
			this.getSession().saveOrUpdate(messageDetailVO);
			return true;
		}
		return false;	
	}
	

	@Override
	public boolean update(MessageDetailVO messageDetailVO) {
		if (messageDetailVO != null) {
			this.getSession().saveOrUpdate(messageDetailVO);
			return true;
		}
		return false;	
	}
	
	@Override
	public boolean delete(Integer message_Id) {
		MessageDetailVO messageDetailVO = (MessageDetailVO) this.getSession().get(MessageDetailVO.class,
				message_Id);
		if (messageDetailVO != null) {
			this.getSession().delete(messageDetailVO);
			return true;
		}
		return false;
	}
	

	@Override
	public MessageDetailVO findByPrimaryKey(String message_Id) {
		return (MessageDetailVO) this.getSession().get(MessageDetailVO.class, message_Id);
	}

	@Override
	public List<MessageDetailVO> select_Journal(String journal_Id) {
		Query query = this.getSession().createQuery(GET_JOURNAL_STMT);
		query.setParameter("journal_Id", journal_Id);
		return (List<MessageDetailVO>) query.list();
	}
	
	@Override
	public List<MessageDetailVO> getAll() {
			Query query = this.getSession().createQuery(GET_ALL_STMT);
		return (List<MessageDetailVO>) query.list();
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
