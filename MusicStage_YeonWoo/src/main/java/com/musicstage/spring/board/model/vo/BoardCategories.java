package com.musicstage.spring.board.model.vo;

public class BoardCategories {
	private int board_category;
	private String board_category_name;
	
	public BoardCategories() {}

	public BoardCategories(int board_category, String board_category_name) {
		super();
		this.board_category = board_category;
		this.board_category_name = board_category_name;
	}

	public int getBoard_category() {
		return board_category;
	}

	public void setBoard_category(int board_category) {
		this.board_category = board_category;
	}

	public String getBoard_category_name() {
		return board_category_name;
	}

	public void setBoard_category_name(String board_category_name) {
		this.board_category_name = board_category_name;
	}

	@Override
	public String toString() {
		return "BoardCategories [board_category=" + board_category + ", board_category_name=" + board_category_name
				+ "]";
	}
	
	
	
}
