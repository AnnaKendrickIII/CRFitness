package com.CRFitness.ProductDetail.controller;

<<<<<<< HEAD

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
	
//	@RequestMapping(method = RequestMethod.GET, value ="/productDetail", produces = MediaType.APPLICATION_JSON)
//	public @ResponseBody List<ProductDetailVO> list_productDetail(
//			HttpServletRequest request) {
//		request.getSession().setAttribute("list_products", productDetailService.getAll());
//		return productDetailService.getAll();
//	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/photo/{productDetail_Id}", produces={
			"image/jpeg", "image/gif" })
	public byte[] findProductsPhoto(@PathVariable String productDetail_Id){
			return productDetailService.findProductsPhoto(productDetail_Id);
	}
	
	@RequestMapping(method = RequestMethod.GET, value ="/productDetail", produces = MediaType.APPLICATION_JSON)
	public @ResponseBody List<ProductDetailVO> showProductDetails(){	
		return productDetailService.getAll();	
	}


	
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
=======
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
		request.getSession()
				.setAttribute("list_products", productDetailService);
		return productDetailService.getAllDetail();
	}

	@RequestMapping(method = RequestMethod.GET, value = "/getProductDetailId", produces = MediaType.APPLICATION_JSON)
	public @ResponseBody ProductDetailVO productDetailVO(
			HttpServletRequest request, @RequestParam String product_Name,
			@RequestParam String size, @RequestParam String color) {

		return null;
	}

	// back-end
	@RequestMapping(method = RequestMethod.GET, value = "/photo/{productDetail_Id}", produces = {
			"image/jpeg", "image/gif" })
	public byte[] findProductsPhoto(@PathVariable String productDetail_Id) {
		return productDetailService.findProductsPhoto(productDetail_Id);
	}

	// @RequestMapping(method = RequestMethod.GET, value ="/productDetail",
	// produces = MediaType.APPLICATION_JSON)
	// public @ResponseBody List<ProductDetailVO> showProductDetails(){
	// return productDetailService.getAll();
	// }
>>>>>>> branch 'master' of https://github.com/AnnaKendrickIII/CRFitness.git

}
