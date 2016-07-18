package com.CRFitness.Activitys.controller;

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

import com.CRFitness.Activitys.model.ActivitysService;
import com.CRFitness.Activitys.model.ActivitysVO;
@Controller
@RequestMapping("/activitysController")
public class ActivitysController {

	@Resource(name = "activitysService")
	private ActivitysService activitysService;
	
//	@RequestMapping(method = RequestMethod.GET, value = "/photo/{activity_Id}", produces={
//			"image/jpeg", "image/gif" })
//	public @ResponseBody byte[] findActivitysPhoto(@PathVariable String activity_Id){
//			return activitysService.findActivitysPhoto(activity_Id);
//	}
	
	@RequestMapping(method = RequestMethod.GET, value ="/AllActivitys", produces = {MediaType.APPLICATION_JSON})
	public @ResponseBody List<ActivitysVO> findActivitysID(){	
		return activitysService.getAll();	
	}
	@RequestMapping(method = RequestMethod.GET, value ="/AllActivitysMembers", produces = {MediaType.APPLICATION_JSON})
	public @ResponseBody List<ActivitysVO> findActivitysMembers_One(){	
		return activitysService.findActivitysMembers_One();	
	}
//	@RequestMapping(method = RequestMethod.GET, value ="/AllActivitysMembersTwo", produces = {MediaType.APPLICATION_JSON})
//	public @ResponseBody List<ActivitysVO> findActivitysMembers_Two(){	
//		return activitysService.findActivitysMembers_Two();	
//	}
	

	@RequestMapping(method = RequestMethod.GET, value = "/{member_Id}", produces = MediaType.APPLICATION_JSON)
	public @ResponseBody List<ActivitysVO> findActivitysMem(
			@PathVariable String member_Id) {		
		return activitysService.findActivitysMem(member_Id);
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/myActivitys/{member_Id}", produces = MediaType.APPLICATION_JSON)
	public @ResponseBody List<ActivitysVO> findMyActivitys(
			@PathVariable String member_Id) {		
		return activitysService.findMyActivitys(member_Id);
	}
	
	@RequestMapping(method = RequestMethod.POST, value ="/addActivitys")
	public @ResponseBody ActivitysVO addActivitys(
			HttpServletRequest request,
			@RequestParam String member_Id,
			@RequestParam String activity_Day,
			@RequestParam String activity_Class,
			@RequestParam String activity_Area,
			@RequestParam MultipartFile photo1,
			@RequestParam String activity_Info,
			@RequestParam String deadline,
			@RequestParam Integer people_Max){
		try {
			member_Id = new String(member_Id.getBytes("iso-8859-1"), "utf-8");
			activity_Class = new String(activity_Class.getBytes("iso-8859-1"), "utf-8");
			activity_Area = new String(activity_Area.getBytes("iso-8859-1"), "utf-8");
			activity_Info = new String(activity_Info.getBytes("iso-8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		 ActivitysVO activitysVO = activitysService.addActivitys(member_Id, activity_Day, activity_Class, activity_Area, activity_Info, deadline, people_Max);	
		 String realPath=request.getServletContext().getRealPath("/");
		 String Path = realPath+"/images/activitys/"+activitysVO.getActivity_Id()+".jpg";
		 activitysService.Insert_activitysImages(Path, photo1);
		 return activitysVO;
	}

	@RequestMapping(method = RequestMethod.POST, value = "/modifyActivitys")
	public @ResponseBody ActivitysVO modifyActivitys(
			@RequestParam String activity_Id,		
			@RequestParam String activity_Class,
			@RequestParam String activity_Area,
			@RequestParam String activity_Info,
			@RequestParam String activity_Day,
			@RequestParam String deadline) {
		System.out.println("activity_DayController" + activity_Day);
			System.out.println("deadlineController" + deadline);
		return activitysService.modifyActivitys(activity_Id, activity_Day,
				activity_Class, activity_Area, activity_Info, deadline);
	}
	
}
