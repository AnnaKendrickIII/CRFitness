package com.CRFitness.Friendships.model;



import java.util.List;

import javax.annotation.Resource;



import org.springframework.stereotype.Service;

import com.CRFitness.Member.model.MemberVO;




@Service("friendshipsService")
public class FriendshipsService {
	
	@Resource(name="friendshipsDAO")
	private FriendshipsDAO_interface friendshipsDAO;
	
	
	
	public  List<MemberVO> findFriends(String member_Id){
		List<MemberVO> list = friendshipsDAO.select_Friends(member_Id);
		for(MemberVO memberVO:list){
			memberVO.setPassword(null);
		}	
		return list;	
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
