package com.CRFitness.ProductDetail.model;

import java.util.List;

import org.hibernate.Session;

public interface ProductDetailDAO_interface {

	Session getSession();

	boolean insert(ProductDetailVO productDetailVO);

	boolean update(ProductDetailVO productDetailVO);

	boolean delete(String productDetail_Id);

	ProductDetailVO findByPrimaryKey(String productDetail_Id);

	List<ProductDetailVO> getAll();

	// Back-end: MaintainEquipment.jsp
	List<ProductDetailVO> getEquipment();

	// Back-end: MaintainClothing.jsp
	List<ProductDetailVO> getClothing();

	// Back-end: MaintainAccessories.jsp
	List<ProductDetailVO> getAccessories();

	// Back-end: MaintainShoes.jsp
	List<ProductDetailVO> getShoes();

}