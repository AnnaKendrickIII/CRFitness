package com.CRFitness.PersonalJournal.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.core.MediaType;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.CRFitness.PersonalJournal.model.CommonJournalService;
import com.CRFitness.PersonalJournal.model.PersonalJournalVO;

@Controller
@RequestMapping("/commonJournalControllerBE")
public class CommonJournalControllerBE {
	@Resource(name="commonJournalService")
	private CommonJournalService  commonJournalService;
	
	@RequestMapping(method = RequestMethod.GET, value = "/getAllFlagJournal", produces = MediaType.APPLICATION_JSON)
	public @ResponseBody List<PersonalJournalVO> getAllJournal() {
		return commonJournalService.Show_AllFlag_Journal();
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "updateFlagJournal", produces = MediaType.APPLICATION_JSON)
	public @ResponseBody boolean updateJournal(@RequestParam String journal_Id,
			@RequestParam Integer publicStatus){
		return commonJournalService.update_Flag_Journal(journal_Id, publicStatus);
	}
	
}
