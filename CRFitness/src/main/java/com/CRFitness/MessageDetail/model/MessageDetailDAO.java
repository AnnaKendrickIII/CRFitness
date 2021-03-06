package com.CRFitness.MessageDetail.model;


import org.hibernate.*;
import org.hibernate.type.StringType;
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
	public List<MessageDetailVO> select_JournalMessage(String journal_Id, Integer message_Id) {
		Query query = this.getSession().createSQLQuery(
				  "select MessageDetail.*, Members.Nickname " 
				  +" from MessageDetail join Members " 
				  +" on MessageDetail.Member_Id = Members.Member_Id " 
				  +" where Journal_Id=:journal_Id and (Message_Id<:message_Id or 0=:message_Id) order by Message_Id desc " 
				  +" OFFSET 0 ROWS FETCH NEXT 3 ROWS ONLY"
				)
				.addEntity(MessageDetailVO.class)
				.addScalar("Nickname", StringType.INSTANCE)
				.setParameter("journal_Id", journal_Id)
				.setParameter("message_Id", message_Id);
		return (List<MessageDetailVO>) query.list();
	}
	
	@Override
	public List<MessageDetailVO> select_JournalMessageAll(String journal_Id) {
		Query query = this.getSession().createSQLQuery(
				"select MessageDetail.*,Nickname,Members.Member_Id " 
				+"from MessageDetail join Members " 
				+"on MessageDetail.Member_Id=Members.Member_Id " 
				+"where Journal_Id=:journal_Id " 
				+"order by MessageTime ")
				.addEntity(MessageDetailVO.class)
				.addScalar("Nickname", StringType.INSTANCE)
				.addScalar("Member_Id")
				.setParameter("journal_Id", journal_Id);
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
