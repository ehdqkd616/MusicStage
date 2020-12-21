package com.musicstage.spring.board.model.vo;

public class Pagenation {
	public static PageInfo getPageInfo(int currentPage, int followBoardCount) {
		
		PageInfo pi = null;
		
		int maxPage;
		int boardLimit = 9; // 한페이지에 뜨는 게시물 갯수
		
		// 최대페이지 계산
		maxPage = (int)Math.ceil((double)followBoardCount/boardLimit);
		
		pi = new PageInfo(currentPage, followBoardCount, maxPage, boardLimit);
		
		return pi;
	}
}
