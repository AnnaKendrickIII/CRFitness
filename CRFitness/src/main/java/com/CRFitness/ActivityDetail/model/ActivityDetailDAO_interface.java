package com.CRFitness.ActivityDetail.model;

import java.util.*;

import com.CRFitness.Activitys.model.ActivitysVO;


public interface ActivityDetailDAO_interface {
    public ActivityDetailVO insert(ActivityDetailVO activityDetailVO);
    public boolean update(ActivityDetailVO activityDetailVO);
    public boolean delete(ActivityDetailVO activityDetailVO);       
    public ActivityDetailVO findByPrimaryKey(ActivityDetailVO activityDetailVO);
    public List<ActivityDetailVO> getAll();
    public List<String> joinMembers(String activity_Id);
    public List<String> cleanMembers(String activity_Id);
}
