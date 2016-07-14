package com.CRFitness.MessageDetail.model;

import java.sql.Timestamp;
import java.util.List;

import javax.annotation.Resource;
import javax.annotation.Resources;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

@Service(value="messageDetailService")
public class MessageDetailService {

	@Resource(name="messageDetailDAO")
	private MessageDetailDAO_interface messageDetailDAO;
	
	public MessageDetailService(){
		
	}
	
	public boolean insert(String journal_Id, String member_Id, String content){
		MessageDetailVO messageDetailVO = new MessageDetailVO();
		messageDetailVO.setJournal_Id(journal_Id);
		messageDetailVO.setMember_Id(member_Id);
		messageDetailVO.setContent(content);
		messageDetailVO.setMessageTime(new Timestamp(System.currentTimeMillis()));
		
		return messageDetailDAO.insert(messageDetailVO);
	}
	
	public List<MessageDetailVO> get_JournalMessage(String journal_Id){
		return messageDetailDAO.select_JournalMessage(journal_Id);
	}
	
	public List<MessageDetailVO> get_JournalMessageAll(String journal_Id){
		return messageDetailDAO.select_JournalMessageAll(journal_Id);
	}
	
}
