package com.CRFitness.Member.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.core.MediaType;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.CRFitness.Member.model.MemberService;
import com.CRFitness.Member.model.MemberVO;

@Controller
@RequestMapping("/memberControllerBE")
public class MemberControllerBE {	

	@Resource(name = "memberService")
	private MemberService memberService;
	
	// select members，新增的列顯示在最上面
	@RequestMapping(method = RequestMethod.GET, value = "/getAll", produces = "application/json; charset=utf-8")
	public @ResponseBody List<MemberVO> getAll() {
		return memberService.getAll();
	}
	
	// change status
	@RequestMapping(method = RequestMethod.POST, value ="/changeStatus", produces="text/html; charset=utf-8")
	public @ResponseBody String changeStatus(
			@RequestParam String member_Id,
			@RequestParam String member_Status){
//		String VO = productDetailService.changeStatus(member_Id, member_Status);
//		System.out.println(VO);
		return memberService.changeStatus(member_Id, member_Status);	
	}
}
