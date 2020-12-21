package com.musicstage.spring.member.model.vo;

import java.sql.Timestamp;

public class RegisterPro {
	
	private int register_no;
	private String specialty_field;
	private String introduce;
	private String school_name;
	private String major;
	private String career;
	private String certification;
	private String special_category;
	private String service_type;
	private char register_approve;
	private Timestamp register_date;
	private String register_user;
	private String register_user_nickName;
	private String register_user_profile_pic;
	
	public RegisterPro() {}

	public RegisterPro(int register_no, String specialty_field, String introduce, String school_name, String major,
			String career, String certification, String special_category, String service_type, char register_approve,
			Timestamp register_date, String register_user, String register_user_nickName,
			String register_user_profile_pic) {
		super();
		this.register_no = register_no;
		this.specialty_field = specialty_field;
		this.introduce = introduce;
		this.school_name = school_name;
		this.major = major;
		this.career = career;
		this.certification = certification;
		this.special_category = special_category;
		this.service_type = service_type;
		this.register_approve = register_approve;
		this.register_date = register_date;
		this.register_user = register_user;
		this.register_user_nickName = register_user_nickName;
		this.register_user_profile_pic = register_user_profile_pic;
	}

	public int getRegister_no() {
		return register_no;
	}

	public void setRegister_no(int register_no) {
		this.register_no = register_no;
	}

	public String getSpecialty_field() {
		return specialty_field;
	}

	public void setSpecialty_field(String specialty_field) {
		this.specialty_field = specialty_field;
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

	public String getSpecial_category() {
		return special_category;
	}

	public void setSpecial_category(String special_category) {
		this.special_category = special_category;
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

	public Timestamp getRegister_date() {
		return register_date;
	}

	public void setRegister_date(Timestamp register_date) {
		this.register_date = register_date;
	}

	public String getRegister_user() {
		return register_user;
	}

	public void setRegister_user(String register_user) {
		this.register_user = register_user;
	}

	public String getRegister_user_nickName() {
		return register_user_nickName;
	}

	public void setRegister_user_nickName(String register_user_nickName) {
		this.register_user_nickName = register_user_nickName;
	}

	public String getRegister_user_profile_pic() {
		return register_user_profile_pic;
	}

	public void setRegister_user_profile_pic(String register_user_profile_pic) {
		this.register_user_profile_pic = register_user_profile_pic;
	}

	@Override
	public String toString() {
		return "RegisterPro [register_no=" + register_no + ", specialty_field=" + specialty_field + ", introduce="
				+ introduce + ", school_name=" + school_name + ", major=" + major + ", career=" + career
				+ ", certification=" + certification + ", special_category=" + special_category + ", service_type="
				+ service_type + ", register_approve=" + register_approve + ", register_date=" + register_date
				+ ", register_user=" + register_user + ", register_user_nickName=" + register_user_nickName
				+ ", register_user_profile_pic=" + register_user_profile_pic + "]";
	}
	
}
