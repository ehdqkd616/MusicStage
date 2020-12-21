package com.musicstage.spring.board.model.vo;

public class PageInfo {
	private int currentPage; // 현재페이지
	private int listCount; // 전체게시물갯수
	private int maxPage; // 최대페이지
	private int boardLimit; // 한페이지에 게시물갯수가 뜨는 갯수
	
	public PageInfo() {}

	public PageInfo(int currentPage, int listCount, int maxPage, int boardLimit) {
		super();
		this.currentPage = currentPage;
		this.listCount = listCount;
		this.maxPage = maxPage;
		this.boardLimit = boardLimit;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getListCount() {
		return listCount;
	}

	public void setListCount(int listCount) {
		this.listCount = listCount;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

	public int getBoardLimit() {
		return boardLimit;
	}

	public void setBoardLimit(int boardLimit) {
		this.boardLimit = boardLimit;
	}

	@Override
	public String toString() {
		return "PageInfo [currentPage=" + currentPage + ", listCount=" + listCount + ", maxPage=" + maxPage
				+ ", boardLimit=" + boardLimit + "]";
	}
	
	
}
