package com.CRFitness.Chats.model;

import java.sql.Timestamp;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.CRFitness.Member.model.MemberDAO_interface;
import com.CRFitness.Member.model.MemberVO;

@Service("chatService")
public class ChatService {
	@Autowired
	public ChatDAO_interface chatDAO;
	@Resource(name = "memberDAO")
	private MemberDAO_interface memberDAO;
	//查詢已讀三則
	public List<Object[]> selectFriendMessage(String member_Id,String friend_Id){
		return chatDAO.select_Friends_message(member_Id, friend_Id);
	}
	//查尋未讀
	public List<Object[]> select_NoReade_Friends_message (String member_Id,String friend_Id){
		return chatDAO.select_NoReade_Friends_message(member_Id, friend_Id);
	}
	//新增未讀
	public ChatVO NoRead(String member_Id,String friend_Id,String chat_Detail,Timestamp time){
		ChatVO chatVO=new ChatVO();
		chatVO.setMember_Id(member_Id);
		chatVO.setFriend_Id(friend_Id);
		chatVO.setChatTime(time);
		chatVO.setChat_Detail(chat_Detail);
		chatVO.setChatStuts(0);
		return chatDAO.insert(chatVO);		
	}
	//新增已讀
	public ChatVO IsRead(String member_Id,String friend_Id,String chat_Detail,Timestamp time){
		ChatVO chatVO=new ChatVO();
		chatVO.setMember_Id(member_Id);
		chatVO.setFriend_Id(friend_Id);
		chatVO.setChatTime(time);
		chatVO.setChat_Detail(chat_Detail);
		chatVO.setChatStuts(1);
		return chatDAO.insert(chatVO);		
	}
	//變更好友對本人發送訊息 未讀為已讀
	public void update_NoReade_Friends_message(String member_Id,String friend_Id){
		List<ChatVO> list=chatDAO.select_NoReade_FriendsforMe_message(member_Id,friend_Id);
		for( ChatVO chatVO:list){				
				chatVO.setChatStuts(1);
				chatDAO.updateNoReade_status(chatVO);		
		}	 
	}
	
	//變更好友對本人加好友訊息 未讀為已讀
		public int update_AddFriends_ChatStuts(String member_Id){	
			List<ChatVO> list=chatDAO.select_AddFriends_ChatStuts(member_Id);
			for( ChatVO chatVO:list){				
					chatVO.setChatStuts(3);
					chatDAO.updateNoReade_status(chatVO);		
			}	
			return list.size();
		}
	//查詢我有幾則未讀訊息以及好友邀請
	public List<Object[]>  select_NoRead_Friends_Allmessage(String member_Id){
		return chatDAO.select_NoRead_Friends_Allmessage(member_Id);	
	}
	
	//增加會員未讀公告
	public void notifaction(String member_Id ,String chat_Detail,Timestamp time){
		List<MemberVO> list = memberDAO.getAll();
		for(MemberVO memberVO:list){
			if(memberVO.getMember_Id().length()>=10){
				ChatVO chatVO=new ChatVO();
				chatVO.setMember_Id(member_Id);
				chatVO.setFriend_Id(memberVO.getMember_Id());
				chatVO.setChatTime(time);
				chatVO.setChat_Detail(chat_Detail);
				chatVO.setChatStuts(5);
				chatDAO.insert(chatVO);	
			}
		}
			
	}
	//公告變為已讀
	public void update_notifaction_message(String member_Id,String friend_Id){
		List<ChatVO> list=chatDAO.select_notifaction_NoRead_message(member_Id,friend_Id);
			for( ChatVO chatVO:list){				
					chatVO.setChatStuts(4);
					chatDAO.updateNoReade_status(chatVO);		
			}	 
	}
	
	// back-end: 顯示最後3筆公告
	public List<ChatVO> select_Three_Notices(){
		return chatDAO.show_Three_Notices();
	}
	
}
