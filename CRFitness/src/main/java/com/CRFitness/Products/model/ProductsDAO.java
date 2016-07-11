package com.CRFitness.Products.model;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.type.BinaryType;
import org.hibernate.type.ByteType;
import org.hibernate.type.StringType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.CRFitness.ProductDetail.model.ProductDetailVO;

@Repository("productsDAO")
@Transactional(transactionManager = "transactionManager")
public class ProductsDAO implements ProductsDAO_interface {

	private static final String GET_ALL_STMT = "from ProductsVO ";
	private static final String GET_ITEM_BY_CATEGORY = "from ProductsVO where category=:category";

	@Autowired
	private SessionFactory sessionFactory;

	public ProductsDAO() {

	}

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public ProductsVO insert(ProductsVO productsVO) {
			this.getSession().saveOrUpdate(productsVO);		
			return productsVO;
		
	}

	@Override
	public boolean update(ProductsVO product_Id) {
		if (product_Id != null) {
			this.getSession().saveOrUpdate(product_Id);
			return true;
		}
		return false;
	}

	@Override
	public boolean delete(String product_Id) {
		ProductsVO productsVO = (ProductsVO) this.getSession().get(ProductsVO.class, product_Id);
		if (productsVO != null) {
			this.getSession().delete(productsVO);
			return true;
		}
		return false;
	}

	@Override
	public ProductsVO findByPrimaryKey(String product_Id) {
		return (ProductsVO) this.getSession().get(ProductsVO.class, product_Id);
	}

	@Override
	public List<ProductsVO> getAll() {
		Query query = this.getSession().createQuery(GET_ALL_STMT);
		return (List<ProductsVO>) query.list();
	}

	@Override
	public List<ProductsVO> getItemByCategory(String category) {
		Query query = this.getSession().createQuery(GET_ITEM_BY_CATEGORY);
		query.setParameter("category", category);
		return (List<ProductsVO>) query.list();
	}

//	@Override
//	public List<ProductsVO> searchAllItem() {
//		Query query = this.getSession()
//				.createSQLQuery("select * " + "from  Products join ProductDetail "
//						+ "on ProductDetail.Product_Id=Products.Product_Id ")
//				.addEntity(ProductsVO.class).addScalar("photo1", BinaryType.INSTANCE)
//				.addScalar("introduction", StringType.INSTANCE)
//				.addScalar("productDetail_Id", StringType.INSTANCE);
//		return (List<ProductsVO>) query.list();
//
//	}

	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("test.config.xml");

		ProductsDAO_interface dao = (ProductsDAO_interface) context.getBean("productsDAO");
		List<ProductsVO> all = dao.getAll();
		// for(ProductsVO vo:all)
		// System.out.println(vo.getProduct_Name()+":"+vo.getPrice()+":"+vo.getCategory());

		ProductsVO vo = dao.findByPrimaryKey("product4008");
		vo.setCategory("點菸神器");
		dao.update(vo);

		((ConfigurableApplicationContext) context).close();
	}
}
