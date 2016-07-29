package com.CRFitness.Chats.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class ChatVO implements Serializable{

	private static final long serialVersionUID = 1L;
	private Integer chat_Id;      						
	private String member_Id;		 
	private String friend_Id;		 
	private String chat_Detail;	
	private Timestamp chatTime ;
	private Integer ChatStuts;
	
	public Integer getChatStuts() {
		return ChatStuts;
	}
	public void setChatStuts(Integer chatStuts) {
		ChatStuts = chatStuts;
	}
	public Integer getChat_Id() {
		return chat_Id;
	}
	public void setChat_Id(Integer chat_Id) {
		this.chat_Id = chat_Id;
	}
	public String getMember_Id() {
		return member_Id;
	}
	public void setMember_Id(String member_Id) {
		this.member_Id = member_Id;
	}
	public String getFriend_Id() {
		return friend_Id;
	}
	public void setFriend_Id(String friend_Id) {
		this.friend_Id = friend_Id;
	}
	public String getChat_Detail() {
		return chat_Detail;
	}
	public void setChat_Detail(String chat_Detail) {
		this.chat_Detail = chat_Detail;
	}
	public Timestamp getChatTime() {
		return chatTime;
	}
	public void setChatTime(Timestamp chatTime) {
		this.chatTime = chatTime;
	}    
	
	
}
