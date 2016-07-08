package com.CRFitness.PersonalJournal.model;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

//健康日誌

@Service("commonJournalService")
public class CommonJournalService {

	@Resource(name = "personalJournalDAO")
	private PersonalJournalDAO_interface personalJournalDAO;

	public CommonJournalService() {

	}

	// 抓取publicStatus狀態
	public List<PersonalJournalVO> ShowAllJournal() {

		List<PersonalJournalVO> List = personalJournalDAO.select_publicStatus(1);
		List<PersonalJournalVO> openJournal = new ArrayList<PersonalJournalVO>();
		for (PersonalJournalVO data : List) {			
				openJournal.add(data);		
		}
		return openJournal;
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
