package com.CRFitness.Member.model;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.sql.Timestamp;
import java.util.List;

import javax.annotation.Resource;
import javax.imageio.ImageIO;

import org.springframework.stereotype.Service;

@Service("memberService")
public class MemberService {

	@Resource(name = "memberDAO")
	private MemberDAO_interface memberDAO;


	public MemberService() {
	}

	// Fb登入判斷
	public MemberVO SignCheck(String nickname, String e_mail, String photoUrl) {		
		ByteArrayOutputStream baos;
		MemberVO memberVO= new MemberVO();
		byte[] photo=null;
		try {
			baos = new ByteArrayOutputStream();
			if(!photoUrl.equals("")){
			URL url = new URL(photoUrl);
			BufferedImage originalImage = ImageIO.read(url);
			ImageIO.write(originalImage, "jpg", baos);
			baos.flush();
			photo = baos.toByteArray();
			}
			baos.close();								
			if (memberDAO.select_email(e_mail).size() != 0) {
				memberVO=memberDAO.select_email(e_mail).get(0);
				memberVO.setPhoto(photo);
				memberDAO.update(memberVO);
				return memberVO;
			} else {		
				memberVO.setE_mail(e_mail);
				memberVO.setNickname(nickname);
			Timestamp datetime = new Timestamp(System.currentTimeMillis());
				memberVO.setRegisterdate(datetime);
				memberVO.setPhoto(photo);
				memberDAO.insert(memberVO);
				return memberVO;			
			}		
		} catch (IOException e) {
			e.printStackTrace();
			return null;
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
		memberDAO.insert(memberVO);

		return memberVO;
	}
	//照片轉byte
	public byte[] CovertPhoto(InputStream is){		
		 ByteArrayOutputStream baos = null;       
	        try {
	        	baos = new ByteArrayOutputStream();
	        	int count = 0;
	    		byte[] bytes = new byte[8192];
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
	
	//找會員照片
	public byte[] findMemberPhoto(String member_Id) {		
			return memberDAO.findByPrimaryKey(member_Id).getPhoto();	
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
		}System.out.println();
		if (memberVO.getPassword() == null) {
			return true;
		}
		return false;
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
