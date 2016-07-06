package com.CRFitness.ProductDetail.model;

import java.util.List;

public interface ProductDetailDAO_interface {
	
	 public boolean insert(ProductDetailVO productDetailVO);
     public boolean update(ProductDetailVO productDetailVO);
     public boolean delete(String productDetail_Id);       
     public ProductDetailVO findByPrimaryKey(String productDetail_Id);
     public List<ProductDetailVO> getAll();
     public ProductDetailVO getProductDetailId(String product_Name, String size, String color);
	
	
}
