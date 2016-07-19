package com.CRFitness.ProductDetail.model;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.CRFitness.Products.model.ProductsDAO_interface;
@Transactional
@Service("shoppingCart")
public class ShoppingCart {
	
	@Resource(name = "productDetailDAO")
	private ProductDetailDAO_interface productDetailDAO;
	@Resource(name = "productsDAO")
	private ProductsDAO_interface productsDAO;
	
	private List<Object> cart =null;
	public ShoppingCart() {
		 cart = new ArrayList<Object>();
	}

	// 加入購物車
	public List<Object> addShoppingCart(String productDetail_Id) {
		System.out.println("A."+productDetail_Id);
		cart.add(productDetailDAO.findByPrimaryKey(productDetail_Id));
		System.out.println("B"+cart);
		System.out.println("C"+productDetailDAO.findByPrimaryKeySQLQuery(productDetail_Id).get(0));
		return cart;
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

//			ProductDetailService service = (ProductDetailService) context
//					.getBean("productDetailService");
			ShoppingCart CshoppingCart = (ShoppingCart) context
					.getBean("shoppingCart");
			
//			shoppingCart cart=new shoppingCart();
			CshoppingCart.addShoppingCart("prodDetail5024");
//			System.out.println(service.getItemByPrimaryKey("prodDetail5024").get(0));
//			 List<ProductDetailVO> cart = new ArrayList<ProductDetailVO>();
			
			
			
//			 for (ProductDetailVO vo : cart) {
//			 System.out.println();
//			 }

			((ConfigurableApplicationContext) context).close();
		}
	
	
}
