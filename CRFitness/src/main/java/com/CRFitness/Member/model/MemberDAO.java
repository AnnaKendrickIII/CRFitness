package com.CRFitness.Member.model;



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
@Repository("memberDAO")
public class MemberDAO implements MemberDAO_interface {

	private static final String GET_ALL_STMT = "from MemberVO ";
	private static final String SELECT_EMALL = "from MemberVO where e_mail=:e_mail";
	private static final String SELECT_ONLY_MEMBERS = "from MemberVO where member_Id like 'member%'";
	
	
	@Autowired
	private SessionFactory sessionFactory ;

	public MemberDAO() {
		
	}

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public boolean insert(MemberVO memberVO) {
		if (memberVO != null) {
			this.getSession().saveOrUpdate(memberVO);
			return true;
		}
		return false;	
	}
	@Override
	public MemberVO update(MemberVO memberVO) {
		this.getSession().saveOrUpdate(memberVO);
		return memberVO;

	}

	@Override
	public boolean delete(String member_Id) {
		MemberVO memberVO = (MemberVO) this.getSession().get(MemberVO.class,
				member_Id);
		if (memberVO != null) {
			this.getSession().delete(memberVO);
			return true;
		}
		return false;
	}

	@Override
	public MemberVO findByPrimaryKey(String member_Id) {
		return (MemberVO) this.getSession().get(MemberVO.class, member_Id);
	}

	
	@Override
	public List<MemberVO> select_email(String e_mail) {	
			Query query = this.getSession().createQuery(SELECT_EMALL)
					.setParameter("e_mail", e_mail);
		return (List<MemberVO>) query.list();
		
	}

	@Override
	public List<MemberVO> getAll() {
			Query query = this.getSession().createQuery(GET_ALL_STMT);
		return (List<MemberVO>) query.list();
	}
	
	@Override
	public List<MemberVO> getAllMembers() {
		Query query = this.getSession().createQuery(SELECT_ONLY_MEMBERS);
		return (List<MemberVO>) query.list();
	}

	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("test.config.xml");
		SessionFactory sessionFactory = (SessionFactory) context.getBean("sessionFactory");
		

		MemberDAO_interface dao = (MemberDAO_interface) context.getBean("memberDAO");
		List<MemberVO> vos=	dao.select_email("fff@iii.com");
		System.out.println(dao.select_email("fff@iii.com").get(0));
		
		((ConfigurableApplicationContext) context).close();
	}
}
