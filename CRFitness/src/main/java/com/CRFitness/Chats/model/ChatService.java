package com.CRFitness.Chats.model;

import java.sql.Timestamp;
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
	public List<Object[]> select_NoReade_Friends_message (String member_Id,String friend_Id){
		return chatDAO.select_NoReade_Friends_message(member_Id, friend_Id);
	}
	public ChatVO NoRead(String member_Id,String friend_Id,String chat_Detail,Timestamp time){
		ChatVO chatVO=new ChatVO();
		chatVO.setMember_Id(member_Id);
		chatVO.setFriend_Id(friend_Id);
		chatVO.setChatTime(time);
		chatVO.setChat_Detail(chat_Detail);
		chatVO.setChatStuts(0);
		return chatDAO.insert(chatVO);		
	}
	public ChatVO IsRead(String member_Id,String friend_Id,String chat_Detail,Timestamp time){
		ChatVO chatVO=new ChatVO();
		chatVO.setMember_Id(member_Id);
		chatVO.setFriend_Id(friend_Id);
		chatVO.setChatTime(time);
		chatVO.setChat_Detail(chat_Detail);
		chatVO.setChatStuts(1);
		return chatDAO.insert(chatVO);		
	}
}
