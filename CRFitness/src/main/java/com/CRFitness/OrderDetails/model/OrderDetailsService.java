package com.CRFitness.OrderDetails.model;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

import com.CRFitness.Orders.model.OrdersDAO_interface;
import com.CRFitness.Orders.model.OrdersVO;
import com.CRFitness.ProductDetail.model.ShoppingCart;

@Service(value = "orderDetailsService")
public class OrderDetailsService {

	@Resource(name = "orderDetailsDAO")
	OrderDetailsDAO_interface orderDetailsDAO;

	@Resource(name = "ordersDAO")
	OrdersDAO_interface ordersDAO;

	@Resource(name = "shoppingCart")
	ShoppingCart shoppingCart;

	// 撈出所有訂單明細
	public List<OrderDetailsVO> searchAllOrderDetails() {
		return orderDetailsDAO.getAll();
	}

	// 利用訂單編號查出該筆訂單所有明細
	public List<OrderDetailsVO> searchOrderDetails(String order_Id) {
		if (!(orderDetailsDAO.findByOrder_Id(order_Id).isEmpty())) {
			return orderDetailsDAO.findByOrder_Id(order_Id);
		} else {
			return null;
		}
	}

	// 修改訂單內容
	public OrderDetailsVO modifyCart(String details_No, Integer quantity,
			String size, String color) {
		OrderDetailsVO orderDetailsVO = null;
		if (!(details_No.isEmpty())) {
			orderDetailsVO = orderDetailsDAO.findByPrimaryKey(details_No);
		}
		if (quantity == 0) {
			orderDetailsDAO.delete(details_No);
		} else if (quantity >= 1 && !("".equals(quantity))) {
			orderDetailsVO.setQuantity(quantity);
		}
		if (size.length() > 0 && !("".equals(size))) {
			orderDetailsVO.setSize(size);
		}
		if (color.length() > 0 && !("".equals(color))) {
			orderDetailsVO.setColor(color);
		}
		orderDetailsDAO.update(orderDetailsVO);
		return orderDetailsVO;
	}

	// 新增訂單
	public OrdersVO addOrder(String member_Id, String consignee_Name, String consignee_Address,
			String payment_Method, Double total_Amount) {

		OrdersVO order = new OrdersVO();

		OrdersVO ordersVO = new OrdersVO();
		ordersVO.setMember_Id(member_Id);
		ordersVO.setConsignee_Name(consignee_Name);
		ordersVO.setConsignee_Address(consignee_Address);
		ordersVO.setPayment_Method(payment_Method);
		ordersVO.setOrder_Status("未出貨");
		ordersVO.setOrder_Time(new Timestamp(System.currentTimeMillis()));
		ordersVO.setShip_Date(null);
		ordersVO.setInvoice_Number("GD123456");
		ordersVO.setTotal_Amount(total_Amount);
		return ordersDAO.insert(ordersVO);
		
	}

	// 新增訂單明細
	public OrderDetailsVO addOrderDetail(String order_Id,String product_Name, Integer quantity,
			String size, String color, Double amount) {

		OrderDetailsVO orderDetailsVO = new OrderDetailsVO();

		orderDetailsVO.setOrder_Id(order_Id);
		orderDetailsVO.setProduct_Name(product_Name);
		orderDetailsVO.setQuantity(quantity);
		orderDetailsVO.setSize(size);
		orderDetailsVO.setColor(color);
		orderDetailsVO.setAmount(amount);
		orderDetailsDAO.insert(orderDetailsVO);

		return orderDetailsVO;
	}

	public static void main(String[] args) {

		ApplicationContext context = new ClassPathXmlApplicationContext(
				"test.config.xml");
		OrderDetailsService dao = (OrderDetailsService) context
				.getBean("orderDetailsService");

		// dao.modifyCart(details_No, quantity, size, color)

		// for(OrderDetailsVO vo:dao.searchOrderDetails("order6002"))
		// System.out.println(vo.getDetails_No());

		// System.out.println(dao.modifyCart("orderDetails6008", 6, "F", "白色"));
		// for(OrderDetailsVO vo:dao.searchAllOrderDetails())
		// System.out.println(dao.searchAllOrderDetails());

		((ConfigurableApplicationContext) context).close();
	}
}
