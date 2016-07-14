package com.CRFitness.ProductDetail.controller;


import java.io.UnsupportedEncodingException;
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
import org.springframework.web.multipart.MultipartFile;

import com.CRFitness.Activitys.model.ActivitysVO;
import com.CRFitness.ProductDetail.model.ProductDetailService;
import com.CRFitness.ProductDetail.model.ProductDetailVO;

@Controller
@RequestMapping("/productDetailControllerBE")
public class ProductDetailControllerBE {	

	@Resource(name = "productDetailService")
	private ProductDetailService productDetailService;
	
	// 新增products
	@RequestMapping(method = RequestMethod.POST, value ="/addProducts")
	public @ResponseBody List<Object> list(
			@RequestParam String product_Name,
			@RequestParam String price,
			@RequestParam String category,
			@RequestParam String size,
			@RequestParam String color,
			@RequestParam String stock,
//			@RequestParam String published_Date,
			@RequestParam MultipartFile photo1,
			@RequestParam String introduction){
		Double price2 = Double.parseDouble(price);
		Integer stock2 = Integer.parseInt(stock);
		try {
			product_Name = new String(product_Name.getBytes("iso-8859-1"), "utf-8");
			category = new String(category.getBytes("iso-8859-1"), "utf-8");
			size = new String(size.getBytes("iso-8859-1"), "utf-8");
			color = new String(color.getBytes("iso-8859-1"), "utf-8");
//			published_Date = new String(published_Date.getBytes("iso-8859-1"), "utf-8");
			introduction = new String(introduction.getBytes("iso-8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return productDetailService.addProductDetail(product_Name, price2, category, size, color, stock2, photo1, introduction);	
	}
	
	// 修改 products
	@RequestMapping(method = RequestMethod.POST, value ="/updateProducts")
	public @ResponseBody List<Object> updateProducts(
			@RequestParam String product_Id,
			@RequestParam String product_Name,
			@RequestParam String price,
			@RequestParam String category,
			@RequestParam String productDetail_Id,
			@RequestParam String size,
			@RequestParam String color,
			@RequestParam String stock,
//			@RequestParam String published_Date,
			@RequestParam MultipartFile photo1,
			@RequestParam String introduction){
		Double price2 = Double.parseDouble(price);
		Integer stock2 = Integer.parseInt(stock);
		try {
			product_Name = new String(product_Name.getBytes("iso-8859-1"), "utf-8");
			category = new String(category.getBytes("iso-8859-1"), "utf-8");
			size = new String(size.getBytes("iso-8859-1"), "utf-8");
			color = new String(color.getBytes("iso-8859-1"), "utf-8");
//			published_Date = new String(published_Date.getBytes("iso-8859-1"), "utf-8");
			introduction = new String(introduction.getBytes("iso-8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return productDetailService.updateProductDetail(product_Id, productDetail_Id, product_Name, price2, category, size, color, stock2, photo1, introduction);	
	}
	
	
	// 新增的列顯示在最上面
	@RequestMapping(method = RequestMethod.GET, value = "/getAllByDesc", produces = MediaType.APPLICATION_JSON)
	public @ResponseBody List<ProductDetailVO> getAllDetail() {
		return productDetailService.getAllByDesc();
	}

}
