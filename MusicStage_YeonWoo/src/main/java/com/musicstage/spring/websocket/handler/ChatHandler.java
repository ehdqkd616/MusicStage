package com.musicstage.spring.websocket.handler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.musicstage.spring.chatting.model.vo.Message;

@RequestMapping("/chat")
public class ChatHandler extends TextWebSocketHandler{	
	
    // 세션 로그
    private static Logger logger = LoggerFactory.getLogger(ChatHandler.class);
    
	//	HashMap<String, WebSocketSession> sessionMap = new HashMap<>(); // 웹소켓 세션을 담아둘 맵
	//  (<"bang_id", 방ID>, <"session", 세션>) - (<"bang_id", 방ID>, <"session", 세션>) - (<"bang_id", 방ID>, <"session", 세션>) 형태 
	private List<Map<String, Object>> sessionList = new ArrayList<Map<String, Object>>(); // 웹소켓 세션을 담아둘 리스트 --- roomListSessions 	

	// 채팅방에 있는 모든 세션들
//	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>(); 
    
    @Override
 	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
 		super.afterConnectionEstablished(session);
 	}
    
    // 클라이언트가 웹소켓 서버로 메시지를 전송했을 때 실행
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
    	
    	super.handleTextMessage(session, message);
    	
    	logger.info("{}로 부터 {} 받음", session.getId(), message.getPayload());
    	
		// TextMessage message -> message 값만 추출
		String msg = message.getPayload();
		JSONParser parser = new JSONParser();
		JSONObject obj = (JSONObject)parser.parse(msg);
		
		String messageType = (String) obj.get("messageType");
		String message_content = (String) obj.get("message_content"); // 페이지에서 보낸 message_content
		String message_sender = (String) obj.get("message_sender"); // 페이지에서 보낸 message_sender (loginUser.userId)
		String message_sender_nickName = (String) obj.get("message_sender_nickName"); // 페이지에서 보낸 message_sender (loginUser.nickName)
		String receiver = (String) obj.get("partnerUserId"); // 페이지에서 보낸 partnerUserId
		int chatRoom_id = Integer.parseInt((String) obj.get("chatRoom_id")); // 페이지에서 보낸 chatRoom_id
		
    	Message messageVO = new Message(); 
    	messageVO.setChatRoom_id(chatRoom_id); 
    	messageVO.setMessage_content(message_content); 
    	messageVO.setMessage_sender(message_sender); 
    	messageVO.setMessage_sender_nickName(message_sender_nickName); 
		messageVO.setMessageType(messageType);
    	
		switch(messageVO.getMessageType()) {
		
		// CLIENT 입장
		case "Enter":
			
			System.out.println("입장 시작! ");
			
			// 세션 리스트에 저장
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("chatRoom_id", chatRoom_id);
			map.put("session", session);
			sessionList.add(map);
			
			// 같은 채팅방에 입장 메세지 전송
			for(int i = 0; i < sessionList.size(); i++) {
				Map<String, Object> mapSessionList = sessionList.get(i);
				int room_id = (int) mapSessionList.get("chatRoom_id");
				WebSocketSession sess = (WebSocketSession) mapSessionList.get("session");
				
				// protocal : messageType, chatRoom_id, message_content, message_sender
				if(room_id == chatRoom_id) {
					String allMessage = "Enter,"+room_id+","+"("+session.getId() +")"+"님이 입장했습니다."+","+message_sender;
					sess.sendMessage(new TextMessage(allMessage));	
				}
			}
			break;
			
		// CLIENT 메세지
		case "Chat":
			// 같은 채팅방에 메세지 전송
			
			System.out.println("메세지 보내기! ");
			
			
			for (int i = 0; i < sessionList.size(); i++) {
				Map<String, Object> mapSessionList = sessionList.get(i);
				int room_id = (int) mapSessionList.get("chatRoom_id");
				WebSocketSession sess = (WebSocketSession) mapSessionList.get("session");
				
				// protocal : messageType, chatRoom_id, message_content, message_sender
				if(room_id == chatRoom_id) {
					String allMessage = "Chat,"+room_id+","+message_content+","+message_sender;
					sess.sendMessage(new TextMessage(allMessage));
				}
			}
			break;	
		}
	
	}
				

	//클라이언트 연결을 끊었을 때 실행
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
    	
    	super.afterConnectionClosed(session, status);
    	
    	logger.info("{} 연결 끊김.", session.getId());

		int now_chatRoom_id = 0;
		
		System.out.println("퇴장하기!! ");
		
		// 사용자 세션을 리스트에서 제거
		for (int i = 0; i < sessionList.size(); i++) {
			Map<String, Object> map = sessionList.get(i);
			int room_id = (int) map.get("chatRoom_id");
			WebSocketSession sess = (WebSocketSession) map.get("session");
			
			if(session.equals(sess)) {
				now_chatRoom_id = room_id;
				sessionList.remove(map);
				break;
			}	
		}
		
		// CLIENT 퇴장
		// 같은 채팅방에 메세지 전송
		for (int i = 0; i < sessionList.size(); i++) {
			Map<String, Object> mapSessionList = sessionList.get(i);
			int room_id = (int) mapSessionList.get("chatRoom_id");
			WebSocketSession sess = (WebSocketSession) mapSessionList.get("session");

			// protocal : messageType, chatRoom_id, message_content, message_sender
			if(room_id == now_chatRoom_id) {
				String allMessage = "Leave,"+room_id+","+"(" + session.getId() + ")" + "님이 퇴장했습니다.";
				sess.sendMessage(new TextMessage(allMessage));
			}
		}	
	}	 
    
}