package com.CRFitness.OrderDetails.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.core.MediaType;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.CRFitness.OrderDetails.model.OrderDetailsService;
import com.CRFitness.OrderDetails.model.OrderDetailsVO;
import com.CRFitness.ProductDetail.model.ShoppingCart;

@Controller
@RequestMapping("/orderDetailsController")
public class OrderDetailsController {

	@Resource(name = "orderDetailsService")
	private OrderDetailsService orderDetailsService;
	@Resource(name = "shoppingCart")
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
			@RequestParam String payment_Method,
			@RequestParam String details_No,
			@RequestParam String product_Name,
			@RequestParam Integer quantity,
			@RequestParam String size,
			@RequestParam String color,
			@RequestParam Double amount) {

				
		orderDetailsService.addOrder(member_Id, consignee_Name,
				consignee_Address, payment_Method, details_No, product_Name,
				quantity, size, color, amount);

	}
}
