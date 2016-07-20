package com.CRFitness.Friendships.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.ws.rs.core.MediaType;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	
	@RequestMapping(method = RequestMethod.POST, value = "/addFriends", produces = MediaType.APPLICATION_JSON)
	public @ResponseBody boolean addFriends(
			@RequestParam String member_Id,
			@RequestParam String friend_Id) {
		return friendshipsService.addFriend(member_Id, friend_Id);
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/deleteFriends", produces = MediaType.APPLICATION_JSON)
	public @ResponseBody boolean deleteFriends(
			@RequestParam String member_Id,
			@RequestParam String friend_Id) {
		return friendshipsService.updateFriend(member_Id, friend_Id, 0);
	}
}
