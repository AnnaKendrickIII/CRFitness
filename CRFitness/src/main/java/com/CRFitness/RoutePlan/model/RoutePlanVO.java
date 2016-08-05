package com.CRFitness.RoutePlan.model;

import java.io.Serializable;

public class RoutePlanVO implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Integer route_Plan_Id;  // 流水號
	private String member_Id;		// fk 會員號碼
	private java.sql.Timestamp route_Plan_Date;  //路徑建立時間
	private String startPoint;		// 起點
	private String endPoint;		// 終點
	private Double mileage;			// 里程數
	private Integer routePlanStatus;
	

	public Double getMileage() {
		return mileage;
	}
	public void setMileage(Double mileage) {
		this.mileage = mileage;
	}
	public Integer getRoutePlanStatus() {
		return routePlanStatus;
	}
	public void setRoutePlanStatus(Integer routePlanStatus) {
		this.routePlanStatus = routePlanStatus;
	}
	public Integer getRoute_Plan_Id() {
		return route_Plan_Id;
	}
	public void setRoute_Plan_Id(Integer route_Plan_Id) {
		this.route_Plan_Id = route_Plan_Id;
	}
	public String getMember_Id() {
		return member_Id;
	}
	public void setMember_Id(String member_Id) {
		this.member_Id = member_Id;
	}
	public java.sql.Timestamp getRoute_Plan_Date() {
		return route_Plan_Date;
	}
	public void setRoute_Plan_Date(java.sql.Timestamp route_Plan_Date) {
		this.route_Plan_Date = route_Plan_Date;
	}
	public String getStartPoint() {
		return startPoint;
	}
	public void setStartPoint(String startPoint) {
		this.startPoint = startPoint;
	}
	public String getEndPoint() {
		return endPoint;
	}
	public void setEndPoint(String endPoint) {
		this.endPoint = endPoint;
	}
	
}
