package com.CRFitness.RoutePlan.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.jboss.logging.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.CRFitness.Member.model.MemberVO;
import com.CRFitness.RoutePlan.model.RoutePlanService;
import com.CRFitness.RoutePlan.model.RoutePlanVO;

@Controller
@RequestMapping("/routePlanController")
public class RoutePlanController {

	@Autowired
	private RoutePlanService routePlanService;
	
	@RequestMapping(method = RequestMethod.GET, value = "/getRPAll")
	public @ResponseBody List<RoutePlanVO> getMemberRoutePlanVOs(@RequestParam String member_Id,HttpSession session){
		MemberVO membervo = (MemberVO)session.getAttribute("LoginOK");
		if(membervo != null && membervo.getMember_Id() != null)
			return routePlanService.getMemberRoutePlanVOs(membervo.getMember_Id());
		else
			return null;
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/addRP")
	public @ResponseBody RoutePlanVO addRoutePlan(@RequestParam String member_Id,
			@RequestParam String startPoint,
			@RequestParam String endPoint,
			@RequestParam Double dist,
			@RequestParam Integer routePlanStatus,
			HttpSession session){
		MemberVO membervo = (MemberVO)session.getAttribute("LoginOK");
		if(membervo != null && membervo.getMember_Id() != null && startPoint != "" && endPoint != "")
			return routePlanService.addRoutePlan(member_Id, startPoint, endPoint, dist, routePlanStatus);
		else
			return null;
	}
}
