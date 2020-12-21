package com.musicstage.spring.friendselect.vo;

public class fPageInfo {

		private int currintPage;
		private int listCount;
		private int pageLimit;
		private int maxPage;
		private int startPage;
		private int endPage;
		private int boardLimit;
	
		public fPageInfo() {
			// TODO Auto-generated constructor stub
		}

		public fPageInfo(int currintPage, int listCount, int pageLimit, int maxPage, int startPage, int endPage,
				int boardLimit) {
			super();
			this.currintPage = currintPage;
			this.listCount = listCount;
			this.pageLimit = pageLimit;
			this.maxPage = maxPage;
			this.startPage = startPage;
			this.endPage = endPage;
			this.boardLimit = boardLimit;
		}

		public int getCurrintPage() {
			return currintPage;
		}

		public void setCurrintPage(int currintPage) {
			this.currintPage = currintPage;
		}

		public int getListCount() {
			return listCount;
		}

		public void setListCount(int listCount) {
			this.listCount = listCount;
		}

		public int getPageLimit() {
			return pageLimit;
		}

		public void setPageLimit(int pageLimit) {
			this.pageLimit = pageLimit;
		}

		public int getMaxPage() {
			return maxPage;
		}

		public void setMaxPage(int maxPage) {
			this.maxPage = maxPage;
		}

		public int getStartPage() {
			return startPage;
		}

		public void setStartPage(int startPage) {
			this.startPage = startPage;
		}

		public int getEndPage() {
			return endPage;
		}

		public void setEndPage(int endPage) {
			this.endPage = endPage;
		}

		public int getBoardLimit() {
			return boardLimit;
		}

		public void setBoardLimit(int boardLimit) {
			this.boardLimit = boardLimit;
		}

		@Override
		public String toString() {
			return "fPageInfo [currintPage=" + currintPage + ", listCount=" + listCount + ", pageLimit=" + pageLimit
					+ ", maxPage=" + maxPage + ", startPage=" + startPage + ", endPage=" + endPage + ", boardLimit="
					+ boardLimit + "]";
		}
		
		
		
}
