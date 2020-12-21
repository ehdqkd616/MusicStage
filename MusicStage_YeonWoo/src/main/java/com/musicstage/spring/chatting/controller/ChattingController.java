package com.musicstage.spring.chatting.controller;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.musicstage.spring.chatting.model.service.ChattingService;
import com.musicstage.spring.chatting.model.vo.ChattingRoom;
import com.musicstage.spring.chatting.model.vo.JoinRoom;
import com.musicstage.spring.chatting.model.vo.Message;
import com.musicstage.spring.common.model.vo.Alarm;
import com.musicstage.spring.member.model.vo.Member;

@Controller
public class ChattingController {
	
	@Autowired
	private ChattingService chattingService;
	
	/* 채팅 페이지 */
	@RequestMapping("chatting.ct")
	public ModelAndView goChatting(HttpSession session,  HttpServletResponse response, ModelAndView mv,
			@RequestParam(value="chatRoom_id", required=false) int chatRoom_id, @RequestParam(value="partnerUserId", required=false) String partnerUserId) {
		
		response.setContentType("application/json; charset=UTF-8");
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("chatRoom_id", chatRoom_id);
		
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("partnerUserId", partnerUserId);
		map2.put("chatRoom_id", chatRoom_id);		
		
		int readCheck = chattingService.updateReadCheck(map);
		if(readCheck > 0) {
			System.out.println("메세지 읽음처리 성공");
		}else {			
			System.out.println("메세지 읽음처리 실패");
		}
		
		List<JoinRoom> joinRoomList = chattingService.getJoinRoomList(userId);
		List<Message> messageList = chattingService.getMessageList(map);
		JoinRoom joinRoom = chattingService.selectJoinRoom(map2);
		
		mv.addObject("joinRoomList", joinRoomList);
		mv.addObject("messageList", messageList);
		mv.addObject("chatRoom_id", chatRoom_id);
		mv.addObject("partnerUserId", partnerUserId);
		mv.addObject("joinRoom", joinRoom);
		mv.setViewName("chatting2");
		
		return mv;
	}
	
	/* 매세지 전체 리스트 가져오기 Ajax */
	@RequestMapping("messageList.ct")
	@ResponseBody
	public JSONArray messageList(HttpSession session, HttpServletResponse response,  
			@RequestParam("chatRoom_id") int chatRoom_id, @RequestParam("partnerUserId") String partnerUserId) {
		
		response.setContentType("application/json; charset=UTF-8");

		Member loginUser = (Member) session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
				
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("chatRoom_id", chatRoom_id);
		
		System.out.println("messageList.ct Ajax 요청");
		
		JSONArray messageArrayList = new JSONArray();

		SimpleDateFormat sdf = new SimpleDateFormat("yy.MM.dd HH:mm");
		
		List<Message> messageList = chattingService.getMessageList(map);
		
		if(messageList.size() > 0) {
			
			for(int i = 0; i < messageList.size(); i++) {
			
				JSONObject jMessage = new JSONObject();
				
				jMessage.put("message_id", messageList.get(i).getMessage_id());
				jMessage.put("message_content", messageList.get(i).getMessage_content());
				jMessage.put("message_sendTime", sdf.format(messageList.get(i).getMessage_sendTime()));
				jMessage.put("message_isRead", messageList.get(i).getMessage_isRead());
				jMessage.put("message_sender", messageList.get(i).getMessage_sender());
				jMessage.put("message_sender_nickName", messageList.get(i).getMessage_sender_nickName());
				jMessage.put("message_sender_profile_pic", messageList.get(i).getMessage_sender_profile_pic());
				
				messageArrayList.add(jMessage);
			}
		}
		
		return messageArrayList;
	}	
	
