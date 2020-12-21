package com.musicstage.spring.chatting.model.vo;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

public class JoinRoom {
	
	private int join_id;
	private int chatRoom_id;
	private String join_userId;
	private String join_user_nickName;
	private String join_user_profile_pic;
	private String lastMessage;
	private Timestamp lastMessage_time;
	private int unRead_message; 
	
	public JoinRoom() {}

	public JoinRoom(int join_id, int chatRoom_id, String join_userId, String join_user_nickName,
			String join_user_profile_pic, String lastMessage, Timestamp lastMessage_time, int unRead_message) {
		super();
		this.join_id = join_id;
		this.chatRoom_id = chatRoom_id;
		this.join_userId = join_userId;
		this.join_user_nickName = join_user_nickName;
		this.join_user_profile_pic = join_user_profile_pic;
		this.lastMessage = lastMessage;
		this.lastMessage_time = lastMessage_time;
		this.unRead_message = unRead_message;
	}

	public int getJoin_id() {
		return join_id;
	}

	public void setJoin_id(int join_id) {
		this.join_id = join_id;
	}

	public int getChatRoom_id() {
		return chatRoom_id;
	}

	public void setChatRoom_id(int chatRoom_id) {
		this.chatRoom_id = chatRoom_id;
	}

	public String getJoin_userId() {
		return join_userId;
	}

	public void setJoin_userId(String join_userId) {
		this.join_userId = join_userId;
	}

	public String getJoin_user_nickName() {
		return join_user_nickName;
	}

	public void setJoin_user_nickName(String join_user_nickName) {
		this.join_user_nickName = join_user_nickName;
	}

	public String getJoin_user_profile_pic() {
		return join_user_profile_pic;
	}

	public void setJoin_user_profile_pic(String join_user_profile_pic) {
		this.join_user_profile_pic = join_user_profile_pic;
	}

	public String getLastMessage() {
		return lastMessage;
	}

	public void setLastMessage(String lastMessage) {
		this.lastMessage = lastMessage;
	}

	public Timestamp getLastMessage_time() {
		return lastMessage_time;
	}

	public void setLastMessage_time(Timestamp lastMessage_time) {
		this.lastMessage_time = lastMessage_time;
	}

	public int getUnRead_message() {
		return unRead_message;
	}

	public void setUnRead_message(int unRead_message) {
		this.unRead_message = unRead_message;
	}

	@Override
	public String toString() {
		return "JoinRoom [join_id=" + join_id + ", chatRoom_id=" + chatRoom_id + ", join_userId=" + join_userId
				+ ", join_user_nickName=" + join_user_nickName + ", join_user_profile_pic=" + join_user_profile_pic
				+ ", lastMessage=" + lastMessage + ", lastMessage_time=" + lastMessage_time + ", unRead_message="
				+ unRead_message + "]";
	}
	
}