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

	@RequestMapping(method = RequestMethod.POST, value ="/addActivitys")
	public @ResponseBody void addActivitys(
			@RequestParam String member_Id,
			@RequestParam String activity_Area,
			@RequestParam String activity_Info,
			@RequestParam String photo1,
			@RequestParam String date){	
		System.out.println(photo1);
		activitysService.addActivitys(member_Id, activity_Area, activity_Info, photo1, date);	
	}
}
