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
@RequestMapping("/productDetailController")
public class ProductDetailControllerBE {	

	@Resource(name = "productDetailService")
	private ProductDetailService productDetailService;
	
	// Back-end: 
	@RequestMapping(method = RequestMethod.GET, value ="/productDetail", produces = MediaType.APPLICATION_JSON)
	public @ResponseBody List<ProductDetailVO> AllProductDetails(){	
		return productDetailService.getAll();	
	}
	
	
	@RequestMapping(method = RequestMethod.POST, value ="/addProducts")
	public @ResponseBody List<Object> list(
			@RequestParam String product_Name,
			@RequestParam Double price,
			@RequestParam String category,
			@RequestParam String size,
			@RequestParam String color,
			@RequestParam Integer stock,
//			@RequestParam String published_Date,
			@RequestParam MultipartFile photo1,
			@RequestParam String introduction){
		try {
			product_Name = new String(product_Name.getBytes("iso-8859-1"), "utf-8");
//			price = price.valueOf(price);
			category = new String(category.getBytes("iso-8859-1"), "utf-8");
			size = new String(size.getBytes("iso-8859-1"), "utf-8");
			color = new String(color.getBytes("iso-8859-1"), "utf-8");
//			stock = new String(stock.getBytes("iso-8859-1"), "utf-8");
//			published_Date = new String(published_Date.getBytes("iso-8859-1"), "utf-8");
			introduction = new String(introduction.getBytes("iso-8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return productDetailService.addProductDetail(product_Name, price, category, size, color, stock, photo1, introduction);	
	}


	// helpless?
//	@RequestMapping(method = RequestMethod.GET, value = "/photo/{productDetail_Id}", produces={
//			"image/jpeg", "image/gif" })
//	public byte[] findProductsPhoto(@PathVariable String productDetail_Id){
//			return productDetailService.findProductsPhoto(productDetail_Id);
//	}
	
	
//	@RequestMapping(method = RequestMethod.GET, value = "/photo/{member_Id}", produces = { "image/jpeg", "image/gif" })
//	public @ResponseBody byte[] findMemberPhoto(HttpServletRequest request, @PathVariable String member_Id) {
//		if(memberService.findMemberPhoto(member_Id)==null){	
//			return memberService.CovertPhoto(request.getServletContext().getResourceAsStream("/images/NoImage.jpg"));
//		}else{
//			return memberService.findMemberPhoto(member_Id);
//		}
//	}
//	
//	
//	@RequestMapping(method = RequestMethod.POST, value ="/Login", produces = MediaType.APPLICATION_JSON)
//	public @ResponseBody MemberVO Third_party_Sign(
//			HttpServletRequest request,
//			@RequestParam String nickname,
//			@RequestParam String e_mail,
//			@RequestParam String photoUrl) {		
//		request.getSession().setAttribute("LoginOK", memberService.SignCheck(nickname, e_mail, photoUrl));
//		return null;
//	}

}
