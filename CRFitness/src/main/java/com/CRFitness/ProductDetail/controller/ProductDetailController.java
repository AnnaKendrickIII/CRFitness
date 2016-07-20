package com.CRFitness.ProductDetail.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.core.MediaType;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.CRFitness.ProductDetail.model.ProductDetailService;
import com.CRFitness.ProductDetail.model.ProductDetailVO;
import com.CRFitness.ProductDetail.model.ShoppingCart;

@Controller
@RequestMapping("/productDetailController")
public class ProductDetailController {

	@Resource(name = "productDetailService")
	private ProductDetailService productDetailService;
	@Resource(name = "shoppingCart")
	private ShoppingCart shoppingCart;

	// front-end
	@RequestMapping(method = RequestMethod.GET, value = "/getAllDetail", produces = MediaType.APPLICATION_JSON)
	public @ResponseBody List<ProductDetailVO> getAllDetail(
			HttpServletRequest request) {
		return productDetailService.getAllItem();
	}

	@RequestMapping(method = RequestMethod.GET, value = "/getProductDetailId", produces = MediaType.APPLICATION_JSON)
	public @ResponseBody ProductDetailVO productDetailVO(
			HttpServletRequest request, @RequestParam String product_Name,
			@RequestParam String size, @RequestParam String color) {
		return null;
	}

	@RequestMapping(method = RequestMethod.GET, value = "/searchByCategory", produces = MediaType.APPLICATION_JSON)
	public @ResponseBody List<ProductDetailVO> searchByCategory(
			HttpServletRequest request, @RequestParam String category,
			@RequestParam Integer page) {
		return productDetailService.getItemByCategory(category, page);

	}

	@RequestMapping(method = RequestMethod.GET, value = "/searchAllItem", produces = "application/json;charset=UTF-8")
	public @ResponseBody List<ProductDetailVO> searchAllItem(
			HttpServletRequest request) {

		return productDetailService.getAllItem();
	}

	@RequestMapping(method = RequestMethod.GET, value = "/findByPrimaryKeySQLQuery", produces = "application/json;charset=UTF-8")
	public @ResponseBody List<Object> findByPrimaryKeySQLQuery(
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
		System.out.println(productDetail_Id);
		shoppingCart.deleteItem(productDetail_Id);
	}
}
