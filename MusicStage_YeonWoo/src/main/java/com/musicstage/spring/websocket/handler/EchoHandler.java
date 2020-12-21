package com.musicstage.spring.websocket.handler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.musicstage.spring.member.model.vo.Member;

@RequestMapping("/echo")
public class EchoHandler extends TextWebSocketHandler{
    
	// 로그인한 전체 세션 리스트
    private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
    
    // 1대1 세션
    private Map<String, WebSocketSession> userSessionsMap = new HashMap<String, WebSocketSession>();
    
    // 세션 로그
    private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);

    
    // 클라이언트가 연결 되었을 때 실행
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        sessionList.add(session);
        
        String senderUserId = getUserId(session);
        userSessionsMap.put(senderUserId, session);
        logger.info("{} 연결됨", session.getId()); 
        System.out.println("senderUserId 값 : " + senderUserId);
        
    }

    // 클라이언트가 웹소켓 서버로 메시지를 전송했을 때 실행
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
    	// String senderEmail = getEmail(session);
		// 모든 유저에게 보낸다 - 브로드 캐스팅
    	// for (WebSocketSession sess : sessionList) {
    	// 		sess.sendMessage(new TextMessage(senderNickname + ": " +  message.getPayload()));
    	// }   
    	
		// message에는 TextMessage payload=[1212], byteCount=4, last=true 라는 값이 들어있다.
		// TextMessage payload 값이 페이지에서 보낸 텍스트 입력 값이다.
		
		// protocol : cmd, 댓글작성자, 게시글작성자,bno (ex: reply,user2,user1,234)
		// 공지사항의 경우 : cmd, 관리자, 모든 유저(세션에 있는 유저, 게시글번호 (ex: notice, admin, all users, 123)
		
		String msg = message.getPayload(); // 페이지에서 보낸 메세지 값
		if (StringUtils.isNotEmpty(msg)) { // 페이지에서 보낸 메세지 값이 비어있지 않은 경우.
			String[] strs = msg.split(",");
			
			if (strs != null && strs.length == 4) { // 메세지 값이 누락 없이 정상적으로 입력되어서 보내졌을 때.
				String cmd = strs[0]; // 페이지 자바스크립트에서 보낸 커멘드 값 ex: reply, notice, follow 등등
				String sender = strs[1]; // 페이지에서 보낸 사람 아이디
				String receiver = strs[2]; // 페이지에서 받는 사람 아이디
				String postNo = strs[3]; // 페이지에서 보낸 게시글 번호
				
				// Receiver가 로그인 되어있다면
				WebSocketSession receiverSession = userSessionsMap.get(receiver); 
				System.out.println("receiverSession : " + receiverSession); 
				
				if("Chat".equals(cmd) && receiverSession != null) {
					TextMessage tmpMsg = new TextMessage("[chat] " + sender + "님이 메세지를 보냈습니다." + "," + "chatting.ct?chatRoom_id="+postNo+"&partnerUserId="+sender);
					receiverSession.sendMessage(tmpMsg);
					System.out.println("Chat 커맨드 핸들러 성공");
					
					
		        }else if ("BoardReply".equals(cmd) && receiverSession != null) { // 게시글 작성자가 온라인인 경우
					TextMessage tmpMsg = new TextMessage(sender + "님이 댓글을 남겼습니다." + "," + "bDetail.bo?bNum=" + postNo );
					receiverSession.sendMessage(tmpMsg);
					System.out.println("BoardReply 커맨드 핸들러 성공");
		        }else if ("ReplyReply".equals(cmd) && receiverSession != null) {
					TextMessage tmpMsg = new TextMessage(sender + "님이 댓글에 답글을 남겼습니다." + "," + "bDetail.bo?bNum=" + postNo);
					receiverSession.sendMessage(tmpMsg);
					System.out.println("ReplyReply 커맨드 핸들러 성공");
				}else if("Follow".equals(cmd) && receiverSession != null) {
					TextMessage tmpMsg = new TextMessage(sender + "님이 회원님을 팔로우하기 시작했습니다." + "," + "goYouStage.st?targetId=" + sender);
					receiverSession.sendMessage(tmpMsg);
					System.out.println("Follow 커맨드 핸들러 성공");
				}else if("Like".equals(cmd) && receiverSession != null) {
					TextMessage tmpMsg = new TextMessage(sender + "님이 게시글을 좋아합니다." + "," + "bDetail.bo?bNum=" + postNo);
					receiverSession.sendMessage(tmpMsg);
					System.out.println("Like 커맨드 핸들러 성공");
				}else if("BoardApproveYes".equals(cmd) && receiverSession != null) {
					TextMessage tmpMsg = new TextMessage("게시글 등록 요청이 승인되었습니다. 알림 메세지를 확인해주세요.");
					receiverSession.sendMessage(tmpMsg);
					System.out.println("BoardApproveYes 커맨드 핸들러 성공");
				}else if("BoardApproveNo".equals(cmd) && receiverSession != null) {
					TextMessage tmpMsg = new TextMessage("게시글 등록 요청이 거절되었습니다. 알림 메세지를 확인해주세요.");
					receiverSession.sendMessage(tmpMsg);
					System.out.println("BoardApproveNo 커맨드 핸들러 성공");
				}else if("RegisterYes".equals(cmd) && receiverSession != null) {
					TextMessage tmpMsg = new TextMessage("전문가 등록 요청이 승인되었습니다. 알림 메세지를 확인해주세요.");
					receiverSession.sendMessage(tmpMsg);
					System.out.println("RegisterYes 커맨드 핸들러 성공");
				}else if("RegisterNo".equals(cmd) && receiverSession != null) {
					TextMessage tmpMsg = new TextMessage("전문가 등록 요청이 거절되었습니다. 알림 메세지를 확인해주세요.");
					receiverSession.sendMessage(tmpMsg);
					System.out.println("RegisterNo 커맨드 핸들러 성공");
				}else if("BoardReportYes".equals(cmd) && receiverSession != null) {
					TextMessage tmpMsg = new TextMessage("신고 요청이 승인되었습니다.");
					receiverSession.sendMessage(tmpMsg);
					System.out.println("BoardReportYes 커맨드 핸들러 성공");
				}else if("BoardReportNo".equals(cmd) && receiverSession != null) {
					TextMessage tmpMsg = new TextMessage("신고 요청이 거절되었습니다. 알림 메세지를 확인해주세요.");
					receiverSession.sendMessage(tmpMsg);
					System.out.println("BoardReportNo 커맨드 핸들러 성공");
				}else if("MemberReportYes".equals(cmd) && receiverSession != null) {
					TextMessage tmpMsg = new TextMessage("신고 요청이 승인되었습니다.");
					receiverSession.sendMessage(tmpMsg);
					System.out.println("MemberReportYes 커맨드 핸들러 성공");
				}else if("MemberReportNo".equals(cmd) && receiverSession != null) {
					TextMessage tmpMsg = new TextMessage("신고 요청이 거절되었습니다. 알림 메세지를 확인해주세요.");
					receiverSession.sendMessage(tmpMsg);
					System.out.println("MemberReportNo 커맨드 핸들러 성공");
				}else if("Notice".equals(cmd)) {
			        for(WebSocketSession sess : sessionList){
			        	TextMessage tmpMsg = new TextMessage("뮤직스테이지에서 알려드립니다. 알림 메세지를 확인해주세요.");
			            sess.sendMessage(tmpMsg);
			            System.out.println("Notice 커맨드 핸들러 성공");
			        }
				}
			}
		}
			
		logger.info("{}로 부터 {} 받음", session.getId(), message.getPayload());

    }

    //클라이언트 연결을 끊었을 때 실행
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        sessionList.remove(session);
        logger.info("{} 연결 끊김.", session.getId());
        
        
    }
    
    
	// httpSession에 있는 userId 값을 리턴
	private String getUserId(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		Member loginUser = (Member)httpSession.get("loginUser");
		
		return loginUser.getUserId();
	}
	
	// httpSession에 있는 userId의 닉네임 값을 리턴
	private String getNickName(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		Member loginUser = (Member)httpSession.get("loginUser");
		
		return loginUser.getNickName();
	} 
    
}