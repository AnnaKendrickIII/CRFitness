package com.CRFitness.ProductDetail.model;

import java.sql.Timestamp;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service(value = "productDetialService")
public class ProductDetialService {

	@Resource(name = "productDetailDAO")
	private ProductDetailDAO_interface productDetailDAO;

	public List<ProductDetailVO> getAlDetial() {
		return productDetailDAO.getAll();
	}

	public ProductDetailVO addProductDetial(ProductDetailVO productDetailVO) {
		if (productDetailVO != null) {
			productDetailDAO.insert(productDetailVO);
			return productDetailVO;
		} else {
			return null;
		}
	}

	public ProductDetailVO modifyProductDetial(String product_Id, String size, String color, 
			String product_Name, Integer stock, Timestamp publishedDay, byte[] photo1,
			byte[] photo2, byte[] photo3, byte[] photo4, byte[] photo5) {
		
		
		return null;
	}

	public static void main(String[] args) {

	}
}
