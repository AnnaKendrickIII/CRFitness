package com.CRFitness.ActivityDetail.model;

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
	
	public ActivityDetailVO addActivityDetail(
			@RequestParam String activity_Id,
			@RequestParam String member_Id) 
	{
		System.out.println(activity_Id);
		System.out.println(member_Id);
		ActivityDetailVO activitydetailVO=new ActivityDetailVO();
		ActivitysVO activitysVO=activitysDAO.findByPrimaryKey(activity_Id);
//		String a_Id = activitydetailVO.getActivity_Id();
//		String m_Id = activitydetailVO.getMember_Id();
//		if((a_Id == activity_Id) && (m_Id == member_Id) ){
//			return activityDetailDAO.;
//		}else{
		activitydetailVO.setMember_Id(member_Id);
		activitydetailVO.setActivity_Id(activity_Id);
		int people = activitysVO.getPeople();
		activitysVO.setPeople((people)+1);
		activitysDAO.insert(activitysVO);
		return activityDetailDAO.insert(activitydetailVO);
//		}
	}

	
}
