package com.CRFitness.PersonalJournal.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.core.MediaType;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.CRFitness.PersonalJournal.model.CommonJournalService;
import com.CRFitness.PersonalJournal.model.PersonalJournalVO;

@Controller
@RequestMapping("/commonJournalController")
public class CommonJournalController {
	@Resource(name="commonJournalService")
	private CommonJournalService  commonJournalService;
	
	@RequestMapping(method = RequestMethod.GET, value = "/commonJournalOne", produces = MediaType.APPLICATION_JSON)
	public @ResponseBody List<PersonalJournalVO> getAll_One() {
		return commonJournalService.ShowAllJournal_One();
	}
	@RequestMapping(method = RequestMethod.GET, value = "/commonJournalTwo", produces = MediaType.APPLICATION_JSON)
	public @ResponseBody List<PersonalJournalVO> getAll_Two() {
		return commonJournalService.ShowAllJournal_Two();
	}
	//CRFSERVICE/commonJournalController/photo/journal2004
	@RequestMapping(method = RequestMethod.GET, value = "/photo/{journal_Id}", produces = {
			"image/jpeg", "image/gif","image/png" })
	public @ResponseBody byte[] findMemberPhoto(
			HttpServletRequest request,
			@PathVariable String journal_Id)   {
		String realPath=request.getServletContext().getRealPath("/");
		String Path=realPath+"/images/Journal/"+journal_Id;
		return commonJournalService.ExitsCovertPhoto(Path);		
	}
	
}
