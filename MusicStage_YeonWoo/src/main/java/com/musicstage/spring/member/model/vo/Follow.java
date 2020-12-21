package com.musicstage.spring.member.model.vo;

public class Follow {
	private String follow_from;
	private String follow_to;
	
	public Follow() {}
	
	public Follow(String follow_from, String follow_to) {
		super();
		this.follow_from = follow_from;
		this.follow_to = follow_to;
	}

	public String getFollow_from() {
		return follow_from;
	}

	public void setFollow_from(String follow_from) {
		this.follow_from = follow_from;
	}

	public String getFollow_to() {
		return follow_to;
	}

	public void setFollow_to(String follow_to) {
		this.follow_to = follow_to;
	}

	@Override
	public String toString() {
		return "Follow [follow_from=" + follow_from + ", follow_to=" + follow_to + "]";
	}
	
	
}
