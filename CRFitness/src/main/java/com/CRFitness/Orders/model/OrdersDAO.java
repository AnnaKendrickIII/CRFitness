package com.CRFitness.Orders.model;

import java.util.Calendar;
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

@Transactional(transactionManager = "transactionManager")
@Repository("ordersDAO")
public class OrdersDAO implements OrdersDAO_interface {

	private static final String GET_ALL_STMT = "from OrdersVO ";
	private static final String SELECT_MEMBER_ID = "from OrdersVO where member_Id=:member_Id";

	@Autowired
	private SessionFactory sessionFactory;

	public OrdersDAO() {

	}

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public boolean insert(OrdersVO ordersVO) {
		if (ordersVO != null) {
			this.getSession().saveOrUpdate(ordersVO);
			return true;
		}
		return false;
	}

	@Override
	public boolean update(OrdersVO ordersVO) {
		if (ordersVO != null) {
			this.getSession().saveOrUpdate(ordersVO);
			return true;
		}
		return false;
	}

	@Override
	public boolean delete(String order_Id) {
		OrdersVO ordersVO = (OrdersVO) this.getSession().get(OrdersVO.class,
				order_Id);
		if (ordersVO != null) {
			this.getSession().delete(ordersVO);
			return true;
		}
		return false;
	}

	@Override
	public OrdersVO findByPrimaryKey(String order_Id) {
		return (OrdersVO) this.getSession().get(OrdersVO.class, order_Id);
	}

	@Override
	public List<OrdersVO> getAll() {
		Query query = this.getSession().createQuery(GET_ALL_STMT);
		return (List<OrdersVO>) query.list();
	}

	@Override
	public List<OrdersVO> findOrdersByMember_Id(String member_Id) {
		Query query = this.getSession().createQuery(SELECT_MEMBER_ID).setParameter("member_Id", member_Id);
		return (List<OrdersVO>) query.list();
	}
	

	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("test.config.xml");
		OrdersDAO_interface dao = (OrdersDAO_interface) context.getBean("ordersDAO");

		// OrdersVO findByPrimaryKey = dao.findByPrimaryKey("order5001");
		// System.out.println(findByPrimaryKey.getOrder_Id()+" : "+findByPrimaryKey.getConsignee_Name()
		// + " : "+ findByPrimaryKey.getOrder_Status());
		// System.out.println("------------------------------------------");

//		 OrdersVO insertVO=new OrdersVO();
//		 insertVO.setMember_Id("member1003");
//		 insertVO.setConsignee_Address("天龍國");
//		 insertVO.setConsignee_Name("鄭欲昇");
//		 insertVO.setInvoice_Number("GG123456");
//		 insertVO.setOrder_Status("配送中");
//		 insertVO.setOrder_Time(new java.sql.Timestamp(Calendar.getInstance().getTime().getTime()));
//		 insertVO.setPayment_Method(8);
//		 insertVO.setShip_Date(new java.sql.Date(System.currentTimeMillis()));
//		 insertVO.setTotal_Amount(999.0);
//		 dao.insert(insertVO);

//		 OrdersVO updateVO= dao.findByPrimaryKey("order5003");
//		 updateVO.setConsignee_Name("辜莞允");
//		 dao.update(updateVO);

		// OrdersVO deleteVO = new OrdersVO();
		// dao.delete("order5007");

//		 List<OrdersVO> getAll = dao.getAll();
//		 for (OrdersVO vo : getAll)
//		 System.out.println(vo.getOrder_Id() + " : "
//		 + vo.getConsignee_Name() + " : " + vo.getOrder_Status());

//		List<OrdersVO> findOrdersByMember_Id = dao.findOrdersByMember_Id("member1001");
//		for (OrdersVO vo : findOrdersByMember_Id)
//			System.out.println(vo.getMember_Id() + ":" + vo.getOrder_Id());
		
		((ConfigurableApplicationContext) context).close();

	}
}
