package com.CRFitness.ActivityDetail.controller;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.CRFitness.ActivityDetail.model.ActivityDetailVO;
import com.CRFitness.ActivityDetail.model.ActivityDetailService;


@Controller
@RequestMapping("/activityDetailController")
public class ActivityDetailController {
	
	@Resource(name = "activitydetailService")
	private ActivityDetailService activitydetailService;

	@RequestMapping(method = RequestMethod.POST, value ="/addActivityDetail")
	public @ResponseBody List<String>  addActivityDetail(
			@RequestParam String activity_Id,
			@RequestParam String member_Id){
		return activitydetailService.addActivityDetail(activity_Id, member_Id);	
	}
	
	@RequestMapping(method = RequestMethod.POST, value ="/cleanActivityDetail")
	public @ResponseBody List<String>  cleanActivityDetail(
			@RequestParam String activity_Id,
			@RequestParam String member_Id){
//		System.out.println("activityDetailController" + activity_Id + member_Id);
		return activitydetailService.cleanActivityDetail(activity_Id, member_Id);	
	}
	
}
