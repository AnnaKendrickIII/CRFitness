package com.Websocket;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.annotation.Scope;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;
//@Scope(value="websocket")
//public class HandshakeInterceptor implements org.springframework.web.socket.server.HandshakeInterceptor{
public class HandshakeInterceptor extends HttpSessionHandshakeInterceptor{
	// 初次握手訪問前
	@Override
	public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse serverHttpResponse,
			WebSocketHandler webSocketHandler, Map<String, Object> map) throws Exception {
		if (request instanceof ServletServerHttpRequest) {
			HttpServletRequest servletRequest = ((ServletServerHttpRequest) request).getServletRequest();
			String userName = "xq";
//			MemberVO vo=null;
//			if(servletRequest.getSession().getAttribute("LoginOK")!=null){
//				vo=(MemberVO)servletRequest.getSession().getAttribute("LoginOK");
//			}
			// 使用userName區分WebSocketHandler，以便定向發送消息
			// String userName = (String)
			// session.getAttribute("WEBSOCKET_USERNAME");
			map.put("WEBSOCKET_USERNAME", userName);
			servletRequest.getSession().setAttribute("WEBSOCKET_USERNAME", userName);
		}
		return true;
	}

	// 初次握手訪問後
	@Override
	public void afterHandshake(ServerHttpRequest serverHttpRequest, ServerHttpResponse serverHttpResponse,
			WebSocketHandler webSocketHandler, Exception e) {

	}
	
//	 @Override
//	    public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler, Map<String, Object> attributes) throws Exception {
//	        return super.beforeHandshake(request, response, wsHandler, attributes);
//	    }
//
//	    @Override
//	    public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler, Exception ex) {
//	        super.afterHandshake(request, response, wsHandler, ex);
//	    }
}