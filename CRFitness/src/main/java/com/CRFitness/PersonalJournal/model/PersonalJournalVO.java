package com.CRFitness.PersonalJournal.model;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

import com.CRFitness.Member.model.MemberVO;
import com.CRFitness.MessageDetail.model.MessageDetailVO;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

public class PersonalJournalVO implements java.io.Serializable{			//個人日誌
	
	
	private static final long serialVersionUID = 1L;
	private String journal_Id;				//日誌編號
	private String member_Id;				//會員編號
	private String contents;				//日誌內容
	private Timestamp publishTime;			//發表日誌時間
	private Integer publicStatus;			//是否公開(狀態) 1:公開  0:限本人  2:朋友  4:刪除 5:停權
	//聯合映射帶出 留言訊息
//	@JsonSerialize
//	private Set<MessageDetailVO> messageDetailVOs = new HashSet<>();

	public String getJournal_Id() {
		return journal_Id;
	}

	public void setJournal_Id(String journal_Id) {
		this.journal_Id = journal_Id;
	}
	public String getMember_Id() {
		return member_Id;
	}

	public void setMember_Id(String member_Id) {
		this.member_Id = member_Id;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public Timestamp getPublishTime() {
		return publishTime;
	}

	public void setPublishTime(Timestamp publishTime) {
		this.publishTime = publishTime;
	}

	public Integer getPublicStatus() {
		return publicStatus;
	}

	public void setPublicStatus(Integer publicStatus) {
		this.publicStatus = publicStatus;
	}

//	public Set<MessageDetailVO> getMessageDetailVOs() {
//		return messageDetailVOs;
//	}
//
//	public void setMessageDetailVOs(Set<MessageDetailVO> messageDetailVOs) {
//		this.messageDetailVOs = messageDetailVOs;
//	}

}
