package com.CRFitness.PersonalJournal.model;

import java.util.List;

import com.CRFitness.Member.model.MemberVO;


public interface PersonalJournalDAO_interface {
	 public PersonalJournalVO insert(PersonalJournalVO personalJournalVO);
     public boolean update(PersonalJournalVO personalJournalVO);
     public boolean delete(String journal_Id);       
     public PersonalJournalVO findByPrimaryKey(String journal_Id);
     public List<PersonalJournalVO> select_journal(MemberVO memberVO);
     public List<PersonalJournalVO> getAll();
     
     
}
