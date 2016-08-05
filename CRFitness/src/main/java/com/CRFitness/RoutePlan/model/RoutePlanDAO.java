package com.CRFitness.RoutePlan.model;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository(value="RoutePlanDAO")
@Transactional(transactionManager = "transactionManager")
public class RoutePlanDAO implements RoutePlanDAO_interface {

	private static final String GET_Member_RoutePlan = "from RoutePlanVO where member_Id=:member_Id";
	@Autowired
	private SessionFactory sessionFactory;
	
	public RoutePlanDAO(){
		
	}
	
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	/* (non-Javadoc)
	 * @see com.CRFitness.RoutePlan.model.RoutePlanDAO_interface#insert(com.CRFitness.RoutePlan.model.RoutePlanVO)
	 */
	@Override
	public RoutePlanVO insert(RoutePlanVO routePlanVO){
		this.getSession().save(routePlanVO);
		return routePlanVO;
	}
	
	/* (non-Javadoc)
	 * @see com.CRFitness.RoutePlan.model.RoutePlanDAO_interface#delete(com.CRFitness.RoutePlan.model.RoutePlanVO)
	 */
	@Override
	public boolean delete(RoutePlanVO routePlanVO){
		return false;
	}
	
	/* (non-Javadoc)
	 * @see com.CRFitness.RoutePlan.model.RoutePlanDAO_interface#getMemberRoutePlanVOs(java.lang.String)
	 */
	@Override
	public List<RoutePlanVO> getMemberRoutePlanVOs(String member_Id){
		Query query = this.getSession().createQuery(GET_Member_RoutePlan).setParameter("member_Id", member_Id);
		return (List<RoutePlanVO>)query.list();
	}
	
}
