package com.CRFitness.OrderDetails.model;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

import com.CRFitness.Orders.model.OrdersDAO_interface;
import com.CRFitness.Orders.model.OrdersVO;

@Service(value = "orderDetailsService")
public class OrderDetailsService {

	@Resource(name = "orderDetailsDAO")
	OrderDetailsDAO_interface orderDetailsDAO;

	@Resource(name = "ordersDAO")
	OrdersDAO_interface ordersDAO;

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
