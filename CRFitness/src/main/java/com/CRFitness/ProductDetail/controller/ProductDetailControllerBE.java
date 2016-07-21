package com.CRFitness.ProductDetail.controller;


import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
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

import com.CRFitness.PersonalJournal.model.PersonalJournalVO;
import com.CRFitness.ProductDetail.model.ProductDetailService;
import com.CRFitness.ProductDetail.model.ProductDetailVO;

@Controller
@RequestMapping("/productDetailControllerBE")
public class ProductDetailControllerBE {	

	@Resource(name = "productDetailService")
	private ProductDetailService productDetailService;
	
	// select products，新增的列顯示在最上面
	@RequestMapping(method = RequestMethod.GET, value = "/getAllByDesc", produces = MediaType.APPLICATION_JSON)
	public @ResponseBody List<Object[]> getAllDetail() {
		return productDetailService.getAllByDesc();
	}
	
	// insert products
	@RequestMapping(method = RequestMethod.POST, value ="/addProducts")
	public @ResponseBody List<Object[]> list(
			@RequestParam String product_Name,
			@RequestParam String price,
			@RequestParam String category,
			@RequestParam String size,
			@RequestParam String color,
			@RequestParam String stock,
			@RequestParam MultipartFile photo1,			
			@RequestParam MultipartFile photo2,			
			@RequestParam MultipartFile photo3,			
			@RequestParam MultipartFile photo4,			
			@RequestParam MultipartFile photo5,					
			@RequestParam String product_Status,
			@RequestParam String info,
			HttpServletRequest request){
		Double price2 = Double.parseDouble(price);
		Integer stock2 = Integer.parseInt(stock);
		try {
			product_Name = new String(product_Name.getBytes("iso-8859-1"), "utf-8");
			category = new String(category.getBytes("iso-8859-1"), "utf-8");
			size = new String(size.getBytes("iso-8859-1"), "utf-8");
			color = new String(color.getBytes("iso-8859-1"), "utf-8");
			product_Status = new String(product_Status.getBytes("iso-8859-1"), "utf-8");
			info = new String(info.getBytes("iso-8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		List<Object[]> list = productDetailService.addProductDetail(product_Name, price2, category, size, color, stock2, photo1, product_Status, info);
		
		String realPath=request.getServletContext().getRealPath("/");

		MultipartFile[] photos = {photo1, photo2, photo3, photo4, photo5};
	System.out.println(realPath);
		String Path = realPath+"/images/products/"+((ProductDetailVO)((list.get(0))[1])).getProductDetail_Id();	
		productDetailService.Insert_Images(Path, photos);
		return list;
	}
	
	// update products
	@RequestMapping(method = RequestMethod.POST, value ="/updateProducts")
	public @ResponseBody List<Object[]> updateProducts(
			@RequestParam String productDetail_Id,
			@RequestParam String product_Id,
			@RequestParam String product_Name,
			@RequestParam String price,
			@RequestParam String category,
			@RequestParam String size,
			@RequestParam String color,
			@RequestParam String stock,
//			@RequestParam MultipartFile photo1,
			@RequestParam String product_Status,
			@RequestParam String info){
		Double price2 = Double.parseDouble(price);
		Integer stock2 = Integer.parseInt(stock);
		try {
			product_Id = new String(product_Id.getBytes("iso-8859-1"), "utf-8");
			product_Name = new String(product_Name.getBytes("iso-8859-1"), "utf-8");
			category = new String(category.getBytes("iso-8859-1"), "utf-8");
			productDetail_Id = new String(productDetail_Id.getBytes("iso-8859-1"), "utf-8");
			size = new String(size.getBytes("iso-8859-1"), "utf-8");
			color = new String(color.getBytes("iso-8859-1"), "utf-8");
			product_Status = new String(product_Status.getBytes("iso-8859-1"), "utf-8");
			info = new String(info.getBytes("iso-8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return productDetailService.updateProductDetail(productDetail_Id, product_Id, product_Name, price2, category, info, size, color, stock2, product_Status);	
	}
	
	// change status
	@RequestMapping(method = RequestMethod.POST, value ="/changeStatus",produces="text/html;charset=utf-8")
	public @ResponseBody String changeStatus(
			@RequestParam String productDetail_Id,
			@RequestParam String product_Status){
//		String VO = productDetailService.changeStatus(productDetail_Id, product_Status);
//		System.out.println(VO);
		return productDetailService.changeStatus(productDetail_Id, product_Status);	
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/photo/{productDetail_Id}_1", produces={
			"image/jpeg", "image/gif", "image/png"})
	public @ResponseBody byte[] findActivitysPhoto(
			HttpServletRequest request,
			@PathVariable String productDetail_Id){
			String realPath = request.getServletContext().getRealPath("/");
			String Path = realPath + "/images/products/" + productDetail_Id+"_1";
			return productDetailService.showPhotos(Path);
	}

}
