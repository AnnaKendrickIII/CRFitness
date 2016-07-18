package com.CRFitness.Member.model;
import java.sql.Timestamp;

public class MemberVO implements java.io.Serializable{
	
	private static final long serialVersionUID = 1L;
	private String member_Id;
	private String e_mail;
	private String password;
	private String nickname;
	private Timestamp registerdate;
	private byte[] photo;

	public String getMember_Id() {
		return member_Id;
	}
	public void setMember_Id(String member_Id) {
		this.member_Id = member_Id;
	}
	public String getE_mail() {
		return e_mail;
	}
	public void setE_mail(String e_mail) {
		this.e_mail = e_mail;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public Timestamp getRegisterdate() {
		return registerdate;
	}
	public void setRegisterdate(Timestamp registerdate) {
		this.registerdate = registerdate;
	}
	
	
}
