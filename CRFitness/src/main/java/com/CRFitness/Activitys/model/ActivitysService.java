package com.CRFitness.Activitys.model;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.util.Base64Utils;

import com.CRFitness.Member.model.MemberDAO_interface;
import com.CRFitness.Member.model.MemberVO;


@Service("activitysService")
public class ActivitysService {
	
	@Resource(name = "activitysDAO")
	private ActivitysDAO_interface activitysDAO;
	@Resource(name = "memberDAO")
	private MemberDAO_interface memberDAO;

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
	
	public List<ActivitysVO> findActivitysMembers( ){
		List<ActivitysVO> list = activitysDAO.select_ActivityMember();
		return list;
	}
	
	public List<ActivitysVO> getAll(){
		List<ActivitysVO> list = activitysDAO.getAll();
		for(ActivitysVO activitysVO:list){
			activitysVO.getMemberVO().setPassword(null);
		}
		return list;
	}
	
	public void addActivitys(
			String member_Id,
			String activity_Day,
			String activity_Class,
			String activity_Area,
			String photo1,
			String activity_Info,
			String deadline)
	{
		
			Timestamp datetime = new Timestamp(System.currentTimeMillis());
			MemberVO memberVO=new MemberVO();
			memberVO.setMember_Id(member_Id);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
			activity_Day =sdf.format(new Date(activity_Day));
			Timestamp ts = Timestamp.valueOf(activity_Day);
			SimpleDateFormat sdft = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
			deadline =sdft.format(new Date());
			Timestamp tsd = Timestamp.valueOf(deadline);
			ActivitysVO activitysVO=new ActivitysVO();
			activitysVO.setMemberVO(memberVO);	
			activitysVO.setActivity_Day(ts);
			activitysVO.setActivity_Class(activity_Class);
			activitysVO.setActivity_Area(activity_Area);
			activitysVO.setPhoto1(Base64Utils.decodeFromString(photo1));
			activitysVO.setActivity_Info(activity_Info);
			activitysVO.setDeadline(tsd);
			activitysVO.setStartDay(datetime);
			activitysVO.setPeople(0);
			activitysDAO.insert(activitysVO);
		
	}

}
