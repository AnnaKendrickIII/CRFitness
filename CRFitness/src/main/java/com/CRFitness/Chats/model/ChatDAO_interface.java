package com.CRFitness.Chats.model;

import java.util.List;

import com.CRFitness.Member.model.MemberVO;

public interface ChatDAO_interface {

    public ChatVO insert(ChatVO chatVO);
    public List<Object[]> select_Friends_message(String member_Id,String friend_Id);
    public List<ChatVO> getAll();
	public int updatefriendstatus(ChatVO chatVO);
	public void updateNoReade_status(ChatVO chatVO) ;
	public List<Object[]> select_NoReade_Friends_message(String member_Id,String friend_Id);
	public List<Object[]> select_NoRead_Friends_Allmessage(String member_Id);
	public List<ChatVO>  select_NoReade_FriendsforMe_message (String member_Id,String friend_Id);
	public List<ChatVO>  select_notifaction_NoRead_message (String member_Id,String friend_Id);
	public List<ChatVO> select_AddFriends_ChatStuts(String member_Id);
}
