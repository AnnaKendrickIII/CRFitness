package com.CRFitness.Laudation.model;

public class LaudationVO implements java.io.Serializable{			//日誌讚數
	
	
	private static final long serialVersionUID = 1L;
	private String journal_Id;		//日誌編號
	private String lauded_Id;		//按讚的會員編號
	
	public String getJournal_Id() {
		return journal_Id;
	}
	public void setJournal_Id(String journal_Id) {
		this.journal_Id = journal_Id;
	}
	public String getLauded_Id() {
		return lauded_Id;
	}
	public void setLauded_Id(String lauded_Id) {
		this.lauded_Id = lauded_Id;
	}
	
}
