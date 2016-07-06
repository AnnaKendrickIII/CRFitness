package com.CRFitness.ProductDetail.model;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
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
@Transactional(transactionManager="transactionManager")
public class ProductDetailDAO implements ProductDetailDAO_interface {


	private static final String GET_ALL_STMT = "from ProductDetailVO";
	private static final String SELECT_CATEGORY = "from ProductDetailVO where product_Id=:product_Id";
	private static final String SELECT_SHOES = "from ProductDetailVO where product_Id>=:product_Id";
	
	private static final String GET_PRODUCTDETAIL_ID = "from ProductDetailVO where product_Name=:product_Name and size=:size and color=:color";
	private static final String GET_ITEM_BY_CATEGORY = "from ProductsVO where category=:category";



	@Autowired
	private SessionFactory sessionFactory ;
	
	public ProductDetailDAO() {

	}

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public boolean insert(ProductDetailVO productDetailVO) {
		if (productDetailVO != null) {
			this.getSession().saveOrUpdate(productDetailVO);
			return true;
		}
		return false;
	}


	@Override
	public boolean update(ProductDetailVO productDetailVO) {
		if (productDetailVO != null) {
			this.getSession().saveOrUpdate(productDetailVO);
			return true;
		}
		return false;
	}


	@Override
	public boolean delete(String productDetail_Id) {
		ProductDetailVO productDetailVO = new ProductDetailVO();
		productDetailVO.setProductDetail_Id(productDetail_Id);
		ProductDetailVO productDetailVOs = (ProductDetailVO)this.getSession().get(PersonalJournalVO.class,productDetailVO);
		if (productDetailVOs != null) {
			this.getSession().delete(productDetailVOs);
			return true;
		}
		return false;
	}

	@Override
	public ProductDetailVO findByPrimaryKey(String productDetail_Id) {
		ProductDetailVO productDetailVO=new ProductDetailVO();
		productDetailVO.setProductDetail_Id(productDetail_Id);
		return (ProductDetailVO) this.getSession().get(ProductDetailVO.class, productDetailVO);
	}



	@Override
	public List<ProductDetailVO> getAll() {
		Query query = this.getSession().createQuery(GET_ALL_STMT);
		return (List<ProductDetailVO>)query.list();
	}
	

	@Override
	public List<ProductDetailVO> getEquipment() {
		Query query = this.getSession().createQuery(SELECT_CATEGORY).setParameter("product_Id", "product4001");
		return (List<ProductDetailVO>)query.list();
	}
	

	@Override
	public List<ProductDetailVO> getClothing() {
		Query query = this.getSession().createQuery(SELECT_CATEGORY).setParameter("product_Id", "product4002");
		return (List<ProductDetailVO>)query.list();
	}
	

	@Override
	public List<ProductDetailVO> getAccessories() {
		Query query = this.getSession().createQuery(SELECT_CATEGORY).setParameter("product_Id", "product4003");
		return (List<ProductDetailVO>)query.list();
	}	
		
	@Override
	public List<ProductDetailVO> getShoes() {
			Query query = this.getSession().createQuery(SELECT_SHOES).setParameter("product_Id", "product4004");
				return (List<ProductDetailVO>)query.list();
	}	
			
			
	public ProductDetailVO getProductDetailId(String product_Name, String size,
			String color) {
		Query query = this.getSession().createQuery(GET_PRODUCTDETAIL_ID);
		query.setParameter("product_Name", product_Name);
		query.setParameter("size", size);
		query.setParameter("color", color);
		return (ProductDetailVO) query.list().get(0);
	}



	@Override
	public List<ProductDetailVO> getItemByCategory(String category) {
		return null;

	}


	
	
	public static void main(String[] args) {

		ApplicationContext context = new ClassPathXmlApplicationContext(
				"test.config.xml");
		ProductDetailDAO_interface dao = (ProductDetailDAO_interface) context
				.getBean("productDetailDAO");

//		ProductDetailVO result = productDetailDAO.getProductDetailId("男超寬楦慢跑鞋",
//				"US9", "黃");
//		System.out.println(result.getProductDetail_Id());
		
	
		System.out.println(dao.findByPrimaryKey("prodDetail5015"));

		((ConfigurableApplicationContext) context).close();

	}
	

	
//	public static void main(String[] args) {
//		
//		
//		ApplicationContext context = new ClassPathXmlApplicationContext("test.config.xml");
//		ProductDetailDAO productDetailDAO = (ProductDetailDAO)context.getBean("productDetailDAO");
//		
//		productDetailDAO.sessionFactory.getCurrentSession().beginTransaction();
//		ProductDetailVO list = productDetailDAO.findByPrimaryKey("prodDetail4001");
//		 if(list!=null)
//		 System.out.print(list.getProductDetail_Id()+","+list.getProduct_Name()+","+list.getStock()
//				 +","+list.getPublishedDay());
//		 
//		 productDetailDAO.sessionFactory.getCurrentSession().getTransaction().commit();
//		 ((ConfigurableApplicationContext)context).close();
//	}
}
