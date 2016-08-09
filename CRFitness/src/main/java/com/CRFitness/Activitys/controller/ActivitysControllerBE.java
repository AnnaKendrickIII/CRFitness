package com.CRFitness.Activitys.controller;


import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.CRFitness.Activitys.model.ActivitysService;

@Controller
@RequestMapping("/activitysControllerBE")
public class ActivitysControllerBE {
	
	@Resource(name = "activitysService")
	private ActivitysService activitysService;
	
	// change status
	@RequestMapping(method = RequestMethod.POST, value = "/changeStatus", produces = "application/json; charset=utf-8")
	public @ResponseBody Integer changeStatus(
			@RequestParam String activity_Id,
			@RequestParam Integer activity_Status){
//		String VO = activitysService.changeStatus(activity_Id, activity_Status);
//		System.out.println(VO);
		return activitysService.changeStatus(activity_Id, activity_Status);	
	}
}
