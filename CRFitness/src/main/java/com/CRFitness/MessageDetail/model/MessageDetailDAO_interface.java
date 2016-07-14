package com.CRFitness.MessageDetail.model;

import java.util.List;

public interface MessageDetailDAO_interface {

	public boolean insert(MessageDetailVO messageDetailVO);

	public boolean update(MessageDetailVO messageDetailVO);

	public boolean delete(Integer message_Id);

	public MessageDetailVO findByPrimaryKey(String message_Id);

	public List<MessageDetailVO> getAll();

	public List<MessageDetailVO> select_JournalMessage(String journal_Id);

	public List<MessageDetailVO> select_JournalMessageAll(String journal_Id);

}