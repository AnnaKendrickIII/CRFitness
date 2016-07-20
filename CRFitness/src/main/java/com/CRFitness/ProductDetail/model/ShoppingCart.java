package com.CRFitness.ProductDetail.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

import com.CRFitness.Products.model.ProductsDAO_interface;

@Service("shoppingCart")

//@Scope(value = "session", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class ShoppingCart implements Serializable{


	private static final long serialVersionUID = 1L;
	@Resource(name = "productDetailDAO")
	private ProductDetailDAO_interface productDetailDAO;
	@Resource(name = "productsDAO")
	private ProductsDAO_interface productsDAO;

	private Map<String, Object> cart = null;

	public ShoppingCart() {
		cart = new HashMap<String, Object>();
	}

	public Map<String, Object> getCart() {
		return cart;
	}

	public void setCart(Map<String, Object> cart) {
		this.cart = cart;
	}

	// 加入購物車
	public Map<String, Object> addShoppingCart(String productDetail_Id) {
		cart.put(productDetail_Id,
				productDetailDAO.findByPrimaryKeySQLQuery(productDetail_Id));

		return cart;
	}

	public Map<String, Object> deleteItem(String productDetail_Id) {
		cart.remove(productDetail_Id);
		System.out.println(cart);
		return cart;
	}

	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext(
				"test.config.xml");

		// ProductDetailService service = (ProductDetailService) context
		// .getBean("productDetailService");
		ShoppingCart CshoppingCart = (ShoppingCart) context
				.getBean("shoppingCart");

		// shoppingCart cart=new shoppingCart();
		CshoppingCart.addShoppingCart("prodDetail5024");
		// System.out.println(service.getItemByPrimaryKey("prodDetail5024").get(0));
		// List<ProductDetailVO> cart = new ArrayList<ProductDetailVO>();

		// for (ProductDetailVO vo : cart) {
		// System.out.println();
		// }

		((ConfigurableApplicationContext) context).close();
	}

}
