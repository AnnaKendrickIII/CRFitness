package com.CRFitness.ProductDetail.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;

@Controller("shoppingCartAction")
@Scope("prototype")
public class ShoppingCartAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	private HttpServletRequest request;
	private HttpSession session;
	private Map<String, String> errorMessage;
	private String name;
	private String address;
	private String email;

	public ShoppingCartAction() {
		request = ServletActionContext.getRequest();
		session = request.getSession();
		errorMessage = new HashMap<>();
		request.setAttribute("ErrorMessage", errorMessage);
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String checkData() {
		if (getName().length() <= 0 || "".equals(getName())) {
			errorMessage.put("error_name", "收件人資料錯誤,請重新檢查");
		}
		if (getAddress().length() <= 0 || "".equals(getAddress())) {
			errorMessage.put("error_address", "收件地址錯誤,請重新檢查");
		}
		if (getEmail().length() <= 0 || "".equals(getEmail())) {
			errorMessage.put("error_email", "E-mail欄位不可空白");
		}

		if (errorMessage.isEmpty()) {
			return SUCCESS;
		} else {
			errorMessage.put("checkfail", "訂單資料有誤,請重新檢查");
			return INPUT;
		}
	}
}
