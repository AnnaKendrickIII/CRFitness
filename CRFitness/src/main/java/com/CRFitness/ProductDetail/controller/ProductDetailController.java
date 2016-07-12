package com.CRFitness.ProductDetail.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.core.MediaType;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.CRFitness.Activitys.model.ActivitysVO;
import com.CRFitness.ProductDetail.model.ProductDetailService;
import com.CRFitness.ProductDetail.model.ProductDetailVO;
import com.CRFitness.Products.model.ProductsService;

@Controller
@RequestMapping("/productDetailController")
public class ProductDetailController {

	@Resource(name = "productDetailService")
	private ProductDetailService productDetailService;

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

	@RequestMapping(method = RequestMethod.GET, value = "/searchByPrimaryKey", produces = MediaType.APPLICATION_JSON)
	public @ResponseBody ProductDetailVO searchByPrimaryKey(
			HttpServletRequest request, @RequestParam String productDetail_Id) {


		return productDetailService.getItemByPrimaryKey(productDetail_Id);
	}

	@RequestMapping(method = RequestMethod.GET, value = "/searchByCategory", produces = MediaType.APPLICATION_JSON)
	public @ResponseBody List<ProductDetailVO> searchByCategory(
			HttpServletRequest request, @RequestParam String category) {
		return productDetailService.getItemByCategory(category);

	}

	@RequestMapping(method = RequestMethod.GET, value = "/searchAllItem", produces = MediaType.APPLICATION_JSON)
	public @ResponseBody List<ProductDetailVO> searchAllItem(
			HttpServletRequest request, String products_Id) {


		return productDetailService.getAllItem();
	}
}
