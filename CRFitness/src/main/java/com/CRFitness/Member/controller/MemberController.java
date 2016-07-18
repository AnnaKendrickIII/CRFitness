package com.CRFitness.Member.controller;

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
@RequestMapping("/memberController")
public class MemberController {	

	@Resource(name = "memberService")
	private MemberService memberService;
	
	@RequestMapping(method = RequestMethod.GET, value = "/photo/{member_Id}", produces = {
			"image/jpeg", "image/gif" })
	public @ResponseBody byte[] findMemberPhoto(
			HttpServletRequest request,
			@PathVariable String member_Id)   {
		String realPath=request.getServletContext().getRealPath("/");
		String Path=realPath+"/images/members/"+member_Id+".jpg";
		System.out.println(Path);
		if(memberService.ExitsPhoto(Path)){				
			return memberService.CovertPhoto(request.getServletContext().getResourceAsStream("/images/NoImage.jpg"));
		}else{
			return memberService.CovertPhoto(request.getServletContext().getResourceAsStream("/images/members/"+member_Id+".jpg"));
		}
	}
	

	
	@RequestMapping(method = RequestMethod.POST, value ="/Login", produces = MediaType.APPLICATION_JSON)
	public @ResponseBody MemberVO Third_party_Sign(
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam String nickname,
			@RequestParam String e_mail,
			@RequestParam String photoUrl)  {
		MemberVO memberVO=memberService.SignCheck(nickname, e_mail);
		request.getSession().setAttribute("LoginOK", memberVO);
		String realPath=request.getServletContext().getRealPath("/");
		System.out.println(realPath);
		String Path=realPath+"/images/members/"+memberVO.getMember_Id()+".jpg";
		memberService.Third_insertimages(Path,photoUrl);
		return null;
	}

}
