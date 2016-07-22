package com.CRFitness.ProductDetail.model;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
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


	// front-end
	// 撈出所有商品資訊
	public List<ProductDetailVO> getAllItem() {
		return productDetailDAO.getAll();
	}

	// PK鍵搜尋商品
	public List<Object[]> getItemByPrimaryKey(String productDetail_Id) {
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
	public List<Object[]> getItemByCategory(String category, Integer page) {
		if (category != null) {
			return productDetailDAO.getItemByCategory(category, page);
		} else {
			return null;
		}
	}

	public List<Object[]> getItemDetail(String Product_Id ){
		return productDetailDAO.getItemDetail(Product_Id);
	}
	// 取得照片
	public byte[] showPhotos(String Path){
		File file=null;
		ByteArrayOutputStream baos = null;
		FileInputStream fis = null;
		byte[] photo = null;		
		file = new File(Path+".jpg");
		if(!file.exists()){
			file = new File(Path+".gif"); 
		}
		if(!file.exists()){
			file = new File(Path+".png");
		}
		try {	
			fis = new FileInputStream(file);
			baos = new ByteArrayOutputStream();
			int count = 0;
    		byte[] bytes = new byte[1024];
    		while ((count = fis.read(bytes)) != -1) {
    			baos.write(bytes, 0, count);
    		}
			baos.flush();
			photo = baos.toByteArray();
			baos.close();
			return photo;
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}finally{
			try {
				fis.close();
			} catch (IOException e) {	
				e.printStackTrace();
				return null;
			}
		}
	
	} // end public byte[] showPhotos(String Path){
	
	
	// back-end: select all columns in ProductDetail & Product Table
	public List<Object[]> getAllByDesc() {
		return productDetailDAO.getAllByDesc();
	}

	// back-end: 新增商品至 ProductDetail & Product Table
	public List<Object[]> addProductDetail(
			String product_Name, // 名稱 
			Double price,// 價格
			String category, // 分類
			String size, // 尺寸
			String color, // 顏色
			Integer stock, // 庫存量
			// MultipartFile photo1, // 圖片1
			// byte[] photo2, // 圖片2
			// byte[] photo3, // 圖片3
			String product_Status, // 狀態
			String info) { // 商品簡介
		List<Object[]> list = new ArrayList<Object[]>();

		ProductsVO productsVO = new ProductsVO();
		productsVO.setProduct_Name(product_Name);
		productsVO.setPrice(price);
		productsVO.setCategory(category);
		productsVO.setInfo(info);
		productsVO = productsDAO.insert(productsVO);

		ProductDetailVO productDetailVO = new ProductDetailVO();
		productDetailVO.setProduct_Id(productsVO.getProduct_Id());
		productDetailVO.setSize(size);
		productDetailVO.setColor(color);
		productDetailVO.setStock(stock);
		Timestamp ts = new Timestamp(System.currentTimeMillis());
		productDetailVO.setPublished_Date(ts);
//		try {
//			productDetailVO.setPhoto1(photo1.getBytes());
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
		productDetailVO.setProduct_Status(product_Status);
		productDetailVO = productDetailDAO.insert(productDetailVO);

		Object[] pVO = {productsVO, productDetailVO}; 
		list.add(0, pVO);
		return list;
	}

	// back-end: 修改商品至 ProductDetail & Product Table
	public List<Object[]> updateProductDetail(
			String productDetail_Id, 
			String product_Id,
			String product_Name, 
			Double price,             // 價格
			String category,          // 分類
			String info,              // 商品簡介
			String size,              // 尺寸
			String color,             // 顏色
			Integer stock,            // 庫存量
			String product_Status){    // 狀態
		List<Object[]> list = new ArrayList<Object[]>();

		ProductsVO productsVO = productsDAO.findByPrimaryKey(product_Id);
		productsVO.setProduct_Name(product_Name);
		productsVO.setPrice(price);
		productsVO.setCategory(category);
		productsVO.setInfo(info);
		productsVO = productsDAO.update(productsVO);

		ProductDetailVO productDetailVO = productDetailDAO.findByPrimaryKey(productDetail_Id);
		productDetailVO.setProduct_Id(productsVO.getProduct_Id());

		productDetailVO.setSize(size);
		productDetailVO.setColor(color);
		productDetailVO.setStock(stock);
		Timestamp ts = new Timestamp(System.currentTimeMillis());
		productDetailVO.setPublished_Date(ts);
		productDetailVO.setProduct_Status(product_Status);
		productDetailVO = productDetailDAO.update(productDetailVO);
		
		Object[] pVO = {productsVO, productDetailVO}; 
		list.add(0, pVO);
		
//		//list.add(0, productsVO);
//		//list.add(1, productDetailVO);
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
	
	// back-end: insert or update images
	public void Insert_Images(String Path, MultipartFile[] photos){
		FileOutputStream fos = null;
		File file = null;
	
		for(int i=0; i<=4; i++){
		try {
			String contentType;
			if(photos[i] != null){
			byte[] photo = photos[i].getBytes();
			if(photos[i].getContentType().substring(6).equalsIgnoreCase("jpeg")){
				contentType=".jpg";
			}else{
				contentType="."+photos[i].getContentType().substring(6);
			}
			file = new File(Path+"_"+(i+1)+contentType);		
			if (!file.exists()) {
				file.createNewFile();
			}	
			fos = new FileOutputStream(file);
			fos.write(photo);
			fos.flush();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				fos.close();
			} catch (IOException e) {
				e.printStackTrace();
			}	
		} // end finally
	} // end for(i=0; i<=4; i++){
} // end public void Insert_Images(String Path, MultipartFile[] photos){

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
