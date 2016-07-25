package com.CRFitness.ActivityDetail.model;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.CRFitness.Activitys.model.ActivitysDAO_interface;
import com.CRFitness.Activitys.model.ActivitysVO;
import com.CRFitness.Member.model.MemberDAO_interface;



@Service("activitydetailService")
public class ActivityDetailService {

	@Resource(name = "activityDetailDAO")
	private ActivityDetailDAO_interface activityDetailDAO;
	@Resource(name = "memberDAO")
	private MemberDAO_interface memberDAO;
	@Resource(name = "activitysDAO")
	private ActivitysDAO_interface activitysDAO;
	
	public ActivityDetailService() {

	}
	
	public List<String> addActivityDetail( String activity_Id,String member_Id){
		
		List<String> list=new ArrayList<String>();
		
//		System.out.println(activity_Id);
//		System.out.println(member_Id);
		ActivityDetailVO activityDetailVO =new ActivityDetailVO();
		activityDetailVO.setActivity_Id(activity_Id);
		activityDetailVO.setMember_Id(member_Id);
		activityDetailVO.setDetail_Status(1);
		ActivitysVO activitysVO=activitysDAO.findByPrimaryKey(activity_Id);
		
//		System.out.println(activitysVO.getMember_Id());
		int people = activitysVO.getPeople();
		
		if(activitysVO.getMember_Id().equals(member_Id)){
			list.add("無法參加自己的活動");
			return list;
		}
		if(activityDetailDAO.findByPrimaryKey(activityDetailVO)!=null){
			list.add("參加過");
			return list;
		}
		if(activitysVO.getPeople_Max()==people){
			list.add("已額滿");
			return list;
		}
		
		activitysVO.setPeople((people)+1);
		activitysDAO.update(activitysVO);
		activityDetailDAO.insert(activityDetailVO);
		return activityDetailDAO.joinMembers(activityDetailVO.getActivity_Id());	
	}
	
		public List<String> cleanActivityDetail( String activity_Id,String member_Id){
		
		List<String> list=new ArrayList<String>();
		ActivityDetailVO activityDetailVO =new ActivityDetailVO();
		activityDetailVO.setActivity_Id(activity_Id);
		activityDetailVO.setMember_Id(member_Id);
		ActivitysVO activitysVO=activitysDAO.findByPrimaryKey(activity_Id);
		ActivityDetailVO activityDetailVO2=activityDetailDAO.findByPrimaryKey(activityDetailVO);
		
		if((activityDetailVO.getDetail_Status())-1 ==0){
			list.add("確定取消參加嗎?");
			int people = activitysVO.getPeople();
			int ad_status = activityDetailVO.getDetail_Status();
			activitysVO.setPeople((people)-1);
			activityDetailVO.setDetail_Status((ad_status)-1);
			activitysDAO.update(activitysVO);
			activityDetailDAO.update(activityDetailVO);
			return list;
		}
		
		return activityDetailDAO.cleanMembers(activityDetailVO.getActivity_Id());	
	}

	
}
