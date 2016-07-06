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
public class ProductDetailControllerBE {	

	@Resource(name = "productDetailService")
	private ProductDetailService productDetailService;

	
	// Back-end: 
	@RequestMapping(method = RequestMethod.GET, value ="/productDetail", produces = MediaType.APPLICATION_JSON)
	public @ResponseBody List<ProductDetailVO> AllProductDetails(){	
		return productDetailService.getAll();	
	}
	
	// Back-end: MaintainEquipment.jsp
	@RequestMapping(method = RequestMethod.GET, value ="/EquipmentDetails", produces = MediaType.APPLICATION_JSON)
	public @ResponseBody List<ProductDetailVO> MaintainEquipmnet(){	
		return productDetailService.getEquipment();	
	}
	// Back-end: MaintainClothing.jsp
	@RequestMapping(method = RequestMethod.GET, value ="/ClothingDetails", produces = MediaType.APPLICATION_JSON)
	public @ResponseBody List<ProductDetailVO> MaintainClothing(){	
		return productDetailService.getClothing();	
	}
	// Back-end: MaintainAccessories.jsp
	@RequestMapping(method = RequestMethod.GET, value ="/AccessoriesDetails", produces = MediaType.APPLICATION_JSON)
	public @ResponseBody List<ProductDetailVO> MaintainAccessories(){	
		return productDetailService.getAccessories();	
	}
	// Back-end: MaintainShoes.jsp
	@RequestMapping(method = RequestMethod.GET, value ="/ShoesDetails", produces = MediaType.APPLICATION_JSON)
	public @ResponseBody List<ProductDetailVO> MaintainShoes(){	
		return productDetailService.getShoes();	
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
