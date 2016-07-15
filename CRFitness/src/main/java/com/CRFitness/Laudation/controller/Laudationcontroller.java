package com.CRFitness.Laudation.controller;

import javax.annotation.Resource;
import javax.ws.rs.core.MediaType;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.CRFitness.Laudation.model.LaudationService;

@Controller
@RequestMapping("/laudationController")
public class Laudationcontroller {

	@Resource(name="laudationService")
	private LaudationService  laudationService;
	
	@RequestMapping(method = RequestMethod.POST, value = "/laudationjournal", produces = MediaType.APPLICATION_JSON)
	public @ResponseBody boolean laudationclick(
			@RequestParam String journal_Id,
			@RequestParam String lauded_Id) {
		return laudationService.laudationclick(journal_Id, lauded_Id) ;
	}

}
