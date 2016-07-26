package com.CRFitness.Friendships.model;



import java.util.List;

import javax.annotation.Resource;





import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("friendshipsService")
public class FriendshipsService {
	
	@Resource(name="friendshipsDAO")
	private FriendshipsDAO_interface friendshipsDAO;
	
	
	
	public  List<Object[]> findFriends(String member_Id){
		return  friendshipsDAO.select_Friends(member_Id);		
	}
	
	public Integer select_Friend_Flag(String member_Id, String friend_Id){
		return friendshipsDAO.select_Friend_Flag(member_Id, friend_Id);
	}
	
	public Long select_Friends_Flag(String member_Id){
		return friendshipsDAO.select_Friends_Flag(member_Id);
	}
	
	@Transactional(transactionManager="transactionManager")
	public boolean addFriend(String member_Id,String friend_Id){
		FriendshipsVO friendshipsVO = new FriendshipsVO();
		FriendshipsVO friendshipsVO2 = new FriendshipsVO();
		friendshipsVO.setMember_Id(member_Id);
		friendshipsVO.setFriend_Id(friend_Id);
		friendshipsVO.setFriend_Status(2);
		friendshipsVO2.setMember_Id(friend_Id);
		friendshipsVO2.setFriend_Id(member_Id);
		friendshipsVO2.setFriend_Status(3);
		if(friendshipsDAO.insert(friendshipsVO) && friendshipsDAO.insert(friendshipsVO2))
			return true;
		else
			return false;
	}
	
	@Transactional(transactionManager="transactionManager")
	public boolean acceptFriend(String member_Id,String friend_Id){
		FriendshipsVO friendshipsVO = new FriendshipsVO();
		FriendshipsVO friendshipsVO2 = new FriendshipsVO();
		friendshipsVO.setMember_Id(member_Id);
		friendshipsVO.setFriend_Id(friend_Id);
		friendshipsVO.setFriend_Status(1);
		friendshipsVO2.setMember_Id(friend_Id);
		friendshipsVO2.setFriend_Id(member_Id);
		friendshipsVO2.setFriend_Status(1);
		if(friendshipsDAO.update(friendshipsVO) && friendshipsDAO.update(friendshipsVO2))
			return true;
		else
			return false;
	}
	
	@Transactional(transactionManager="transactionManager")
	public boolean deleteFriend(String member_Id,String friend_Id){
		if(friendshipsDAO.delete(member_Id, friend_Id) && friendshipsDAO.delete(friend_Id, member_Id))
			return true;
		else
			return false;
	}
	
	
//	public static void main(String[] args)  {	
//		ApplicationContext context = new ClassPathXmlApplicationContext(
//				"test.config.xml");
//		FriendshipsService friendshipsService = (FriendshipsService) context.getBean("friendshipsService");
//		FriendshipsDAO friendshipsDAO=(FriendshipsDAO)context.getBean("friendshipsDAO");
//		friendshipsDAO.getSessionFactory().getCurrentSession().beginTransaction();	
//		List<FriendshipsVO> list=friendshipsService.findFriends("member1002");
//		FriendshipsVO friendshipsVO = null ;
//		 for(FriendshipsVO data:list){
//			 friendshipsVO=data;
//			 System.out.println(friendshipsVO.getMember_Id()+","+friendshipsVO.getFriend_Id());
//		 }	
//		friendshipsDAO.getSessionFactory().getCurrentSession().getTransaction()
//		.commit();
//		((ConfigurableApplicationContext) context).close();
//	}
}
