package com.musicstage.spring.board.model.vo;

import java.sql.Timestamp;

public class SaveBoard {
	private int save_board_code;
	private int save_board_number;
	private String save_board_user;
	private Timestamp save_board_date;
	private char save_board_check;
	private Board board;
	
	public SaveBoard() {}

	public SaveBoard(int save_board_code, int save_board_number, String save_board_user, Timestamp save_board_date,
			char save_board_check, Board board) {
		super();
		this.save_board_code = save_board_code;
		this.save_board_number = save_board_number;
		this.save_board_user = save_board_user;
		this.save_board_date = save_board_date;
		this.save_board_check = save_board_check;
		this.board = board;
	}

	public int getSave_board_code() {
		return save_board_code;
	}

	public void setSave_board_code(int save_board_code) {
		this.save_board_code = save_board_code;
	}

	public int getSave_board_number() {
		return save_board_number;
	}

	public void setSave_board_number(int save_board_number) {
		this.save_board_number = save_board_number;
	}

	public String getSave_board_user() {
		return save_board_user;
	}

	public void setSave_board_user(String save_board_user) {
		this.save_board_user = save_board_user;
	}

	public Timestamp getSave_board_date() {
		return save_board_date;
	}

	public void setSave_board_date(Timestamp save_board_date) {
		this.save_board_date = save_board_date;
	}

	public char getSave_board_check() {
		return save_board_check;
	}

	public void setSave_board_check(char save_board_check) {
		this.save_board_check = save_board_check;
	}

	public Board getBoard() {
		return board;
	}

	public void setBoard(Board board) {
		this.board = board;
	}

	@Override
	public String toString() {
		return "SaveBoard [save_board_code=" + save_board_code + ", save_board_number=" + save_board_number
				+ ", save_board_user=" + save_board_user + ", save_board_date=" + save_board_date
				+ ", save_board_check=" + save_board_check + ", board=" + board + "]";
	}

	
	
}
