package com.Websocket;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.CRFitness.Chats.model.ChatService;
import com.CRFitness.Friendships.model.FriendshipsService;
import com.CRFitness.Friendships.model.FriendshipsVO;
import com.google.gson.Gson;

@Controller
public class WebsocketEndPoint extends TextWebSocketHandler   {
	//會員們
	private Map<String, WebSocketSession> clients = new ConcurrentHashMap<>();
	//管理員們
	private Map<String, WebSocketSession> admins = new ConcurrentHashMap<>();
	@Resource(name = "chatService")
	private ChatService chatService;
	@Resource(name = "friendshipsService")
	private FriendshipsService friendshipsService;
	
	@Override
	public void afterConnectionEstablished(WebSocketSession websession) throws Exception {
		
//			clients.put((String)(websession.getAttributes().get("WEBSOCKET_USERNAME")),websession);
//			String userName = (String) websession.getAttributes().get("WEBSOCKET_USERNAME");
//			System.out.println(clients.get(((MemberVO)websession.getAttribute("LoginOK")).getMember_Id()));

	 }
	 

	@Override
    public void handleTextMessage(WebSocketSession session, TextMessage message)
    {
    	String data = message.getPayload();
    	
    	Gson g = new Gson();
    	
        Map<String, Object> datas = g.fromJson(data, Map.class);
        
        String type = datas.get("type").toString();
        //會員
        if(!clients.containsKey(datas.get("userID").toString())
        	&& !("".equals(datas.get("userID").toString())))
        {
            clients.put(datas.get("userID").toString(), session);
         
            if("1".equals(type)){
            	TextMessage tm = new TextMessage(g.toJson(datas)); 
            	 //會員登入後好友會出現誰上線
            	LoginSendMessage(datas.get("userID").toString(),tm);
            }
        }
        if(clients.get(datas.get("userID").toString())!=session 
            	&& !("".equals(datas.get("userID").toString())))
               {
                    clients.put(datas.get("userID").toString(), session);
               }
        //管理員
        if(!admins.containsKey(datas.get("adminID").toString())
        		&& !("".equals(datas.get("adminID").toString())))
        {
        	admins.put(datas.get("adminID").toString(), session); 
        }       	 	
        if(admins.get(datas.get("adminID").toString())!=session 
            	&& !("".equals(datas.get("adminID").toString())))
          {
        	admins.put(datas.get("adminID").toString(), session);
          }
        
        if("2".equals(type)){  //私訊
        	TextMessage tm = new TextMessage(g.toJson(datas));   	
        	long batch_date = Long.parseLong(datas.get("Time").toString()); 
            Date dt = new Date (batch_date); 
        	SimpleDateFormat sfd = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
        	Timestamp ts = Timestamp.valueOf(sfd.format(dt));
        	 sendMessageToUser(datas.get("userID").toString(),datas.get("friendId").toString(),datas.get("data").toString(),ts,tm);
        }
        else if("3".equals(type))//關掉，登出移除自己的WebSocketSession
        {          
            TextMessage tm = new TextMessage(g.toJson(datas)); 
            LogoutMessage(datas.get("userID").toString(),tm);
            
        } else if("4".equals(type)){//加好友     
        	TextMessage tm = new TextMessage(g.toJson(datas)); 
        	addFriend(datas.get("userID").toString(),datas.get("friendId").toString(), 
        			datas.get("myName").toString(), tm);
        	
        }else if("5".equals(type)){//接受加好友  
        	TextMessage tm = new TextMessage(g.toJson(datas)); 
        	acceptFriend(datas.get("userID").toString(),datas.get("friendId").toString(), 
        			datas.get("myName").toString(), tm);
        	
        }else if("6".equals(type)){//管理員登出
        	admins.remove(datas.get("adminID").toString());
        }else if("7".equals(type)){//管理員發公告
        	TextMessage tm = new TextMessage(g.toJson(datas));
        	sendToAll(datas.get("adminID").toString(),tm);
        }
    }
	//會員登入後好友會出現誰上線
    public void LoginSendMessage(String member_Id,TextMessage message) {
    	try {
    		List<FriendshipsVO> list = friendshipsService.select_MyFriends(member_Id);	
			for(FriendshipsVO friendshipsVO:list){
				String friend_Id=friendshipsVO.getFriend_Id();
			if(clients.containsKey(friend_Id)){
				if (clients.get(member_Id).isOpen() && clients.get(friend_Id).isOpen()) {
					clients.get(friend_Id).sendMessage(message);					
				}else{	
				
					}
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
    }
    //登出訊息
    public void LogoutMessage(String member_Id,TextMessage message) {
    	try {
    		List<FriendshipsVO> list = friendshipsService.select_MyFriends(member_Id);	
			for(FriendshipsVO friendshipsVO:list){
				String friend_Id=friendshipsVO.getFriend_Id();
			if(clients.containsKey(friend_Id)){
				if (clients.get(member_Id).isOpen() && clients.get(friend_Id).isOpen()) {
					clients.get(friend_Id).sendMessage(message);					
				}else{	
				
					}
				}
			}
			 clients.remove(member_Id);
		} catch (IOException e) {
			e.printStackTrace();
		}
    }
    //給所有會員發公告  7
    private void sendToAll(String adminID,TextMessage tm)
    {
        try{
        	if (clients.size() > 0) {
        		Set<String> set = clients.keySet();
        		Iterator<String> members = set.iterator();
        		while (members.hasNext()) {
        			if(clients.containsKey(members.next())){
						if (clients.get(members.next()).isOpen() && admins.get(adminID).isOpen()) {
												
						}else{
						
							
						}
        			
        			}
        		}
        	}
        }catch(Exception e){
        	
           e.printStackTrace();
       }
        
    }
    //私訊
  public void sendMessageToUser(String member_Id,String friend_Id,String chat_Detail,Timestamp time,TextMessage message) {
				try {
					if(clients.containsKey(friend_Id)){
						if (clients.get(member_Id).isOpen() && clients.get(friend_Id).isOpen()) {
							if(chatService.IsRead(member_Id,friend_Id,chat_Detail,time)!=null){
								clients.get(member_Id).sendMessage(message);
								clients.get(friend_Id).sendMessage(message);
							}							
						}else{
						
							clients.get(member_Id).sendMessage(message);				
							chatService.NoRead(member_Id, friend_Id, chat_Detail, time);
						}
					}else{
				
						clients.get(member_Id).sendMessage(message);				
						chatService.NoRead(member_Id, friend_Id, chat_Detail, time);
					}			
				} catch (IOException e) {
					e.printStackTrace();
				}
	}
	//發出加好友邀請
  public void addFriend(String member_Id,String friend_Id,String Who,TextMessage message) {
		try {
			if(clients.containsKey(friend_Id)){
				if (clients.get(member_Id).isOpen() && clients.get(friend_Id).isOpen()) {	
					clients.get(friend_Id).sendMessage(message);	
				}
			}else{
									
			}			
		} catch (IOException e) {
			e.printStackTrace();
	}
  }
  //接受加好友
  public void acceptFriend(String member_Id,String friend_Id,String Who,TextMessage message) {
		try {
			if(clients.containsKey(friend_Id)){
				if (clients.get(member_Id).isOpen() && clients.get(friend_Id).isOpen()) {	
					clients.get(friend_Id).sendMessage(message);
					clients.get(member_Id).sendMessage(message);	
				}
			}else{
									
			}			
		} catch (IOException e) {
			e.printStackTrace();
	}
  }
}
