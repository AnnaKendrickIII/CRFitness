package com.CRFitness.PersonalJournal.model;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

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
	public boolean insertJournal(PersonalJournalVO personalJournalVO){
		return personalJournalDAO.insert(personalJournalVO);
	}
	
	// 取得自己個人日誌，好友個人日誌
	public List<PersonalJournalVO> showJournal(MemberVO memberVO){
		return personalJournalDAO.select_journal(memberVO);
	}
//---------------------------------------------------------------------	
	// 抓取publicStatus狀態
	public List<PersonalJournalVO> ShowAllJournal() {
		List<PersonalJournalVO> List = personalJournalDAO.getAll();
		List<PersonalJournalVO> openJournal = new ArrayList<PersonalJournalVO>();
		for (PersonalJournalVO data : List) {
			if (data.getPublicStatus() == 1) {
				openJournal.add(data);
			}
		}
		return openJournal;
	}

	 public static void main(String[] args) {
	 ApplicationContext context = new
	 ClassPathXmlApplicationContext("test.config.xml");
	
	 PersonalJournalService service = (PersonalJournalService)
	 context.getBean("commonJournalService");
	
	 List<PersonalJournalVO> testdata = service.ShowAllJournal();
	
	 for(PersonalJournalVO go:testdata){
	 System.out.println(go.getJournal_Id()+" "+go.getContents());
	 }
	 ((ConfigurableApplicationContext) context).close();
	 }
}
