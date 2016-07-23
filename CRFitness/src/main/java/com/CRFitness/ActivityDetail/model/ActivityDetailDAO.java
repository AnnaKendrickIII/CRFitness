package com.CRFitness.ActivityDetail.model;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.type.StringType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.CRFitness.Activitys.model.ActivitysVO;


@Transactional(transactionManager="transactionManager")
@Repository("activityDetailDAO")
public class ActivityDetailDAO implements ActivityDetailDAO_interface {
	
	private static final String GET_ALL_STMT = "from ActivityDetailVO";

	@Autowired
	private  SessionFactory sessionFactory;
	
	public ActivityDetailDAO() {

	}
	
	public Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	
    @Override
	public ActivityDetailVO insert(ActivityDetailVO activityDetailVO) {
			this.getSession().saveOrUpdate(activityDetailVO);
			return activityDetailVO;
	}
	@Override
	public boolean update(ActivityDetailVO activityDetailVO) {
		if (activityDetailVO != null) {
			this.getSession().saveOrUpdate(activityDetailVO);
			return true;
		}
		return false;	
	}

	@Override
	public boolean delete(String activity_Id,String member_id) {
		ActivityDetailVO activityDetailVO =new ActivityDetailVO();
		activityDetailVO.setActivity_Id(activity_Id);
		activityDetailVO.setMember_Id(member_id);
		ActivityDetailVO activityDetailVOs= (ActivityDetailVO) this.getSession().get(ActivityDetailVO.class
				, activityDetailVO);
		if (activityDetailVOs != null) {
			this.getSession().delete(activityDetailVOs);
			return true;
		}
		return false;
	}

	@Override
	public ActivityDetailVO findByPrimaryKey(ActivityDetailVO activityDetailVO) {	
		return (ActivityDetailVO) this.getSession().get(ActivityDetailVO.class, activityDetailVO);
	}


	@Override
	public List<ActivityDetailVO> getAll() {
			Query query = this.getSession().createQuery(GET_ALL_STMT);
		return (List<ActivityDetailVO>) query.list();
	}
	@Override
	 public List<String> joinMembers(String activity_Id){
		Query query = this.getSession().createSQLQuery(
				"Select Nickname " 
				+"from  ActivityDetail join Members "
				+"on  ActivityDetail.Member_Id =Members.Member_Id "
				+"where ActivityDetail.Activity_Id='"+activity_Id+"'")
				.addScalar("Nickname", StringType.INSTANCE);
		 return (List<String>) query.list();
	 }

	@Override
	public List<String> cleanMembers(String activity_Id) {
		Query query = this.getSession().createSQLQuery(
				"Select Nickname " 
				+"from  ActivityDetail join Members "
				+"on  ActivityDetail.Member_Id =Members.Member_Id "
				+"where ActivityDetail.Activity_Id='"+activity_Id+"'")
				.addScalar("Nickname", StringType.INSTANCE);
		 return (List<String>) query.list();
	}

}
