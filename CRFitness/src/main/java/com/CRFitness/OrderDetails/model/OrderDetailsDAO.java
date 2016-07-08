package com.CRFitness.OrderDetails.model;

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

import com.CRFitness.Orders.model.OrdersDAO_interface;
import com.CRFitness.Orders.model.OrdersVO;

@Transactional(transactionManager = "transactionManager")
@Repository("orderDetailsDAO")
public class OrderDetailsDAO implements OrderDetailsDAO_interface {
	private static final String GET_ALL_STMT = "from OrderDetailsVO ";
	private static final String SELECTBYORDER_ID = "from OrderDetailsVO where order_Id=:order_Id";
	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	public OrderDetailsDAO() {

	}

	@Override
	public boolean insert(OrderDetailsVO orderDetailsVO) {
		if (orderDetailsVO != null) {
			this.getSession().saveOrUpdate(orderDetailsVO);
			return true;
		}
		return false;
	}

	@Override
	public boolean update(OrderDetailsVO orderDetailsVO) {
		if (orderDetailsVO != null) {
			this.getSession().saveOrUpdate(orderDetailsVO);
			return true;
		}
		return false;
	}

	@Override
	public boolean delete(String details_No) {
		OrderDetailsVO orderDetailsVO = (OrderDetailsVO) this.getSession().get(
				OrderDetailsVO.class, details_No);
		if (orderDetailsVO != null) {
			this.getSession().delete(orderDetailsVO);
			return true;
		}
		return false;
	}

	@Override
	public OrderDetailsVO findByPrimaryKey(String details_No) {
		return (OrderDetailsVO) this.getSession().get(OrderDetailsVO.class,
				details_No);
	}

	@Override
	public List<OrderDetailsVO> getAll() {
		Query query = this.getSession().createQuery(GET_ALL_STMT);
		return (List<OrderDetailsVO>) query.list();
	}

	@Override
	public List<OrderDetailsVO> findByOrder_Id(String order_Id) {
		Query query = this.getSession().createQuery(SELECTBYORDER_ID)
				.setParameter("order_Id", order_Id);
		return (List<OrderDetailsVO>) query.list();
	}

	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext(
				"test.config.xml");
		OrderDetailsDAO_interface dao = (OrderDetailsDAO_interface) context
				.getBean("orderDetailsDAO");

		// List<OrderDetailsVO> findByOrder_Id =
		// dao.findByOrder_Id("order5002");
		// for (OrderDetailsVO vo : findByOrder_Id)
		// System.out.println(vo.getProduct_Name() + ":" + vo.getColor() + ":"
		// + vo.getSize() + ":" + vo.getQuantity() + ":"
		// + vo.getDetails_No() + ":" + vo.getOrder_Id());
//		OrderDetailsVO orderDetailsVO = new OrderDetailsVO();
//		orderDetailsVO.setProduct_Name("打火機");
//		orderDetailsVO.setColor("紅");
//		orderDetailsVO.setQuantity(3);
//		orderDetailsVO.setAmount(20.0);
//		orderDetailsVO.setOrdersVO(OrdersVO.class);
//		orderDetailsVO.setSize("F");
//		dao.insert(orderDetailsVO);

		((ConfigurableApplicationContext) context).close();
	}
}
