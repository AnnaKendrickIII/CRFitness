package com.CRFitness.Activitys.model;
import java.sql.Timestamp;

import org.hibernate.type.ArrayType;

import com.CRFitness.Member.model.MemberVO;
public class ActivitysVO implements java.io.Serializable{				//揪團專區
	

	private static final long serialVersionUID = 1L;
	private String activity_Id;			//揪團專案編號		
	private String member_Id;			//會員編號
	private Timestamp activity_Day;		//活動日
	private String activity_Class;		//揪團類別
	private String activity_Area;		//活動地區
	private String activity_Info;		//活動內容
	private Timestamp deadline;		//報名截止日
	private Timestamp startDay;		//發起日期
	private Integer people;				//活動人數
	private Integer people_Max;				//人數上限
	private Integer activity_Status;				//揪團狀態


	public String getMember_Id() {
		return member_Id;
	}

	public void setMember_Id(String member_Id) {
		this.member_Id = member_Id;
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
	
	public Integer getPeople_Max() {
		return people_Max;
	}

	public void setPeople_Max(Integer people_Max) {
		this.people_Max = people_Max;
	}

	public Integer getActivity_Status() {
		return activity_Status;
	}

	public void setActivity_Status(Integer activity_Status) {
		this.activity_Status = activity_Status;
	}

}