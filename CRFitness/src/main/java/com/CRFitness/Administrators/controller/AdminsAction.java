package com.CRFitness.Administrators.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.CRFitness.Administrators.model.AdminsService;
import com.CRFitness.Administrators.model.AdminsVO;
import com.CRFitness.Member.Interceptor.TargetURLAware;
import com.opensymphony.xwork2.ActionSupport;

@Controller("adminsAction")
@Scope("prototype")
public class AdminsAction extends ActionSupport implements TargetURLAware{

	private static final long serialVersionUID = 1L;
	private AdminsVO adminsVO;
	private HttpServletRequest request;
	private HttpSession session;
	private Map<String, String> errorMessage;
	@Resource(name = "adminsService")
	private AdminsService adminsService;
	private String password;
	private String mail;
	private String preURL;  
	@Override
	public String getPreURL() {  
	        return preURL;  
	}  	
	@Override
	public void setPreURL(String preURL) {	
		this.preURL = preURL;
	}
	public AdminsAction() {
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

	public AdminsVO getAdminsVO() {
		return adminsVO;
	}

	public void setAdminsVO(AdminsVO adminsVO) {
		this.adminsVO = adminsVO;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String registered() {

		if (adminsVO.getName().length() == 0 || "".equals(adminsVO.getName())) {
			errorMessage.put("nickname_error", "請輸入暱稱");
		}
		if (mail.length() == 0 || "".equals(mail)) {
			errorMessage.put("e_mail_error", "請輸入E-mail");
		} else if (adminsService.checkE_mail(mail)) {
			errorMessage.put("e_mail_error", "E-mail已重複");
		}
		if (adminsVO.getPassword().length() == 0 || "".equals(adminsVO.getPassword())) {
			errorMessage.put("password_error", "請輸入密碼");
		}
		if (password.length() == 0 || "".equals(password)) {
			errorMessage.put("checkpassword_error", "請輸入密碼");
		}
		if (!(password.equals(adminsVO.getPassword()))) {
			errorMessage.put("checkpassword_error", "密碼與第一次輸入不符");
		}

		if (errorMessage.size()==0) {
			adminsVO.setE_mail(mail);
			adminsVO.setAdministrator_Status("登錄中");
			adminsService.addMember(adminsVO);
			session.setAttribute("LoginOK", adminsVO);
			return SUCCESS;
		} else {		
			errorMessage.put("registered_error", "註冊資料有誤");
			return INPUT;
		}
	}

	public String login() {	
		if (adminsVO.getE_mail().length() == 0 || "".equals(adminsVO.getE_mail())) {
			request.setAttribute("LoginErrorMessage", "帳號或密碼有誤請重新輸入");
			return INPUT;
			}
		if (adminsVO.getPassword().length() == 0 || "".equals(adminsVO.getPassword())) {
			request.setAttribute("LoginErrorMessage", "帳號或密碼有誤請重新輸入");
			return INPUT;
		}
		if (adminsService.checkPassword(adminsVO.getE_mail())) {
			request.setAttribute("LoginErrorMessage", "帳號或密碼有誤請重新輸入");
			return INPUT;
		}
		if (adminsService.login(adminsVO.getE_mail(), adminsVO.getPassword()) != null) {
			(adminsVO = adminsService.login(adminsVO.getE_mail(),
					adminsVO.getPassword())).setPassword(null);
			session.setAttribute("LoginOK", adminsVO);
			request.getServletContext().removeAttribute("GoUrl");
			return SUCCESS;
		} else {
			request.setAttribute("LoginErrorMessage", "帳號或密碼有誤請重新輸入");
			return INPUT;
		}

	}

}
