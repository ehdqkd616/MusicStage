package com.musicstage.spring.board.model.vo;

import java.sql.Timestamp;

public class LikeBoard {
	private int like_board_code;
	private int like_board_number;
	private String like_board_user;
	private Timestamp like_board_date;
	private char like_board_check;
	
	public LikeBoard() {
		// TODO Auto-generated constructor stub
	}

	public LikeBoard(int like_board_code, int like_board_number, String like_board_user, Timestamp like_board_date,
			char like_board_check) {
		super();
		this.like_board_code = like_board_code;
		this.like_board_number = like_board_number;
		this.like_board_user = like_board_user;
		this.like_board_date = like_board_date;
		this.like_board_check = like_board_check;
	}

	public int getLike_board_code() {
		return like_board_code;
	}

	public void setLike_board_code(int like_board_code) {
		this.like_board_code = like_board_code;
	}

	public int getLike_board_number() {
		return like_board_number;
	}

	public void setLike_board_number(int like_board_number) {
		this.like_board_number = like_board_number;
	}

	public String getLike_board_user() {
		return like_board_user;
	}

	public void setLike_board_user(String like_board_user) {
		this.like_board_user = like_board_user;
	}

	public Timestamp getLike_board_date() {
		return like_board_date;
	}

	public void setLike_board_date(Timestamp like_board_date) {
		this.like_board_date = like_board_date;
	}

	public char getLike_board_check() {
		return like_board_check;
	}

	public void setLike_board_check(char like_board_check) {
		this.like_board_check = like_board_check;
	}

	@Override
	public String toString() {
		return "LikeBoard [like_board_code=" + like_board_code + ", like_board_number=" + like_board_number
				+ ", like_board_user=" + like_board_user + ", like_board_date=" + like_board_date
				+ ", like_board_check=" + like_board_check + "]";
	}	
}
