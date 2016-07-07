package com.CRFitness.Activitys.model;
import java.sql.Timestamp;

import org.hibernate.type.ArrayType;

import com.CRFitness.Member.model.MemberVO;
public class ActivitysVO implements java.io.Serializable{				//揪團專區
	

	private static final long serialVersionUID = 1L;
	private String activity_Id;			//揪團專案編號		
	private MemberVO memberVO;			//會員編號
	private Timestamp activity_Day;		//活動日
	private String activity_Class;		//揪團類別
	private String activity_Area;		//活動地區
	private byte[] photo1;				//照片1
	private byte[] photo2;				//照片2
	private byte[] photo3;				//照片3
	private String activity_Info;		//活動內容
	private Timestamp deadline;		//報名截止日
	private Timestamp startDay;		//發起日期
	private Integer people;				//活動人數
	public MemberVO getMemberVO() {
		return memberVO;
	}
	
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	public String getActivity_Id() {
		return activity_Id;
	}

	public void setActivity_Id(String activity_Id) {
		this.activity_Id = activity_Id;
	}


	public Timestamp getActivity_Day() {
		return activity_Day;
	}

	public void setActivity_Day(Timestamp activity_Day) {
		this.activity_Day = activity_Day;
	}

	public String getActivity_Class() {
		return activity_Class;
	}

	public void setActivity_Class(String activity_Class) {
		this.activity_Class = activity_Class;
	}

	public String getActivity_Area() {
		return activity_Area;
	}

	public void setActivity_Area(String activity_Area) {
		this.activity_Area = activity_Area;
	}

	public byte[] getPhoto1() {
		return photo1;
	}

	public void setPhoto1(byte[] photo1) {
		this.photo1 = photo1;
	}

	public byte[] getPhoto2() {
		return photo2;
	}

	public void setPhoto2(byte[] photo2) {
		this.photo2 = photo2;
	}

	public byte[] getPhoto3() {
		return photo3;
	}

	public void setPhoto3(byte[] photo3) {
		this.photo3 = photo3;
	}

	public String getActivity_Info() {
		return activity_Info;
	}

	public void setActivity_Info(String activity_Info) {
		this.activity_Info = activity_Info;
	}

	public Timestamp getDeadline() {
		return deadline;
	}

	public void setDeadline(Timestamp deadline) {
		this.deadline = deadline;
	}

	public Timestamp getStartDay() {
		return startDay;
	}

	public void setStartDay(Timestamp startDay) {
		this.startDay = startDay;
	}

	public Integer getPeople() {
		return people;
	}

	public void setPeople(Integer people) {
		this.people = people;
	}

}