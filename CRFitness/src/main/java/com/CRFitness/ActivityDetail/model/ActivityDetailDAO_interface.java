package com.CRFitness.ActivityDetail.model;

import java.util.*;


public interface ActivityDetailDAO_interface {
    public ActivityDetailVO insert(ActivityDetailVO activityDetailVO);
    public boolean update(ActivityDetailVO activityDetailVO);
    public boolean delete(String activity_Id,String member_Id);       
    public ActivityDetailVO findByPrimaryKey(String activity_Id,String member_Id);
    public List<ActivityDetailVO> getAll();

		
}
