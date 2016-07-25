package com.CRFitness.Member.controller;

import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.core.MediaType;

import org.springframework.stereotype.Controller;
import org.springframework.util.Base64Utils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.CRFitness.Member.model.MemberService;
import com.CRFitness.Member.model.MemberVO;
import com.CRFitness.PersonalJournal.model.PersonalJournalVO;

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
			return memberService.CovertPhoto(request.getServletContext().getResourceAsStream("/images/memebers/NoImage.jpg"));	
		}			
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/insertphoto")
	public @ResponseBody byte[] insertphoto(
			HttpServletRequest request,
			@RequestParam String member_ID,
			@RequestParam String photo1
			) 
	{
		
		String realPath=request.getServletContext().getRealPath("/");
		String Path=realPath+"/images/members/"+member_ID+".jpg";	
		memberService.Insert_MemberImages(Path,photo1);
		return null;
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
		String Path=realPath+"/images/members/"+memberVO.getMember_Id()+".jpg";
		memberService.Third_insertimages(Path,photoUrl);
		return null;
	}

}
