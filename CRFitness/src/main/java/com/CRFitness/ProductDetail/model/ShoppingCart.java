package com.CRFitness.ProductDetail.model;

import java.io.Serializable;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Service;

import com.CRFitness.Products.model.ProductsDAO_interface;

@Service("shoppingCart")
@Scope(value = "session", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class ShoppingCart implements Serializable {

	private static final long serialVersionUID = 1L;
	@Resource(name = "productDetailDAO")
	private ProductDetailDAO_interface productDetailDAO;
	@Resource(name = "productsDAO")
	private ProductsDAO_interface productsDAO;
	private Map<String, Object> cart = null;

	public ShoppingCart() {
		cart = new LinkedHashMap<String, Object>();
	}

	public Map<String, Object> getCart() {
		return cart;
	}

	public void setCart(Map<String, Object> cart) {
		this.cart = cart;
	}

	// 加入購物車
	@SuppressWarnings("unchecked")
	public Map<String, Object> addShoppingCart(String productDetail_Id) {
		// 判斷車子裡是否有這東西 沒有就幫他加數量1
		if (cart.get(productDetail_Id) == null) {
			cart.put(productDetail_Id, productDetailDAO.findByPrimaryKeySQLQuery(productDetail_Id));
			Integer num = 1;
			Object[] numob = { num };
			// 給車子數量1
			((List<Object[]>) (cart.get(productDetail_Id))).add(1, numob);
		} else {// 如果車子裡有這東西就把他數量取出來加1再放回去
			Integer newNum = ((Integer) (((List<Object[]>) (cart.get(productDetail_Id))).get(1))[0]) + 1;
			Object[] numob = { newNum };
			// 把車子裡的數量換新數量
			((List<Object[]>) (cart.get(productDetail_Id))).set(1, numob);
		}
		// System.out.println(((Integer)(((List<Object[]>)(cart.get(productDetail_Id))).get(1))[0]));/這給你測試看的

		return cart;
	}

	// 刪除購物車商品
	public Map<String, Object> deleteItem(String productDetail_Id) {
		cart.remove(productDetail_Id);
		return cart;
	}

	// 計算購物車內商品價格
	public double totalAmount() {
		double subTotal = 0;
		if (cart.size() > 0) {
			Set<String> set = cart.keySet();
			Iterator<String> prouducts = set.iterator();
			while (prouducts.hasNext()) {
				List<Object[]> product = (List<Object[]>) (cart.get(prouducts.next()));
				double price = (Double) (product.get(0))[2];
				int num = (Integer) (product.get(1))[0];
				double num_price = num * price;
				subTotal += num_price;
			}
		}
		return subTotal;
	}

	// 更改數量
	public void ChangeProductNum(String productDetail_Id, String num) {
		List<Object[]> prouduct = (List<Object[]>) (cart.get(productDetail_Id));
		(prouduct.get(1))[0] = Integer.parseInt(num);
	}

	// 清空購物車
	public void cleanCart() {
		if (!cart.isEmpty()) {
			cart.clear();
		}
	}

	// 新增訂單
	public Map<String, Object> addOrder() {
		if (cart.size() > 0) {

		}
		return cart;

	}

	// public static void main(String[] args) {
	// ApplicationContext context = new ClassPathXmlApplicationContext(
	// "test.config.xml");
	//
	// ShoppingCart CshoppingCart = (ShoppingCart) context
	// .getBean("shoppingCart");
	//
	// CshoppingCart.addShoppingCart("prodDetail5024");
	//
	//
	// ((ConfigurableApplicationContext) context).close();
	// }

}
