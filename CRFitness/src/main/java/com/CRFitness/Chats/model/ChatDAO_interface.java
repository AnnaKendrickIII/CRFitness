package com.CRFitness.Chats.model;

import java.util.List;

import com.CRFitness.Member.model.MemberVO;

public interface ChatDAO_interface {

    public ChatVO insert(ChatVO chatVO);
    public List<Object[]> select_Friends(String member_Id);
    public List<ChatVO> getAll();

}
