package com.CRFitness.PersonalJournal.model;


import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.annotation.Resource;




import javax.imageio.ImageIO;

import org.springframework.stereotype.Service;

//健康日誌

@Service("commonJournalService")
public class CommonJournalService {

	@Resource(name = "personalJournalDAO")
	private PersonalJournalDAO_interface personalJournalDAO;

	public CommonJournalService() {

	}

	// 抓取publicStatus狀態
	public List<PersonalJournalVO> ShowAllJournal_One() {
		return  personalJournalDAO.select_publicStatus_One();
	}
	public List<PersonalJournalVO> ShowAllJournal_Two() {
		return  personalJournalDAO.select_publicStatus_Two();
	}
	
	public List<PersonalJournalVO> Show_AllFlag_Journal() {
		return personalJournalDAO.get_Flag_All();
	}
	
	public boolean update_Flag_Journal(String journal_Id, Integer publicStatus) {
		return personalJournalDAO.update_Flag_Journal(journal_Id, publicStatus);
	}
	
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
//			BufferedImage originalImage = ImageIO.read(file);
//			ImageIO.write(originalImage,MimeType, baos);
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
	
//	 public static void main(String[] args) {
//	 ApplicationContext context = new
//	 ClassPathXmlApplicationContext("test.config.xml");
//	
//	 CommonJournalService service = (CommonJournalService)
//	 context.getBean("commonJournalService");
//	
//	 List<PersonalJournalVO> testdata = service.ShowAllJournal();
//	
//	 for(PersonalJournalVO go:testdata){
//	 System.out.println(go.getJournal_Id()+" "+go.getContents());
//	 }
//	 ((ConfigurableApplicationContext) context).close();

//	 }
	

}
