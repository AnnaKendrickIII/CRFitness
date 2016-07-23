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
