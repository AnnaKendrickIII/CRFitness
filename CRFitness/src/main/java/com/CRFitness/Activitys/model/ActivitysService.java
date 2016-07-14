package com.CRFitness.Activitys.model;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.util.Base64Utils;
import org.springframework.web.multipart.MultipartFile;

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
	
	public List<ActivitysVO> findActivitysMembers_One( ){
		List<ActivitysVO> list = activitysDAO.select_ActivityMember_One();
		return list;
	}
	public List<ActivitysVO> findActivitysMembers_Two( ){
		List<ActivitysVO> list = activitysDAO.select_ActivityMember_Two();
		return list;
	}
	public  List<ActivitysVO> findActivitysMem(String member_Id){
		List<ActivitysVO> list = activitysDAO.select_Activitys(member_Id);
		return list;	
	} 
	
	public List<ActivitysVO> getAll(){
		List<ActivitysVO> list = activitysDAO.getAll();
		for(ActivitysVO activitysVO:list){
			activitysVO.getMember_Id();
		}
		return list;
	}
	
	public ActivitysVO addActivitys(
			String member_Id,
			String activity_Day,
			String activity_Class,
			String activity_Area,
			MultipartFile photo1,
			String activity_Info,
			String deadline)
	{
		System.out.println(activity_Day);
		System.out.println(deadline);	
			Timestamp datetime = new Timestamp(System.currentTimeMillis());
			MemberVO memberVO=new MemberVO();
			memberVO.setMember_Id(member_Id);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
			activity_Day =sdf.format(new Date(activity_Day));
			Timestamp ts = Timestamp.valueOf(activity_Day);
			SimpleDateFormat sdft = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
			deadline =sdft.format(new Date(deadline));
			Timestamp tsd = Timestamp.valueOf(deadline);
			ActivitysVO activitysVO=new ActivitysVO();
			activitysVO.setMember_Id(member_Id);	
			activitysVO.setActivity_Day(ts);
			activitysVO.setActivity_Class(activity_Class);
			activitysVO.setActivity_Area(activity_Area);
			
			try {
				activitysVO.setPhoto1(photo1.getBytes());
			} catch (IOException e) {
				e.printStackTrace();
			}
			activitysVO.setActivity_Info(activity_Info);
			activitysVO.setDeadline(tsd);
			activitysVO.setStartDay(datetime);
			activitysVO.setPeople(0);
		return activitysDAO.insert(activitysVO);
		
	}
	
	public ActivitysVO modifyActivitys(
			String activity_Id,
			String activity_Day,
			String activity_Class,
			String activity_Area,
			String activity_Info,
			String deadline)
	{
		System.out.println(activity_Day);
		System.out.println(deadline);	
		activity_Day=activity_Day.replace("-", "/");
		deadline=deadline.replace("-", "/");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
			activity_Day =sdf.format(new Date(activity_Day));
			Timestamp ts = Timestamp.valueOf(activity_Day);
			SimpleDateFormat sdft = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
			deadline =sdft.format(new Date(deadline));
			Timestamp tsd = Timestamp.valueOf(deadline);
			ActivitysVO activitysVO = activitysDAO.findByPrimaryKey(activity_Id);	
			activitysVO.setActivity_Day(ts);
			activitysVO.setActivity_Class(activity_Class);
			activitysVO.setActivity_Area(activity_Area);
			activitysVO.setActivity_Info(activity_Info);
			activitysVO.setDeadline(tsd);		
		return activitysDAO.update(activitysVO);
		
	}

	
}
