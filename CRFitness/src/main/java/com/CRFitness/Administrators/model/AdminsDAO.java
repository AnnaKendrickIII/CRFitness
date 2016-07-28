package com.CRFitness.Administrators.model;



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

@Transactional(transactionManager="transactionManager")
@Repository("AdminsDAO")
public class AdminsDAO implements AdminsDAO_interface {

	private static final String GET_ALL_STMT = "from AdminsVO ";
	private static final String SELECT_EMALL = "from AdminsVO where e_mail=:e_mail";
	@Autowired
	private SessionFactory sessionFactory ;

	public AdminsDAO() {
		
	}

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public boolean insert(AdminsVO adminsVO) {
		if (adminsVO != null) {
			this.getSession().saveOrUpdate(adminsVO);
			return true;
		}
		return false;	
	}
	
	@Override
	public AdminsVO update(AdminsVO adminsVO) {
		this.getSession().saveOrUpdate(adminsVO);
		return adminsVO;
	}

	@Override
	public boolean delete(String administrator_Id) {
		AdminsVO adminsVO = (AdminsVO) this.getSession().get(AdminsVO.class,
				administrator_Id);
		if (adminsVO != null) {
			this.getSession().delete(adminsVO);
			return true;
		}
		return false;
	}

	@Override
	public AdminsVO findByPrimaryKey(String administrator_Id) {
		return (AdminsVO) this.getSession().get(AdminsVO.class, administrator_Id);
	}

	
	@Override
	public List<AdminsVO> select_email(String e_mail) {	
			Query query = this.getSession().createQuery(SELECT_EMALL)
					.setParameter("e_mail", e_mail);
		return (List<AdminsVO>) query.list();
	}

	@Override
	public List<AdminsVO> getAll() {
			Query query = this.getSession().createQuery(GET_ALL_STMT);
		return (List<AdminsVO>) query.list();
	}

	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("test.config.xml");
		SessionFactory sessionFactory = (SessionFactory) context.getBean("sessionFactory");
		

		AdminsDAO_interface dao = (AdminsDAO_interface) context.getBean("AdminsDAO");
		List<AdminsVO> vos=	dao.select_email("simpson@crf.admin.com");
		System.out.println(dao.select_email("simpson@crf.admin.com").get(0));
		
		((ConfigurableApplicationContext) context).close();
	}
}
