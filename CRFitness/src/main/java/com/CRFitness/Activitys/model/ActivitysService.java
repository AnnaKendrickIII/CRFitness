package com.CRFitness.Activitys.model;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.CRFitness.Friendships.model.FriendshipsVO;
import com.CRFitness.Member.model.MemberVO;


@Service("activitysService")
public class ActivitysService {
	
	@Resource(name = "activitysDAO")
	private ActivitysDAO_interface activitysDAO;
	
	public ActivitysService(){
		
	}

	//找活動照片
	public byte[] findActivitysPhoto(String activity_Id){
		return activitysDAO.findByPrimaryKey(activity_Id).getPhoto1();
	}
	
	public void updateactivitys(ActivitysVO activitysVO){
		activitysDAO.update(activitysVO);
	}
	
	public void deleteactivitys(String activity_Id){
		activitysDAO.delete(activity_Id);
	}
	
	public ActivitysVO findActivitys(String activity_Id){
		return activitysDAO.findByPrimaryKey(activity_Id);
	}
	
	public List<ActivitysVO> getAll(){
		List<ActivitysVO> list = activitysDAO.getAll();
		for(ActivitysVO activitysVO:list){
			activitysVO.getMemberVO().setPassword(null);
		}
		return list;
	}
	


}
