package com.CRFitness.ProductDetail.model;

import java.util.List;


public interface ProductDetailDAO_interface {

	
	public ProductDetailVO insert(ProductDetailVO productDetailVO);
	public ProductDetailVO update(ProductDetailVO productDetailVO);
	public boolean delete(String productDetail_Id);       
	public ProductDetailVO findByPrimaryKey(String productDetail_Id);
	public List<ProductDetailVO> getAll();
	public ProductDetailVO getProductDetailId(String product_Name, String size, String color);
	public List<ProductDetailVO> getItemByCategory(String category, Integer page);
	public List<ProductDetailVO> getAllByDesc();
	public List<Object> findByPrimaryKeySQLQuery(String productDetail_Id);
	
	
}

	
