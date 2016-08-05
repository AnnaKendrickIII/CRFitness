package com.Websocket;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

import com.CRFitness.Member.model.MemberVO;
//@Scope(value="websocket")
public class HandshakeInterceptor extends HttpSessionHandshakeInterceptor{
	// 初次握手訪問前
	@Override
	public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse serverHttpResponse,
			WebSocketHandler webSocketHandler, Map<String, Object> map) throws Exception {
		if (request instanceof ServletServerHttpRequest) {
			HttpServletRequest servletRequest = ((ServletServerHttpRequest) request).getServletRequest();
			MemberVO vo=null;
			if(servletRequest.getSession().getAttribute("LoginOK")!=null){
				vo=(MemberVO)servletRequest.getSession().getAttribute("LoginOK");
				map.put("WEBSOCKET_USERNAME", vo.getMember_Id());
			}
//			servletRequest.getSession().setAttribute("WEBSOCKET_USERNAME", vo.getMember_Id());
		}
		return true;
	}

	// 初次握手訪問後
	@Override
	public void afterHandshake(ServerHttpRequest serverHttpRequest, ServerHttpResponse serverHttpResponse,
			WebSocketHandler webSocketHandler, Exception e) {

	}	
}