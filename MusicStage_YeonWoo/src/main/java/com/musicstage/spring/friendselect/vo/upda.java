package com.musicstage.spring.friendselect.vo;

public class upda {
	private String che ;
	private String id ;
	
	public upda() {
		// TODO Auto-generated constructor stub
	}
	public upda(String che, String id) {
		super();
		this.che = che;
		this.id = id;
	}
	public String getChe() {
		return che;
	}
	public void setChe(String che) {
		this.che = che;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "upda [che=" + che + ", id=" + id + "]";
	}
	
	
	
}
