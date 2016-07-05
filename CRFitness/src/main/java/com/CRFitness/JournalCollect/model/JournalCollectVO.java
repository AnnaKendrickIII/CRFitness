package com.CRFitness.JournalCollect.model;

public class JournalCollectVO implements java.io.Serializable{				//日誌收藏
	

	private static final long serialVersionUID = 1L;
	private String member_Id;				//會員編號
	private String favorited_Journal;		//日誌編號
	
	public String getMember_Id() {
		return member_Id;
	}
	public void setMember_Id(String member_Id) {
		this.member_Id = member_Id;
	}
	public String getFavorited_Journal() {
		return favorited_Journal;
	}
	public void setFavorited_Journal(String favorited_Journal) {
		this.favorited_Journal = favorited_Journal;
	}
}
