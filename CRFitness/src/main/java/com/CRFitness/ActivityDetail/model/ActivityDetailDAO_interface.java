package com.CRFitness.ActivityDetail.model;

import java.util.*;

public interface ActivityDetailDAO_interface {
    public ActivityDetailVO insert(ActivityDetailVO activityDetailVO);
    public boolean update(ActivityDetailVO activityDetailVO);
    public boolean delete(String activity_Id,String member_Id);       
    public ActivityDetailVO findByPrimaryKey(ActivityDetailVO activityDetailVO);
    public List<ActivityDetailVO> getAll();
    public List<String> joinMembers(String activity_Id);
    public List<String> cleanMembers(String activity_Id);
}
