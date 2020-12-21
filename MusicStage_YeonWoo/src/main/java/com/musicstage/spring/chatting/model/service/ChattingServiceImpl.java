package com.musicstage.spring.chatting.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.musicstage.spring.chatting.model.dao.ChattingDAO;
import com.musicstage.spring.chatting.model.vo.ChattingRoom;
import com.musicstage.spring.chatting.model.vo.JoinRoom;
import com.musicstage.spring.chatting.model.vo.Message;

@Service
public class ChattingServiceImpl implements ChattingService {

	@Autowired
	ChattingDAO chattingDAO;
	
	@Override
	public ArrayList<JoinRoom> getJoinRoomList(String userId) {
		return chattingDAO.getJoinRoomList(userId);
	}

	@Override
	@Transactional("transactionManager")
	public int createRoom(Map<String, Object> map) {
		int result1 = chattingDAO.createChattingRoom();
		int result2 = chattingDAO.joinRoomA(map);
		int result3 = chattingDAO.joinRoomB(map);
		
		int result = result1*result2*result3;
		
		return result;
	}

	@Override
	public int getCountUnReadMessage(String userId) {
		return chattingDAO.getCountUnReadMessage(userId);
	}
	
	@Override
	public int getCountUnReadAllMessage(String userId) {
		return chattingDAO.getCountUnReadAllMessage(userId);
	}

	@Override
	public int saveMessage(HashMap<String, Object> map) {
		return chattingDAO.saveMessage(map);
	}

	@Override
	public int updateReadCheck(Map<String, Object> map) {
		return chattingDAO.updateReadCheck(map);
	}

	@Override
	public ArrayList<Message> getMessageList(Map<String, Object> map) {
		return chattingDAO.getMessageList(map);
	}

	@Override
	public ArrayList<Message> scrollMessageList(Map<String, Object> map) {
		return chattingDAO.scrollMessageList(map);
	}

	@Override
	public int checkChattingRoomIsExist(Map<String, Object> map) {
		return chattingDAO.checkChattingRoomIsExist(map);
	}

	@Override
	public JoinRoom selectJoinRoom(Map<String, Object> map) {
		return chattingDAO.selectJoinRoom(map);
	}

}
