package com.musicstage.spring.common.model.vo;

import java.sql.Timestamp;

public class ReportBoard {
	private int report_no;
	private String report_content;
	private Timestamp report_date;
	private String report_status;
	private int board_report_category;
	private String board_report_category_name;
	private int report_board;
	private String report_board_title;
	private String report_board_writer;
	private String report_board_writer_nickName;
	private String report_from;
	private String report_from_nickName;
	
	public ReportBoard() {}

	public ReportBoard(int report_no, String report_content, Timestamp report_date, String report_status,
			int board_report_category, String board_report_category_name, int report_board, String report_board_title,
			String report_board_writer, String report_board_writer_nickName, String report_from, String report_from_nickName) {
		super();
		this.report_no = report_no;
		this.report_content = report_content;
		this.report_date = report_date;
		this.report_status = report_status;
		this.board_report_category = board_report_category;
		this.board_report_category_name = board_report_category_name;
		this.report_board = report_board;
		this.report_board_title = report_board_title;
		this.report_board_writer = report_board_writer;
		this.report_board_writer_nickName = report_board_writer_nickName;
		this.report_from = report_from;
		this.report_from_nickName = report_from_nickName;
	}

	public int getReport_no() {
		return report_no;
	}

	public void setReport_no(int report_no) {
		this.report_no = report_no;
	}

	public String getReport_content() {
		return report_content;
	}

	public void setReport_content(String report_content) {
		this.report_content = report_content;
	}

	public Timestamp getReport_date() {
		return report_date;
	}

	public void setReport_date(Timestamp report_date) {
		this.report_date = report_date;
	}

	public String getReport_status() {
		return report_status;
	}

	public void setReport_status(String report_status) {
		this.report_status = report_status;
	}

	public int getBoard_report_category() {
		return board_report_category;
	}

	public void setBoard_report_category(int board_report_category) {
		this.board_report_category = board_report_category;
	}

	public String getBoard_report_category_name() {
		return board_report_category_name;
	}

	public void setBoard_report_category_name(String board_report_category_name) {
		this.board_report_category_name = board_report_category_name;
	}

	public int getReport_board() {
		return report_board;
	}

	public void setReport_board(int report_board) {
		this.report_board = report_board;
	}

	public String getReport_board_title() {
		return report_board_title;
	}

	public void setReport_board_title(String report_board_title) {
		this.report_board_title = report_board_title;
	}

	public String getReport_board_writer() {
		return report_board_writer;
	}

	public void setReport_board_writer(String report_board_writer) {
		this.report_board_writer = report_board_writer;
	}

	public String getReport_board_writer_nickName() {
		return report_board_writer_nickName;
	}

	public void setReport_board_writer_nickName(String report_board_writer_nickName) {
		this.report_board_writer_nickName = report_board_writer_nickName;
	}

	public String getReport_from() {
		return report_from;
	}

	public void setReport_from(String report_from) {
		this.report_from = report_from;
	}

	public String getReport_from_nickName() {
		return report_from_nickName;
	}

	public void setReport_from_nickName(String report_from_nickName) {
		this.report_from_nickName = report_from_nickName;
	}

	@Override
	public String toString() {
		return "ReportBoard [report_no=" + report_no + ", report_content=" + report_content + ", report_date="
				+ report_date + ", report_status=" + report_status + ", board_report_category=" + board_report_category
				+ ", board_report_category_name=" + board_report_category_name + ", report_board=" + report_board
				+ ", report_board_title=" + report_board_title + ", report_board_writer=" + report_board_writer
				+ ", report_board_writer_nickName=" + report_board_writer_nickName + ", report_from=" + report_from
				+ ", report_from_nickName=" + report_from_nickName + "]";
	}

}
