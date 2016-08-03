package com.CRFitness.ProductDetail.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/shoppingCartServlet")
public class ShoppingCartServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		Map<String, String> errorMessage = new HashMap<String, String>();
		request.setAttribute("ErrorMassage", errorMessage);
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String email = request.getParameter("email");

		System.out.println("servlettest");
		
		if (name.trim().length() <= 0 || "".equals(name.trim())) {
			errorMessage.put("errorName", "收件人姓名不可為空白,請重新輸入");
		}
		if (address.trim().length() <= 0 || "".equals(address.trim())) {
			errorMessage.put("errorAddress", "收件地址不可為空白,請重新輸入");
		}
		if (email.trim().length() <= 0 || "".equals(email.trim())) {
			errorMessage.put("errorEmail", "E-mail不可為空白,請重新輸入");
		}

		if (!errorMessage.isEmpty()) {
			RequestDispatcher rd = request
					.getRequestDispatcher("${this_contextPath}/ShoppingCart.jsp");
			rd.forward(request, response);
		}
	

	}

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
