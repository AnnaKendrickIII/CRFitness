package com.CRFitness.Laudation.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.ws.rs.core.MediaType;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.CRFitness.Laudation.model.LaudationService;
import com.CRFitness.Laudation.model.LaudationVO;

@Controller
@RequestMapping("/laudationcontroller")
public class Laudationcontroller {

	@Resource(name="laudationService")
	private LaudationService  laudationService;
	
	@RequestMapping(method = RequestMethod.POST, value = "/laudationjournal", produces = MediaType.APPLICATION_JSON)
	public @ResponseBody boolean laudationclick(
			@RequestParam String journal_Id,
			@RequestParam String lauded_Id) {
		return laudationService.laudationclick(journal_Id, lauded_Id) ;
	}
	
	@RequestMapping(method = RequestMethod.POST , value = "/laudationjournalcancel", produces = MediaType.APPLICATION_JSON)
	public @ResponseBody boolean laudationclickagain(
			@RequestParam String journal_Id,
			@RequestParam String lauded_Id) {
		return laudationService.laudationclickagain(journal_Id, lauded_Id) ;
	}
	
	@RequestMapping(method = RequestMethod.GET , value = "/laudationjournalnumber", produces = MediaType.APPLICATION_JSON)
	public @ResponseBody  List<LaudationVO> judgmenthasjournal(
						@RequestParam String lauded_Id) {
		return laudationService.haslaudation(lauded_Id) ;
	}

	


}
