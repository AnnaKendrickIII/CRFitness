package com.CRFitness.RoutePlan.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service(value="routePlanService")
public class RoutePlanService {

	@Autowired
	private RoutePlanDAO_interface RoutePlanDAO;
	
	public RoutePlanService(){
		
	}

	public RoutePlanVO addRoutePlan(String member_Id, String startPoint,
			String endPoint, Double dist, Integer routePlanStatus){
		RoutePlanVO routePlanVO = new RoutePlanVO();
		routePlanVO.setMember_Id(member_Id);
		routePlanVO.setRoute_Plan_Date(new java.sql.Timestamp(System.currentTimeMillis()));
		routePlanVO.setStartPoint(startPoint);
		routePlanVO.setEndPoint(endPoint);
		routePlanVO.setMileage(dist);
		routePlanVO.setRoutePlanStatus(routePlanStatus);
		return RoutePlanDAO.insert(routePlanVO);
	}
	
	public List<RoutePlanVO> getMemberRoutePlanVOs(String member_Id){
		return RoutePlanDAO.getMemberRoutePlanVOs(member_Id);
	}
}
