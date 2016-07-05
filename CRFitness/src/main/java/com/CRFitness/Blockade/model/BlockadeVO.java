package com.CRFitness.Blockade.model;

public class BlockadeVO implements java.io.Serializable{			//黑名單
	
	
	private static final long serialVersionUID = 1L;
	private String member_Id;		//會員編號
	private String blockade_Id;		//被黑名單會員編號
	
	public String getMember_Id() {
		return member_Id;
	}
	public void setMember_Id(String member_Id) {
		this.member_Id = member_Id;
	}
	public String getBlockade_Id() {
		return blockade_Id;
	}
	public void setBlockade_Id(String blockade_Id) {
		this.blockade_Id = blockade_Id;
	}

}
