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
	//查詢已讀3則
	@RequestMapping(method = RequestMethod.GET, value ="/selectFriendMessage", produces = "application/json; charset=utf-8")
	public @ResponseBody List<Object[]> selectFriendMessage(
			@RequestParam String member_Id,@RequestParam String friend_Id){	
		return chatService.selectFriendMessage(member_Id, friend_Id);	
	}
	//查詢未讀
	@RequestMapping(method = RequestMethod.GET, value ="/select_NoReade_Friends_message", produces = "application/json; charset=utf-8")
	public @ResponseBody List<Object[]> select_NoReade_Friends_message(
			@RequestParam String member_Id,@RequestParam String friend_Id){	
		return chatService.select_NoReade_Friends_message(member_Id, friend_Id);	
	}
	//變更好友對本人發送訊息 未讀為已讀
	@RequestMapping(method = RequestMethod.POST, value ="/update_NoReade_Friends_message")
	public @ResponseBody void update_NoReade_Friends_message(
			@RequestParam String member_Id,@RequestParam String friend_Id){	
		 chatService.update_NoReade_Friends_message(member_Id, friend_Id);	
	}
	
	@RequestMapping(method = RequestMethod.POST, value ="/update_AddFriends_ChatStuts")
	public @ResponseBody int update_AddFriends_ChatStuts(
			@RequestParam String member_Id){	
		return chatService.update_AddFriends_ChatStuts(member_Id);	
	}
	//查詢我有幾則未讀訊息以及好友邀請
	@RequestMapping(method = RequestMethod.GET, value ="/select_NoRead_Friends_Allmessage", produces = "application/json; charset=utf-8")
	public @ResponseBody List<Object[]> select_NoRead_Friends_Allmessage(
				@RequestParam String member_Id){	
		return chatService.select_NoRead_Friends_Allmessage(member_Id);	
	}
	
	//變更好友對本人發送訊息 未讀為已讀
		@RequestMapping(method = RequestMethod.POST, value ="/update_notifaction_message")
		public @ResponseBody void update_notifaction_message(
				@RequestParam String member_Id,@RequestParam String friend_Id){	
			 chatService.update_notifaction_message(member_Id, friend_Id);	
		}
}
