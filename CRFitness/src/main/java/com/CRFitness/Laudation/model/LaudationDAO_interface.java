package com.CRFitness.Laudation.model;

import java.util.List;

public interface LaudationDAO_interface {

	public  boolean insert(LaudationVO laudationVO);

	public  boolean update(LaudationVO laudationVO);

	public  boolean delete(String journal_Id, String lauded_Id);
	
	public  LaudationVO findByPrimaryKey(String journal_Id,String lauded_Id);
	
	public  List<LaudationVO> getAll();

}