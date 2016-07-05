package com.CRFitness.MessageDetail.model;

import java.sql.Timestamp;

public class MessageDetailVO implements java.io.Serializable{				//留言明細

	
	private static final long serialVersionUID = 1L;
	private Integer message_Id;				//留言編號(流水號)
	private String journal_Id;				//日誌編號
	private String member_Id;				//留言會員編號
	private String content;					//回應留言
	private Timestamp messageTime;		//回應時間

	public Integer getMessage_Id() {
		return message_Id;
	}

	public void setMessage_Id(Integer message_Id) {
		this.message_Id = message_Id;
	}

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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getMessageTime() {
		return messageTime;
	}

	public void setMessageTime(Timestamp messageTime) {
		this.messageTime = messageTime;
	}

}
