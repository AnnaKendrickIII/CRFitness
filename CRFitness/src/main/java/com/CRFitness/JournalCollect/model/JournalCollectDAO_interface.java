package com.CRFitness.JournalCollect.model;

import java.util.List;

public interface JournalCollectDAO_interface {

	public boolean insert(JournalCollectVO journalCollectVO);

	public boolean update(JournalCollectVO journalCollectVO);

	public boolean delete(String member_Id, String favorited_Journal);

	public JournalCollectVO findByPrimaryKey(String member_Id,
			String favorited_Journal);

	public List<JournalCollectVO> getAll();

}