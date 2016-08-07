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
	private static final String SHOW_3_NOTICES = "SELECT Chat.*, Members.Nickname FROM Chat JOIN Members ON Chat.Member_Id = Members.Member_Id WHERE friend_Id = 'member1001' AND Chat_Detail IN (SELECT chat.Chat_Detail FROM chat WHERE friend_Id = 'member1001' AND (ChatStuts=5 OR ChatStuts=4) ORDER BY Chat_Id DESC OFFSET 0 ROWS FETCH NEXT 3 ROWS ONLY) ORDER BY Chat_Id DESC";
	
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
					+"and Friend_Id='"+friend_Id+"')) and ChatStuts=1  order by Chat_Id desc "
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
					+"and  Friend_Id='"+friend_Id+"')) and ChatStuts=0  order by Chat_Id desc ")
					.addEntity(ChatVO.class);				
		return (List<Object[]>) query.list();	
	}
	
	@Override
	public List<ChatVO> select_NoReade_FriendsforMe_message(String member_Id,String friend_Id) {	
			Query query = this.getSession().createSQLQuery(
					"SELECT  Chat.* "
					+"from Chat "	
					+"where (Member_Id='"+member_Id+"' "
					+"and  Friend_Id='"+friend_Id+"') "
					+" and ChatStuts=0 ")
					.addEntity(ChatVO.class);				
		return (List<ChatVO>) query.list();	
	}
	public List<ChatVO>  select_notifaction_NoRead_message (String member_Id,String friend_Id){
		Query query = this.getSession().createSQLQuery(
				"SELECT  Chat.* "
				+"from Chat "	
				+"where (Member_Id='"+member_Id+"' "
				+"and  Friend_Id='"+friend_Id+"') "
				+" and ChatStuts=5 ")
				.addEntity(ChatVO.class);				
	return (List<ChatVO>) query.list();	
	}
	@Override
	public List<Object[]> select_NoRead_Friends_Allmessage(String member_Id) {	
			Query query = this.getSession().createSQLQuery(
					"SELECT DISTINCT Chat.ChatStuts,Chat.Member_Id,Members.Nickname,Chat.Chat_Detail "
					+"from Chat join Members "
				    +"on Chat.Member_Id =Members.Member_Id "
					+"where  Friend_Id='"+member_Id+"' "
					+"and (ChatStuts=0 or ChatStuts=2 or ChatStuts=3 or ChatStuts=5) ")
					.addScalar("ChatStuts",StringType.INSTANCE)
					.addScalar("Member_Id",StringType.INSTANCE)
					.addScalar("Nickname",StringType.INSTANCE)
					.addScalar("Chat_Detail",StringType.INSTANCE);	
		return (List<Object[]>) query.list();	
	}
	
	@Override
	public List<ChatVO> select_AddFriends_ChatStuts(String member_Id) {	
			Query query = this.getSession().createSQLQuery(
					"SELECT  Chat.*  "
					+"from Chat "
					+"where  Friend_Id='"+member_Id+"' "
					+"and  ChatStuts=2")
					.addEntity(ChatVO.class);				
		return (List<ChatVO>) query.list();	
	}
	
	@Override//更新未讀為已讀
	public void updateNoReade_status(ChatVO chatVO) {
			this.getSession().saveOrUpdate(chatVO);	
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
			+chatVO.getFriend_Id()+"' and Friend_Id='"+chatVO.getMember_Id()+
			"' and (ChatStuts=2 or ChatStuts=3)");
			return query.executeUpdate();
		}
		return 0;
	}
	
	// Back-end: 選取最後3筆公告
	@Override
	public List<Object[]> show_Three_Notices() {	
		Query query = this.getSession().createSQLQuery(SHOW_3_NOTICES)
				.addEntity(ChatVO.class)
				.addScalar("Nickname",StringType.INSTANCE);
		return (List<Object[]>) query.list();	
	}
	
}
