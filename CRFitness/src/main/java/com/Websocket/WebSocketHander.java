package com.Websocket;
import org.apache.log4j.Logger;
import org.springframework.web.socket.*;

import java.io.IOException;
import java.util.ArrayList;

public class WebSocketHander implements WebSocketHandler {
	
	private static final Logger logger = Logger.getLogger(WebSocketHander.class);

	private static final ArrayList<WebSocketSession> users = new ArrayList<>();

	// 初次鏈接成功執行
	@Override
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

	// 接受消息處理消息
	@Override
	public void handleMessage(WebSocketSession webSocketSession, WebSocketMessage<?> webSocketMessage)
	{
		
		
		System.out.println("2:  "+webSocketMessage.getPayload());
		sendMessageToUsers(new TextMessage(webSocketMessage.getPayload()+ ""));
	}

	@Override
	public void handleTransportError(WebSocketSession webSocketSession, Throwable throwable) throws Exception {
		if (webSocketSession.isOpen()) {
			webSocketSession.close();
		}
		logger.debug("鏈接出錯，關閉鏈接......");
		users.remove(webSocketSession);
	}

	@Override
	public void afterConnectionClosed(WebSocketSession webSocketSession, CloseStatus closeStatus) throws Exception {
		logger.debug("鏈接關閉......" + closeStatus.toString());
		users.remove(webSocketSession);
	}

	@Override
	public boolean supportsPartialMessages() {
		return false;
	}

	/**
	 * 给所有在線用戶發送消息
	 *
	 * @param message
	 */
	public void sendMessageToUsers(TextMessage message) {
		for (WebSocketSession user : users) {
			try {
				if (user.isOpen()) {
					System.out.println("1:  "+message);
					user.sendMessage(message);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * 给某個用戶發送消息
	 *
	 * @param userName
	 * @param message
	 */
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