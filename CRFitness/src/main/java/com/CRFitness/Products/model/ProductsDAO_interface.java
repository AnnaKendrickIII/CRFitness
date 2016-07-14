package com.CRFitness.Products.model;

import java.util.List;


public interface ProductsDAO_interface {
	
	 public ProductsVO insert(ProductsVO productsVO);
     public ProductsVO update(ProductsVO productsVO);
     public boolean delete(String product_Id);       
     public ProductsVO findByPrimaryKey(String product_Id);
     public List<ProductsVO> getAll();
     public List<ProductsVO> getItemByCategory(String category);
//     public List<ProductsVO> searchAllItem();
	

}
