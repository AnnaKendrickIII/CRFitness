package com.CRFitness.Products.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.core.MediaType;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.CRFitness.Products.model.ProductsService;
import com.CRFitness.Products.model.ProductsVO;

@Controller
@RequestMapping("/productsController")
public class ProductsController {

	@Resource(name = "productsService")
	private ProductsService productsService;

	@RequestMapping(method = RequestMethod.GET, value = "/selectAllItem", produces = MediaType.APPLICATION_JSON)
	public @ResponseBody List<ProductsVO> list_productsVO(HttpServletRequest request) {
		
		return productsService.selectAllItem();
	}

//	@RequestMapping(method = RequestMethod.GET, value = "/searchAllItem", produces = MediaType.APPLICATION_JSON)
//	public @ResponseBody List<ProductsVO> searchAllItem(HttpServletRequest request) {
//		request.getSession().setAttribute("searchAllItem", productsService);
//		return productsService.searchAllItem();
//	}

}
