package com.CRFitness.OrderDetails.model;

import com.CRFitness.Orders.model.OrdersVO;

public class OrderDetailsVO implements java.io.Serializable { // 訂單明細

	private static final long serialVersionUID = 1L;
	private String details_No; // 明細流水號
	private String order_Id; // 訂單編號
	private String product_Name; // 商品名稱
	private Integer quantity; // 數量
	private String size; // 尺寸
	private String color; // 顏色
	private Double amount; // 金額(單項商品)

	public String getDetails_No() {
		return details_No;
	}

	public void setDetails_No(String details_No) {
		this.details_No = details_No;
	}

	public String getOrder_Id() {
		return order_Id;
	}

	public void setOrder_Id(String order_Id) {
		this.order_Id = order_Id;
	}

	public String getProduct_Name() {
		return product_Name;
	}

	public void setProduct_Name(String product_Name) {
		this.product_Name = product_Name;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public Double getAmount() {
		return amount;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
	}

}
