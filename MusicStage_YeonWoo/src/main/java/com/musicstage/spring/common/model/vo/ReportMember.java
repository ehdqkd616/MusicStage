package com.musicstage.spring.common.model.vo;

import java.sql.Timestamp;

public class ReportMember {
	private int report_no;
	private String report_content;
	private Timestamp report_date;
	private String report_status;	
	private int member_report_category;
	private String member_report_category_name;
	private String report_to;
	private String report_to_nickName;
	private String report_from;	
	private String report_from_nickName;	
	
	public ReportMember() {}

	public ReportMember(int report_no, String report_content, Timestamp report_date, String report_status,
			int member_report_category, String member_report_category_name, String report_to, String report_to_nickName,
			String report_from, String report_from_nickName) {
		super();
		this.report_no = report_no;
		this.report_content = report_content;
		this.report_date = report_date;
		this.report_status = report_status;
		this.member_report_category = member_report_category;
		this.member_report_category_name = member_report_category_name;
		this.report_to = report_to;
		this.report_to_nickName = report_to_nickName;
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

	public int getMember_report_category() {
		return member_report_category;
	}

	public void setMember_report_category(int member_report_category) {
		this.member_report_category = member_report_category;
	}

	public String getMember_report_category_name() {
		return member_report_category_name;
	}

	public void setMember_report_category_name(String member_report_category_name) {
		this.member_report_category_name = member_report_category_name;
	}

	public String getReport_to() {
		return report_to;
	}

	public void setReport_to(String report_to) {
		this.report_to = report_to;
	}

	public String getReport_to_nickName() {
		return report_to_nickName;
	}

	public void setReport_to_nickName(String report_to_nickName) {
		this.report_to_nickName = report_to_nickName;
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
		return "ReportMember [report_no=" + report_no + ", report_content=" + report_content + ", report_date="
				+ report_date + ", report_status=" + report_status + ", member_report_category="
				+ member_report_category + ", member_report_category_name=" + member_report_category_name
				+ ", report_to=" + report_to + ", report_to_nickName=" + report_to_nickName + ", report_from="
				+ report_from + ", report_from_nickName=" + report_from_nickName + "]";
	}
	
}
