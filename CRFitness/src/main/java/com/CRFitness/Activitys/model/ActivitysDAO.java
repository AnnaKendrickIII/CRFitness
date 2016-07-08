package com.CRFitness.Activitys.model;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.type.StringType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


@Transactional(transactionManager="transactionManager")
@Repository("activitysDAO")
public class ActivitysDAO implements ActivitysDAO_interface {

	private static final String GET_ALL_STMT = "from ActivitysVO order by activity_id desc";

	@Autowired
	private SessionFactory sessionFactory;
	
	public ActivitysDAO() {

	}
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public boolean insert(ActivitysVO activitysVO) {
		if(activitysVO != null) {
			this.getSession().saveOrUpdate(activitysVO);
			return true;
		}
		return false;
	}

	@Override
	public boolean update(ActivitysVO activitysVO) {
		if (activitysVO != null) {
			this.getSession().saveOrUpdate(activitysVO);
			return true;
		}
		return false;
	}

	@Override
	public boolean delete(String activity_Id) {
		ActivitysVO activitysVO = (ActivitysVO) this.getSession().get(ActivitysVO.class,
				activity_Id);
		if (activitysVO != null) {
			this.getSession().delete(activitysVO);
			return true;
		}
		return false;
	}

	@Override
	public ActivitysVO findByPrimaryKey(String activity_Id) {
		return (ActivitysVO) this.getSession().get(ActivitysVO.class, activity_Id);
	}

	@Override
	public List<ActivitysVO> getAll() {
		Query query = this.getSession().createQuery(GET_ALL_STMT);
	return (List<ActivitysVO>) query.list();
	}
	@Override
	public List<ActivitysVO> select_ActivityMember( ) {	
		Query query = this.getSession().createSQLQuery(
				"SELECT Members.Nickname ,Activitys.* "
				+"FROM Activitys JOIN ActivityDetail "
				+"ON Activitys.Activity_Id=ActivityDetail.Activity_Id "
				+"JOIN Members ON ActivityDetail.Member_Id=Members.Member_Id "		
				).addEntity("Activitys.*",ActivitysVO.class)
				.addScalar("Nickname",StringType.INSTANCE);
	return (List<ActivitysVO>) query.list();	
}

}
