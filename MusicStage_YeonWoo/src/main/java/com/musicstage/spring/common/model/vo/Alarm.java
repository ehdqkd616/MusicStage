package com.musicstage.spring.common.model.vo;

import java.sql.Timestamp;

public class Alarm {
	
	private int alarm_no;
	private String alarm_title;
	private String alarm_content;
	private String alarm_type;
	private Timestamp alarm_date;
	private char alarm_isRead;
	private String alarm_url;
	private String alarm_sender;
	private String alarm_sender_nickName;
	private String alarm_sender_profile_pic;	
	private String alarm_receiver;
	private String alarm_receiver_nickName;
	private String alarm_receiver_profile_pic;
	private int board_no;
	private String board_file_path;
	private String board_file_change_name;
	private int reply_no;
	private int etc_board_no;	
	private int register_no;
	private int m_report_no;
	private int b_report_no;
	
	
	public Alarm() {}


	public Alarm(int alarm_no, String alarm_title, String alarm_content, String alarm_type, Timestamp alarm_date,
			char alarm_isRead, String alarm_url, String alarm_sender, String alarm_sender_nickName,
			String alarm_sender_profile_pic, String alarm_receiver, String alarm_receiver_nickName,
			String alarm_receiver_profile_pic, int board_no, String board_file_path, String board_file_change_name,
			int reply_no, int etc_board_no, int register_no, int m_report_no, int b_report_no) {
		super();
		this.alarm_no = alarm_no;
		this.alarm_title = alarm_title;
		this.alarm_content = alarm_content;
		this.alarm_type = alarm_type;
		this.alarm_date = alarm_date;
		this.alarm_isRead = alarm_isRead;
		this.alarm_url = alarm_url;
		this.alarm_sender = alarm_sender;
		this.alarm_sender_nickName = alarm_sender_nickName;
		this.alarm_sender_profile_pic = alarm_sender_profile_pic;
		this.alarm_receiver = alarm_receiver;
		this.alarm_receiver_nickName = alarm_receiver_nickName;
		this.alarm_receiver_profile_pic = alarm_receiver_profile_pic;
		this.board_no = board_no;
		this.board_file_path = board_file_path;
		this.board_file_change_name = board_file_change_name;
		this.reply_no = reply_no;
		this.etc_board_no = etc_board_no;
		this.register_no = register_no;
		this.m_report_no = m_report_no;
		this.b_report_no = b_report_no;
	}


	public int getAlarm_no() {
		return alarm_no;
	}


	public void setAlarm_no(int alarm_no) {
		this.alarm_no = alarm_no;
	}


	public String getAlarm_title() {
		return alarm_title;
	}


	public void setAlarm_title(String alarm_title) {
		this.alarm_title = alarm_title;
	}


	public String getAlarm_content() {
		return alarm_content;
	}


	public void setAlarm_content(String alarm_content) {
		this.alarm_content = alarm_content;
	}


	public String getAlarm_type() {
		return alarm_type;
	}


	public void setalarm_type(String alarm_type) {
		this.alarm_type = alarm_type;
	}


	public Timestamp getAlarm_date() {
		return alarm_date;
	}


	public void setAlarm_date(Timestamp alarm_date) {
		this.alarm_date = alarm_date;
	}


	public char getAlarm_isRead() {
		return alarm_isRead;
	}


	public void setAlarm_isRead(char alarm_isRead) {
		this.alarm_isRead = alarm_isRead;
	}


	public String getAlarm_url() {
		return alarm_url;
	}


	public void setAlarm_url(String alarm_url) {
		this.alarm_url = alarm_url;
	}


	public String getAlarm_sender() {
		return alarm_sender;
	}


	public void setalarm_sender(String alarm_sender) {
		this.alarm_sender = alarm_sender;
	}


	public String getAlarm_sender_nickName() {
		return alarm_sender_nickName;
	}


	public void setalarm_sender_nickName(String alarm_sender_nickName) {
		this.alarm_sender_nickName = alarm_sender_nickName;
	}


	public String getAlarm_sender_profile_pic() {
		return alarm_sender_profile_pic;
	}


	public void setalarm_sender_profile_pic(String alarm_sender_profile_pic) {
		this.alarm_sender_profile_pic = alarm_sender_profile_pic;
	}


	public String getAlarm_receiver() {
		return alarm_receiver;
	}


	public void setalarm_receiver(String alarm_receiver) {
		this.alarm_receiver = alarm_receiver;
	}


	public String getAlarm_receiver_nickName() {
		return alarm_receiver_nickName;
	}


	public void setalarm_receiver_nickName(String alarm_receiver_nickName) {
		this.alarm_receiver_nickName = alarm_receiver_nickName;
	}


	public String getAlarm_receiver_profile_pic() {
		return alarm_receiver_profile_pic;
	}


	public void setalarm_receiver_profile_pic(String alarm_receiver_profile_pic) {
		this.alarm_receiver_profile_pic = alarm_receiver_profile_pic;
	}


	public int getBoard_no() {
		return board_no;
	}


	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}


	public String getBoard_file_path() {
		return board_file_path;
	}


	public void setBoard_file_path(String board_file_path) {
		this.board_file_path = board_file_path;
	}


	public String getBoard_file_change_name() {
		return board_file_change_name;
	}


	public void setBoard_file_change_name(String board_file_change_name) {
		this.board_file_change_name = board_file_change_name;
	}


	public int getReply_no() {
		return reply_no;
	}


	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
	}


	public int getEtc_board_no() {
		return etc_board_no;
	}


	public void setEtc_board_no(int etc_board_no) {
		this.etc_board_no = etc_board_no;
	}


	public int getRegister_no() {
		return register_no;
	}


	public void setRegister_no(int register_no) {
		this.register_no = register_no;
	}


	public int getM_report_no() {
		return m_report_no;
	}


	public void setM_report_no(int m_report_no) {
		this.m_report_no = m_report_no;
	}


	public int getB_report_no() {
		return b_report_no;
	}


	public void setB_report_no(int b_report_no) {
		this.b_report_no = b_report_no;
	}


	@Override
	public String toString() {
		return "Alarm [alarm_no=" + alarm_no + ", alarm_title=" + alarm_title + ", alarm_content=" + alarm_content
				+ ", alarm_type=" + alarm_type + ", alarm_date=" + alarm_date + ", alarm_isRead=" + alarm_isRead
				+ ", alarm_url=" + alarm_url + ", alarm_sender=" + alarm_sender + ", alarm_sender_nickName="
				+ alarm_sender_nickName + ", alarm_sender_profile_pic=" + alarm_sender_profile_pic + ", alarm_receiver="
				+ alarm_receiver + ", alarm_receiver_nickName=" + alarm_receiver_nickName
				+ ", alarm_receiver_profile_pic=" + alarm_receiver_profile_pic + ", board_no=" + board_no
				+ ", board_file_path=" + board_file_path + ", board_file_change_name=" + board_file_change_name
				+ ", reply_no=" + reply_no + ", etc_board_no=" + etc_board_no + ", register_no=" + register_no
				+ ", m_report_no=" + m_report_no + ", b_report_no=" + b_report_no + "]";
	}
	
	
	
}
