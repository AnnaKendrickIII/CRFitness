package com.CRFitness.ProductDetail.model;

import java.sql.Timestamp;

import com.CRFitness.Products.model.ProductsVO;

public class ProductDetailVO implements java.io.Serializable { // 商品明細

	private static final long serialVersionUID = 1L;
	private String productDetail_Id; // 商品明細編號
	private String product_Id; //商品編號
	private String size; // 尺寸
	private String color; // 顏色
	private Integer stock; // 庫存量
	private Timestamp published_Date; // 刊登日期
	private String product_Status; // 商品狀態
	public String getProductDetail_Id() {
		return productDetail_Id;
	}
	public void setProductDetail_Id(String productDetail_Id) {
		this.productDetail_Id = productDetail_Id;
	}
	public String getProduct_Id() {
		return product_Id;
	}
	public void setProduct_Id(String product_Id) {
		this.product_Id = product_Id;
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
	public Integer getStock() {
		return stock;
	}
	public void setStock(Integer stock) {
		this.stock = stock;
	}
	public Timestamp getPublished_Date() {
		return published_Date;
	}
	public void setPublished_Date(Timestamp published_Date) {
		this.published_Date = published_Date;
	}
	public String getProduct_Status() {
		return product_Status;
	}
	public void setProduct_Status(String product_Status) {
		this.product_Status = product_Status;
	}
	
}
