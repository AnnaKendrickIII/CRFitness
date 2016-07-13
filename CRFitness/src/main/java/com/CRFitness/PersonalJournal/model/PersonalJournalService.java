package com.CRFitness.PersonalJournal.model;

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

import com.CRFitness.Member.model.MemberVO;

// 健康日誌

@Service("personalJournalService")
public class PersonalJournalService {

	@Resource(name = "personalJournalDAO")
	private PersonalJournalDAO_interface personalJournalDAO;

	public PersonalJournalService() {

	}
//--------------------------------------------------------------------------
	// 新增個人日誌
	public PersonalJournalVO insertPersonalJournal(
			 String member_Id,
			 MultipartFile archives,
			 String contents,
			 Timestamp publishTime,
			 Integer publicStatus
			){
		MemberVO memberVO =new MemberVO();
		memberVO.setMember_Id(member_Id);
		PersonalJournalVO personalJournalVO = new PersonalJournalVO();
		personalJournalVO.setMember_Id(member_Id);
		try {
			personalJournalVO.setArchives(archives.getBytes());
		} catch (IOException e) {
			e.printStackTrace();
		}
		personalJournalVO.setContents(contents);
		personalJournalVO.setPublishTime(publishTime);
		personalJournalVO.setPublicStatus(publicStatus);
		return personalJournalDAO.insert(personalJournalVO);
	}
	
	// 編輯個人日誌公開狀態
	public boolean updatePersonalJournal(
			String journal_Id,
			String contents,
			Integer publicStatus) {
		
//		MemberVO mbmberVO = new MemberVO();
//		mbmberVO.setMember_Id(member_Id);
//		PersonalJournalVO personalJournalVO = new PersonalJournalVO();
//		personalJournalVO.setJournal_Id(journal_Id);
//		personalJournalVO.setMemberVO(mbmberVO);
//		personalJournalVO.setContents(contents);
//		personalJournalVO.setPublicStatus(publicStatus);
		return personalJournalDAO.update(journal_Id,contents,publicStatus);
	}
	
	
	// 取得自己個人日誌
	public List<PersonalJournalVO> showMySelfJournal(String member_Id) {

		return personalJournalDAO.select_myJournal(member_Id);
	}
	
	// 取得好友日誌
	public List<PersonalJournalVO> showFriendJournal(String member_Id){

		return personalJournalDAO.select_friendJournal(member_Id);
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
