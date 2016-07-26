package com.Websocket;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.apache.log4j.Logger;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class WebsocketEndPoint extends TextWebSocketHandler   {

    private Map<String, WebSocketSession> clients = new ConcurrentHashMap<>();
    private static final Logger logger = Logger.getLogger(WebSocketHander.class);
	private static final ArrayList<WebSocketSession> users = new ArrayList<>();

    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
    	System.out.println(message);
        super.handleTextMessage(session, message);
        if (!clients.containsKey(session.getId())) {
            clients.put(session.getId(), session);
        }
        TextMessage returnMessage = new TextMessage(message.getPayload());
        sendMessageToUser(returnMessage);
    }
    
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		logger.debug("連接成功......");
		users.add(session);
		String userName = (String) session.getAttributes().get("WEBSOCKET_USERNAME");
		if (userName != null) {
			// 查詢未讀消息
			int count = 5;
			session.sendMessage(new TextMessage(count + ""));
		}
	}
    private void sendMessageToUser(TextMessage tm)
    {
        try {
            for(WebSocketSession user : users) {
                if(user.isOpen()) {
                	user.sendMessage(tm);
                } else {
                	users.remove(user.getId());
                }
            }
        } catch(Exception e){
            e.printStackTrace();
        }
    }
    //悄悄話
    public void sendMessageToUser(String userName, TextMessage message) {
		for (WebSocketSession user : users) {
			if (user.getAttributes().get("WEBSOCKET_USERNAME").equals(userName)) {
				try {
					if (user.isOpen()) {
						user.sendMessage(message);
					}
				} catch (IOException e) {
					e.printStackTrace();
				}
				break;
			}
		}
	}
    
}
