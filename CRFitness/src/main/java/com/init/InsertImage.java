package com.init;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.CRFitness.Member.model.MemberDAO;
import com.CRFitness.Member.model.MemberDAO_interface;
import com.CRFitness.Member.model.MemberVO;

public class InsertImage {

	public static void main(String[] args) throws IOException {
		ApplicationContext context = new ClassPathXmlApplicationContext(
				"test.config.xml");
		MemberDAO_interface memberDAO = (MemberDAO_interface) context.getBean("memberDAO");
		//memberDAO.getSessionFactory().getCurrentSession().beginTransaction();
		MemberVO memberVO = new MemberVO();
		memberVO=memberDAO.findByPrimaryKey("member1001");
		BufferedImage originalImage = ImageIO.read(new File(
				"src/main/webapp/images/p1.jpg"));
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		ImageIO.write(originalImage, "jpg", baos);
		baos.flush();
		byte[] photo = baos.toByteArray();
		baos.close();
		memberVO.setPhoto(photo);
		memberDAO.update(memberVO);

		memberVO=memberDAO.findByPrimaryKey("member1002");
		BufferedImage originalImage2 = ImageIO.read(new File(
				"src/main/webapp/images/p2.jpg"));
		ByteArrayOutputStream baos2 = new ByteArrayOutputStream();
		ImageIO.write(originalImage2, "jpg", baos2);
		baos2.flush();
		byte[] photo2 = baos2.toByteArray();
		baos2.close();
		memberVO.setPhoto(photo2);
		memberDAO.update(memberVO);
		
		memberVO=memberDAO.findByPrimaryKey("member1003");
		BufferedImage originalImage3 = ImageIO.read(new File(
				"src/main/webapp/images/p3.jpg"));
		ByteArrayOutputStream baos3 = new ByteArrayOutputStream();
		ImageIO.write(originalImage3, "jpg", baos3);
		baos3.flush();
		byte[] photo3 = baos3.toByteArray();
		baos3.close();
		memberVO.setPhoto(photo3);
		memberDAO.update(memberVO);
		
		
		memberVO=memberDAO.findByPrimaryKey("member1004");
		BufferedImage originalImage4= ImageIO.read(new File(
				"src/main/webapp/images/p4.jpg"));
		ByteArrayOutputStream baos4 = new ByteArrayOutputStream();
		ImageIO.write(originalImage4, "jpg", baos4);
		baos4.flush();
		byte[] photo4 = baos4.toByteArray();
		baos4.close();
		memberVO.setPhoto(photo4);
		memberDAO.update(memberVO);
		
		memberVO=memberDAO.findByPrimaryKey("member1005");
		BufferedImage originalImage5= ImageIO.read(new File(
				"src/main/webapp/images/p5.jpg"));
		ByteArrayOutputStream baos5 = new ByteArrayOutputStream();
		ImageIO.write(originalImage5, "jpg", baos5);
		baos5.flush();
		byte[] photo5= baos5.toByteArray();
		baos5.close();
		memberVO.setPhoto(photo5);
		memberDAO.update(memberVO);
		
		
		memberVO=memberDAO.findByPrimaryKey("member1006");
		BufferedImage originalImage6= ImageIO.read(new File(
				"src/main/webapp/images/p6.jpg"));
		ByteArrayOutputStream baos6 = new ByteArrayOutputStream();
		ImageIO.write(originalImage6, "jpg", baos6);
		baos6.flush();
		byte[] photo6= baos6.toByteArray();
		baos6.close();
		memberVO.setPhoto(photo6);
		memberDAO.update(memberVO);
		
		memberVO=memberDAO.findByPrimaryKey("member1007");
		BufferedImage originalImage7= ImageIO.read(new File(
				"src/main/webapp/images/p7.jpg"));
		ByteArrayOutputStream baos7 = new ByteArrayOutputStream();
		ImageIO.write(originalImage7, "jpg", baos7);
		baos7.flush();
		byte[] photo7= baos7.toByteArray();
		baos7.close();
		memberVO.setPhoto(photo7);
		memberDAO.update(memberVO);
		
		memberVO=memberDAO.findByPrimaryKey("member1008");
		BufferedImage originalImage8= ImageIO.read(new File(
				"src/main/webapp/images/p8.jpg"));
		ByteArrayOutputStream baos8 = new ByteArrayOutputStream();
		ImageIO.write(originalImage8, "jpg", baos8);
		baos8.flush();
		byte[] photo8= baos8.toByteArray();
		baos8.close();
		memberVO.setPhoto(photo8);
		memberDAO.update(memberVO);
		
		memberVO=memberDAO.findByPrimaryKey("member1009");
		BufferedImage originalImage9= ImageIO.read(new File(
				"src/main/webapp/images/p9.jpg"));
		ByteArrayOutputStream baos9 = new ByteArrayOutputStream();
		ImageIO.write(originalImage9, "jpg", baos9);
		baos9.flush();
		byte[] photo9= baos9.toByteArray();
		baos9.close();
		memberVO.setPhoto(photo9);
		memberDAO.update(memberVO);
		
		memberVO=memberDAO.findByPrimaryKey("member1010");
		BufferedImage originalImage10= ImageIO.read(new File(
				"src/main/webapp/images/p10.jpg"));
		ByteArrayOutputStream baos10 = new ByteArrayOutputStream();
		ImageIO.write(originalImage10, "jpg", baos10);
		baos10.flush();
		byte[] photo10= baos10.toByteArray();
		baos10.close();
		memberVO.setPhoto(photo10);
		memberDAO.update(memberVO);
		
		memberVO=memberDAO.findByPrimaryKey("member1011");
		BufferedImage originalImage11= ImageIO.read(new File(
				"src/main/webapp/images/p11.jpg"));
		ByteArrayOutputStream baos11 = new ByteArrayOutputStream();
		ImageIO.write(originalImage11, "jpg", baos11);
		baos11.flush();
		byte[] photo11= baos11.toByteArray();
		baos11.close();
		memberVO.setPhoto(photo11);
		memberDAO.update(memberVO);
		
		
		memberVO=memberDAO.findByPrimaryKey("member1012");
		BufferedImage originalImage12= ImageIO.read(new File(
				"src/main/webapp/images/p12.jpg"));
		ByteArrayOutputStream baos12 = new ByteArrayOutputStream();
		ImageIO.write(originalImage12, "jpg", baos12);
		baos12.flush();
		byte[] photo12= baos12.toByteArray();
		baos12.close();
		memberVO.setPhoto(photo12);
		memberDAO.update(memberVO);
		
		memberVO=memberDAO.findByPrimaryKey("member1013");
		BufferedImage originalImage13= ImageIO.read(new File(
				"src/main/webapp/images/p13.jpg"));
		ByteArrayOutputStream baos13 = new ByteArrayOutputStream();
		ImageIO.write(originalImage13, "jpg", baos13);
		baos13.flush();
		byte[] photo13= baos13.toByteArray();
		baos13.close();
		memberVO.setPhoto(photo13);
		memberDAO.update(memberVO);
		
		memberVO=memberDAO.findByPrimaryKey("member1014");
		BufferedImage originalImage14= ImageIO.read(new File(
				"src/main/webapp/images/p14.jpg"));
		ByteArrayOutputStream baos14 = new ByteArrayOutputStream();
		ImageIO.write(originalImage14, "jpg", baos14);
		baos14.flush();
		byte[] photo14= baos14.toByteArray();
		baos14.close();
		memberVO.setPhoto(photo14);
		memberDAO.update(memberVO);

		memberVO=memberDAO.findByPrimaryKey("member1015");
		BufferedImage originalImage15= ImageIO.read(new File(
				"src/main/webapp/images/p15.jpg"));
		ByteArrayOutputStream baos15 = new ByteArrayOutputStream();
		ImageIO.write(originalImage15, "jpg", baos15);
		baos15.flush();
		byte[] photo15= baos15.toByteArray();
		baos15.close();
		memberVO.setPhoto(photo15);
		memberDAO.update(memberVO);
		
		memberVO=memberDAO.findByPrimaryKey("member1016");
		BufferedImage originalImage16= ImageIO.read(new File(
				"src/main/webapp/images/p16.jpg"));
		ByteArrayOutputStream baos16 = new ByteArrayOutputStream();
		ImageIO.write(originalImage16, "jpg", baos16);
		baos16.flush();
		byte[] photo16= baos16.toByteArray();
		baos16.close();
		memberVO.setPhoto(photo16);
		memberDAO.update(memberVO);
		
		memberVO=memberDAO.findByPrimaryKey("member1017");
		BufferedImage originalImage17= ImageIO.read(new File(
				"src/main/webapp/images/p17.jpg"));
		ByteArrayOutputStream baos17 = new ByteArrayOutputStream();
		ImageIO.write(originalImage17, "jpg", baos17);
		baos17.flush();
		byte[] photo17= baos17.toByteArray();
		baos17.close();
		memberVO.setPhoto(photo17);
		memberDAO.update(memberVO);
		//memberDAO.getSessionFactory().getCurrentSession().getTransaction()
				//.commit();
		((ConfigurableApplicationContext) context).close();
	}

}
