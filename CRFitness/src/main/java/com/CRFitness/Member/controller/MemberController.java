package com.CRFitness.Member.controller;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
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
@RequestMapping("/memberController")
public class MemberController {	

	@Resource(name = "memberService")
	private MemberService memberService;
	
	@RequestMapping(method = RequestMethod.GET, value = "/photo/{member_Id}", produces = {
			"image/jpeg", "image/gif" })
	public @ResponseBody byte[] findMemberPhoto(
			HttpServletRequest request,
			@PathVariable String member_Id) {
		if(memberService.findMemberPhoto(member_Id)==null){	
			return memberService.CovertPhoto(request.getServletContext().getResourceAsStream("/images/NoImage.jpg"));
		}else{
			return memberService.findMemberPhoto(member_Id);
		}
	}
	

	
	@RequestMapping(method = RequestMethod.POST, value ="/Login", produces = MediaType.APPLICATION_JSON)
	public @ResponseBody MemberVO Third_party_Sign(
			HttpServletRequest request,
			@RequestParam String nickname,
			@RequestParam String e_mail,
			@RequestParam String photoUrl) {
	request.getSession().setAttribute("LoginOK", memberService.SignCheck(nickname, e_mail, photoUrl));
		return null;
	}

}
