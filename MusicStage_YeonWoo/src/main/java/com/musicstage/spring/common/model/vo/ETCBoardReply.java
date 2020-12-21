package com.musicstage.spring.common.model.vo;

import java.sql.Timestamp;

public class ETCBoardReply {
	
	private int reply_number;
	private String reply_content;
	private Timestamp r_write_date;
	private int board_number;
	private String r_writer;
	private String r_writer_nickName;
	private String r_writer_profile_pic;
	
	public ETCBoardReply() {}
	
	public ETCBoardReply(int reply_number, String reply_content, Timestamp r_write_date, int board_number,
			String r_writer, String r_writer_nickName, String r_writer_profile_pic) {
		super();
		this.reply_number = reply_number;
		this.reply_content = reply_content;
		this.r_write_date = r_write_date;
		this.board_number = board_number;
		this.r_writer = r_writer;
		this.r_writer_nickName = r_writer_nickName;
		this.r_writer_profile_pic = r_writer_profile_pic;
	}

	public int getReply_number() {
		return reply_number;
	}

	public void setReply_number(int reply_number) {
		this.reply_number = reply_number;
	}

	public String getReply_content() {
		return reply_content;
	}

	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}

	public Timestamp getR_write_date() {
		return r_write_date;
	}

	public void setR_write_date(Timestamp r_write_date) {
		this.r_write_date = r_write_date;
	}

	public int getBoard_number() {
		return board_number;
	}

	public void setBoard_number(int board_number) {
		this.board_number = board_number;
	}

	public String getR_writer() {
		return r_writer;
	}

	public void setR_writer(String r_writer) {
		this.r_writer = r_writer;
	}

	public String getR_writer_nickName() {
		return r_writer_nickName;
	}

	public void setR_writer_nickName(String r_writer_nickName) {
		this.r_writer_nickName = r_writer_nickName;
	}

	public String getR_writer_profile_pic() {
		return r_writer_profile_pic;
	}

	public void setR_writer_profile_pic(String r_writer_profile_pic) {
		this.r_writer_profile_pic = r_writer_profile_pic;
	}

	@Override
	public String toString() {
		return "Etc_board_reply [reply_number=" + reply_number + ", reply_content=" + reply_content + ", r_write_date="
				+ r_write_date + ", board_number=" + board_number + ", r_writer=" + r_writer + ", r_writer_nickName="
				+ r_writer_nickName + ", r_writer_profile_pic=" + r_writer_profile_pic + "]";
	}
	

}
