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
			"image/png","image/jpeg", "image/gif" })
	public @ResponseBody byte[] findMemberPhoto(
			HttpServletRequest request,
			@PathVariable String member_Id)   {
		
		String realPath=request.getServletContext().getRealPath("/");
		String Path=realPath+"/images/members/"+member_Id;
		if(memberService.ExitsCovertPhoto(Path)!=null){
			return memberService.ExitsCovertPhoto(Path);
		}else{
			return memberService.CovertPhoto(request.getServletContext().getResourceAsStream("/images/members/NoImage.jpg"));	
		
		}			
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/insertphoto", produces = {
			"image/png","image/jpeg", "image/gif" })
	public @ResponseBody byte[] insertphoto(
			HttpServletRequest request,
			@RequestParam String member_ID,
			@RequestParam String photo1
			) 
	{
		
		String realPath=request.getServletContext().getRealPath("/");
		String Path=realPath+"/images/members/"+member_ID;	
		return memberService.Insert_MemberImages(Path,photo1);
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
		String Path=realPath+"/images/members/"+memberVO.getMember_Id();
		memberService.Third_insertimages(Path,photoUrl);
		return null;
	}
	
	@RequestMapping(method = RequestMethod.POST, value ="/APPLogin", produces= "text/html; charset=utf-8" )
	public @ResponseBody String APP_Sign(
			HttpServletResponse response,
			@RequestParam String e_mail,
			@RequestParam String password
			)  {
		response.setHeader("Access-Control-Allow-Origin", "*");
		if (memberService.checkPassword(e_mail)) {
			return "失敗";
		}
		if(memberService.login(e_mail, password)!=null){
			return "成功";
		}else{
			return "失敗";
		}
	}
	

}
