package com.CRFitness.PersonalJournal.model;

import java.util.List;

<<<<<<< HEAD

public interface PersonalJournalDAO_interface {
	 public boolean insert(PersonalJournalVO personalJournalVO);
     public boolean update(PersonalJournalVO personalJournalVO);
     public boolean delete(String journal_Id);       
     public PersonalJournalVO findByPrimaryKey(String journal_Id);
     public List<PersonalJournalVO> select_journal(String member_Id);
=======
import com.CRFitness.Member.model.MemberVO;


public interface PersonalJournalDAO_interface {
	 public boolean insert(PersonalJournalVO personalJournalVO);
     public boolean update(PersonalJournalVO personalJournalVO);
     public boolean delete(String journal_Id);       
     public PersonalJournalVO findByPrimaryKey(String journal_Id);
     public List<PersonalJournalVO> select_journal(MemberVO memberVO);
>>>>>>> branch 'master' of https://github.com/AnnaKendrickIII/CRFitness.git
     public List<PersonalJournalVO> getAll();
     
     
}
