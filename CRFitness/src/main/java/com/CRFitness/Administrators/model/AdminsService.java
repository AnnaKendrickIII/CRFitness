package com.CRFitness.Administrators.model;


import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Timestamp;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.util.Base64Utils;

import com.CRFitness.Member.model.MemberVO;

@Service("adminsService")
public class AdminsService {

	@Resource(name = "AdminsDAO")
	private AdminsDAO_interface adminsDAO;


	public AdminsService() {
	}
	
	//登入判斷
	public AdminsVO login(String e_mail, String password) {
		List<AdminsVO> list = adminsDAO.select_email(e_mail);
		AdminsVO adminsVO = new AdminsVO();
		for (AdminsVO data : list) {
			adminsVO = data;
		}
		if (adminsVO != null) {
			if (password != null && password.length() != 0) {
				if (adminsVO.getPassword().equals(password)) {
					return adminsVO;
				}
			}
		}
		return null;
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
	
	// 加入照片
	public byte[] Insert_MemberImages(String Path, String photo1){
		ByteArrayOutputStream baos = null;
		File file = null;	
		FileOutputStream fos = null;
		try {
			file = new File(Path+".jpg");
			if(!file.exists()){
				file.createNewFile();
			}
			fos = new FileOutputStream(file);
			byte[] imageByte = Base64Utils.decodeFromString(photo1.substring(23));	
			fos.write(imageByte);
			return imageByte;
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}finally{
			if(fos!=null){
			try {				
				fos.close();
			} catch (IOException e) {	
				e.printStackTrace();
				
			}
			}
		}
	}
	
	//照片判斷哪種型態是否存在  轉byte
		public byte[] showCoverPhoto(String Path){
			File file=null;
			ByteArrayOutputStream baos = null;
			FileInputStream fis = null;
			byte[] photo = null;		
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
				fis = new FileInputStream(file);
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
		if ((adminsDAO.select_email(E_mail)).size() != 0) {
			return true;
		} else
			return false;
	}
	
	//檢查密碼
	public Boolean checkPassword(String e_mail) {
		List<AdminsVO> list = adminsDAO.select_email(e_mail);
		AdminsVO adminsVO = new AdminsVO();
		for (AdminsVO data : list) {
			adminsVO = data;
		}
		if (adminsVO.getPassword() == null) {
			return true;
		}
		return false;
	}
	
	//註冊
	public AdminsVO addMember(AdminsVO adminsVO) {
		Timestamp datetime = new Timestamp(System.currentTimeMillis());
		adminsVO.setRegisterdate(datetime);
		adminsDAO.insert(adminsVO);
		return adminsVO;
	}
	
	public void updatemember(AdminsVO adminsVO) {
		adminsDAO.update(adminsVO);
	}

	public void deletemember(String administrator_Id) {
		adminsDAO.delete(administrator_Id);
	}

	public AdminsVO findMember(String administrator_Id) {
		return adminsDAO.findByPrimaryKey(administrator_Id);
	}

	public List<AdminsVO> getAll() {
		return adminsDAO.getAll();
	}
		
	// back-end: change status
	public String changeStatus(String administrator_Id, String administrator_Status) {
		AdminsVO adminsVO = adminsDAO.findByPrimaryKey(administrator_Id);
		adminsVO.setAdministrator_Status(administrator_Status);
		adminsVO = adminsDAO.update(adminsVO);
		// System.out.println(productDetailVO.getAdministrator_Status());
		return adminsVO.getAdministrator_Status();
	}

	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext(
				"test.config.xml");
		SessionFactory sessionFactory = (SessionFactory) context
				.getBean("sessionFactory");
		sessionFactory.getCurrentSession().beginTransaction();

		AdminsService service = (AdminsService) context
				.getBean("adminsService");
		System.out.println(service.checkE_mail("simpson@crf.admin.com"));

		sessionFactory.getCurrentSession().getTransaction().commit();
		((ConfigurableApplicationContext) context).close();
	}
	
}
