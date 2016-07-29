package com.CRFitness.Chats.model;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.type.StringType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.CRFitness.Member.model.MemberVO;
import com.CRFitness.PersonalJournal.model.PersonalJournalVO;

@Transactional(transactionManager="transactionManager")
@Repository("chatDAO")
public class ChatDAO implements ChatDAO_interface {

	private static final String GET_ALL_STMT = "from FriendshipsVO";

	@Autowired
	private SessionFactory sessionFactory;
	
	public ChatDAO(){
		
	}
	
	public Session getSession(){
		return sessionFactory.getCurrentSession();
	}

	@Override
	public List<Object[]> select_Friends_message(String member_Id,String friend_Id) {	
			Query query = this.getSession().createSQLQuery(
					"SELECT  Chat.* "
					+"from Chat "	
					+"where ((Member_Id='"+friend_Id+"' "
					+"and Friend_Id='"+member_Id+"') "
					+"or (Member_Id='"+member_Id+"' "
					+"and Friend_Id='"+friend_Id+"')) and ChatStuts=1  order by ChatTime desc "
					+ "OFFSET 0 ROWS FETCH NEXT 3 ROWS ONLY")
					.addEntity(ChatVO.class);				
		return (List<Object[]>) query.list();	
	}
	
	
	@Override
	public List<Object[]> select_NoReade_Friends_message(String member_Id,String friend_Id) {	
			Query query = this.getSession().createSQLQuery(
					"SELECT  Chat.* "
					+"from Chat "	
					+"where ((Member_Id='"+friend_Id+"' "
					+"and  Friend_Id='"+member_Id+"') "
					+"or  (Member_Id='"+member_Id+"' "
					+"and  Friend_Id='"+friend_Id+"')) and ChatStuts=0  order by ChatTime desc ")
					.addEntity(ChatVO.class);				
		return (List<Object[]>) query.list();	
	}
	
	@Override
	public List<ChatVO> getAll() {
		Query query = this.getSession().createQuery(GET_ALL_STMT);
	return (List<ChatVO >) query.list();
	}
	@Override
	public ChatVO insert(ChatVO chatVO) {
		if (chatVO != null) {			
			this.getSession().saveOrUpdate(chatVO);
			return chatVO;
		}
		return null;
	}
	@Override
	public int updatefriendstatus(ChatVO chatVO) {
		if (chatVO != null) {
			Query query = this.getSession().createSQLQuery(
					"update Chat set ChatStuts="
			+chatVO.getChatStuts()+" where Member_Id='"
			+chatVO.getMember_Id()+"' and Friend_Id='"+chatVO.getFriend_Id()+
			"' and (ChatStuts=2 or ChatStuts=3)");
			return query.executeUpdate();
		}
		return 0;
	}
	
}
