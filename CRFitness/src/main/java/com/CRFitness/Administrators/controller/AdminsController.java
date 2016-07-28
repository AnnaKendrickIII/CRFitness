package com.CRFitness.Administrators.controller;

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

import com.CRFitness.Administrators.model.AdminsService;

@Controller
@RequestMapping("/adminsController")
public class AdminsController {	

	@Resource(name = "adminsService")
	private AdminsService adminsService;
	
	@RequestMapping(method = RequestMethod.GET, value = "/photo/{administrator_Id}", produces = {
			"image/png", "image/jpeg", "image/gif" })
	public @ResponseBody byte[] findMemberPhoto(
			HttpServletRequest request,
			@PathVariable String administrator_Id)   {
		
		String realPath = request.getServletContext().getRealPath("/");
		String Path = realPath+"/admin/assets/img/"+administrator_Id;
		if(adminsService.showCoverPhoto(Path)!=null){
			return adminsService.showCoverPhoto(Path);
		}else{
			return adminsService.CovertPhoto(request.getServletContext().getResourceAsStream("/images/members/NoImage.jpg"));	
		
		}			
	}
	
	// unnecessary
	@RequestMapping(method = RequestMethod.POST, value = "/insertphoto", produces = {
			"image/png","image/jpeg", "image/gif" })
	public @ResponseBody byte[] insertphoto(
			HttpServletRequest request,
			@RequestParam String administrator_Id,
			@RequestParam String photo1) {
		String realPath=request.getServletContext().getRealPath("/");
		String Path=realPath+"/images/members/"+administrator_Id;	
		return adminsService.Insert_MemberImages(Path,photo1);
	}
	
}
