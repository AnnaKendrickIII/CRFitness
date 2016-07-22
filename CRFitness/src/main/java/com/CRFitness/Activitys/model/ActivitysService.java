package com.CRFitness.Activitys.model;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URL;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.imageio.ImageIO;

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
		List<ActivitysVO> list = activitysDAO.select_ActivityMember();
		return list;
	}
	
//	public List<ActivitysVO> findActivitysMembers_Two( ){
//		List<ActivitysVO> list = activitysDAO.select_ActivityMember_Two();
//		return list;
//	}
	
	public  List<ActivitysVO> findActivitysMem(String member_Id){
		List<ActivitysVO> list = activitysDAO.select_Activitys(member_Id);
		return list;	
	} 
	
	public List<ActivitysVO> findMyActivitys(String member_Id) {
		List<ActivitysVO> list = activitysDAO.select_MyActivitys(member_Id);
		return list;
	}
	
	public List<ActivitysVO> findFriendActivitys(String member_Id) {
		List<ActivitysVO> list = activitysDAO.select_FriendActivitys(member_Id);
		return list;
	}
	
	public List<ActivitysVO> getAll(){
		List<ActivitysVO> list = activitysDAO.getAll();
		for(ActivitysVO activitysVO:list){
			activitysVO.getMember_Id();
		}
		return list;
	}
	
	public List<ActivitysVO> getdownActivitys(){
		List<ActivitysVO> list = activitysDAO.getAll();
		for(ActivitysVO activitysVO:list){
//			activitysVO.getMember_Id();
//			System.out.println(activitysVO.getMember_Id());
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
			Timestamp activity_day = activitysVO.getActivity_Day();
//			System.out.println(activity_day);
//			String ts = sdf.format(activity_day);
			
			Date date = new Date();
			Timestamp sdf2 = new Timestamp(date.getTime());
//			System.out.println(sdf2);
			 int compareTo = activity_day.compareTo(sdf2); 
			 System.out.println(compareTo);
//			if(compareTo == -1){
//				System.out.println("更新揪團狀態");
//			}else(compareTo == 1){
//				System.out.println("不用動作");
//			}http://localhost:8080/CRFitness/CRFSERVICE/activitysController/downActivitys
			 
//			String dateString = sdf2.format(date);
//			System.out.println(sdf2);
//			if(activity_day.compareTo(sdf2))
			
			
//			Timestamp datetime = new Timestamp(System.currentTimeMillis());
			
		}
		return list;
	}
	
	public ActivitysVO addActivitys(
			String member_Id,
			String activity_Day,
			String activity_Class,
			String activity_Area,
			String activity_Info,
			String deadline,
			Integer people_Max)
	{
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
			activitysVO.setPeople_Max(people_Max);
			activitysVO.setActivity_Info(activity_Info);
			activitysVO.setDeadline(tsd);
			activitysVO.setStartDay(datetime);
			activitysVO.setPeople(0);
			activitysVO.setActivity_Status(1);
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
		System.out.println("activity_DayServer" + activity_Day);
		System.out.println("activity_Daydeadline" + deadline);	
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
		
	public void Insert_activitysImages(String Path,MultipartFile photo1){
		FileOutputStream fop = null;
		File file=null;
		byte[] photo=null;
		file = new File(Path + ".jpg");
		if(!file.exists()){
			file = new File(Path + ".gif");
		}
		if(!file.exists()){
			file = new File(Path + ".png");
		}
		try {
			photo=photo1.getBytes();
			file = new File(Path);		
			if (!file.exists()) {
				file.createNewFile();
			}	
			fop = new FileOutputStream(file);
			fop.write(photo);
			fop.flush();
			fop.close();		
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				fop.close();
			} catch (IOException e) {
			
				e.printStackTrace();
			}	
		}
	}

	public byte[] findActivitysPhoto(String activity_Id) {
		// TODO Auto-generated method stub
		return null;
	}
	
	//取得照片
	public byte[] ExitsCovertPhoto(String Path){
		File file=null;
		ByteArrayOutputStream baos = null;
		FileInputStream fis=null;
		byte[] photo=null;		
		file = new File(Path+".jpg");
		if(!file.exists()){
			file = new File(Path+".gif"); 
		}
		if(!file.exists()){
			file = new File(Path+".png");
		}
		try {	
			fis=new FileInputStream(file);
			baos = new ByteArrayOutputStream();
			int count = 0;
    		byte[] bytes = new byte[1024];
    		while ((count = fis.read(bytes)) != -1) {
    			baos.write(bytes, 0, count);
    		}
			baos.flush();
			photo = baos.toByteArray();
			baos.close();
			return photo;
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}finally{
			try {
				fis.close();
			} catch (IOException e) {	
				e.printStackTrace();
				return null;
			}
		}
	
	}
	
	
	public void Insert_Images(String Path,MultipartFile photo1){
		FileOutputStream fop = null;
		File file=null;
		byte[] photo=null;			      
		try {
			photo=photo1.getBytes();
			file = new File(Path);		
			if (!file.exists()) {
				file.createNewFile();
			}	
			fop = new FileOutputStream(file);
			fop.write(photo);
			fop.flush();
			fop.close();		
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				fop.close();
			} catch (IOException e) {
			
				e.printStackTrace();
			}	
		}
	}
	
	// back-end: change status
	public Integer changeStatus(String activity_Id, Integer activity_Status) {
		ActivitysVO activitysVO = activitysDAO.findByPrimaryKey(activity_Id);
		activitysVO.setActivity_Status(activity_Status);
		activitysVO = activitysDAO.update(activitysVO);
		// System.out.println(productDetailVO.getMember_Status());
		return activitysVO.getActivity_Status();
	}

}
