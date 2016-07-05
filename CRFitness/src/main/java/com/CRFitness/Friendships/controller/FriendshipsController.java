package com.CRFitness.Friendships.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.ws.rs.core.MediaType;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.CRFitness.Friendships.model.FriendshipsService;
import com.CRFitness.Friendships.model.FriendshipsVO;
import com.CRFitness.Member.model.MemberService;
import com.CRFitness.Member.model.MemberVO;

@Controller
@RequestMapping("/friendships")
public class FriendshipsController {

	@Resource(name = "friendshipsService")
	private FriendshipsService friendshipsService;

	@RequestMapping(method = RequestMethod.GET, value = "{member_Id}", produces = MediaType.APPLICATION_JSON)
	public @ResponseBody List<MemberVO> findFriends(
			@PathVariable String member_Id) {		
		return friendshipsService.findFriends(member_Id);
	}
}
