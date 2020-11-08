package com.kh.hongk.chat.handler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;


//  2. TextWebSocketHandler을 상속받은 객체를 생성
public class EchoHandler extends TextWebSocketHandler { //  WebSocketHandler 인터페이스를 구현
	
	// 1대 1
	 Map<String, WebSocketSession> sessions  = new HashMap<String, WebSocketSession>();	 

	// 다중사용자 이용시 각 세션을 보관할 list
	private List<WebSocketSession> sessionList = new ArrayList<>();
	
	//실행 시 확인용 로그 생성
	private Logger logger = LoggerFactory.getLogger(EchoHandler.class);

	//사용자 연결이 되면 실행되는 메소드
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		// Map 사용
		sessions.put(session.getId(), session);
  		
		//연결이 되면 사용자를 sessionList에 추가해줌 (List사용)
//		sessionList.add(session);
		//연결된 사용자에게 부여된 세션 아이디 출력
		logger.info("{}연결됨", session.getId());
		
		System.out.println("채팅방 입장자 :"+session.getId() );
		// super.afterConnectionEstablished(session);
	}


	// list에 추가된 인원에게 보내진 메세지를 전송하는 메소드
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
        logger.info("{}로 부터 {} 받음", session.getId(), message.getPayload());

		
		//session.sendMessage(new TextMessage(session.getId() + "|" + message.getPayload()));
		System.out.println("session주소 : "+session.getRemoteAddress());
		System.out.println(session.getAttributes().get("userName"));
		
		// 다수 인원에게 메세지를 전송하는 기능구현
/*		for (WebSocketSession sss : sessionList) {
			sss.sendMessage(new TextMessage(session.getId() + " | " + message.getPayload()+"|"+session.getRemoteAddress()+"|"+session.getAttributes().get("userName")));
			// 1. 세션 아이디
			// 2. 전달 된 메세지
			// 3. ip
			// 4. 입장 시 입력할 userName
		}
*/		
		// super.handleTextMessage(session, message);
		Iterator<String> sessionIds = sessions.keySet().iterator();
        String sessionId="";
        while(sessionIds.hasNext()){
        	sessionId = sessionIds.next();
            sessions.get(sessionId).sendMessage(new TextMessage("echo : " +message.getPayload()));
            
            
        }
	}


	//연결이 끊어지면 실행되는 메소드
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		sessions.remove(session.getId());
		// list에서 session삭제
//		sessionList.remove(session);
//		logger.info("{}연결 끊김", session.getId());
		
//		for (WebSocketSession sss : sessionList) {
//			if(sss==session) continue;
//			sss.sendMessage(new TextMessage(session.getAttributes().get("userName")+"님이 퇴장하셨습니다."));
//		}
		
		//super.afterConnectionClosed(session, status);
	}

}
