package com.CRFitness.Products.model;

public class ProductsVO implements java.io.Serializable{			//商品
									
	
	private static final long serialVersionUID = 1L;
	private String product_Id;		//商品編號
	private String product_Name;	//商品名稱
	private Double price;			//價格
	private String category;		//分類
	private String info; // 商品簡介
	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getProduct_Id() {
		return product_Id;
	}

	public void setProduct_Id(String product_Id) {
		this.product_Id = product_Id;
	}

	public String getProduct_Name() {
		return product_Name;
	}

	public void setProduct_Name(String product_Name) {
		this.product_Name = product_Name;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

}
