package com.musicstage.spring.common.model.vo;

import java.sql.Timestamp;

public class BoardApprove {

	private int board_number;
	private String board_title;
	private String board_content;
	private int read_count;
	private int like_count;
	private char board_enabled;
	private int report_count;
	private Timestamp b_write_date;
	private Timestamp b_modify_date;
	private String board_approve;
	private String sub_curriculum;
	private String sub_address;
	private String sub_delivery_format;
	private char search_type;
	private String sub_category;
	private int board_category;
	private String board_category_name;
	private String b_writer;
	private String b_writer_nickName;
	private String b_writer_profile_pic;
	
	public BoardApprove() {}

	public BoardApprove(int board_number, String board_title, String board_content, int read_count, int like_count,
			char board_enabled, int report_count, Timestamp b_write_date, Timestamp b_modify_date, String board_approve,
			String sub_curriculum, String sub_address, String sub_delivery_format, char search_type,
			String sub_category, int board_category, String board_category_name, String b_writer,
			String b_writer_nickName, String b_writer_profile_pic) {
		super();
		this.board_number = board_number;
		this.board_title = board_title;
		this.board_content = board_content;
		this.read_count = read_count;
		this.like_count = like_count;
		this.board_enabled = board_enabled;
		this.report_count = report_count;
		this.b_write_date = b_write_date;
		this.b_modify_date = b_modify_date;
		this.board_approve = board_approve;
		this.sub_curriculum = sub_curriculum;
		this.sub_address = sub_address;
		this.sub_delivery_format = sub_delivery_format;
		this.search_type = search_type;
		this.sub_category = sub_category;
		this.board_category = board_category;
		this.board_category_name = board_category_name;
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

	public int getRead_count() {
		return read_count;
	}

	public void setRead_count(int read_count) {
		this.read_count = read_count;
	}

	public int getLike_count() {
		return like_count;
	}

	public void setLike_count(int like_count) {
		this.like_count = like_count;
	}

	public char getBoard_enabled() {
		return board_enabled;
	}

	public void setBoard_enabled(char board_enabled) {
		this.board_enabled = board_enabled;
	}

	public int getReport_count() {
		return report_count;
	}

	public void setReport_count(int report_count) {
		this.report_count = report_count;
	}

	public Timestamp getB_write_date() {
		return b_write_date;
	}

	public void setB_write_date(Timestamp b_write_date) {
		this.b_write_date = b_write_date;
	}

	public Timestamp getB_modify_date() {
		return b_modify_date;
	}

	public void setB_modify_date(Timestamp b_modify_date) {
		this.b_modify_date = b_modify_date;
	}

	public String getBoard_approve() {
		return board_approve;
	}

	public void setBoard_approve(String board_approve) {
		this.board_approve = board_approve;
	}

	public String getSub_curriculum() {
		return sub_curriculum;
	}

	public void setSub_curriculum(String sub_curriculum) {
		this.sub_curriculum = sub_curriculum;
	}

	public String getSub_address() {
		return sub_address;
	}

	public void setSub_address(String sub_address) {
		this.sub_address = sub_address;
	}

	public String getSub_delivery_format() {
		return sub_delivery_format;
	}

	public void setSub_delivery_format(String sub_delivery_format) {
		this.sub_delivery_format = sub_delivery_format;
	}

	public char getSearch_type() {
		return search_type;
	}

	public void setSearch_type(char search_type) {
		this.search_type = search_type;
	}

	public String getSub_category() {
		return sub_category;
	}

	public void setSub_category(String sub_category) {
		this.sub_category = sub_category;
	}

	public int getBoard_category() {
		return board_category;
	}

	public void setBoard_category(int board_category) {
		this.board_category = board_category;
	}

	public String getBoard_category_name() {
		return board_category_name;
	}

	public void setBoard_category_name(String board_category_name) {
		this.board_category_name = board_category_name;
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
		return "BoardApprove [board_number=" + board_number + ", board_title=" + board_title + ", board_content="
				+ board_content + ", read_count=" + read_count + ", like_count=" + like_count + ", board_enabled="
				+ board_enabled + ", report_count=" + report_count + ", b_write_date=" + b_write_date
				+ ", b_modify_date=" + b_modify_date + ", board_approve=" + board_approve + ", sub_curriculum="
				+ sub_curriculum + ", sub_address=" + sub_address + ", sub_delivery_format=" + sub_delivery_format
				+ ", search_type=" + search_type + ", sub_category=" + sub_category + ", board_category="
				+ board_category + ", board_category_name=" + board_category_name + ", b_writer=" + b_writer
				+ ", b_writer_nickName=" + b_writer_nickName + ", b_writer_profile_pic=" + b_writer_profile_pic + "]";
	}
	
}