	/* 스크롤 올렸을때 매세지 리스트 20개씩 가져오기 */
	@RequestMapping("scrollMessageList.ct")
	@ResponseBody
	public JSONArray scrollMessageList(HttpSession session, HttpServletResponse response, 
			@RequestParam(value="lastMessageNo", required=false, defaultValue="0") int lastMessageNo, 
			@RequestParam("chatRoom_id") int chatRoom_id, @RequestParam("partnerUserId") String partnerUserId) {
		
		response.setContentType("application/json; charset=UTF-8");

		Member loginUser = (Member) session.getAttribute("loginUser");
		String userId = loginUser.getUserId();	
		
		int messageToStart = lastMessageNo - 1;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("chatRoom_id", chatRoom_id);			
		map.put("messageToStart", messageToStart);			
				
		System.out.println("scrollMessageList.ct Ajax 요청");
		
		JSONArray messageArrayList = new JSONArray();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		List<Message> messageList = chattingService.scrollMessageList(map);
		
		if(messageList.size() > 0) {
			
			for(int i = 0; i < messageList.size(); i++) {
			
				JSONObject jMessage = new JSONObject();
				
				jMessage.put("message_id", messageList.get(i).getMessage_id());
				jMessage.put("message_content", messageList.get(i).getMessage_content());
				jMessage.put("message_sendTime", sdf.format(messageList.get(i).getMessage_sendTime()));
				jMessage.put("message_isRead", messageList.get(i).getMessage_isRead());
				jMessage.put("message_sender", messageList.get(i).getMessage_sender());
				jMessage.put("message_sender_nickName", messageList.get(i).getMessage_sender_nickName());
				jMessage.put("message_sender_profile_pic", messageList.get(i).getMessage_sender_profile_pic());
				
				messageArrayList.add(jMessage);
			}
		}
		
		return messageArrayList;
	}
	
	/* 채팅방 목록 불러오기 Ajax */
	@ResponseBody
	@RequestMapping("chattingRoomList.ct")
	public JSONArray chattingRoomList(HttpSession session, HttpServletResponse response) {
		
		response.setContentType("application/json; charset=UTF-8");

		Member loginUser = (Member) session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
		
		System.out.println("chattingRoomList.ct Ajax 요청");
		
		JSONArray joinRoomArrayList = new JSONArray();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		List<JoinRoom> joinRoomList = chattingService.getJoinRoomList(userId);
		
		if(joinRoomList.size() > 0) {
			
			for(int i = 0; i < joinRoomList.size(); i++) {
			
				JSONObject jJoinRoom = new JSONObject();
				
				jJoinRoom.put("join_id", joinRoomList.get(i).getJoin_id());
				jJoinRoom.put("chatRoom_id", joinRoomList.get(i).getChatRoom_id());
				jJoinRoom.put("join_userId", joinRoomList.get(i).getJoin_userId());
				jJoinRoom.put("join_user_nickName", joinRoomList.get(i).getJoin_user_nickName());
				jJoinRoom.put("join_user_profile_pic", joinRoomList.get(i).getJoin_user_profile_pic());
				jJoinRoom.put("lastMessage", joinRoomList.get(i).getLastMessage());
				jJoinRoom.put("lastMessage_time", sdf.format(joinRoomList.get(i).getLastMessage_time()));
				
				joinRoomArrayList.add(jJoinRoom);
			}
		}
		
		return joinRoomArrayList;		
		
	}
	
	/* 채팅방 생성하기 */
	@RequestMapping("createRoom.ct")
	@ResponseBody
	public String createRoom(HttpSession session, @RequestParam("partnerUserId") String partnerUserId) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		String senderUserId = loginUser.getUserId();
		
		map.put("senderUserId", senderUserId);
		map.put("partnerUserId", partnerUserId);
		
		int result = chattingService.createRoom(map);
		
		if(result > 0) {
			
		}

		return "채팅 페이지";
	}
	
	/* 채팅방 별 읽지않은 매세지 갯수 가져오기 */
	@RequestMapping("countUnReadMessage.ct")
	@ResponseBody
	public int countUnReadMessage(HttpSession session) {
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
		
		int count = chattingService.getCountUnReadMessage(userId);
		return count;
	}
	
	/* 읽지않은 매세지 전체 갯수 가져오기 */
	@RequestMapping("countUnReadAllMessage.ct")
	@ResponseBody
	public int countUnReadAllMessage(HttpSession session) {
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
		
		int count = chattingService.getCountUnReadAllMessage(userId);
		System.out.println("전체 매세지 개수 : " + count);
		
		return count;
	}	
	
	/* 매세지 DB 저장 */
	@RequestMapping("saveMessage.ct")
	@ResponseBody
	public boolean saveMessage(@RequestBody HashMap<String, Object> map) {
		
		int result = chattingService.saveMessage(map);
		
		if(result > 0) {
			return true;
		}else {
			return false;
		}
	}
	
	
	
}
