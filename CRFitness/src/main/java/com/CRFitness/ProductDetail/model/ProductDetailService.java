package com.CRFitness.ProductDetail.model;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.CRFitness.Products.model.ProductsDAO_interface;
import com.CRFitness.Products.model.ProductsVO;

@Service("productDetailService")
public class ProductDetailService {

	@Resource(name = "productDetailDAO")
	private ProductDetailDAO_interface productDetailDAO;
	@Resource(name = "productsDAO")
	private ProductsDAO_interface productsDAO;



	public ProductDetailService() {
	}
	public List<Object> addShoppingCart222(String productDetail_Id) {
		List<Object> cart=new ArrayList<Object>();
		System.out.println("A."+productDetail_Id);
		cart.add(productDetailDAO.findByPrimaryKey(productDetail_Id));
		System.out.println("B"+cart);
		System.out.println("C"+productDetailDAO.findByPrimaryKeySQLQuery(productDetail_Id).get(0));
		return cart;
	}
	// back-end: 找商品照片
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

	// back-end
	public List<ProductDetailVO> getAllByDesc() {
		return productDetailDAO.getAllByDesc();
	}

	// front-end
	// 撈出所有商品資訊
	public List<ProductDetailVO> getAllItem() {
		return productDetailDAO.getAll();
	}

	// 新增商品至 ProductDetail Table
	public ProductDetailVO addProductDetial(ProductDetailVO productDetailVO) {
		if (productDetailVO != null) {
			productDetailDAO.insert(productDetailVO);
			return productDetailVO;
		} else {
			return null;
		}
	}

	// PK鍵搜尋商品
	public List<Object> getItemByPrimaryKey(String productDetail_Id) {
		if (productDetail_Id != null) {
			return productDetailDAO.findByPrimaryKeySQLQuery(productDetail_Id);
		} else {
			return null;
		}

	}

	// 用 商品名稱 尺寸 顏色 找出 ProductDetail_Id
	public ProductDetailVO getItemId(String product_Name, String size,
			String color) {
		if (product_Name != null && size != null && color != null) {
			return productDetailDAO.getProductDetailId(product_Name, size,
					color);
		} else {
			return null;
		}
	}

	// 用商品分類檢索 找出該類商品
	public List<ProductDetailVO> getItemByCategory(String category, Integer page) {
		if (category != null) {
			return productDetailDAO.getItemByCategory(category, page);
		} else {
			return null;
		}
	}


	// back-end: 新增商品至 ProductDetail & Product Table
	public List<Object> addProductDetail(String product_Name, Double price,// 價格
			String category, // 分類
			String size, // 尺寸
			String color, // 顏色
			Integer stock, // 庫存量
			// Timestamp published_Date, // 刊登日期
			MultipartFile photo1, // 圖片1
			// byte[] photo2, // 圖片2
			// byte[] photo3, // 圖片3
			String product_Status, // 狀態
			String info // 商品簡介
	// String detailed_Description, // 商品詳細說明
	) {
		List<Object> list = new ArrayList<Object>();

		ProductsVO productsVO = new ProductsVO();
		productsVO.setProduct_Name(product_Name);
		productsVO.setPrice(price);
		productsVO.setCategory(category);
		productsVO = productsDAO.insert(productsVO);

		ProductDetailVO productDetailVO = new ProductDetailVO();
		productDetailVO.setProduct_Id(productsVO.getProduct_Id());
		productDetailVO.setSize(size);
		productDetailVO.setColor(color);
		productDetailVO.setStock(stock);
		Timestamp ts = new Timestamp(System.currentTimeMillis());
		productDetailVO.setPublished_Date(ts);
		try {
			productDetailVO.setPhoto1(photo1.getBytes());
		} catch (IOException e) {
			e.printStackTrace();
		}
		productDetailVO.setProduct_Status(product_Status);
		productDetailVO.setInfo(info);
		productDetailVO = productDetailDAO.insert(productDetailVO);

		list.add(0, productsVO);
		list.add(1, productDetailVO);
		return list;
	}

	// back-end: 修改商品至 ProductDetail & Product Table
	public List<Object> updateProductDetail(String product_Id,
			String product_Name, Double price, // 價格
			String category, // 分類
			String productDetail_Id, String size, // 尺寸
			String color, // 顏色
			Integer stock, // 庫存量
			// Timestamp published_Date, // 刊登日期
			// MultipartFile photo1, // 圖片1
			// byte[] photo2, // 圖片2
			// byte[] photo3, // 圖片3
			String product_Status, // 狀態
			String info // 商品簡介
	// String detailed_Description, // 商品詳細說明
	) {
		List<Object> list = new ArrayList<Object>();

		// ProductsVO productsVO = new ProductsVO();
		ProductsVO productsVO = productsDAO.findByPrimaryKey(product_Id);
		productsVO.setProduct_Name(product_Name);
		productsVO.setPrice(price);
		productsVO.setCategory(category);
		productsVO = productsDAO.update(productsVO);

		// ProductDetailVO productDetailVO = new ProductDetailVO();
		ProductDetailVO productDetailVO = productDetailDAO
				.findByPrimaryKey(productDetail_Id);
		productDetailVO.setProduct_Id(productsVO.getProduct_Id());

		productDetailVO.setSize(size);
		productDetailVO.setColor(color);
		productDetailVO.setStock(stock);
		Timestamp ts = new Timestamp(System.currentTimeMillis());
		productDetailVO.setPublished_Date(ts);
		// System.out.println(productDetailVO.getPublished_Date());
		// try {
		// productDetailVO.setPhoto1(photo1.getBytes());
		// } catch (IOException e) {
		// e.printStackTrace();
		// }
		productDetailVO.setProduct_Status(product_Status);
		productDetailVO.setInfo(info);
		productDetailVO = productDetailDAO.update(productDetailVO);

		list.add(0, productsVO);
		list.add(1, productDetailVO);
		return list;
	}

	// back-end: change status
	public String changeStatus(String productDetail_Id, String product_Status) {
		ProductDetailVO productDetailVO = productDetailDAO
				.findByPrimaryKey(productDetail_Id);
		productDetailVO.setProduct_Status(product_Status);
		productDetailVO = productDetailDAO.update(productDetailVO);
		// System.out.println(productDetailVO.getProduct_Status());
		return productDetailVO.getProduct_Status();
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

		// System.out.println(service.getItemByPrimaryKey("prodDetail5015")
		// .getProductsVO().getProduct_Name());

		// List<ProductDetailVO> cart = new ArrayList<ProductDetailVO>();
		//
		// service.addShoppingCart("prodDetail5011");
		// service.addShoppingCart("prodDetail5013");
		// service.addShoppingCart("prodDetail5015");
		//
		// for (ProductDetailVO vo : cart) {
		// System.out.println(vo.getProduct_Name());
		// }

		((ConfigurableApplicationContext) context).close();
	}

}
