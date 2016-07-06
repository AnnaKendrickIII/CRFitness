package com.CRFitness.Friendships.model;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.CRFitness.Member.model.MemberVO;

@Transactional(transactionManager="transactionManager")
@Repository("friendshipsDAO")
public class FriendshipsDAO implements FriendshipsDAO_interface {

	private static final String GET_ALL_STMT = "from FriendshipsVO";

	@Autowired
	private SessionFactory sessionFactory;
	
	public FriendshipsDAO(){
		
	}
	
	public Session getSession(){
		return sessionFactory.getCurrentSession();
	}

	
	public List<MemberVO> select_Friends(String member_Id) {	
			Query query = this.getSession().createSQLQuery(
					"SELECT  Members.* "
					+"FROM  Members JOIN Friendships "
					+"ON Members.Member_Id=Friendships.Friend_Id "
					+"where Friendships.Member_Id='"+member_Id+"'").addEntity(MemberVO.class);				
		return (List<MemberVO>) query.list();	
	}
	@Override
	public boolean insert(FriendshipsVO friendshipsVO) {
		if(friendshipsVO != null) {
			this.getSession().saveOrUpdate(friendshipsVO);
			return true;
		}
		return false;
	}

	@Override
	public boolean update(FriendshipsVO friendshipsVO) {
		if (friendshipsVO != null) {
			this.getSession().saveOrUpdate(friendshipsVO);
			return true;
		}	
		return false;
	}

	@Override
	public boolean delete(String member_Id,String friend_Id) {
		FriendshipsVO friendshipsVO=new FriendshipsVO();
		friendshipsVO.setMember_Id(member_Id);
		friendshipsVO.setFriend_Id(friend_Id);
		FriendshipsVO friendshipsVOs = (FriendshipsVO) this.getSession().get(FriendshipsVO.class,
				friendshipsVO);
		if (friendshipsVOs != null) {
			this.getSession().delete(friendshipsVOs);
			return true;
		}		return false;
	}

	@Override
	public List<FriendshipsVO> getAll() {
		Query query = this.getSession().createQuery(GET_ALL_STMT);
	return (List<FriendshipsVO>) query.list();
	}
	
}
