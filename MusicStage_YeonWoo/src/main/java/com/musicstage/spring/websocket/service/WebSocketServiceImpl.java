package com.musicstage.spring.websocket.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.musicstage.spring.common.model.vo.Alarm;
import com.musicstage.spring.websocket.dao.WebSocketDAO;

@Service
public class WebSocketServiceImpl implements WebSocketService{
	
	@Autowired
	WebSocketDAO webSocketDAO;

	@Override
	public int getCountUnReadAlarm(String userId) {
		return webSocketDAO.getCountUnReadAlarm(userId);
	}

	@Override
	public void checkReadAllAlarm(String userId) {
		webSocketDAO.checkReadAllAlarm(userId);
	}

	@Override
	public List<Alarm> getAlarmList(String userId) {
		return (List)webSocketDAO.getAlarmList(userId);
	}

	@Override
	public int getCountTotalAlarm(String userId) {
		return webSocketDAO.getCountTotalAlarm(userId);
	}

	@Override
	public int saveAlarm(HashMap<String, String> map) {
		return webSocketDAO.saveAlarm(map);
	}

	@Override
	public int getCountSystemAlarm(String userId) {
		return webSocketDAO.getCountSystemAlarm(userId);
	}

	@Override
	public int getCountSocialAlarm(String userId) {
		return webSocketDAO.getCountSocialAlarm(userId);
	}

	@Override
	public List<Alarm> getSystemAlarmList(String userId) {
		return (List)webSocketDAO.getSystemAlarmList(userId);
	}

	@Override
	public List<Alarm> getSocialAlarmList(String userId) {
		return (List)webSocketDAO.getSocialAlarmList(userId);
	}

	@Override
	public Alarm alarmDetail(int alarm_no) {
		return webSocketDAO.AlarmDetail(alarm_no);
	}

	@Override
	public void checkReadAlarm(Map<String, Object> map) {
		webSocketDAO.checkReadAlarm(map);
	}

	@Override
	public int deleteAlarm(HashMap<String, String> map) {
		return webSocketDAO.deleteAlarm(map);
	}

	@Override
	public int deleteFollowAlarm(HashMap<String, String> map) {
		return webSocketDAO.deleteFollowAlarm(map);
	}
	
	
	
}
