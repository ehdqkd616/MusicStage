package com.musicstage.spring.member.model.vo;

import java.sql.Date;

/**
 * @author khj
 *
 */
public class register_Pro {

	private int register_no; //전문가 등록 번호
	private String specialrt_field; // 전문분야
	private String introduce; //소개
	private String school_name;//학교명
	private String major;//전공
	private String career;//경력
	private String certification;//자격증
	private String top_special_category;//상위 카테고리
	private String service_type;//서비스 타입
	
	private char register_approve;//전문가 승인 여부
	private String register_date; // 전문가 등록 날짜
	private String register_user;//전문가 등록자
	
	
	private String middle_special_category;//하위 카테고리
	
	private String form_of_provision;// 제공 형태
	private String additional_options;//추가 옵션
	
	public register_Pro() {	}
	
	






	public register_Pro(int register_no, String specialrt_field, String introduce, String school_name, String major,
			String career, String certification, String top_special_category, String middle_special_category,
			String service_type, String form_of_provision, String additional_options, char register_approve,
			String register_date, String register_user, register_file file) {
		super();
		this.register_no = register_no;
		this.specialrt_field = specialrt_field;
		this.introduce = introduce;
		this.school_name = school_name;
		this.major = major;
		this.career = career;
		this.certification = certification;
		this.top_special_category = top_special_category;
		this.middle_special_category = middle_special_category;
		this.service_type = service_type;
		this.form_of_provision = form_of_provision;
		this.additional_options = additional_options;
		this.register_approve = register_approve;
		this.register_date = register_date;
		this.register_user = register_user;
		
	}








	public String getAdditional_options() {
		return additional_options;
	}



	public void setAdditional_options(String additional_options) {
		this.additional_options = additional_options;
	}



	public String getForm_of_provision() {
		return form_of_provision;
	}



	public void setForm_of_provision(String form_of_provision) {
		this.form_of_provision = form_of_provision;
	}
	
	
	public String getTop_special_category() {
		return top_special_category;
	}

	public void setTop_special_category(String top_special_category) {
		this.top_special_category = top_special_category;
	}

	public String getMiddle_special_category() {
		return middle_special_category;
	}

	public void setMiddle_special_category(String middle_special_category) {
		this.middle_special_category = middle_special_category;
	}


	public int getRegister_no() {
		return register_no;
	}

	public void setRegister_no(int register_no) {
		this.register_no = register_no;
	}

	public String getSpecialrt_field() {
		return specialrt_field;
	}

	public void setSpecialrt_field(String specialrt_field) {
		this.specialrt_field = specialrt_field;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public String getSchool_name() {
		return school_name;
	}

	public void setSchool_name(String school_name) {
		this.school_name = school_name;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getCareer() {
		return career;
	}

	public void setCareer(String career) {
		this.career = career;
	}

	public String getCertification() {
		return certification;
	}

	public void setCertification(String certification) {
		this.certification = certification;
	}

	

	public String getService_type() {
		return service_type;
	}

	public void setService_type(String service_type) {
		this.service_type = service_type;
	}

	public char getRegister_approve() {
		return register_approve;
	}

	public void setRegister_approve(char register_approve) {
		this.register_approve = register_approve;
	}

	public String getRegister_date() {
		return register_date;
	}

	public void setRegister_date(String ff) {
		this.register_date = ff;
	}

	public String getRegister_user() {
		return register_user;
	}

	public void setRegister_user(String register_user) {
		this.register_user = register_user;
	}








	@Override
	public String toString() {
		return "register_Pro [register_no=" + register_no + ", specialrt_field=" + specialrt_field + ", introduce="
				+ introduce + ", school_name=" + school_name + ", major=" + major + ", career=" + career
				+ ", certification=" + certification + ", top_special_category=" + top_special_category
				+ ", middle_special_category=" + middle_special_category + ", service_type=" + service_type
				+ ", form_of_provision=" + form_of_provision + ", additional_options=" + additional_options
				+ ", register_approve=" + register_approve + ", register_date=" + register_date + ", register_user="
				+ register_user+"]";
	}











	
	
	
	
}
