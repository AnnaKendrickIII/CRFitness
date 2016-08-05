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
@RequestMapping("/chatControllerBE")
public class ChatControllerBE {

	@Resource(name = "chatService")
	private ChatService chatService;
	
	// 顯示已發3則公告
	@RequestMapping(method = RequestMethod.GET, value ="/showNotices", produces = "application/json; charset=utf-8")
	public @ResponseBody List<Object[]> selectFriendMessage(
			@RequestParam String member_Id,@RequestParam String friend_Id){	
		return chatService.selectFriendMessage(member_Id, friend_Id);	
	}
	
	// 查詢未讀
	@RequestMapping(method = RequestMethod.GET, value ="/select_NoReade_Friends_message", produces = "application/json; charset=utf-8")
	public @ResponseBody List<Object[]> select_NoReade_Friends_message(
			@RequestParam String member_Id,@RequestParam String friend_Id){	
		return chatService.select_NoReade_Friends_message(member_Id, friend_Id);	
	}
	
	// 變更好友對本人發送訊息 未讀為已讀
	@RequestMapping(method = RequestMethod.POST, value ="/giveNotices")
	public @ResponseBody void update_NoReade_Friends_message(
			@RequestParam String member_Id, @RequestParam String friend_Id){	
		 chatService.update_NoReade_Friends_message(member_Id, friend_Id);	
	}
	
	// 
	@RequestMapping(method = RequestMethod.POST, value ="/update_AddFriends_ChatStuts")
	public @ResponseBody int update_AddFriends_ChatStuts(
			@RequestParam String member_Id){	
		return chatService.update_AddFriends_ChatStuts(member_Id);	
	}
	
}
