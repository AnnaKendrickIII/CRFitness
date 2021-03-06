package com.CRFitness.PersonalJournal.controller;

import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.core.MediaType;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.CRFitness.Member.model.MemberVO;
import com.CRFitness.PersonalJournal.model.PersonalJournalService;
import com.CRFitness.PersonalJournal.model.PersonalJournalVO;

@Controller
@RequestMapping("/personalJournalController")
public class PersonalJournalController {
	@Resource(name="personalJournalService")
	private PersonalJournalService personalJournalService;
	
	@RequestMapping(method = RequestMethod.GET, value = "/showJournal", produces = MediaType.APPLICATION_JSON)
	public @ResponseBody List<PersonalJournalVO> getJournal(@RequestParam String member_Id,
			HttpServletResponse response,@RequestParam Integer visitorStatus , HttpSession session) {
		response.setHeader("Access-Control-Allow-Origin", "*");
		if(member_Id != null && member_Id.trim().length() != 0){
			MemberVO mySelf = (MemberVO) session.getAttribute("LoginOK");
			System.out.println(mySelf);
			if(mySelf.getMember_Id().equals(member_Id) && visitorStatus == 1){
				return personalJournalService.showMySelfJournal(member_Id);
			}
			else if(visitorStatus == 2){
				return personalJournalService.showFriendJournal(member_Id);
			}else{
				return personalJournalService.showOtherJournal(member_Id);
			}
		}else{
			return null;
		}
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/showJournal2", produces = "application/json;charset=UTF-8")
	public @ResponseBody List<PersonalJournalVO> getJournal2(@RequestParam String member_Id,
			HttpServletResponse response,@RequestParam Integer visitorStatus ) {
		response.setHeader("Access-Control-Allow-Origin", "*");
			return personalJournalService.showMySelfJournal(member_Id);
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/insertJournal", produces = MediaType.APPLICATION_JSON)
	public @ResponseBody PersonalJournalVO insertPersonalJournal(
			HttpServletRequest request,
			@RequestParam String member_Id,
			@RequestParam MultipartFile archives,
			@RequestParam String contents,
			@RequestParam Timestamp publishTime,
			@RequestParam Integer publicStatus
			) {
		try {
			//改編碼 iso-8859-1 -> utf-8
			contents = new String(contents.getBytes("iso-8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		PersonalJournalVO personalJournalVO=personalJournalService.insertPersonalJournal(member_Id,contents,publishTime,publicStatus);
		String realPath=request.getServletContext().getRealPath("/");
		String contentType;
		if(archives.getContentType().substring(6).equalsIgnoreCase("jpeg")){
			contentType=".jpg";
		}else{
			contentType="."+archives.getContentType().substring(6);
		}
		String Path=realPath+"/images/Journal/"+personalJournalVO.getJournal_Id()+contentType;	
		personalJournalService.Insert_JournalImages(Path,archives);
		return personalJournalVO;
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/updateJournal", produces = MediaType.APPLICATION_JSON)
	public @ResponseBody boolean updatePersonalJournal(
			@RequestParam String journal_Id,
			@RequestParam String member_Id,
			@RequestParam String contents,
			@RequestParam Integer publicStatus,
			HttpSession session
			){
		MemberVO mySelf = (MemberVO) session.getAttribute("LoginOK");
		if(mySelf.getMember_Id().equals(member_Id))
			return personalJournalService.updatePersonalJournal(journal_Id, contents, publicStatus);
		else
			return false;
	}

	@RequestMapping(method = RequestMethod.POST, value = "/updateJournalcontents", produces = MediaType.APPLICATION_JSON)
	public @ResponseBody boolean updatePersonalJournal(
			@RequestParam String journal_Id,
			@RequestParam String member_Id,
			@RequestParam String contents,
			HttpSession session
			){
		MemberVO mySelf = (MemberVO) session.getAttribute("LoginOK");
		if(mySelf.getMember_Id().equals(member_Id))
			return personalJournalService.updatePersonalJournalcontents(journal_Id, contents);
		else
			return false;
	}
}

