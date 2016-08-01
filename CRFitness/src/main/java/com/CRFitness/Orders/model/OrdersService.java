package com.CRFitness.Orders.model;

import java.sql.Timestamp;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

@Service(value = "ordersService")
public class OrdersService {

	@Resource(name = "ordersDAO")
	OrdersDAO_interface ordersDAO;

	public OrdersService() {

	}

	// 利用 member_Id 搜尋有效會員訂單
	public List<OrdersVO> searchOrdersByMember_Id(String member_Id) {
		List<OrdersVO> vos = ordersDAO.findOrdersByMember_Id(member_Id);
		if (!(vos.isEmpty())) {
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

	public List<OrdersVO> searchMemberOrders() {
		return ordersDAO.getAll();
	}

	// 新增訂單 及 明細
	public OrdersVO addOrder(String member_Id, String consignee_Name,
			String consignee_Address, String payment_Method, Double total_Amount) {
		OrdersVO ordersVO = new OrdersVO();
		ordersVO.setMember_Id(member_Id);
		ordersVO.setConsignee_Name(consignee_Name);
		ordersVO.setConsignee_Address(consignee_Address);
		ordersVO.setPayment_Method(payment_Method);
		ordersVO.setOrder_Status("未出貨");
		ordersVO.setOrder_Time(new Timestamp(System.currentTimeMillis()));
		ordersVO.setShip_Date(null);
		ordersVO.setTotal_Amount(total_Amount);
		ordersVO.setInvoice_Number("GD123456");
		return ordersVO;
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
		// List<OrdersVO> list = service.searchAllOrders();
		// for (OrdersVO vo : list)
		// System.out.println(vo.getOrder_Id());
		OrdersVO vo = service.addOrder("member1001", "林明禎", "林靖凱家", "用身體付",
				99999.99);
		System.out.println(vo.getOrder_Id());
		((ConfigurableApplicationContext) context).close();
	}
}
