package com.musicstage.spring.chatting.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.musicstage.spring.chatting.model.vo.ChattingRoom;
import com.musicstage.spring.chatting.model.vo.JoinRoom;
import com.musicstage.spring.chatting.model.vo.Message;

public interface ChattingService {

	ArrayList<JoinRoom> getJoinRoomList(String userId);

	int createRoom(Map<String, Object> map);

	int getCountUnReadMessage(String userId);

	int getCountUnReadAllMessage(String userId);
	
	int saveMessage(HashMap<String, Object> map);

	int updateReadCheck(Map<String, Object> map);

	ArrayList<Message> getMessageList(Map<String, Object> map);

	ArrayList<Message> scrollMessageList(Map<String, Object> map);

	int checkChattingRoomIsExist(Map<String, Object> map);
	
	JoinRoom selectJoinRoom(Map<String, Object> map);
	
}
