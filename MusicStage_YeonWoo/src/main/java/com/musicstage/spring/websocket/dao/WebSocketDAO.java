package com.musicstage.spring.websocket.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.musicstage.spring.common.model.vo.Alarm;

public interface WebSocketDAO {

	int getCountUnReadAlarm(String userId);

	void checkReadAllAlarm(String userId);

	List getAlarmList(String userId);

	int getCountTotalAlarm(String userId);

	int saveAlarm(HashMap<String, String> map);

	int getCountSystemAlarm(String userId);

	int getCountSocialAlarm(String userId);

	List getSystemAlarmList(String userId);

	List getSocialAlarmList(String userId);

	Alarm AlarmDetail(int alarm_no);

	void checkReadAlarm(Map<String, Object> map);

	int deleteAlarm(HashMap<String, String> map);

	int deleteFollowAlarm(HashMap<String, String> map);

	
}
