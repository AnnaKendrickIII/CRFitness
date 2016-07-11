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
	private MemberVO memberVO;				//會員編號
	private byte[] archives;				//影音圖檔
	private String contents;				//日誌內容
	private Timestamp publishTime;			//發表日誌時間
	private Integer publicStatus;			//是否公開(狀態)
	//聯合映射帶出 留言訊息
	@JsonSerialize
	private Set<MessageDetailVO> messageDetailVOs = new HashSet<>();

	public String getJournal_Id() {
		return journal_Id;
	}

	public void setJournal_Id(String journal_Id) {
		this.journal_Id = journal_Id;
	}
	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}

	public byte[] getArchives() {
		return archives;
	}

	public void setArchives(byte[] archives) {
		this.archives = archives;
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

	public Set<MessageDetailVO> getMessageDetailVOs() {
		return messageDetailVOs;
	}

	public void setMessageDetailVOs(Set<MessageDetailVO> messageDetailVOs) {
		this.messageDetailVOs = messageDetailVOs;
	}

}
