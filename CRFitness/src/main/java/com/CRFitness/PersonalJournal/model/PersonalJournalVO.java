package com.CRFitness.PersonalJournal.model;

import java.sql.Timestamp;

<<<<<<< HEAD
public class PersonalJournalVO implements java.io.Serializable{			//個人日誌
	
	
	private static final long serialVersionUID = 1L;
	private String journal_Id;				//日誌編號
	private String member_Id;				//會員編號
	private byte[] archives;				//影音圖檔
	private String contents;				//日誌內容
	private Timestamp publishTime;		//發表日誌時間
	private Integer publicStatus;			//是否公開(狀態)

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
=======
import com.CRFitness.Member.model.MemberVO;

public class PersonalJournalVO implements java.io.Serializable{			//個人日誌
	
	
	private static final long serialVersionUID = 1L;
	private String journal_Id;				//日誌編號
	private MemberVO memberVO;				//會員編號
	private byte[] archives;				//影音圖檔
	private String contents;				//日誌內容
	private Timestamp publishTime;		//發表日誌時間
	private Integer publicStatus;			//是否公開(狀態)

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
>>>>>>> branch 'master' of https://github.com/AnnaKendrickIII/CRFitness.git
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

}
