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


	// back-end
	// 找商品照片
	public byte[] findProductsPhoto(String productDetail_Id) {
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

	
	// Back-end: MaintainEquipment.jsp
	public List<ProductDetailVO> getEquipment() {
		return productDetailDAO.getEquipment();
	}
	// Back-end: MaintainClothing.jsp
	public List<ProductDetailVO> getClothing() {
		return productDetailDAO.getClothing();
	}
	// Back-end: MaintainAccessories.jsp
	public List<ProductDetailVO> getAccessories() {
		return productDetailDAO.getAccessories();
	}
	// Back-end: MaintainShoes.jsp
	public List<ProductDetailVO> getShoes() {
		return productDetailDAO.getShoes();
	}
	

	// front-end
	public List<ProductDetailVO> getAllItem() {
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

	public ProductDetailVO getItemByPrimaryKey(String productDetail_Id) {
		if (productDetail_Id != null) {
			return productDetailDAO.findByPrimaryKey(productDetail_Id);
		} else {
			return null;
		}

	}

	public ProductDetailVO getItemId(String product_Name, String size,
			String color) {
		if (product_Name != null && size != null && color != null) {
			return productDetailDAO.getProductDetailId(product_Name, size,
					color);
		} else {
			return null;
		}
	}

	// public static void main(String[] args) {
	// 如果要進行以下測試，要調整hibernate.cfg.xml的設定
	// 打開：<property
	// name="hibernate.current_session_context_class">thread</property>
	// 註解：<property name="hibernate.show_sql">true</property>
	// 增加 ProductDetailVO 的toString();
	// Run as >> Java Application
	// List<ProductDetailVO> beans = null;
	//
	// ApplicationContext context = new
	// ClassPathXmlApplicationContext("test.config.xml");
	// SessionFactory sessionFactory = (SessionFactory)
	// context.getBean("sessionFactory");
	// sessionFactory.getCurrentSession().beginTransaction();
	//
	// ProductDetailService productDetailService = (ProductDetailService)
	// context.getBean("productDetailService");
	//
	// beans = productDetailService.getAll();
	// for(ProductDetailVO item : beans) {
	// System.out.println(item);
	// }
	//
	// sessionFactory.getCurrentSession().getTransaction().commit();
	// ((ConfigurableApplicationContext) context).close();

	// JDBC
	// ProductsService productService = new ProductsService();
	// List<ProductsVO> productsVO = productService.getAll();
	// System.out.println("productsVO="+productsVO);
	// }
	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext(
				"test.config.xml");

		ProductDetailService service = (ProductDetailService) context
				.getBean("productDetailService");
		
		System.out.println(service.getItemByPrimaryKey("prodDetail5015").getProduct_Name());

		((ConfigurableApplicationContext) context).close();
	}

}