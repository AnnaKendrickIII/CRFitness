package com.CRFitness.ActivityDetail.model;

public class ActivityDetailVO implements java.io.Serializable{		//揪團明細
	
	private static final long serialVersionUID = 1L;
	private String activity_Id;		//揪團專案編號
	private String member_Id;		//參與會員編號
	private Integer detail_Status;

	public String getActivity_Id() {
		return activity_Id;
	}

	public void setActivity_Id(String activity_Id) {
		this.activity_Id = activity_Id;
	}

	public String getMember_Id() {
		return member_Id;
	}

	public void setMember_Id(String member_Id) {
		this.member_Id = member_Id;
	}

	public Integer getDetail_Status() {
		return detail_Status;
	}

	public void setDetail_Status(Integer detail_Status) {
		this.detail_Status = detail_Status;
	}

}
