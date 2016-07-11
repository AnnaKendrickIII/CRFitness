package com.CRFitness.PersonalJournal.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.ws.rs.core.MediaType;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.CRFitness.MessageDetail.model.MessageDetailVO;
import com.CRFitness.PersonalJournal.model.CommonJournalService;
import com.CRFitness.PersonalJournal.model.PersonalJournalVO;

@Controller
@RequestMapping("/commonJournalController")
public class CommonJournalController {
	@Resource(name="commonJournalService")
	private CommonJournalService  commonJournalService;
	
	@RequestMapping(method = RequestMethod.GET, value = "/commonJournal", produces = MediaType.APPLICATION_JSON)
	public @ResponseBody List<PersonalJournalVO> getAll() {
		return commonJournalService.ShowAllJournal();
	}
}
