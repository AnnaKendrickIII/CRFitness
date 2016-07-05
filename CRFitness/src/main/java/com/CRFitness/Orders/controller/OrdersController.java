package com.CRFitness.Orders.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.core.MediaType;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.CRFitness.Member.model.MemberVO;
import com.CRFitness.Orders.model.OrdersService;
import com.CRFitness.Orders.model.OrdersVO;

@Controller
@RequestMapping("/ordersController")
public class OrdersController {

	@Resource(name = "ordersService")
	private OrdersService ordersService;

	@RequestMapping(method = RequestMethod.GET, value = "/orders", produces = MediaType.APPLICATION_JSON)
	public @ResponseBody List<OrdersVO> searchAllOrders( HttpServletRequest request) {
		request.getSession().setAttribute("searchAllOrders", ordersService);
		return ordersService.searchAllOrders();
	}
}
