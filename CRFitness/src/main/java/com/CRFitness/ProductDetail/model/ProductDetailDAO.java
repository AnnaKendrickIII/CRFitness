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
import org.springframework.transaction.annotation.Transactional;

import com.CRFitness.PersonalJournal.model.PersonalJournalVO;

@Repository("productDetailDAO")
@Transactional(transactionManager = "transactionManager")
public class ProductDetailDAO implements ProductDetailDAO_interface {

	private static final String GET_ALL_STMT = "from ProductDetailVO ";
	private static final String GET_PRODUCTDETAILID = "from ProductDetailVO where product_Name=:product_Name and size=:size and color=:color";

	@Autowired
	private SessionFactory sessionFactory;

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
		ProductDetailVO productDetailVO = new ProductDetailVO();
		productDetailVO.setProductDetail_Id(productDetail_Id);
		return (ProductDetailVO) this.getSession().get(ProductDetailVO.class,
				productDetailVO);
	}

	@Override
	public List<ProductDetailVO> getAll() {
		Query query = this.getSession().createQuery(GET_ALL_STMT);
		return (List<ProductDetailVO>) query.list();
	}

	@Override
	public ProductDetailVO getProductDetailId(String product_Name, String size,
			String color) {
		Query query = this.getSession().createQuery(GET_PRODUCTDETAILID);
		query.setParameter("product_Name", product_Name);
		query.setParameter("size", size);
		query.setParameter("color", color);
		return (ProductDetailVO)query.list().get(0);
	}

	public static void main(String[] args) {

		ApplicationContext context = new ClassPathXmlApplicationContext(
				"test.config.xml");
		ProductDetailDAO_interface productDetailDAO = (ProductDetailDAO_interface) context
				.getBean("productDetailDAO");

		ProductDetailVO result = productDetailDAO.getProductDetailId("男超寬楦慢跑鞋", "US9", "黃");
		System.out.println(result.getProductDetail_Id());

		((ConfigurableApplicationContext) context).close();
	}
}
