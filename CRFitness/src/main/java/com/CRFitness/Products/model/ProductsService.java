package com.CRFitness.Products.model;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

import com.CRFitness.ProductDetail.model.ProductDetailVO;

@Service("productsService")
public class ProductsService {

	@Resource(name = "productsDAO")
	private ProductsDAO_interface productsDAO;

	public ProductsService() {

	}

	// 如你所見,撈出商品資料
	public List<ProductsVO> selectAllItem() {
		if (productsDAO.getAll() != null) {
			return productsDAO.getAll();
		} else {
			return null;
		}
	}
	
	//新增商品
	public ProductsVO addItem(ProductsVO productsVO) {
		if (productsVO != null) {
			productsDAO.insert(productsVO);
		}
		return productsVO;
	}
	
	//修改商品內容
	public ProductsVO modifyItem(String product_Id, String product_Name,
			Double price, String category) {

		ProductsVO productsVO = productsDAO.findByPrimaryKey(product_Id);
		productsVO.setProduct_Name(product_Name);
		productsVO.setPrice(price);
		productsVO.setCategory(category);
		productsDAO.update(productsVO);
		return productsVO;
	}
	


	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext(
				"test.config.xml");
		ProductsService service = (ProductsService) context
				.getBean("productsService");

		// addItem()
		// List<ProductsVO> vos = service.selectItem();
		// for (ProductsVO vo : vos)
		// System.out.println(vo.getProduct_Name() + ":" + vo.getCategory()
		// + ":" + vo.getPrice());

		// modifyItem()
		// ProductsVO productsVO = new ProductsVO();
		// productsVO.setProduct_Name("打火機");
		// productsVO.setPrice(20.0);
		// productsVO.setCategory("護具");
		// service.addItem(productsVO);

		

		((ConfigurableApplicationContext) context).close();
	}
}
