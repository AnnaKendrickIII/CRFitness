package com.CRFitness.RoutePlan.model;

import java.util.List;

public interface RoutePlanDAO_interface {

	RoutePlanVO insert(RoutePlanVO routePlanVO);

	boolean delete(RoutePlanVO routePlanVO);

	List<RoutePlanVO> getMemberRoutePlanVOs(String member_Id);

}