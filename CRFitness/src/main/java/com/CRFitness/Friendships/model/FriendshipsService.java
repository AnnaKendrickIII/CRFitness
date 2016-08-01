package com.CRFitness.Friendships.model;



import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.CRFitness.Chats.model.ChatDAO_interface;
import com.CRFitness.Chats.model.ChatVO;

@Service("friendshipsService")
public class FriendshipsService {
	
	@Resource(name="friendshipsDAO")
	private FriendshipsDAO_interface friendshipsDAO;
	
	@Autowired
	public ChatDAO_interface chatDAO;
	
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
	public boolean addFriend(String member_Id,String friend_Id, String nickname){
		FriendshipsVO friendshipsVO = new FriendshipsVO();
		FriendshipsVO friendshipsVO2 = new FriendshipsVO();
		friendshipsVO.setMember_Id(member_Id);
		friendshipsVO.setFriend_Id(friend_Id);
		friendshipsVO.setFriend_Status(2);
		friendshipsVO2.setMember_Id(friend_Id);
		friendshipsVO2.setFriend_Id(member_Id);
		friendshipsVO2.setFriend_Status(3);
		ChatVO chatVO1 = new ChatVO();
		chatVO1.setMember_Id(member_Id);
		chatVO1.setFriend_Id(friend_Id);
		chatVO1.setChat_Detail(nickname + " 想加你為好友");
		chatVO1.setChatTime(new java.sql.Timestamp(System.currentTimeMillis()));
		chatVO1.setChatStuts(2);
		if(friendshipsDAO.insert(friendshipsVO) && friendshipsDAO.insert(friendshipsVO2) && chatDAO.insert(chatVO1)!=null)
			return true;
		else
			return false;
	}
	
	@Transactional(transactionManager="transactionManager")
	public boolean acceptFriend(String member_Id,String friend_Id){
		ChatVO chatVO1 = new ChatVO();
		chatVO1.setMember_Id(member_Id);
		chatVO1.setFriend_Id(friend_Id);
		chatVO1.setChatStuts(4);
		FriendshipsVO friendshipsVO = new FriendshipsVO();
		FriendshipsVO friendshipsVO2 = new FriendshipsVO();
		friendshipsVO.setMember_Id(member_Id);
		friendshipsVO.setFriend_Id(friend_Id);
		friendshipsVO.setFriend_Status(1);
		friendshipsVO2.setMember_Id(friend_Id);
		friendshipsVO2.setFriend_Id(member_Id);
		friendshipsVO2.setFriend_Status(1);
		if(friendshipsDAO.update(friendshipsVO) && friendshipsDAO.update(friendshipsVO2) && chatDAO.updatefriendstatus(chatVO1) == 1)
			return true;
		else
			return false;
	}
	
	@Transactional(transactionManager="transactionManager")
	public boolean deleteFriend(String member_Id,String friend_Id){
		ChatVO chatVO1 = new ChatVO();
		chatVO1.setMember_Id(member_Id);
		chatVO1.setFriend_Id(friend_Id);
		chatVO1.setChatStuts(4);
		if(friendshipsDAO.delete(member_Id, friend_Id) && friendshipsDAO.delete(friend_Id, member_Id) && chatDAO.updatefriendstatus(chatVO1) ==1)
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
