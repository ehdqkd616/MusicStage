package com.musicstage.spring.websocket.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.musicstage.spring.common.model.vo.Alarm;

public interface WebSocketService {

	int getCountUnReadAlarm(String userId);

	void checkReadAllAlarm(String userId);

	List<Alarm> getAlarmList(String userId);

	int getCountTotalAlarm(String userId);

	int saveAlarm(HashMap<String, String> map);

	int getCountSystemAlarm(String userId);

	int getCountSocialAlarm(String userId);

	List<Alarm> getSystemAlarmList(String userId);

	List<Alarm> getSocialAlarmList(String userId);

	Alarm alarmDetail(int alarm_no);

	void checkReadAlarm(Map<String, Object> map);

	int deleteAlarm(HashMap<String, String> map);

	int deleteFollowAlarm(HashMap<String, String> map);

}
