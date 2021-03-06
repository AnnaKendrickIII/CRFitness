package com.CRFitness.ProductDetail.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.core.MediaType;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.CRFitness.OrderDetails.model.OrderDetailsService;
import com.CRFitness.ProductDetail.model.ProductDetailService;
import com.CRFitness.ProductDetail.model.ProductDetailVO;
import com.CRFitness.ProductDetail.model.ShoppingCart;

@Controller
@RequestMapping("/productDetailController")
public class ProductDetailController {

	@Resource(name = "productDetailService")
	private ProductDetailService productDetailService;
	@Resource(name = "orderDetailsService")
	private OrderDetailsService orderDetailsService;
	@Resource(name = "shoppingCart")
	private ShoppingCart shoppingCart;

	// front-end
	@RequestMapping(method = RequestMethod.GET, value = "/getAllDetail", produces = "application/json;charset=UTF-8")
	public @ResponseBody List<ProductDetailVO> getAllDetail(
			HttpServletRequest request) {
		return productDetailService.getAllItem();
	}

	@RequestMapping(method = RequestMethod.GET, value = "/getProductDetailId", produces = "application/json;charset=UTF-8")
	public @ResponseBody ProductDetailVO productDetailVO(
			HttpServletRequest request, @RequestParam String product_Name,
			@RequestParam String size, @RequestParam String color) {
		return null;
	}

	@RequestMapping(method = RequestMethod.GET, value = "/searchByCategory", produces = "application/json;charset=UTF-8")
	public @ResponseBody List<Object[]> searchByCategory(
			HttpServletRequest request, @RequestParam String category,
			@RequestParam Integer page) {
		return productDetailService.getItemByCategory(category, page);

	}

	@RequestMapping(method = RequestMethod.GET, value = "/getItemDetail", produces = "application/json;charset=UTF-8")
	public @ResponseBody List<Object[]> getItemDetail(
			HttpServletRequest request, @RequestParam String product_Id) {
		return productDetailService.getItemDetail(product_Id);

	}

	@RequestMapping(method = RequestMethod.GET, value = "/searchAllItem", produces = "application/json;charset=UTF-8")
	public @ResponseBody List<ProductDetailVO> searchAllItem(
			HttpServletRequest request) {

		return productDetailService.getAllItem();
	}

	@RequestMapping(method = RequestMethod.GET, value = "/findByPrimaryKeySQLQuery", produces = "application/json;charset=UTF-8")
	public @ResponseBody List<Object[]> findByPrimaryKeySQLQuery(
			HttpServletRequest request, @RequestParam String productDetail_Id) {
		return productDetailService.getItemByPrimaryKey(productDetail_Id);
	}

	// 加入購物車
	@RequestMapping(method = RequestMethod.GET, value = "/addShoppingCart", produces = "application/json;charset=UTF-8")
	public @ResponseBody Map<String, Object> addShoppingCart(
			HttpServletRequest request, @RequestParam String productDetail_Id) {
		return shoppingCart.addShoppingCart(productDetail_Id);
	}

	// 取出購物車內容
	@RequestMapping(method = RequestMethod.GET, value = "/showCart", produces = "application/json;charset=UTF-8")
	public @ResponseBody Map<String, Object> showCart(HttpServletRequest request) {
		return shoppingCart.getCart();
	}

	// 刪除購物車內商品
	@RequestMapping(method = RequestMethod.GET, value = "/deleteItem")
	public @ResponseBody void deleteItem(HttpServletRequest request,
			@RequestParam String productDetail_Id) {
		shoppingCart.deleteItem(productDetail_Id);
	}

	// 取總金額
	@RequestMapping(method = RequestMethod.GET, value = "/totalAmount")
	public @ResponseBody double totalAmount() {
		return shoppingCart.totalAmount();
	}

	// 更改數量
	@RequestMapping(method = RequestMethod.POST, value = "/ChangeProductNum")
	public @ResponseBody void ChangeProductNum(String productDetail_Id,
			String num) {
		shoppingCart.ChangeProductNum(productDetail_Id, num);
	}

	// 清空購物車
	@RequestMapping(method = RequestMethod.GET, value = "/cleanCart")
	public @ResponseBody void cleanCart() {
		shoppingCart.cleanCart();
	}

	// 驗證訂單資料
	@RequestMapping(method = RequestMethod.GET, value = "/checkForm", produces = "application/json;charset=UTF-8")
	public void checkForm(HttpServletRequest request,
			HttpServletResponse response, String name, String address,
			String email) {
		Map<String, String> errorMessage = new HashMap<String, String>();
		request.setAttribute("ErrorMassage", errorMessage);

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
			try {
				rd.forward(request, response);
			} catch (ServletException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

}
