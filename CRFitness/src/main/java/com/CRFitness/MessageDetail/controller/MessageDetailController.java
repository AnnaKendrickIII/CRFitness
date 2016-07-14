package com.CRFitness.MessageDetail.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.ws.rs.core.MediaType;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.CRFitness.MessageDetail.model.MessageDetailService;
import com.CRFitness.MessageDetail.model.MessageDetailVO;

@Controller
@RequestMapping("/messageDetailController")
public class MessageDetailController {

	@Resource(name = "messageDetailService")
	private MessageDetailService messageDetailService;

	@RequestMapping(method = RequestMethod.POST, value = "/addMessageDetail", produces = MediaType.APPLICATION_JSON)
	public @ResponseBody boolean insertMessageDetail(@RequestParam String journal_Id, @RequestParam String member_Id,
			@RequestParam String content) {
//		System.out.println("insertMessageDetail");
		return messageDetailService.insert(journal_Id, member_Id, content);

	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/getMessageDetail", produces = MediaType.APPLICATION_JSON)
	public @ResponseBody List<MessageDetailVO> getMessageDetail(@RequestParam String journal_Id) {
		return messageDetailService.get_JournalMessage(journal_Id);
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/getMessageDetailAll", produces = MediaType.APPLICATION_JSON)
	public @ResponseBody List<MessageDetailVO> getMessageDetailAll(@RequestParam String journal_Id) {
		return messageDetailService.get_JournalMessageAll(journal_Id);
	}
}
