package com.CRFitness.Member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.CRFitness.Member.Interceptor.TargetURLAware;
import com.CRFitness.Member.model.MemberService;
import com.CRFitness.Member.model.MemberVO;
import com.opensymphony.xwork2.ActionSupport;

@Controller("memberAction")
@Scope("prototype")
public class MemberAction extends ActionSupport implements TargetURLAware{

	private static final long serialVersionUID = 1L;
	private MemberVO memberVO;
	private HttpServletRequest request;
	private HttpSession session;
	private Map<String, String> errorMessage;
	@Resource(name = "memberService")
	private MemberService memberService;
	private String password;
	private String mail;
	private String preURL;  
	@Override
	public String getPreURL() {  
	        return preURL;  
	}  	
	@Override
	public void setPreURL(String preURL) {	
		this.preURL=preURL;
	}
	public MemberAction() {
		request = ServletActionContext.getRequest();
		session = request.getSession();
		errorMessage = new HashMap<>();
		request.setAttribute("ErrorMessage", errorMessage);
	}
	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String registered() {

		if (memberVO.getNickname().length() == 0 || "".equals(memberVO.getNickname())) {
			errorMessage.put("nickname_error", "請輸入暱稱");
		}
		if (mail.length() == 0 || "".equals(mail)) {
			errorMessage.put("e_mail_error", "請輸入E-mail");
		} else if (memberService.checkE_mail(mail)) {
			errorMessage.put("e_mail_error", "E-mail已重複");
		}
		if (memberVO.getPassword().length() == 0 || "".equals(memberVO.getPassword())) {
			errorMessage.put("password_error", "請輸入密碼");
		}
		if (password.length() == 0 || "".equals(password)) {
			errorMessage.put("checkpassword_error", "請輸入密碼");
		}
		if (!(password.equals(memberVO.getPassword()))) {
			errorMessage.put("checkpassword_error", "密碼與第一次輸入不符");
		}

		if (errorMessage.size()==0) {
			memberVO.setE_mail(mail);
			memberService.addMember(memberVO);
			session.setAttribute("LoginOK", memberVO);
			return SUCCESS;
		} else {		
			errorMessage.put("registered_error", "註冊資料有誤");
			return INPUT;
		}
	}

	public String login() {	
		if (memberVO.getE_mail().length() == 0 || "".equals(memberVO.getE_mail())) {
			request.setAttribute("LoginErrorMessage", "帳號或密碼有誤請重新輸入");
			return INPUT;
			}
		if (memberVO.getPassword().length() == 0 || "".equals(memberVO.getPassword())) {
			request.setAttribute("LoginErrorMessage", "帳號或密碼有誤請重新輸入");
			return INPUT;
		}
		if (memberService.checkPassword(memberVO.getE_mail())) {
			request.setAttribute("LoginErrorMessage", "帳號或密碼有誤請重新輸入");
			return INPUT;
		}
		if (memberService.login(memberVO.getE_mail(), memberVO.getPassword()) != null) {
			(memberVO = memberService.login(memberVO.getE_mail(),
					memberVO.getPassword())).setPassword(null);
			session.setAttribute("LoginOK", memberVO);
			return SUCCESS;
		} else {
			request.setAttribute("LoginErrorMessage", "帳號或密碼有誤請重新輸入");
			return INPUT;
		}

	}

}
