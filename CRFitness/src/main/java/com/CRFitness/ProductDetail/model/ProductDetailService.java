package com.CRFitness.ProductDetail.model;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

@Service("productDetailService")
public class ProductDetailService {

	@Resource(name = "productDetailDAO")
	private ProductDetailDAO_interface productDetailDAO;

	public ProductDetailService() {
	}
	
	
	//back-end
	//找商品照片
	public byte[] findProductsPhoto(String productDetail_Id){
		return productDetailDAO.findByPrimaryKey(productDetail_Id).getPhoto1();
	}
	
	public ProductDetailVO insertProductDetail(ProductDetailVO productDetailVO) {
		productDetailDAO.insert(productDetailVO);
		return productDetailVO;
	}


	public void updateProductDetail(ProductDetailVO productDetailVO) {
		productDetailDAO.update(productDetailVO);
	}


	public void deletProductDetail(String productDetail_Id) {
		productDetailDAO.delete(productDetail_Id);
	}


	public ProductDetailVO findProductDetail(String productDetail_Id) {
		return productDetailDAO.findByPrimaryKey(productDetail_Id);
	}

	public List<ProductDetailVO> getAll() {
		return productDetailDAO.getAll();
	}
	
	
	//front-end
	public List<ProductDetailVO> getAllDetail() {
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

	public ProductDetailVO getProductDetailId(String product_Name, String size,
			String color) {
		if (product_Name != null && size != null && color != null) {
			return productDetailDAO.getProductDetailId(product_Name, size,
					color);
		} else {
			return null;
		}
	}

	

//	public static void main(String[] args) {
		// 如果要進行以下測試，要調整hibernate.cfg.xml的設定
		// 打開：<property name="hibernate.current_session_context_class">thread</property>
		// 註解：<property name="hibernate.show_sql">true</property>
		// 增加 ProductDetailVO 的toString();
		// Run as >> Java Application
		
//		List<ProductDetailVO> beans = null;
//		
//		ApplicationContext context = new ClassPathXmlApplicationContext("test.config.xml");
//		SessionFactory sessionFactory = (SessionFactory) context.getBean("sessionFactory");
//		sessionFactory.getCurrentSession().beginTransaction();
//
//		ProductDetailService productDetailService = (ProductDetailService) context.getBean("productDetailService");
//		
//		beans = productDetailService.getAll();
//		for(ProductDetailVO item : beans) {
//		        System.out.println(item);
//		}
//
//		sessionFactory.getCurrentSession().getTransaction().commit();
//		((ConfigurableApplicationContext) context).close();

		
		// JDBC
		// ProductsService productService = new ProductsService();
		// List<ProductsVO> productsVO = productService.getAll();
		// System.out.println("productsVO="+productsVO);
//	}

}
