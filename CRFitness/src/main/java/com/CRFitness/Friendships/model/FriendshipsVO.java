package com.CRFitness.Friendships.model;





public class FriendshipsVO implements java.io.Serializable{			//好友
	

	private static final long serialVersionUID = 1L;
	private String member_Id;			//會員編號
	private String friend_Id;			//好友會員編號
	private Integer friend_Status;		//狀態
	
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
	public Integer getFriend_Status() {
		return friend_Status;
	}
	public void setFriend_Status(Integer friend_Status) {
		this.friend_Status = friend_Status;
	}
	
}
