package com.CRFitness.ProductDetail.model;

import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.type.DoubleType;
import org.hibernate.type.StringType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.CRFitness.PersonalJournal.model.PersonalJournalVO;
import com.CRFitness.Products.model.ProductsVO;

@Repository("productDetailDAO")
@Transactional(transactionManager = "transactionManager")
public class ProductDetailDAO implements ProductDetailDAO_interface {

	private static final String GET_PRODUCTDETAIL_ID = "from ProductDetailVO where product_Name=:product_Name and size=:size and color=:color";
	private static final String CHANGE_STATUS = "from ProductDetailVO where product_Status=:product_Status";
	
	@Autowired
	private SessionFactory sessionFactory;

	public ProductDetailDAO() {

	}

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public ProductDetailVO insert(ProductDetailVO productDetailVO) {
		this.getSession().saveOrUpdate(productDetailVO);
		return productDetailVO;

	}

	@Override
	public ProductDetailVO update(ProductDetailVO productDetailVO) {
		this.getSession().saveOrUpdate(productDetailVO);
		return productDetailVO;
	}

	@Override
	public boolean delete(String productDetail_Id) {
		ProductDetailVO productDetailVO = new ProductDetailVO();
		productDetailVO.setProductDetail_Id(productDetail_Id);
		ProductDetailVO productDetailVOs = (ProductDetailVO) this.getSession()
				.get(PersonalJournalVO.class, productDetailVO);
		if (productDetailVOs != null) {
			this.getSession().delete(productDetailVOs);
			return true;
		}
		return false;
	}

	@Override
	public ProductDetailVO findByPrimaryKey(String productDetail_Id) {
		return (ProductDetailVO) this.getSession().get(ProductDetailVO.class,
				productDetail_Id);
	}

	@Override
	public List<ProductDetailVO> getAll() {
		Query query = this
				.getSession()
				.createSQLQuery(
						"select ProductDetail.* ,Products.Product_Name ,Products.Price , Products.Category "
								+ " from  ProductDetail join Products"
								+ " on ProductDetail.Product_Id=Products.Product_Id ")
				.addEntity(ProductDetailVO.class)
				.addScalar("product_Name", StringType.INSTANCE)
				.addScalar("price", DoubleType.INSTANCE)
				.addScalar("category", StringType.INSTANCE);

		return (List<ProductDetailVO>) query.list();
	}

	// back-end
	@Override
	public List<ProductDetailVO> getAllByDesc() {
		Query query = this
				.getSession()
				.createSQLQuery(
						"Select ProductDetail.* ,Products.Product_Name ,Products.Price , Products.Category "
								+ " from  ProductDetail join Products"
								+ " on ProductDetail.Product_Id=Products.Product_Id "
								+ " Order by Product_Id desc")
				.addEntity(ProductDetailVO.class)
				.addScalar("product_Name", StringType.INSTANCE)
				.addScalar("price", DoubleType.INSTANCE)
				.addScalar("category", StringType.INSTANCE);
		return (List<ProductDetailVO>) query.list();
	}

	@Override
	public ProductDetailVO getProductDetailId(String product_Name, String size,
			String color) {
		Query query = this.getSession().createQuery(GET_PRODUCTDETAIL_ID);
		query.setParameter("product_Name", product_Name);
		query.setParameter("size", size);
		query.setParameter("color", color);
		return (ProductDetailVO) query.list().get(0);
	}

	// 依商品分類顯示
	@Override
	public List<ProductDetailVO> getItemByCategory(String category, Integer page) {
		int max=12;
		Query query = this
				.getSession()
				.createSQLQuery(
						"select * "
								+ "from  ProductDetail join Products "
								+ "on ProductDetail.Product_Id=Products.Product_Id "
								+ "where Products.Category='" + category + "'")
				.addEntity(ProductDetailVO.class)
				.addScalar("product_Name", StringType.INSTANCE)
				.addScalar("price", DoubleType.INSTANCE)
				.addScalar("category", StringType.INSTANCE);
		query.setFirstResult((page - 1) * max);
		query.setMaxResults(max);

		return (List<ProductDetailVO>) query.list();
	}

	@Override
	public List<ProductDetailVO> findByPrimaryKeySQLQuery(
			String productDetail_Id) {
		Query query = getSession()
				.createSQLQuery(
						"select ProductDetail.*, product_Name, price, category  from ProductDetail join Products "
								+ "on ProductDetail.Product_Id = Products.Product_Id "
								+ "where ProductDetail_Id='"
								+ productDetail_Id
								+ "'").addEntity(ProductDetailVO.class)
				.addScalar("product_Name", StringType.INSTANCE)
				.addScalar("price", DoubleType.INSTANCE)
				.addScalar("category", StringType.INSTANCE);

		return (List<ProductDetailVO>) query.list();
	}

	// back-end: change status
	@Override
	public ProductDetailVO changStatus(String product_Status) {
		Query query = this.getSession().createQuery(CHANGE_STATUS);
//		query.setParameter("productDetail_Id", productDetail_Id);
		query.setParameter("product_Status", product_Status);
		return (ProductDetailVO) query.list().get(0);
	}

	public static void main(String[] args) {

		ApplicationContext context = new ClassPathXmlApplicationContext(
				"test.config.xml");
		ProductDetailDAO_interface dao = (ProductDetailDAO_interface) context
				.getBean("productDetailDAO");

		// ProductDetailVO result =
		// productDetailDAO.getProductDetailId("男超寬楦慢跑鞋",
		// "US9", "黃");
		// System.out.println(result.getProductDetail_Id());

		// for (ProductDetailVO vo : dao.getItemByCategory("運動用品")) {
		// System.out.println(vo.getProduct_Name());
		// }

		((ConfigurableApplicationContext) context).close();

	}

	// public static void main(String[] args) {
	//
	//
	// ApplicationContext context = new
	// ClassPathXmlApplicationContext("test.config.xml");
	// ProductDetailDAO productDetailDAO =
	// (ProductDetailDAO)context.getBean("productDetailDAO");
	//
	// productDetailDAO.sessionFactory.getCurrentSession().beginTransaction();
	// ProductDetailVO list =
	// productDetailDAO.findByPrimaryKey("prodDetail4001");
	// if(list!=null)
	// System.out.print(list.getProductDetail_Id()+","+list.getProduct_Name()+","+list.getStock()
	// +","+list.getPublishedDay());
	//
	// productDetailDAO.sessionFactory.getCurrentSession().getTransaction().commit();
	// ((ConfigurableApplicationContext)context).close();
	// }
}
