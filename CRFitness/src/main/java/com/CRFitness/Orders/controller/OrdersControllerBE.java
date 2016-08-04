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
@RequestMapping("/ordersControllerBE")
public class OrdersControllerBE {

	@Resource(name = "ordersService")
	private OrdersService ordersService;

	@RequestMapping(method = RequestMethod.GET, value = "/orders", produces = "application/json;charset=UTF-8")
	public @ResponseBody List<OrdersVO> searchAllOrders() {
		return ordersService.searchAllOrders();
	}

	@RequestMapping(method = RequestMethod.GET, value = "/getAll", produces = "application/json;charset=UTF-8")
	public @ResponseBody List<OrdersVO> searchMemberOrders(String member_Id) {
		return ordersService.searchOrdersByMember_Id(member_Id);
	}

	@RequestMapping(method = RequestMethod.POST, value = "/cancelOrder")
	public @ResponseBody void cancelOrder(String order_Id) {
		ordersService.cancelOrder(order_Id);
	}
}
