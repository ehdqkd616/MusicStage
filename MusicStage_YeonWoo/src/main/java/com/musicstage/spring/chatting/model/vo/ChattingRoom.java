package com.musicstage.spring.chatting.model.vo;

import java.sql.Timestamp;

public class ChattingRoom {

	private int chatRoom_id;
	private Timestamp chatRoom_time;
	
	public ChattingRoom() {}
	
	public ChattingRoom(int chatRoom_id, Timestamp chatRoom_time) {
		super();
		this.chatRoom_id = chatRoom_id;
		this.chatRoom_time = chatRoom_time;
	}

	public int getChatRoom_id() {
		return chatRoom_id;
	}

	public void setChatRoom_id(int chatRoom_id) {
		this.chatRoom_id = chatRoom_id;
	}

	public Timestamp getChatRoom_time() {
		return chatRoom_time;
	}

	public void setChatRoom_time(Timestamp chatRoom_time) {
		this.chatRoom_time = chatRoom_time;
	}

	@Override
	public String toString() {
		return "ChattingRoom [chatRoom_id=" + chatRoom_id + ", chatRoom_time=" + chatRoom_time + "]";
	}
		
}
