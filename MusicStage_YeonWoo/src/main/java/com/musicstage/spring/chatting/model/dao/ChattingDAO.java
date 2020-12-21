package com.musicstage.spring.chatting.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.musicstage.spring.chatting.model.vo.ChattingRoom;
import com.musicstage.spring.chatting.model.vo.JoinRoom;
import com.musicstage.spring.chatting.model.vo.Message;

public interface ChattingDAO {
	
	public ArrayList<JoinRoom> getJoinRoomList(String userId);
	public int createChattingRoom();
	public int joinRoomA(Map<String, Object> map);
	public int joinRoomB(Map<String, Object> map);
	public int getCountUnReadMessage(String userId);
	public int getCountUnReadAllMessage(String userId);
	public int saveMessage(HashMap<String, Object> map);
	public int updateReadCheck(Map<String, Object> map);
	public ArrayList<Message> getMessageList(Map<String, Object> map);
	public ArrayList<Message> scrollMessageList(Map<String, Object> map);
	public int checkChattingRoomIsExist(Map<String, Object> map);
	public JoinRoom selectJoinRoom(Map<String, Object> map);
	
}
