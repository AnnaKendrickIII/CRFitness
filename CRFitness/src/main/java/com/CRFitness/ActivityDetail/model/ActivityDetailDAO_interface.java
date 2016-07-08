package com.CRFitness.ActivityDetail.model;

import java.util.*;


public interface ActivityDetailDAO_interface {
    public boolean insert(ActivityDetailVO activityDetailVO);
    public boolean update(ActivityDetailVO activityDetailVO);
    public boolean delete(String activity_Id,String member_id);       
    public ActivityDetailVO findByPrimaryKey(String activity_Id,String member_id);
    public List<ActivityDetailVO> getAll();

		
}
