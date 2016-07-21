package com.CRFitness.PersonalJournal.model;

import java.util.List;

import com.CRFitness.Member.model.MemberVO;


public interface PersonalJournalDAO_interface {
	 public PersonalJournalVO insert(PersonalJournalVO personalJournalVO);
     public PersonalJournalVO update(PersonalJournalVO personalJournalVO);
     public boolean delete(String journal_Id);       
     public PersonalJournalVO findByPrimaryKey(String journal_Id);
//     public List<PersonalJournalVO> select_journal(MemberVO memberVO);
     public List<PersonalJournalVO> getAll();
	 public boolean update(String journal_Id, String contents, Integer publicStatus);
     public List<PersonalJournalVO> select_publicStatus_One();
     public List<PersonalJournalVO> select_publicStatus_Two();
     public List<PersonalJournalVO> select_myJournal(String member_Id);
     public List<PersonalJournalVO> select_friendJournal(String member_Id);
     public List<PersonalJournalVO> select_otherJournal(String member_Id);
     public List<PersonalJournalVO> get_Flag_All();
     public boolean update_Flag_Journal(String journal_Id, Integer publicStatus);
     
}
