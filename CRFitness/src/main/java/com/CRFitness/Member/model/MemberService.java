package com.CRFitness.Member.model;



import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.sql.Timestamp;
import java.util.List;

import javax.annotation.Resource;



import org.springframework.stereotype.Service;
import org.springframework.util.Base64Utils;




@Service("memberService")
public class MemberService {

	@Resource(name = "memberDAO")
	private MemberDAO_interface memberDAO;


	public MemberService() {
	}

	// Fb登入判斷
	public MemberVO SignCheck(String nickname, String e_mail) {		
		MemberVO memberVO= new MemberVO();							
			if (memberDAO.select_email(e_mail).size() != 0) {
				memberVO=memberDAO.select_email(e_mail).get(0);
				memberDAO.update(memberVO);
				return memberVO;
			} else {		
				memberVO.setE_mail(e_mail);
				memberVO.setNickname(nickname);
			Timestamp datetime = new Timestamp(System.currentTimeMillis());
				memberVO.setRegisterdate(datetime);
				memberVO.setMember_Status("登錄中");
				memberDAO.insert(memberVO);
				return memberVO;			
			}			
	}
	
	//登入判斷
	public MemberVO login(String e_mail, String password) {
		List<MemberVO> list = memberDAO.select_email(e_mail);
		MemberVO memberVO = new MemberVO();
		for (MemberVO data : list) {
			memberVO = data;
		}
		if (memberVO != null) {
			if (password != null && password.length() != 0) {
				if (memberVO.getPassword().equals(password)) {
					return memberVO;
				}
			}
		}
		return null;
	}
	
	
	//註冊
	public MemberVO addMember(MemberVO memberVO) {
		Timestamp datetime = new Timestamp(System.currentTimeMillis());
		memberVO.setRegisterdate(datetime);
		memberVO.setMember_Status("登錄中");
		memberDAO.insert(memberVO);

		return memberVO;
	}
	//照片轉byte
	public byte[] CovertPhoto(InputStream is){	
		 ByteArrayOutputStream baos = null;       
	        try {
	        	baos = new ByteArrayOutputStream();
	        	int count = 0;
	    		byte[] bytes = new byte[1024];
	    		while ((count = is.read(bytes)) != -1) {
	    			baos.write(bytes, 0, count);
	    		}
				 byte[] photo = baos.toByteArray();  
				 return photo; 	
			} catch (IOException e) {		
				e.printStackTrace();
					return null;
			}  	       
	}
	
	public byte[] Insert_MemberImages(String Path,String photo1){
		File file=null;	
		FileOutputStream fop=null;
		try {
			file = new File(Path+".jpg");
			if(!file.exists()){
				file.createNewFile();
			}
			fop = new FileOutputStream(file);
			byte[] imageByte = Base64Utils.decodeFromString(photo1.substring(23));	
			fop.write(imageByte);
			return imageByte;
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}finally{
			if(fop!=null){
			try {				
				fop.close();
			} catch (IOException e) {	
				e.printStackTrace();
				
			}
			}
		}
	}
	
	
	//照片判斷哪種型態是否存在  轉byte
		public byte[] ExitsCovertPhoto(String Path){
			File file=null;
			ByteArrayOutputStream baos = null;
			FileInputStream fis=null;
			byte[] photo=null;		
			file = new File(Path+".jpg");
			if(!file.exists()){
				file = new File(Path+".png");
			}
			if(!file.exists()){
				file = new File(Path+".gif"); 
			}
			if(!file.exists()){
				return null;
			}
			try {	
				fis=new FileInputStream(file);
				baos = new ByteArrayOutputStream();
//				BufferedImage originalImage = ImageIO.read(file);
//				ImageIO.write(originalImage,MimeType, baos);
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
	//檢查e_mail
	public Boolean checkE_mail(String E_mail) {
		if ((memberDAO.select_email(E_mail)).size() != 0) {
			return true;
		} else
			return false;
	}
	//檢查密碼
	public Boolean checkPassword(String e_mail) {
		List<MemberVO> list = memberDAO.select_email(e_mail);
		MemberVO memberVO = new MemberVO();
		for (MemberVO data : list) {
			memberVO = data;
		}
		if (memberVO.getPassword() == null) {
			return true;
		}
		return false;
	}
	
	// back-end: 檢查是否為管理員？true：不是；false：是
	public Boolean checkAdmin(String e_mail) {
		List<MemberVO> list = memberDAO.select_email(e_mail);
		MemberVO memberVO = new MemberVO();
		for (MemberVO data : list) {
			memberVO = data;
		}	
		if (memberVO.getMember_Id().length() >=10 ) {
			return true;
		} else
			return false;
	}
	
	// back-end: 僅列出會員，沒有管理員
	public List<MemberVO> getAllMembers() {
		return memberDAO.getAllMembers();
	}
	
	public void updatemember(MemberVO memberVO) {
		memberDAO.update(memberVO);
	}

	public void deletemember(String member_Id) {
		memberDAO.delete(member_Id);
	}

	public MemberVO findMember(String member_Id) {
		return memberDAO.findByPrimaryKey(member_Id);
	}

	public List<MemberVO> getAll() {
		return memberDAO.getAll();
	}
	public void Third_insertimages(String Path,String photoUrl){
		FileOutputStream fop = null;
		File file=null;
		byte[] photo=null;			
		ByteArrayOutputStream baos = null; 
		InputStream is=null;
		try {
			baos = new ByteArrayOutputStream();
			file = new File(Path+".jpg");
			if(!file.exists()){
				file = new File(Path+".png");
			}
			if(!file.exists()){
				file = new File(Path+".gif"); 
			}
			if (!file.exists()) {
				file.createNewFile();
			}		
			if(!photoUrl.equals("")){	
//					URL url = new URL(photoUrl);
//					BufferedImage originalImage = ImageIO.read(url);
//					ImageIO.write(originalImage, "gif", baos);
//					baos.flush();
//					photo = baos.toByteArray();
				
//				BufferedImage originalImage = ImageIO.read(file);
//				ImageIO.write(originalImage,MimeType, baos);
				 is = new URL(photoUrl).openStream();
				 fop = new FileOutputStream(file);
				 baos = new ByteArrayOutputStream();
				int count = 0;
	    		byte[] bytes = new byte[1024];
	    		while ((count = is.read(bytes)) != -1) {
	    			baos.write(bytes, 0, count);
	    		}
				baos.flush();
				photo = baos.toByteArray();
				baos.close();		
			}
			baos.close();		
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
	public String changeStatus(String member_Id, String member_Status) {
		MemberVO memberVO = memberDAO.findByPrimaryKey(member_Id);
		memberVO.setMember_Status(member_Status);
		memberVO = memberDAO.update(memberVO);
		// System.out.println(productDetailVO.getMember_Status());
		return memberVO.getMember_Status();
	}

//	public static void main(String[] args) {
//		ApplicationContext context = new ClassPathXmlApplicationContext(
//				"test.config.xml");
//		SessionFactory sessionFactory = (SessionFactory) context
//				.getBean("sessionFactory");
//		sessionFactory.getCurrentSession().beginTransaction();
//
//		MemberService service = (MemberService) context
//				.getBean("memberService");
//		System.out.println(service.checkE_mail("ghjk@iii.com"));
//
//		sessionFactory.getCurrentSession().getTransaction().commit();
//		((ConfigurableApplicationContext) context).close();
//	}
}
