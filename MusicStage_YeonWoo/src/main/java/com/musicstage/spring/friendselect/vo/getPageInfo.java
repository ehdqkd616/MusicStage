package com.musicstage.spring.friendselect.vo;

public class getPageInfo {
	public static fPageInfo getPageInfo(int currntPage, int listCount) {
		
		fPageInfo fp = null;
		int pageLimit = 10;
		int maxPage;
		int startPage;
		int endPage;
		int boardLimit = 10;
		
		maxPage = (int)Math.ceil((double)listCount/boardLimit);
		
		startPage = (currntPage -1) / pageLimit * pageLimit +1;
		
		endPage = startPage + pageLimit -1;
		if(maxPage<endPage) {
			endPage = maxPage;
		}
		
		fp = new fPageInfo(currntPage,listCount,pageLimit,maxPage,startPage,endPage,boardLimit);
		return fp;
		
	}
}
