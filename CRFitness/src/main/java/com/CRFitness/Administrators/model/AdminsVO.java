package com.CRFitness.Administrators.model;
import java.sql.Timestamp;

public class AdminsVO implements java.io.Serializable{
	
	private static final long serialVersionUID = 1L;
	private String administrator_Id;
	private String e_mail;
	private String password;
	private String name;
	private Timestamp registerdate;
	private String administrator_Status;
	
	public String getAdministrator_Id() {
		return administrator_Id;
	}
	public void setAdministrator_Id(String administrator_Id) {
		this.administrator_Id = administrator_Id;
	}
	public String getE_mail() {
		return e_mail;
	}
	public void setE_mail(String e_mail) {
		this.e_mail = e_mail;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Timestamp getRegisterdate() {
		return registerdate;
	}
	public void setRegisterdate(Timestamp registerdate) {
		this.registerdate = registerdate;
	}
	public String getAdministrator_Status() {
		return administrator_Status;
	}
	public void setAdministrator_Status(String administrator_Status) {
		this.administrator_Status = administrator_Status;
	}

}
