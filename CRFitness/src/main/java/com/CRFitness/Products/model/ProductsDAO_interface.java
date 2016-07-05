package com.CRFitness.Products.model;

import java.util.List;

public interface ProductsDAO_interface {
	
	 public boolean insert(ProductsVO productsVO);
     public boolean update(ProductsVO productsVO);
     public boolean delete(String product_Id);       
     public ProductsVO findByPrimaryKey(String product_Id);
     public List<ProductsVO> getAll();
	

}
