package com.CRFitness.Member.model;

import java.util.*;

import com.CRFitness.ActivityDetail.model.ActivityDetailVO;

public interface MemberDAO_interface {
          public boolean insert(MemberVO memberVO);
          public MemberVO update(MemberVO memberVO);
          public boolean delete(String member_Id);       
          public MemberVO findByPrimaryKey(String member_Id);
          public List<MemberVO> select_email (String e_mail);
          public List<MemberVO> getAll();
          public List<MemberVO> getAllMembers();
}
