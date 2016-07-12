package com.CRFitness.Orders.model;

import java.sql.Timestamp;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

import com.CRFitness.OrderDetails.model.OrderDetailsVO;

@Service(value = "ordersService")
public class OrdersService {

	@Resource(name = "ordersDAO")
	OrdersDAO_interface ordersDAO;

	public OrdersService() {

	}

	// 利用 member_Id 搜尋會員訂單
	public List<OrdersVO> searchOrdersByMember_Id(String member_Id) {
		if (!(ordersDAO.findOrdersByMember_Id(member_Id).isEmpty())) {
			return ordersDAO.findOrdersByMember_Id(member_Id);
		} else {
			return null;
		}
	}

	// 取消訂單
	public Boolean cancelOrder(String order_Id) {
		OrdersVO ordersVO = ordersDAO.findByPrimaryKey(order_Id);
		if (ordersVO != null && !"作廢".equals(ordersVO.getOrder_Status())) {
			ordersVO.setOrder_Status("作廢");
			ordersDAO.update(ordersVO);
			return true;
		} else {
			return false;
		}

	}

	// 如你所見,撈出所有訂單
	public List<OrdersVO> searchAllOrders() {
		return ordersDAO.getAll();
	}

	// 新增訂單
	public OrdersVO addOrder(String consignee_Name, String consignee_Address,
			String payment_Method, Double total_Amount) {
		OrdersVO ordersVO = new OrdersVO();
		ordersVO.setConsignee_Name(consignee_Name);
		ordersVO.setConsignee_Address(consignee_Address);
		ordersVO.setPayment_Method(payment_Method);
		ordersVO.setOrder_Status("未出貨");
		ordersVO.setOrder_Time(new Timestamp(System.currentTimeMillis()));
		ordersVO.setShip_Date(null);
		ordersVO.setTotal_Amount(total_Amount);
		if (ordersDAO.insert(ordersVO)) {
			return ordersVO;
		} else {
			return null;
		}
	}

	public static void main(String[] args) {

		ApplicationContext context = new ClassPathXmlApplicationContext(
				"test.config.xml");
		OrdersService service = (OrdersService) context
				.getBean("ordersService");

		// List<OrdersVO> inquireOrdersByMember_Id =
		// service.searchOrders("member1003");
		// for (OrdersVO vo : searchOrdersByMember_Id)
		// System.out.println(vo.getOrder_Id());

		// System.out.println(service.cancelOrder("order5007"));
		// System.out.println(service.searchOrdersByMember_Id("member3000"));
		List<OrdersVO> list = service.searchAllOrders();
		for (OrdersVO vo : list)
			System.out.println(vo.getOrder_Id());
		((ConfigurableApplicationContext) context).close();
	}
}
