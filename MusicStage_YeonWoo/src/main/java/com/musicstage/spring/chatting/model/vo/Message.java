package com.musicstage.spring.chatting.model.vo;

import java.sql.Timestamp;

public class Message {
	
	private int message_id;
	private String message_content;
	private Timestamp message_sendTime;
	private String message_isRead;
	private String message_sender;
	private String message_sender_nickName;
	private String message_sender_profile_pic;
	private int chatRoom_id;
	
	private String messageType;
	
	public Message() {}

	public Message(int message_id, String message_content, Timestamp message_sendTime, String message_isRead,
			String message_sender, String message_sender_nickName, String message_sender_profile_pic, int chatRoom_id) {
		super();
		this.message_id = message_id;
		this.message_content = message_content;
		this.message_sendTime = message_sendTime;
		this.message_isRead = message_isRead;
		this.message_sender = message_sender;
		this.message_sender_nickName = message_sender_nickName;
		this.message_sender_profile_pic = message_sender_profile_pic;
		this.chatRoom_id = chatRoom_id;
	}

	public int getMessage_id() {
		return message_id;
	}

	public void setMessage_id(int message_id) {
		this.message_id = message_id;
	}

	public String getMessage_content() {
		return message_content;
	}

	public void setMessage_content(String message_content) {
		this.message_content = message_content;
	}

	public Timestamp getMessage_sendTime() {
		return message_sendTime;
	}

	public void setMessage_sendTime(Timestamp message_sendTime) {
		this.message_sendTime = message_sendTime;
	}

	public String getMessage_isRead() {
		return message_isRead;
	}

	public void setMessage_isRead(String message_isRead) {
		this.message_isRead = message_isRead;
	}

	public String getMessage_sender() {
		return message_sender;
	}

	public void setMessage_sender(String message_sender) {
		this.message_sender = message_sender;
	}

	public String getMessage_sender_nickName() {
		return message_sender_nickName;
	}

	public void setMessage_sender_nickName(String message_sender_nickName) {
		this.message_sender_nickName = message_sender_nickName;
	}

	public String getMessage_sender_profile_pic() {
		return message_sender_profile_pic;
	}

	public void setMessage_sender_profile_pic(String message_sender_profile_pic) {
		this.message_sender_profile_pic = message_sender_profile_pic;
	}

	public int getChatRoom_id() {
		return chatRoom_id;
	}

	public void setChatRoom_id(int chatRoom_id) {
		this.chatRoom_id = chatRoom_id;
	}
	
	public String getMessageType() {
		return messageType;
	}

	public void setMessageType(String messageType) {
		this.messageType = messageType;
	}
	
	@Override
	public String toString() {
		return "Message [message_id=" + message_id + ", message_content=" + message_content + ", message_sendTime="
				+ message_sendTime + ", message_isRead=" + message_isRead + ", message_sender=" + message_sender
				+ ", message_sender_nickName=" + message_sender_nickName + ", message_sender_profile_pic="
				+ message_sender_profile_pic + ", chatRoom_id=" + chatRoom_id + "]";
	}

}
