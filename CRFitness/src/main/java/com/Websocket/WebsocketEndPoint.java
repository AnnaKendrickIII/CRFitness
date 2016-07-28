package com.Websocket;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.CRFitness.Member.model.MemberVO;
import com.google.gson.Gson;

public class WebsocketEndPoint extends TextWebSocketHandler   {
	
	private Map<String, WebSocketSession> clients = new ConcurrentHashMap<>();
//	private static final ArrayList<WebSocketSession> users = new ArrayList<>();
//	private static final Logger logger = Logger.getLogger(WebSocketHander.class);
	
//  public void afterConnectionEstablished(WebSocketSession session) throws Exception {
//		logger.debug("連接成功......");
//		users.add(session);
//		String userName = (String) session.getAttributes().get("WEBSOCKET_USERNAME");
//		if (userName != null) {
//			// 查詢未讀消息
//			int count = 5;
//			session.sendMessage(new TextMessage(count + ""));
//		}
//	}
	
//	@Override
//	public void afterConnectionEstablished(WebSocketSession websession) throws Exception {
//		 System.out.println(websession);
//			clients.put((String)(websession.getAttributes().get("WEBSOCKET_USERNAME")),websession);
////			String userName = (String) websession.getAttributes().get("WEBSOCKET_USERNAME");
////			System.out.println(clients.get(((MemberVO)websession.getAttribute("LoginOK")).getMember_Id()));
////			if (userName != null) {
////				// 查詢未讀消息
////				int count = 5;
////				session.sendMessage(new TextMessage(count + ""));
////			}
//	 }
	 

	
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
        
//        System.out.println(datas.get("userID").toString());
        if("1".equals(type))
        {   	
        	System.out.println("上線");
//            datas.put("pcount", clients.keySet().size() + "");
        }else if("2".equals(type)){
        	System.out.println(clients.get(datas.get("userID").toString()));
        	System.out.println(clients.get(datas.get("friendId").toString()));
        	 TextMessage tm = new TextMessage(g.toJson(datas));

        	 sendMessageToUser(datas.get("userID").toString(),datas.get("friendId").toString(),tm);
//             sendToAll(tm); 	
        }
        else if("3".equals(type))//關掉
        {
            clients.remove(datas.get("userID").toString());
        }
         
//        TextMessage tm = new TextMessage(g.toJson(datas));
//        sendToAll(tm);
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
//	  System.out.println(friend_Id);
//	  System.out.println(message);
//	  System.out.println(clients.get(friend_Id));
	  
//	  		for(WebSocketSession session : clients.values())
//	  			{
//	  			if (clients.get(friend_Id).equals(session)) {
				try {
					if (clients.get(member_Id).isOpen()) {
						clients.get(member_Id).sendMessage(message);
					}
					if (clients.get(friend_Id).isOpen()) {
						clients.get(friend_Id).sendMessage(message);
					}
				} catch (IOException e) {
					e.printStackTrace();
				}
//				break;
//	  			}
//			}	
	}
	
	
	
	
	
	

//    private Map<String, WebSocketSession> clients = new ConcurrentHashMap<>();
//    private static final Logger logger = Logger.getLogger(WebSocketHander.class);
//	private static final ArrayList<WebSocketSession> users = new ArrayList<>();
//
//    @Override
//    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
//    	System.out.println(message);
//        super.handleTextMessage(session, message);
//        if (!clients.containsKey(session.getId())) {
//            clients.put(session.getId(), session);
//        }
//        
//        String data = message.getPayload();
//        Gson g = new Gson();
//        Map<String, Object> datas = g.fromJson(data, Map.class);
//        String type = datas.get("type").toString();
//         
//        if("1".equals(type))
//        {
//            datas.put("pcount", clients.keySet().size() + "");  
//            TextMessage tm = new TextMessage(g.toJson(datas));       
//            sendMessageToUser(tm);
//        }
//        else if("2".equals(type))
//        {
//        	
//        	
////            clients.remove(session.getId());
////            datas.put("pcount", clients.keySet().size() + "");
//        }
//         
//       
//    }
//    
//    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
//		logger.debug("連接成功......");
//		users.add(session);
//		String userName = (String) session.getAttributes().get("WEBSOCKET_USERNAME");
//		if (userName != null) {
//			// 查詢未讀消息
//			int count = 5;
//			session.sendMessage(new TextMessage(count + ""));
//		}
//	}
//    private void sendMessageToUser(TextMessage tm)
//    {
//        try {
//            for(WebSocketSession user : users) {
//                if(user.isOpen()) {
//                	user.sendMessage(tm);
//                } else {
//                	users.remove(user.getId());
//                }
//            }
//        } catch(Exception e){
//            e.printStackTrace();
//        }
//    }
//    //悄悄話
//    public void sendMessageToUser(String userName, TextMessage message) {
//		for (WebSocketSession user : users) {
//			if (user.getAttributes().get("WEBSOCKET_USERNAME").equals(userName)) {
//				try {
//					if (user.isOpen()) {
//						user.sendMessage(message);
//					}
//				} catch (IOException e) {
//					e.printStackTrace();
//				}
//				break;
//			}
//		}
//	}
    
}
