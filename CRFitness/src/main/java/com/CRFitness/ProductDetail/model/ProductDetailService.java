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

	//找商品照片
	public byte[] findProductsPhoto(String productDetail_Id){
		return productDetailDAO.findByPrimaryKey(productDetail_Id).getPhoto1();
	}
	
	public ProductDetailVO insertProductDetail(ProductDetailVO productDetailVO) {
		productDetailDAO.insert(productDetailVO);
		return productDetailVO;
	}
	// public ProductBean insert(ProductBean bean) {
	// ProductBean result = null;
	// if(bean!=null) {
	// result = productDao.insert(bean);
	// }
	// return result;
	// }

	public void updateProductDetail(ProductDetailVO productDetailVO) {
		productDetailDAO.update(productDetailVO);
	}
	// public ProductBean update(ProductBean bean) {
	// ProductBean result = null;
	// if(bean!=null) {
	// result = productDao.update(bean.getName(), bean.getPrice(),
	// bean.getMake(), bean.getExpire(), bean.getId());
	// }
	// return result;
	// }

	public void deletProductDetail(String productDetail_Id) {
		productDetailDAO.delete(productDetail_Id);
	}
	// public boolean delete(ProductBean bean) {
	// boolean result = false;
	// if(bean!=null) {
	// result = productDao.delete(bean.getId());
	// }
	// return result;
	// }

	public ProductDetailVO findProductDetail(String productDetail_Id) {
		return productDetailDAO.findByPrimaryKey(productDetail_Id);
	}

	public List<ProductDetailVO> getAll() {
		return productDetailDAO.getAll();
	}
	// public List<ProductBean> select(ProductBean bean) {
	// List<ProductBean> result = null;
	// if(bean!=null && bean.getId()!=0) {
	// ProductBean temp = productDao.select(bean.getId());
	// if(temp!=null) {
	// result = new ArrayList<ProductBean>();
	// result.add(temp);
	// }
	// } else {
	// result = productDao.select();
	// }
	// return result;
	// }
	

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
