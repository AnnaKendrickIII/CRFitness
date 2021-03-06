package com.CRFitness.Friendships.model;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.type.StringType;
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

	@Override
	public List<FriendshipsVO> select_MyFriends(String member_Id) {	
			Query query = this.getSession().createSQLQuery(
					"SELECT Friendships.* "
					+"FROM Friendships "
					+"where Member_Id='"+member_Id+"' and Friend_Status = 1")
					.addEntity(FriendshipsVO.class);
								
		return (List<FriendshipsVO>) query.list();	
	}
	
	@Override
	public List<Object[]> select_Friends(String member_Id) {	
			Query query = this.getSession().createSQLQuery(
					"SELECT Members.Member_Id,Members.E_mail,Members.Nickname "
					+"FROM Members JOIN Friendships "
					+"ON Members.Member_Id=Friendships.Friend_Id "
					+"where Friendships.Member_Id='"+member_Id+"' and Friend_Status = 1")
					.addScalar("Member_Id",StringType.INSTANCE).addScalar("E_mail",StringType.INSTANCE)
					.addScalar("Nickname",StringType.INSTANCE);				
		return (List<Object[]>) query.list();	
	}
	
	@Override
	public Integer select_Friend_Flag(String member_Id, String friend_Id) {	
		Query query = this.getSession().createQuery(
			"SELECT friend_Status "
			+"FROM FriendshipsVO "
			+"where member_Id=:member_Id and friend_Id=:friend_Id")
			.setParameter("member_Id", member_Id)
			.setParameter("friend_Id", friend_Id);
		List<Object> friend_Flag = query.list();
		if(!friend_Flag.isEmpty())
			return (Integer)friend_Flag.get(0);
		else
			return 0;
	}
	
	@Override
	public Long select_Friends_Flag(String member_Id) {	
		Query query = this.getSession().createQuery(
			"SELECT count(*) "
			+"FROM FriendshipsVO "
			+"where member_Id=:member_Id and friend_Status=3 ").setParameter("member_Id", member_Id);
		List<Object> friends_Flag = query.list();
		if(!friends_Flag.isEmpty())
			return (Long)friends_Flag.get(0);
		else
			return 0L;
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
