package com.CRFitness.OrderDetails.controller;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.constraints.NotNull;
import javax.ws.rs.core.MediaType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.CRFitness.OrderDetails.model.OrderDetailsService;
import com.CRFitness.OrderDetails.model.OrderDetailsVO;
import com.CRFitness.Orders.model.OrdersVO;
import com.CRFitness.ProductDetail.model.ProductDetailVO;
import com.CRFitness.ProductDetail.model.ShoppingCart;

@Controller
@RequestMapping("/orderDetailsController")
public class OrderDetailsController {

	@Resource(name = "orderDetailsService")
	private OrderDetailsService orderDetailsService;
	@Autowired
	private ShoppingCart shoppingCart;

	@RequestMapping(method = RequestMethod.GET, value = "/orderDetails", produces = MediaType.APPLICATION_JSON)
	public @ResponseBody List<OrderDetailsVO> list_orderDetailsVO(
			HttpServletRequest request) {
		request.getSession().setAttribute("list_orderDetailsVO",
				orderDetailsService);
		return orderDetailsService.searchAllOrderDetails();
	}

	@RequestMapping(method = RequestMethod.GET, value = "/search", produces = MediaType.APPLICATION_JSON)
	public @ResponseBody List<OrderDetailsVO> searchByOrder_Id(
			HttpServletRequest request, @RequestParam String order_Id) {
		request.getSession().setAttribute("searchByOrder_Id", order_Id);
		return orderDetailsService.searchOrderDetails(order_Id);
	}
	
	

	@RequestMapping(method = RequestMethod.GET, value = "/addOrder", produces = "application/json;charset=UTF-8")
	public @ResponseBody void addOrder(
			@RequestParam String member_Id,
			@RequestParam String consignee_Name,
			@RequestParam String consignee_Address,
			@RequestParam String payment_Method, HttpServletRequest request) {
		OrdersVO order = null;
		order = orderDetailsService.addOrder(member_Id, consignee_Name, consignee_Address,
				payment_Method, shoppingCart.totalAmount());

		if (shoppingCart.getCart().size() > 0) {
			Set<String> set = shoppingCart.getCart().keySet();
			Iterator<String> prouducts = set.iterator();
			while (prouducts.hasNext()) {
				List<Object[]> product = (List<Object[]>) (shoppingCart.getCart().get(prouducts.next()));
				String productDetail_Id = (String)((ProductDetailVO) (product.get(0))[0]).getProductDetail_Id();
				int quantity = (Integer) (product.get(1))[0];
				String product_Name = (String) (product.get(0))[1];
				String color = (String) ((ProductDetailVO) (product.get(0))[0])
						.getColor();
				String size = (String) ((ProductDetailVO) (product.get(0))[0])
						.getSize();
				double amount = (Double) (product.get(0))[2];
				
				System.out.println(productDetail_Id);
				System.out.println(quantity);
				System.out.println(product_Name);
				System.out.println(color);
				System.out.println(size);
				System.out.println(amount);

				orderDetailsService.addOrderDetail(order.getOrder_Id(), productDetail_Id, product_Name, quantity, size, color, amount);
			}
		}
		shoppingCart.cleanCart();
	}
}
