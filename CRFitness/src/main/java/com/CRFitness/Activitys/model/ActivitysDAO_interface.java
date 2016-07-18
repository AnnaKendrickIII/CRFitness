package com.CRFitness.Activitys.model;

import java.util.*;


public interface ActivitysDAO_interface {

    public ActivitysVO insert(ActivitysVO activitysVO);
    public ActivitysVO update(ActivitysVO activitysVO);
    public boolean delete(String activity_Id);       
    public ActivitysVO findByPrimaryKey(String activity_Id);
//    public List<ActivitysVO> getAll(String member_Id);
    public List<ActivitysVO> getAll();
    public List<ActivitysVO> select_ActivityMember();
//    public List<ActivitysVO> select_ActivityMember_Two();
	public List<ActivitysVO> select_Activitys(String member_Id);
	public List<ActivitysVO> select_MyActivitys(String member_Id);
}
