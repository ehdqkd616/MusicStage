package com.musicstage.spring.websocket.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.musicstage.spring.chatting.model.vo.JoinRoom;
import com.musicstage.spring.common.model.vo.Alarm;

@Repository
public class WebSocketDAOImpl implements WebSocketDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public int getCountUnReadAlarm(String userId) {
		return sqlSession.selectOne("wsMapper.countUnReadAlarm", userId);
	}

	@Override
	public void checkReadAllAlarm(String userId) {
		sqlSession.update("wsMapper.checkReadAllAlarm", userId);
	}

	@Override
	public List getAlarmList(String userId) {
		return sqlSession.selectList("wsMapper.selectAlarmList", userId);
	}

	@Override
	public int getCountTotalAlarm(String userId) {
		return sqlSession.selectOne("wsMapper.countTotalAlarm", userId);
	}

	@Override
	public int saveAlarm(HashMap<String, String> map) {
		
		if(map.get("alarm_type").equals("Follow")) {
			return sqlSession.insert("wsMapper.saveFollowAlarm", map);			
		}else if(map.get("alarm_type").equals("BoardReply")) {
			return sqlSession.insert("wsMapper.saveBoardAlarm", map);
		}else if(map.get("alarm_type").equals("ReplyReply")) {
			return sqlSession.insert("wsMapper.saveReplyAlarm", map);
		}else if(map.get("alarm_type").equals("Like")) {
			return sqlSession.insert("wsMapper.saveLikeAlarm", map);
		}else if(map.get("alarm_type").equals("Notice")) {
			return sqlSession.insert("wsMapper.saveNoticeAlarm", map);			
		}else if(map.get("alarm_type").equals("RegisterYes")) {
			return sqlSession.insert("wsMapper.saveRegisterYesAlarm", map);						
		}else if(map.get("alarm_type").equals("RegisterNo")) {
			return sqlSession.insert("wsMapper.saveRegisterNoAlarm", map);									
		}else if(map.get("alarm_type").equals("MemberReportYes")) {
			return sqlSession.insert("wsMapper.saveMemberReportYesAlarm", map);	
		}else if(map.get("alarm_type").equals("MemberReportNo")) {
			return sqlSession.insert("wsMapper.saveMemberReportNoAlarm", map);									
		}else if(map.get("alarm_type").equals("BoardReportYes")) {
			return sqlSession.insert("wsMapper.saveBoardReportYesAlarm", map);									
		}else if(map.get("alarm_type").equals("BoardReportNo")) {
			return sqlSession.insert("wsMapper.saveBoardReportNoAlarm", map);									
		}else if(map.get("alarm_type").equals("BoardApproveYes")) {
			return sqlSession.insert("wsMapper.saveBoardApproveYesAlarm", map);									
		}else if(map.get("alarm_type").equals("BoardApproveNo")) {
			return sqlSession.insert("wsMapper.saveBoardApproveNoAlarm", map);									
		}else {
			return 0;			
		}
		
	}

	@Override
	public int getCountSystemAlarm(String userId) {
		return sqlSession.selectOne("wsMapper.countSystemAlarm", userId);
	}

	@Override
	public int getCountSocialAlarm(String userId) {
		return sqlSession.selectOne("wsMapper.countSocialAlarm", userId);
	}

	@Override
	public List getSystemAlarmList(String userId) {
		return sqlSession.selectList("wsMapper.selectSystemAlarmList", userId);
	}

	@Override
	public List getSocialAlarmList(String userId) {
		return sqlSession.selectList("wsMapper.selectSocialAlarmList", userId);
	}

	@Override
	public Alarm AlarmDetail(int alarm_no) {
		return sqlSession.selectOne("wsMapper.selectAlarm", alarm_no);
	}

	@Override
	public void checkReadAlarm(Map<String, Object> map) {
		sqlSession.update("wsMapper.checkReadAlarm", map);
	}

	@Override
	public int deleteAlarm(HashMap<String, String> map) {
		return sqlSession.delete("wsMapper.deleteAlarm", map);
	}

	@Override
	public int deleteFollowAlarm(HashMap<String, String> map) {
		return sqlSession.delete("wsMapper.deleteFollowAlarm", map);
	}
	
}
