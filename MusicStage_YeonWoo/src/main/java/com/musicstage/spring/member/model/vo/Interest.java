package com.musicstage.spring.member.model.vo;

public class Interest {

	private int like_interest;
	private String like_interest_name;
	
	public Interest() {
		
	}
	
	public Interest(int like_interest, String like_interest_name) {
		super();
		this.like_interest = like_interest;
		this.like_interest_name = like_interest_name;
	}

	public int getLike_interest() {
		return like_interest;
	}

	public void setLike_interest(int like_interest) {
		this.like_interest = like_interest;
	}

	public String getLike_interest_name() {
		return like_interest_name;
	}

	public void setLike_interest_name(String like_interest_name) {
		this.like_interest_name = like_interest_name;
	}
	
}
