package com.musicstage.spring.websocket.controller;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.musicstage.spring.common.model.vo.Alarm;
import com.musicstage.spring.member.model.vo.Member;
import com.musicstage.spring.websocket.service.WebSocketService;

@Controller
public class WebSocketController {

	@Autowired
	private WebSocketService webSocketService;
	
	@RequestMapping("saveAlarm.ws")
	@ResponseBody
	public int saveAlarm(@RequestBody HashMap<String, String> map) {
		
		int result = webSocketService.saveAlarm(map);
		
		if(result > 0) {
			return 1;
		}else {
			return 0;			
		}
		
	}
	
	@RequestMapping("deleteAlarm.ws")
	@ResponseBody
	public int deleteAlarm(@RequestBody HashMap<String, String> map) {
		
		System.out.println("넘어온 map : " + map);

		int result = webSocketService.deleteAlarm(map);
		
		System.out.println("result : " + result);
		
		if(result > 0) {
			return 1;
		}else {
			return 0;			
		}
		
	}	
	
	@RequestMapping("deleteFollowAlarm.ws")
	@ResponseBody
	public int deleteFollowAlarm(@RequestBody HashMap<String, String> map) {
		
		System.out.println("넘어온 map : " + map);

		int result = webSocketService.deleteFollowAlarm(map);
		
		System.out.println("result : " + result);
		
		if(result > 0) {
			return 1;
		}else {
			return 0;			
		}
		
	}	
	
	@RequestMapping("alarmDetail.ws")
	public ModelAndView alarmDetail(@RequestParam("alarm_no") int alarm_no, ModelAndView mv) {
		
		System.out.println("alarm_no 값 : "+alarm_no);
		
		Alarm alarm = webSocketService.alarmDetail(alarm_no);
		
		System.out.println("alarm.getAlarm_no 값 : "+alarm.getAlarm_no());
		
		if(alarm != null) {
			mv.addObject("alarm", alarm)
			.setViewName("common/alarm_detail");
		}
		
		return mv;
	}	
	
	
	@RequestMapping(value ="countUnReadAlarm.ws")
	@ResponseBody
	public int countAlarm(HttpSession session) {
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
		
		int count = webSocketService.getCountUnReadAlarm(userId);
		return count;
	}
	
	@ResponseBody
	@RequestMapping("selectSystemAlarmList.ws")
	public JSONArray selectSystemAlarmList(Model model, HttpSession session, HttpServletResponse response) {
		
		response.setContentType("application/json; charset=UTF-8");
		
		System.out.println("selectSystemAlarmList.ws Ajax 요청");
		
		JSONArray alarmList = new JSONArray();

		Member loginUser = (Member) session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
		
//		webSocketService.checkReadAlarm(userId);

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		List<Alarm> systemAlarmList = webSocketService.getSystemAlarmList(userId);
		
		if(systemAlarmList.size() > 0) {
			
			for(int i = 0; i < systemAlarmList.size(); i++) {
			
				JSONObject jAlarm = new JSONObject();
				
				jAlarm.put("alarm_no1", systemAlarmList.get(i).getAlarm_no());
				jAlarm.put("alarm_title1", systemAlarmList.get(i).getAlarm_title());
				jAlarm.put("alarm_content1", systemAlarmList.get(i).getAlarm_content());
				jAlarm.put("alarm_type1", systemAlarmList.get(i).getAlarm_type());
				jAlarm.put("alarm_url1", systemAlarmList.get(i).getAlarm_url());
				jAlarm.put("alarm_receiver1", systemAlarmList.get(i).getAlarm_receiver());
				jAlarm.put("alarm_receiver_nickName1", systemAlarmList.get(i).getAlarm_receiver_nickName());
				jAlarm.put("alarm_receiver_profile_pic1", systemAlarmList.get(i).getAlarm_receiver_profile_pic());
				jAlarm.put("alarm_sender1", systemAlarmList.get(i).getAlarm_sender());
				jAlarm.put("alarm_sender_nickName1", systemAlarmList.get(i).getAlarm_sender_nickName());
				jAlarm.put("alarm_sender_profile_pic1", systemAlarmList.get(i).getAlarm_sender_profile_pic());
				jAlarm.put("alarm_date1", sdf.format(systemAlarmList.get(i).getAlarm_date()));

				jAlarm.put("alarm_isRead1", systemAlarmList.get(i).getAlarm_isRead());
				
				jAlarm.put("alarm_board_no1", systemAlarmList.get(i).getBoard_no());
				jAlarm.put("alarm_thumbnail_path1", systemAlarmList.get(i).getBoard_file_path());
				jAlarm.put("alarm_thumbnail_name1", systemAlarmList.get(i).getBoard_file_change_name());
				jAlarm.put("alarm_reply_no1", systemAlarmList.get(i).getReply_no());
				jAlarm.put("alarm_register_no1", systemAlarmList.get(i).getRegister_no());
				jAlarm.put("alarm_etc_board_no1", systemAlarmList.get(i).getEtc_board_no());
				jAlarm.put("alarm_b_board_no1", systemAlarmList.get(i).getB_report_no());
				jAlarm.put("alarm_m_board_no1", systemAlarmList.get(i).getM_report_no());			
				
				alarmList.add(jAlarm);
			}
		}
		
		return alarmList;
		
	}	
	
