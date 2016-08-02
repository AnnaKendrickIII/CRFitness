package com.CRFitness.ProductDetail.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

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

		if (name.length() <= 0 || "".equals(name)) {
			errorMessage.put("errorName", "收件人姓名不可為空白,請重新輸入");
		}
		if (address.length() <= 0 || "".equals(address)) {
			errorMessage.put("errorAddress", "收件地址不可為空白,請重新輸入");
		}
		if (email.length() <= 0 || "".equals(email)) {
			errorMessage.put("errorEmail", "E-mail不可為空白,請重新輸入");
		}

	}

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
