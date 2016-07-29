package com.Websocket;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.annotation.Resource;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.CRFitness.Chats.model.ChatService;
import com.CRFitness.Member.model.MemberVO;
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
        
        if("2".equals(type)){
        	TextMessage tm = new TextMessage(g.toJson(datas));
        	 sendMessageToUser(datas.get("userID").toString(),datas.get("friendId").toString(),tm);

        }
        else if("3".equals(type))//關掉
        {
            clients.remove(datas.get("userID").toString());
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
  public void sendMessageToUser(String member_Id,String friend_Id, TextMessage message) {
				try {
					if(clients.containsKey(friend_Id)){
						if (clients.get(member_Id).isOpen() && clients.get(friend_Id).isOpen()) {
							clients.get(member_Id).sendMessage(message);
							clients.get(friend_Id).sendMessage(message);
						}
					}else{
						clients.get(member_Id).sendMessage(message);
					}			
				} catch (IOException e) {
					e.printStackTrace();
				}
	}
	
	
    
}
