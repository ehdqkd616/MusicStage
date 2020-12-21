package com.musicstage.spring.member.model.vo;

import java.sql.Date;

public class Member {

	private String userId;
	private String password;
	private String nickName;
	private String userName;
	private Date birthDay;
	private GenderType gender;
	private String email;
	private String phone;
	private String address;
	private String url_address;
	private char enabled;
	private int report_count;
	private String profile_pic;
	private Date join_date;
	private int follower_count;
	private int following_count;
	private String introduce;
	private char pro_approve;
	private int authority;
	
	public Member() {
		super();
	}
	
	public Member(String userId, String password) {
		super();
		this.userId = userId;
		this.password = password;
	}

	public Member(String userId, String password, String nickName, String userName, Date birthDay, GenderType gender,
			String email, String phone, String address, String url_address, char enabled, int report_count,
			String profile_pic, Date join_date, int follower_count, int following_count, String introduce,
			char pro_approve, int authority) {
		super();
		this.userId = userId;
		this.password = password;
		this.nickName = nickName;
		this.userName = userName;
		this.birthDay = birthDay;
		this.gender = gender;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.url_address = url_address;
		this.enabled = enabled;
		this.report_count = report_count;
		this.profile_pic = profile_pic;
		this.join_date = join_date;
		this.follower_count = follower_count;
		this.following_count = following_count;
		this.introduce = introduce;
		this.pro_approve = pro_approve;
		this.authority = authority;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Date getBirthDay() {
		return birthDay;
	}

	public void setBirthDay(Date birthDay) {
		this.birthDay = birthDay;
	}

	public GenderType getGender() {
		return gender;
	}

	public void setGender(GenderType gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getUrl_address() {
		return url_address;
	}

	public void setUrl_address(String url_address) {
		this.url_address = url_address;
	}

	public char getEnabled() {
		return enabled;
	}

	public void setEnabled(char enabled) {
		this.enabled = enabled;
	}

	public int getReport_count() {
		return report_count;
	}

	public void setReport_count(int report_count) {
		this.report_count = report_count;
	}

	public String getProfile_pic() {
		return profile_pic;
	}

	public void setProfile_pic(String profile_pic) {
		this.profile_pic = profile_pic;
	}

	public Date getJoin_date() {
		return join_date;
	}

	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}

	public int getFollower_count() {
		return follower_count;
	}

	public void setFollower_count(int follower_count) {
		this.follower_count = follower_count;
	}

	public int getFollowing_count() {
		return following_count;
	}

	public void setPollowing_count(int following_count) {
		this.following_count = following_count;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public char getPro_approve() {
		return pro_approve;
	}

	public void setPro_approve(char pro_approve) {
		this.pro_approve = pro_approve;
	}

	public int getAuthority() {
		return authority;
	}

	public void setAuthority(int authority) {
		this.authority = authority;
	}

	@Override
	public String toString() {
		return "Member [userId=" + userId + ", password=" + password + ", nickName=" + nickName + ", userName="
				+ userName + ", birthDay=" + birthDay + ", gender=" + gender + ", email=" + email + ", phone=" + phone
				+ ", address=" + address + ", url_address=" + url_address + ", enabled=" + enabled + ", report_count="
				+ report_count + ", profile_pic=" + profile_pic + ", join_date=" + join_date + ", follower_count="
				+ follower_count + ", following_count=" + following_count + ", introduce=" + introduce
				+ ", pro_approve=" + pro_approve + ", authority=" + authority + "]";
	}
	
	
	
}
