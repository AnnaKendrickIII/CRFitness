package com.CRFitness.PersonalJournal.model;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.CRFitness.Friendships.model.FriendshipsDAO_interface;
import com.CRFitness.Member.model.MemberVO;
import com.CRFitness.Orders.model.OrdersVO;

// 健康日誌

@Service("personalJournalService")
public class PersonalJournalService {

	@Resource(name = "personalJournalDAO")
	private PersonalJournalDAO_interface personalJournalDAO;
	@Resource(name = "friendshipsDAO")
	private FriendshipsDAO_interface friendshipsDAO;
	
	public PersonalJournalService() {

	}
//--------------------------------------------------------------------------
	// 新增個人日誌
	public PersonalJournalVO insertPersonalJournal(
			 String member_Id,
			 String contents,
			 Timestamp publishTime,
			 Integer publicStatus
			){
		MemberVO memberVO =new MemberVO();
		memberVO.setMember_Id(member_Id);
		PersonalJournalVO personalJournalVO = new PersonalJournalVO();
		personalJournalVO.setMember_Id(member_Id);
		personalJournalVO.setContents(contents);
		personalJournalVO.setPublishTime(publishTime);
		personalJournalVO.setPublicStatus(publicStatus);
		return personalJournalDAO.insert(personalJournalVO);
	}
	
	public void Insert_JournalImages(String Path,MultipartFile archives){
		FileOutputStream fop = null;
		File file=null;
		byte[] photo=null;			      
		try {
			photo=archives.getBytes();
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
	
	// 編輯個人日誌公開狀態
	public boolean updatePersonalJournal(
			String journal_Id,
			String contents,
			Integer publicStatus) {
		return personalJournalDAO.update(journal_Id,contents,publicStatus);
	}
	
	// 編輯個人日誌內容
	public boolean updatePersonalJournalcontents(String journal_Id, String contents) {
		return personalJournalDAO.updatePersonalJournalcontents(journal_Id, contents);
	}
		
	// 取得自己個人日誌
	public List<PersonalJournalVO> showMySelfJournal(String member_Id) {
		return personalJournalDAO.select_myJournal(member_Id);
	}
	
	// 取得好友日誌
	public List<PersonalJournalVO> showFriendJournal(String member_Id){
		return personalJournalDAO.select_friendJournal(member_Id);
	}
	
	// 取得其它日誌
	public List<PersonalJournalVO> showOtherJournal(String member_Id){
		return personalJournalDAO.select_otherJournal(member_Id);
	}
	
	// 取得所有健康日誌、個人日誌
	public List<PersonalJournalVO> showAllJournals() {
		return personalJournalDAO.getAll();
	}

//	 public static void main(String[] args) {
//	 ApplicationContext context = new
//	 ClassPathXmlApplicationContext("test.config.xml");
//	
//	 PersonalJournalService service = (PersonalJournalService)
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
