package com.Websocket;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.CRFitness.Chats.model.ChatService;
import com.google.gson.Gson;

@Controller
public class WebsocketEndPoint extends TextWebSocketHandler   {
	
	private Map<String, WebSocketSession> clients = new ConcurrentHashMap<>();
	@Resource(name = "chatService")
	private ChatService chatService;
	
	@Override
	public void afterConnectionEstablished(WebSocketSession websession) throws Exception {
		
			clients.put((String)(websession.getAttributes().get("WEBSOCKET_USERNAME")),websession);
//			String userName = (String) websession.getAttributes().get("WEBSOCKET_USERNAME");
//			System.out.println(clients.get(((MemberVO)websession.getAttribute("LoginOK")).getMember_Id()));
//			if (userName != null) {
//				// 查詢未讀消息
//				int count = 5;
//				session.sendMessage(new TextMessage(count + ""));
//			}
	 }
	 

	
    public void handleTextMessage(WebSocketSession session, TextMessage message)
    {
    	String data = message.getPayload();
    	Gson g = new Gson();
        Map<String, Object> datas = g.fromJson(data, Map.class);
        String type = datas.get("type").toString();
        if(!clients.containsKey(datas.get("userID").toString()))
        {
            clients.put(datas.get("userID").toString(), session);
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
            clients.remove(datas.get("userID").toString());
        } else if("4".equals(type)){//加好友     
        	TextMessage tm = new TextMessage(g.toJson(datas)); 
        	addFriend(datas.get("userID").toString(),datas.get("friendId").toString(), 
        			datas.get("myName").toString(), tm);
        }else if("5".equals(type)){//接受加好友  
        	TextMessage tm = new TextMessage(g.toJson(datas)); 
        	acceptFriend(datas.get("userID").toString(),datas.get("friendId").toString(), 
        			datas.get("myName").toString(), tm);
        }
    }
    private void sendToAll(TextMessage tm)
    {
        try
        {
            for(WebSocketSession session : clients.values())
            {
                if(session.isOpen())
                {
                    session.sendMessage(tm);
                }
                else
                {
                    clients.remove(session.getId());
                }
            }
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        
    }
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
