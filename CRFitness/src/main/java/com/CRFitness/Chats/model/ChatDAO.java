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
@Repository("chatDAODAO")
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
	public List<Object[]> select_Friends(String member_Id) {	
			Query query = this.getSession().createSQLQuery(
					"SELECT Members.Member_Id,Members.E_mail,Members.Nickname "
					+"FROM Members JOIN Friendships "
					+"ON Members.Member_Id=Friendships.Friend_Id "
					+"where Friendships.Member_Id='"+member_Id+"' and Friend_Status = 1")
					.addScalar("Member_Id",StringType.INSTANCE).addScalar("E_mail",StringType.INSTANCE)
					.addScalar("Nickname",StringType.INSTANCE);				
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

	
}
