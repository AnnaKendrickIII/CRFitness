package com.CRFitness.Administrators.model;

import java.util.*;

import com.CRFitness.ActivityDetail.model.ActivityDetailVO;

public interface AdminsDAO_interface {
          public boolean insert(AdminsVO adminsVO);
          public AdminsVO update(AdminsVO adminsVO);
          public boolean delete(String administrator_Id);       
          public AdminsVO findByPrimaryKey(String administrator_Id);
          public List<AdminsVO> select_email (String e_mail);
          public List<AdminsVO> getAll();
}
