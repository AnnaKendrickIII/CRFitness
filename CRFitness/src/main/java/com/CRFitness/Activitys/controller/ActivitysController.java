package com.CRFitness.Activitys.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.ws.rs.core.MediaType;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.CRFitness.Activitys.model.ActivitysService;
import com.CRFitness.Activitys.model.ActivitysVO;
@Controller
@RequestMapping("/activitysController")
public class ActivitysController {

	@Resource(name = "activitysService")
	private ActivitysService activitysService;
	
	@RequestMapping(method = RequestMethod.GET, value = "/photo/{activity_Id}", produces={
			"image/jpeg", "image/gif" })
	public @ResponseBody byte[] findActivitysPhoto(@PathVariable String activity_Id){
			return activitysService.findActivitysPhoto(activity_Id);
	}
	
	@RequestMapping(method = RequestMethod.GET, value ="/AllActivitys", produces = {MediaType.APPLICATION_JSON})
	public @ResponseBody List<ActivitysVO> findActivitysID(){	
		return activitysService.getAll();	
	}
	@RequestMapping(method = RequestMethod.GET, value ="/AllActivitysMembers", produces = {MediaType.APPLICATION_JSON})
	public @ResponseBody List<ActivitysVO> findActivitysMembers(){	
		return activitysService.findActivitysMembers();	
	}

	@RequestMapping(method = RequestMethod.GET, value = "/{member_Id}", produces = MediaType.APPLICATION_JSON)
	public @ResponseBody List<ActivitysVO> findActivitysMem(
			@PathVariable String member_Id) {		
		return activitysService.findActivitysMem(member_Id);
	}
	
	@RequestMapping(method = RequestMethod.POST, value ="/addActivitys")
	public @ResponseBody void addActivitys(
			@RequestParam String member_Id,
			@RequestParam String activity_Day,
			@RequestParam String activity_Class,
			@RequestParam String activity_Area,
			@RequestParam String photo1,
			@RequestParam String activity_Info,
			@RequestParam String deadline){	
		System.out.println(activity_Day);
		System.out.println(activity_Class);
		System.out.println(deadline);
		activitysService.addActivitys(member_Id, activity_Day, activity_Class, activity_Area, photo1, activity_Info, deadline);	
	}
}
