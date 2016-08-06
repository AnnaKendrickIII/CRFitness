package com.CRFitness.Chats.contrller;


import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.CRFitness.Chats.model.ChatService;
import com.CRFitness.Chats.model.ChatVO;

@Controller
@RequestMapping("/chatControllerBE")
public class ChatControllerBE<chatVO> {

	@Resource(name = "chatService")
	private ChatService chatService;
	
	// 查詢最後3則公告
	@RequestMapping(method = RequestMethod.GET, value ="/showThreeNotices", produces = "application/json; charset=utf-8")
	public @ResponseBody List<ChatVO> showThreeNotices(
			HttpServletRequest request){
			List<ChatVO> chatVO = chatService.select_Three_Notices();
			request.getSession().setAttribute("chatVO", chatVO);
		return chatVO;	
	}
}
