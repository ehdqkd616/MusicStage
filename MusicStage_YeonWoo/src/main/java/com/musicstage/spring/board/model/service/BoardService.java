package com.musicstage.spring.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;

import com.musicstage.spring.board.model.vo.Board;
import com.musicstage.spring.board.model.vo.BoardFile;
import com.musicstage.spring.board.model.vo.LikeBoard;
import com.musicstage.spring.board.model.vo.Reply;
import com.musicstage.spring.board.model.vo.ReportBoard;
import com.musicstage.spring.board.model.vo.SaveBoard;

public interface BoardService {

		// 서영
	   List<Board> allFeedList();

	   List<Board> socialFeedList();

	   List<Board> findFeedList();

	   List<Board> columnFeedList();

	   List<Board> reviewFeedList();

	   List<Board> allBoardList();
	   
	   List<Board> socialBoardList();

	   List<Board> findBoardList();

	   List<Board> columnBoardList();

	   List<Board> reviewBoardList();

	   int insertLike(HashMap<String, Object> likePara);

	   int deleteLike(HashMap<String, Object> likedeletePara);

	   List<LikeBoard> likeList(String id);
	   
	   int likeCount(int bNo);
	   
	// 연우
	   String checkLike(HashMap<String, Object> likePara);
	   
	   int updateLike(HashMap<String, Object> likePara);
	   
	 
	   String checkKeep(HashMap<String, Object> keepPara);
	   
	   int updateKeep(HashMap<String, Object> keepPara);
	   
	   
	   
	   int insertKeep(HashMap<String, Object> keepPara);
	   
	   int deleteKeep(HashMap<String, Object> keepdeletePara);
	   
	   //보관함 리스트 불러오기
	   List<SaveBoard> saveList(String id);
	   
	   // 서영 - 신고하기
	   int insertReportBoard2(ReportBoard report);
	   
	   // 신고했던 게시물인지 아닌지 체크
	   int ynCheckReport(ReportBoard report);
	   
	   // 게시글 클릭했을 때 모달 창 데이터
	   Board selectBoardModal(int bNo);

	   // 서영 - 댓글
	   List<Reply> replyList();
	   
	   LikeBoard selectLikeBoard(Map data);
	   
	   
	   
	   
	   
	   
	   
	   
	   
	     
	// 하윤
	// 사이드바 메뉴
	// 1. 팔로우
	ArrayList<Board> followBoardList(String loginUser);

	ArrayList<Board> scrollNewFollowList(HashMap<String, Object> scroll);
	
	int updateCount(int bno);
	
	Board selectBoard(int bno);
	
	// 음악/사진/영상 각각가져오기
	ArrayList<BoardFile> selectMusicFile(int bno);
	ArrayList<BoardFile> selectImageFile(int bno);
	ArrayList<BoardFile> selectVideoFile(int bno);
	
	
	int parentReplyCount(int bno);
	
	ArrayList<Reply> selectReply(int bno);
	
	int insertReply(Reply insertRp);
	
	int childReplyCount(int parent_number);

	ArrayList<Reply> selectchildReply(int bno);

	int insertChildReply(Reply insertreply);

	int deleteParentReply(Reply r);
	
	int deleteChildReply(HashMap<String, Integer> childcomment);
	
	int insertReportBoard(ReportBoard report);

	int updateReportCount(int bon);

	int deleteBoard(int bno);
	
	// 2. 보관함
	ArrayList<SaveBoard> selectSaveBoardList(String loginUser);

	ArrayList<SaveBoard> selectScrollSaveList(HashMap<String, Object> scroll);
	
	// 3. fresh
	List<Board> selectFirstBoard();

	// boardInsert모음
	int insertBoard(Board insertBoard);
	int insertBoardFile(ArrayList<BoardFile> boardFile);
	int deleteFile(int fileNum);
	
	// boardUpdate
	int updateBoard(Board updateBoard);
	BoardFile selectThumbnail(int bNum); // 썸네일여부확인
	
	// 검색기능
	ArrayList<Board> searchBoard(HashMap<String, String> search);
	// 검색스크롤
	ArrayList<Board> scrollSearchList(HashMap<String, Object> scroll);
	
	// 세부카테고리 필터
	// 찾아요
	ArrayList<Board> selectSearchTypeList(ArrayList<String> searchName);
	// 컬럼
	ArrayList<Board> selectSearchColumnList(String nickName);
	// 리뷰
	ArrayList<Board> selectSearchCateList(ArrayList<String> searchName);
	// 세부검색스크롤
	ArrayList<Board> scrollDetailSearchList(HashMap<String, Object> scroll);
	
	// allBoard타입 스크롤
	ArrayList<Board> scrollAllBoardList(int bnoToStart);
	
	// 카테고리별 스크롤
	ArrayList<Board> scrollCategoryBoard(HashMap<String, Object> scroll);
	
	
	// 규동
	int countBoard(String userId);
	
	// 좋아요 부분
	int selectlikeCount(int bNo);
	
	// 해당게시글의 saveBoard가져오기
	SaveBoard selectSaveBoard(Map<String, Object> data);
	

	ArrayList<Board> getBoardList(String userId, int start, int end, int category);

	int getboardAllCount(String userId, int category);



}
