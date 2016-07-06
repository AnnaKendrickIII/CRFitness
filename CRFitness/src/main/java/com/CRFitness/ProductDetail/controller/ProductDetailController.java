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

@Controller
@RequestMapping("/productDetailController")
public class ProductDetailController {

	@Resource(name = "productDetailService")
	private ProductDetailService productDetailService;

	// front-end
	@RequestMapping(method = RequestMethod.GET, value = "/getAllDetail", produces = MediaType.APPLICATION_JSON)
	public @ResponseBody List<ProductDetailVO> list_productDetail(
			HttpServletRequest request) {
		request.getSession().setAttribute("list_productDetail",
				productDetailService);
		return productDetailService.getAllItem();
	}

	@RequestMapping(method = RequestMethod.GET, value = "/getProductDetailId", produces = MediaType.APPLICATION_JSON)
	public @ResponseBody ProductDetailVO productDetailVO(
			HttpServletRequest request, @RequestParam String product_Name,
			@RequestParam String size, @RequestParam String color) {

		return null;
	}


}
