package com.musicstage.spring.chatting.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.musicstage.spring.chatting.model.vo.ChattingRoom;
import com.musicstage.spring.chatting.model.vo.JoinRoom;
import com.musicstage.spring.chatting.model.vo.Message;

@Repository
public class ChattingDAOImpl implements ChattingDAO {
	
	@Autowired
	private SqlSession session;
	
	@Override
	public ArrayList<JoinRoom> getJoinRoomList(String userId) {
		return (ArrayList)session.selectList("chattingMapper.getJoinRoomList", userId);
	}

	@Override
	public int createChattingRoom() {
		return session.insert("chattingMapper.createChattingRoom");
	}

	@Override
	public int joinRoomA(Map<String, Object> map) {
		return session.insert("chattingMapper.joinRoomA", map);
	}

	@Override
	public int joinRoomB(Map<String, Object> map) {
		return session.insert("chattingMapper.joinRoomB", map);
	}

	@Override
	public int getCountUnReadMessage(String userId) {
		return session.insert("chattingMapper.getCountUnReadMessage", userId);
	}
	
	@Override
	public int getCountUnReadAllMessage(String userId) {
		return session.selectOne("chattingMapper.getCountUnReadAllMessage", userId);
	}	

	@Override
	public int saveMessage(HashMap<String, Object> map) {
		return session.insert("chattingMapper.saveMessage", map);
	}

	@Override
	public int updateReadCheck(Map<String, Object> map) {
		return session.update("chattingMapper.updateReadCheck", map);
	}

	@Override
	public ArrayList<Message> getMessageList(Map<String, Object> map) {
		return (ArrayList)session.selectList("chattingMapper.getMessageList", map);
	}

	@Override
	public ArrayList<Message> scrollMessageList(Map<String, Object> map) {
		return (ArrayList)session.selectList("chattingMapper.scrollMessageList", map);
	}

	@Override
	public int checkChattingRoomIsExist(Map<String, Object> map) {
		return session.selectOne("chattingMapper.checkChattingRoomIsExist", map);
	}
	
	@Override
	public JoinRoom selectJoinRoom(Map<String, Object> map) {
		return session.selectOne("chattingMapper.selectJoinRoom", map);
	}
	
}
