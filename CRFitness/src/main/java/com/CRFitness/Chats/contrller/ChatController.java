package com.CRFitness.Chats.contrller;


import java.util.List;

import javax.annotation.Resource;


import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.CRFitness.Chats.model.ChatService;
@Controller
@RequestMapping("/chatController")
public class ChatController {

	@Resource(name = "chatService")
	private ChatService chatService;
	@RequestMapping(method = RequestMethod.GET, value ="/selectFriendMessage", produces = "application/json; charset=utf-8")
	public @ResponseBody List<Object[]> selectFriendMessage(
			@RequestParam String member_Id,@RequestParam String friend_Id){	
		return chatService.selectFriendMessage(member_Id, friend_Id);	
	}
}