	@ResponseBody
	@RequestMapping("selectSocialAlarmList.ws")
	public JSONArray selectSocialAlarmList(Model model, HttpSession session, HttpServletResponse response) {
		
		response.setContentType("application/json; charset=UTF-8");
		
		System.out.println("selectSocialAlarmList.ws Ajax 요청");
		
		JSONArray alarmList = new JSONArray();

		Member loginUser = (Member) session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
		
//		webSocketService.checkReadAlarm(userId);

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		List<Alarm> socialAlarmList = webSocketService.getSocialAlarmList(userId);
		
		if(socialAlarmList.size() > 0) {
			
			for(int i = 0; i < socialAlarmList.size(); i++) {
			
				JSONObject jAlarm = new JSONObject();
				
				jAlarm.put("alarm_no2", socialAlarmList.get(i).getAlarm_no());
				jAlarm.put("alarm_title2", socialAlarmList.get(i).getAlarm_title());
				jAlarm.put("alarm_content2", socialAlarmList.get(i).getAlarm_content());
				jAlarm.put("alarm_type2", socialAlarmList.get(i).getAlarm_type());
				jAlarm.put("alarm_url2", socialAlarmList.get(i).getAlarm_url());
				jAlarm.put("alarm_receiver2", socialAlarmList.get(i).getAlarm_receiver());
				jAlarm.put("alarm_receiver_nickName2", socialAlarmList.get(i).getAlarm_receiver_nickName());
				jAlarm.put("alarm_receiver_profile_pic2", socialAlarmList.get(i).getAlarm_receiver_profile_pic());
				jAlarm.put("alarm_sender2", socialAlarmList.get(i).getAlarm_sender());
				jAlarm.put("alarm_sender_nickName2", socialAlarmList.get(i).getAlarm_sender_nickName());
				jAlarm.put("alarm_sender_profile_pic2", socialAlarmList.get(i).getAlarm_sender_profile_pic());
				jAlarm.put("alarm_date2", sdf.format(socialAlarmList.get(i).getAlarm_date()));
				
				jAlarm.put("alarm_isRead2", socialAlarmList.get(i).getAlarm_isRead());
				
				jAlarm.put("alarm_board_no2", socialAlarmList.get(i).getBoard_no());
				jAlarm.put("alarm_thumbnail_path2", socialAlarmList.get(i).getBoard_file_path());
				jAlarm.put("alarm_thumbnail_name2", socialAlarmList.get(i).getBoard_file_change_name());
				jAlarm.put("alarm_reply_no2", socialAlarmList.get(i).getReply_no());
				jAlarm.put("alarm_register_no2", socialAlarmList.get(i).getRegister_no());
				jAlarm.put("alarm_etc_board_no2", socialAlarmList.get(i).getEtc_board_no());
				jAlarm.put("alarm_b_board_no2", socialAlarmList.get(i).getB_report_no());
				jAlarm.put("alarm_m_board_no2", socialAlarmList.get(i).getM_report_no());
				
				alarmList.add(jAlarm);
			}
		}
		
		return alarmList;
		
	}	
	
	@ResponseBody
	@RequestMapping("updateReadCheckAlarm.ws")
	public int updateReadCheckAlarm(@RequestBody Map<String, Object> map, HttpSession session, HttpServletResponse response) {
		
		response.setContentType("application/json; charset=UTF-8");
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
		
		webSocketService.checkReadAlarm(map);
		int countAlarm = webSocketService.getCountUnReadAlarm(userId);
		
		return countAlarm;
		
	}	
	
}
