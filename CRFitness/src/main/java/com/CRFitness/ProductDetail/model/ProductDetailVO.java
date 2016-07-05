package com.CRFitness.ProductDetail.model;

import java.sql.Timestamp;
import java.util.Arrays;

public class ProductDetailVO implements java.io.Serializable{				//商品明細
	
	private static final long serialVersionUID = 1L;
	private String productDetail_Id;		//商品明細編號
	private String product_Id;				//商品編號
	private String size;					//尺寸
	private String color;					//顏色
	private String product_Name;			//商品名稱
	private Integer stock;					//庫存量
	private Timestamp publishedDay;		//刊登日期
	private byte[] photo1;					//圖片1
	private byte[] photo2;					//圖片2
	private byte[] photo3;					//圖片3

		
//	@Override
//	public String toString() {
//		return "Detail_Id=" + productDetail_Id + ", product_Id=" + product_Id + ", size=" + size
//				+ ", color=" + color + ", Name=" + product_Name + ", stock=" + stock + ", publishedDay="
//				+ publishedDay;
//	}
	
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
	public String getProduct_Name() {
		return product_Name;
	}
	public void setProduct_Name(String product_Name) {
		this.product_Name = product_Name;
	}
	public Integer getStock() {
		return stock;
	}
	public void setStock(Integer stock) {
		this.stock = stock;
	}
	public Timestamp getPublishedDay() {
		return publishedDay;
	}
	public void setPublishedDay(Timestamp publishedDay) {
		this.publishedDay = publishedDay;
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

}
