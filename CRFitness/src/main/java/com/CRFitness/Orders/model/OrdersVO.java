package com.CRFitness.Orders.model;

import java.sql.Timestamp;


public class OrdersVO implements java.io.Serializable { // 訂單

	private static final long serialVersionUID = 1L;
	private String order_Id; // 訂單編號
	private String member_Id; // 會員編號
	private String order_Status; // 訂單狀態
	private java.sql.Date ship_Date; // 出貨日期
	private Double total_Amount; // 總金額
	private String invoice_Number; // 發票號碼
	private String consignee_Name; // 收件人姓名
	private String consignee_Address; // 收件人地址
	private Timestamp order_Time; // 下單時間
	private String payment_Method; // 付款方式

	public String getOrder_Id() {
		return order_Id;
	}

	public void setOrder_Id(String order_Id) {
		this.order_Id = order_Id;
	}

	public String getMember_Id() {
		return member_Id;
	}

	public void setMember_Id(String member_Id) {
		this.member_Id = member_Id;
	}

	public String getOrder_Status() {
		return order_Status;
	}

	public void setOrder_Status(String order_Status) {
		this.order_Status = order_Status;
	}

	public java.sql.Date getShip_Date() {
		return ship_Date;
	}

	public void setShip_Date(java.sql.Date ship_Date) {
		this.ship_Date = ship_Date;
	}

	public Double getTotal_Amount() {
		return total_Amount;
	}

	public void setTotal_Amount(Double total_Amount) {
		this.total_Amount = total_Amount;
	}

	public String getInvoice_Number() {
		return invoice_Number;
	}

	public void setInvoice_Number(String invoice_Number) {
		this.invoice_Number = invoice_Number;
	}

	public String getConsignee_Name() {
		return consignee_Name;
	}

	public void setConsignee_Name(String consignee_Name) {
		this.consignee_Name = consignee_Name;
	}

	public String getConsignee_Address() {
		return consignee_Address;
	}

	public void setConsignee_Address(String consignee_Address) {
		this.consignee_Address = consignee_Address;
	}

	public Timestamp getOrder_Time() {
		return order_Time;
	}

	public void setOrder_Time(Timestamp order_Time) {
		this.order_Time = order_Time;
	}

	public String getPayment_Method() {
		return payment_Method;
	}

	public void setPayment_Method(String payment_Method) {
		this.payment_Method = payment_Method;
	}

}
