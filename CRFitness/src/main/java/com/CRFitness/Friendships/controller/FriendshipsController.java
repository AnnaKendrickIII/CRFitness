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
	public @ResponseBody List<Object[]> findFriends(
			@PathVariable String member_Id) {		
		return friendshipsService.findFriends(member_Id);
	}
	
	
	@RequestMapping(method = RequestMethod.POST, value = "/addFriends", produces = MediaType.APPLICATION_JSON)
	public @ResponseBody boolean addFriends(
			@RequestParam String member_Id,
			@RequestParam String friend_Id) {
		return friendshipsService.addFriend(member_Id, friend_Id);
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/findFriendFlag", produces = MediaType.APPLICATION_JSON)
	public @ResponseBody Integer findFriendFlag(@RequestParam String member_Id,
			@RequestParam String friend_Id){
		return friendshipsService.select_Friend_Flag(member_Id, friend_Id);
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/findFriendsFlag", produces = MediaType.APPLICATION_JSON)
	public @ResponseBody Long findFriendsFlag(@RequestParam String member_Id){
		return friendshipsService.select_Friends_Flag(member_Id);
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/acceptFriend", produces = MediaType.APPLICATION_JSON)
	public @ResponseBody boolean acceptfriend(@RequestParam String member_Id,
			@RequestParam String friend_Id){
		return friendshipsService.acceptFriend(member_Id, friend_Id);
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/deleteFriend", produces = MediaType.APPLICATION_JSON)
	public @ResponseBody boolean deleteFriends(
			@RequestParam String member_Id,
			@RequestParam String friend_Id) {
		return friendshipsService.deleteFriend(member_Id, friend_Id);
	}
}
