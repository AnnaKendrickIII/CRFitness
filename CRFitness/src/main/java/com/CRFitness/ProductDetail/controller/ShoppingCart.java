package com.CRFitness.ProductDetail.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.CRFitness.ProductDetail.model.ProductDetailService;
import com.CRFitness.ProductDetail.model.ProductDetailVO;
import com.opensymphony.xwork2.ActionSupport;

@Controller("shoppingCart")
@Scope("prototype")
public class ShoppingCart extends ActionSupport {

	private static final long serialVersionUID = 1L;
	private List<ProductDetailVO> cart;
	private ProductDetailVO productDetailVO;
	private HttpServletRequest request;
	private HttpSession session;
	@Resource(name = "productDetailService")
	private ProductDetailService productDetailService;

	public ShoppingCart() {
		request = ServletActionContext.getRequest();
		session = request.getSession();
		cart.add(productDetailVO);
		request.setAttribute("cart", cart);
	}
	
	
	
}
