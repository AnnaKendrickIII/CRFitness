package com.CRFitness.Chats.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("chatService")
public class ChatService {
	@Autowired
	public ChatDAO_interface chatDAO;
	
	public List<Object[]> selectFriendMessage(String member_Id,String friend_Id){
		return chatDAO.select_Friends_message(member_Id, friend_Id);
	}
	
}
