package com.musicstage.spring.board.model.vo;

import java.sql.Date;

public class ReportBoard {
	private int report_no;
	private String report_content;
	private Date report_date;
	private String report_status;
	private int board_report_category;
	private int report_board;
	private String report_from;
	
	public ReportBoard() {}
	
	public ReportBoard(int report_no, String report_content, Date report_date, String report_status,
			int board_report_category, int report_board, String report_from) {
		super();
		this.report_no = report_no;
		this.report_content = report_content;
		this.report_date = report_date;
		this.report_status = report_status;
		this.board_report_category = board_report_category;
		this.report_board = report_board;
		this.report_from = report_from;
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


	public Date getReport_date() {
		return report_date;
	}


	public void setReport_date(Date report_date) {
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


	public int getReport_board() {
		return report_board;
	}


	public void setReport_board(int report_board) {
		this.report_board = report_board;
	}


	public String getReport_from() {
		return report_from;
	}


	public void setReport_from(String report_from) {
		this.report_from = report_from;
	}


	@Override
	public String toString() {
		return "ReportBoard [report_no=" + report_no + ", report_content=" + report_content + ", report_date="
				+ report_date + ", report_status=" + report_status + ", board_report_category=" + board_report_category
				+ ", report_board=" + report_board + ", report_from=" + report_from + "]";
	}
	
	
	
}
