package com.musicstage.spring.common.model.vo;

import java.sql.Timestamp;

public class ETCBoard {
	
	private int board_number;
	private String board_category;
	private String board_title;
	private String board_content;
	private char board_enabled;
	private Timestamp b_write_date;
	private String b_writer;
	private String b_writer_nickName;
	private String b_writer_profile_pic;
	
	public ETCBoard() {}
	
	public ETCBoard(int board_number, String board_category, String board_title, String board_content,
			char board_enabled, Timestamp b_write_date, String b_writer, String b_writer_nickName,
			String b_writer_profile_pic) {
		super();
		this.board_number = board_number;
		this.board_category = board_category;
		this.board_title = board_title;
		this.board_content = board_content;
		this.board_enabled = board_enabled;
		this.b_write_date = b_write_date;
		this.b_writer = b_writer;
		this.b_writer_nickName = b_writer_nickName;
		this.b_writer_profile_pic = b_writer_profile_pic;
	}

	public int getBoard_number() {
		return board_number;
	}

	public void setBoard_number(int board_number) {
		this.board_number = board_number;
	}

	public String getBoard_category() {
		return board_category;
	}

	public void setBoard_category(String board_category) {
		this.board_category = board_category;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	public char getBoard_enabled() {
		return board_enabled;
	}

	public void setBoard_enabled(char board_enabled) {
		this.board_enabled = board_enabled;
	}

	public Timestamp getB_write_date() {
		return b_write_date;
	}

	public void setB_write_date(Timestamp b_write_date) {
		this.b_write_date = b_write_date;
	}

	public String getB_writer() {
		return b_writer;
	}

	public void setB_writer(String b_writer) {
		this.b_writer = b_writer;
	}

	public String getB_writer_nickName() {
		return b_writer_nickName;
	}

	public void setB_writer_nickName(String b_writer_nickName) {
		this.b_writer_nickName = b_writer_nickName;
	}

	public String getB_writer_profile_pic() {
		return b_writer_profile_pic;
	}

	public void setB_writer_profile_pic(String b_writer_profile_pic) {
		this.b_writer_profile_pic = b_writer_profile_pic;
	}

	@Override
	public String toString() {
		return "Etc_board [board_number=" + board_number + ", board_category=" + board_category + ", board_title="
				+ board_title + ", board_content=" + board_content + ", board_enabled=" + board_enabled
				+ ", b_write_date=" + b_write_date + ", b_writer=" + b_writer + ", b_writer_nickName="
				+ b_writer_nickName + ", b_writer_profile_pic=" + b_writer_profile_pic + "]";
	}
	
	
	
}
