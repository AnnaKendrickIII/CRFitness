package com.CRFitness.Laudation.model;



import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("laudationService")
public class LaudationService {
	

	@Resource(name="laudationDAO")
	private LaudationDAO_interface laudationDAO;

	public LaudationService() {		
	}
	
	public boolean laudationclick(String journal_Id,String lauded_Id){
		LaudationVO laudationVO = new LaudationVO();
		
		laudationVO.setJournal_Id(journal_Id);
		laudationVO.setLauded_Id(lauded_Id);
		
		laudationDAO.insert(laudationVO); 
		
		return false;
	}




}
