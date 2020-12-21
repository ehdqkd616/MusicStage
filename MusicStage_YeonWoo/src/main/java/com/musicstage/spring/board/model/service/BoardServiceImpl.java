package com.musicstage.spring.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.musicstage.spring.board.model.dao.BoardDAO;
import com.musicstage.spring.board.model.vo.Board;
import com.musicstage.spring.board.model.vo.BoardFile;
import com.musicstage.spring.board.model.vo.LikeBoard;
import com.musicstage.spring.board.model.vo.Reply;
import com.musicstage.spring.board.model.vo.ReportBoard;
import com.musicstage.spring.board.model.vo.SaveBoard;

@Service("bService")
public class BoardServiceImpl implements BoardService{

	@Autowired // 의존성주입
	   private SqlSessionTemplate sqlSession;
	   // root-context에서 객체생성하는부분 지정

	   @Autowired
	   private BoardDAO bDAO;

	   // 서영
	   // 피드타입 : 전체
	   @Override
	   public List<Board> allFeedList() {
	      List<Board> bList2 = bDAO.allFeedList(sqlSession);
	      List<Board> bList = new ArrayList();
		   for(Board b : bList2) {
			   int bNo = b.getBoard_number();
			   bDAO.selectReply(sqlSession, bNo);
			   int reply = bDAO.replyCount(sqlSession, bNo);
			   b.setReply_count(reply);
			   bList.add(b);
		   }
	      return bList;
	   }

	   // 피드타입 : 소셜 게시판
	   @Override
	   public List<Board> socialFeedList() {
		   
		  List<Board> bList2 = bDAO.socialFeedList(sqlSession);
		  List<Board> bList = new ArrayList();
		   for(Board b : bList2) {
			   int bNo = b.getBoard_number();
			   bDAO.selectReply(sqlSession, bNo);
			   int reply = bDAO.replyCount(sqlSession, bNo);
			   b.setReply_count(reply);
			   bList.add(b);
		   }
	      return bList;
	   }


	   // 피드타입 : 찾아요 게시판
	   @Override
	   public List<Board> findFeedList() {
	      List<Board> bList2 = bDAO.findFeedList(sqlSession);
	      List<Board> bList = new ArrayList();
		   for(Board b : bList2) {
			   int bNo = b.getBoard_number();
			   bDAO.selectReply(sqlSession, bNo);
			   int reply = bDAO.replyCount(sqlSession, bNo);
			   b.setReply_count(reply);
			   bList.add(b);
		   }
	      return bList;
	   }

	   // 피드타입 : 컬럼 게시판
	   @Override
	   public List<Board> columnFeedList() {
	      return bDAO.columnFeedList(sqlSession);
	   }

	   // 피드타입 : 리뷰 게시판
	   @Override
	   public List<Board> reviewFeedList() {
	      return bDAO.reviewFeedList(sqlSession);
	   }

	   // 보드타입 : 전체
	   @Override
	   public List<Board> allBoardList() {
	      return bDAO.allBoardList(sqlSession);
	   }
	   
	   // 보드타입 : 소셜
	   @Override
	   public List<Board> socialBoardList() {
	      return bDAO.socialBoardList(sqlSession);
	   }

	   // 보드타입 : 찾아요
	   @Override
	   public List<Board> findBoardList() {
	      return bDAO.findBoardList(sqlSession);
	   }

	   // 보드타입 : 컬럼
	   @Override
	   public List<Board> columnBoardList() {
	      return bDAO.columnBoardList(sqlSession);
	   }

	   // 보드타입 : 리뷰
	   @Override
	   public List<Board> reviewBoardList() {
	      return bDAO.reviewBoardList(sqlSession);
	   }

	   // 좋아요
	   @Override
	   public int insertLike(HashMap<String, Object> likePara) {

	      int countPlus = bDAO.addLikeCount(sqlSession, likePara);

	      int result = 0;
	      if (countPlus > 0) {// 좋아요 저장됐을 때
	         result = bDAO.insertLike(sqlSession, likePara);
	      }

	      return result;
	   }

	   // 좋아요 취소
	   @Override
	   public int deleteLike(HashMap<String, Object> likedeletePara) {

	      int countMinus = bDAO.subtractLikeCount(sqlSession, likedeletePara);

	      int result = 0;
	      if (countMinus > 0) {
	         result = bDAO.deleteLike(sqlSession, likedeletePara);
	      }
	      return result;
	   }

	   // 좋아요 리스트
	   @Override
	   public List<LikeBoard> likeList(String id) {
	      return bDAO.likeList(sqlSession, id);
	   }
	   
	   @Override
	   public int likeCount(int bNo) {
	      return bDAO.likeCount(sqlSession, bNo);
	   }
	   
	   // 연우 
	   @Override
	   public String checkLike(HashMap<String, Object> likePara) {
	      return bDAO.checkLike(sqlSession, likePara);
	   }
	   
	   @Override
	   public int updateLike(HashMap<String, Object> likePara) {
	      
	      int countPlus = bDAO.addLikeCount(sqlSession, likePara);

	         int result = 0;
	         if (countPlus > 0) {// 좋아요 저장됐을 때
	            result = bDAO.updateLike(sqlSession, likePara);
	         }
	      
	      
	      return result;
	   }
	   
	   @Override
	   public String checkKeep(HashMap<String, Object> keepPara) {
		   return bDAO.checkKeep(sqlSession, keepPara);
	   }
	   
	   @Override
	   public int updateKeep(HashMap<String, Object> keepPara) {
		  return bDAO.updateKeep(sqlSession, keepPara);
	   }
	   
	   
	   
	   
	   

	   // 보관함
	   @Override
	   public int insertKeep(HashMap<String, Object> keepPara) {
	      return bDAO.insertKeep(sqlSession, keepPara);
	   }

	   // 보관함 취소
	   @Override
	   public int deleteKeep(HashMap<String, Object> keepdeletePara) {
	      return bDAO.deleteKeep(sqlSession, keepdeletePara);
	   }

	   //보관함 리스트 불러오기
	   @Override
	   public List<SaveBoard> saveList(String id) {
	      return bDAO.saveList(sqlSession, id);
	   }
	   
	   // 서영 - 신고하기
	   @Override
	   public int insertReportBoard2(ReportBoard report) {
	      
	      int insertReportBoard = bDAO.insertReportBoard2(sqlSession, report);
	      
	      if(insertReportBoard > 0) {//0보다 크다면 신고횟수 올리기
	         insertReportBoard = bDAO.updateReportCount2(sqlSession, report);
	      }
	      
	      return insertReportBoard;
	   }

	   // 신고했던 게시물인지 아닌지 체크
	   @Override
	   public int ynCheckReport(ReportBoard report) {
	      return bDAO.ynCheckReport(sqlSession, report);
	   }
	   
	   // 게시글 클릭했을 때 모달창 데이터 
	   @Override
	   public Board selectBoardModal(int bNo) {
	      return bDAO.selectBoardModal(sqlSession, bNo);
	   }
	   
	   // 모달 좋아
	   @Override
	   public LikeBoard selectLikeBoard(Map data) {
	   	return bDAO.selectLikeBoard(sqlSession, data);
	   }
	   
	@Override
	public List<Reply> replyList() {
		// TODO Auto-generated method stub
		return null;
	}
	   
	   
	   
	   
	   
	   
	   
	   
	// 하윤
	// 사이드바 메뉴들
	// 1. 팔로우
	// 팔로우된 사람을의 게시글 다 가져오기
	@Override
	public ArrayList<Board> followBoardList(String loginUser) {
		// TODO Auto-generated method stub
		return bDAO.followBoardList(sqlSession, loginUser);
	}
	
	@Override
	public ArrayList<Board> scrollNewFollowList(HashMap<String, Object> scroll) {
		// TODO Auto-generated method stub
		return bDAO.scrollNewFollowList(sqlSession, scroll);
	}
	
	@Override
	public int updateCount(int bno) {
		// TODO Auto-generated method stub
		return bDAO.updateCount(sqlSession, bno);
	}
	
	@Override
	public Board selectBoard(int bno) {
		// TODO Auto-generated method stub
		return bDAO.selectBoard(sqlSession, bno);
	}
	
	// 음악/사진/영상 각각가져오기
	@Override
	public ArrayList<BoardFile> selectMusicFile(int bno){
		return bDAO.selectMusicFile(sqlSession, bno);
	}
	@Override
	public ArrayList<BoardFile> selectImageFile(int bno){
		return bDAO.selectImageFile(sqlSession, bno);
	}
	@Override
	public ArrayList<BoardFile> selectVideoFile(int bno){
		return bDAO.selectVideoFile(sqlSession, bno);
	}
	
	
	@Override
	public int parentReplyCount(int bno) {
		// TODO Auto-generated method stub
		return bDAO.parentReplyCount(sqlSession, bno);
	}
	
	@Override
	public ArrayList<Reply> selectReply(int bno) {
		return bDAO.selectReply(sqlSession, bno);
	}
	
	@Override
	public int insertReply(Reply insertRp) {
		return bDAO.insertReply(sqlSession, insertRp);
	}
	
	@Override
	public int childReplyCount(int parent_number) {
		// TODO Auto-generated method stub
		return bDAO.childReplyCount(sqlSession, parent_number);
	}
	
	@Override
	public ArrayList<Reply> selectchildReply(int parent_num) {
		// TODO Auto-generated method stub
		return bDAO.selectChildReply(sqlSession, parent_num);
	}
	
	@Override
	public int insertChildReply(Reply insertreply) {
		// TODO Auto-generated method stub
		return bDAO.insertChildReply(sqlSession, insertreply);
	}
	
	@Override
	public int deleteParentReply(Reply r) {
		// TODO Auto-generated method stub
		return bDAO.deleteParentReply(sqlSession, r);
	}
	
	@Override
	public int deleteChildReply(HashMap<String, Integer> childcomment) {
		// TODO Auto-generated method stub
		return bDAO.deleteChildReply(sqlSession, childcomment);
	}
	
	@Override
	public int insertReportBoard(ReportBoard report) {
		// TODO Auto-generated method stub
		return bDAO.insertReportBoard(sqlSession, report);
	}
	
	// 신고하면 신고횟수 올라가게 하기
	@Override
	public int updateReportCount(int bno) {
		// TODO Auto-generated method stub
		return bDAO.updateReportCount(sqlSession, bno);
	}
	
	@Override
	public int deleteBoard(int bno) {
		// TODO Auto-generated method stub
		return bDAO.deleteBoard(sqlSession, bno);
	}
	
	// 2. 보관함
	@Override
	public ArrayList<SaveBoard> selectSaveBoardList(String loginUser) {
		// TODO Auto-generated method stub
		return bDAO.selectSaveBoardList(sqlSession, loginUser);
	}
	
	@Override
	public ArrayList<SaveBoard> selectScrollSaveList(HashMap<String, Object> scroll){
		return bDAO.selectScrollSaveList(sqlSession, scroll);
	}
	
	// 3. fresh
	@Override
	public List<Board> selectFirstBoard() {
		// TODO Auto-generated method stub
		List<Board> bList2 = bDAO.selectFirstBoard(sqlSession);
		
		List<Board> bList = new ArrayList();
		   for(Board b : bList2) {
			   int bNo = b.getBoard_number();
			   bDAO.selectReply(sqlSession, bNo);
			   int reply = bDAO.replyCount(sqlSession, bNo);
			   b.setReply_count(reply);
			   bList.add(b);
		   }
	      return bList;
	}
	
	// boardInsert모음
	@Override
	public int insertBoard(Board insertBoard) {
		// TODO Auto-generated method stub
		return bDAO.insertBoard(sqlSession, insertBoard);
	}
	@Override
	public int insertBoardFile(ArrayList<BoardFile> boardFile) {
		// TODO Auto-generated method stub
		return bDAO.insertBoardFile(sqlSession, boardFile);
	}
	
	// 수정페이지
	// 이미지지우기
	@Override
	public int deleteFile(int fileNum) {
		// TODO Auto-generated method stub
		return bDAO.deleteFile(sqlSession, fileNum);
	}
	@Override
	public int updateBoard(Board updateBoard) {
		// TODO Auto-generated method stub
		return bDAO.updateBoard(sqlSession, updateBoard);
	}
	@Override // 썸네일여부확인
	public BoardFile selectThumbnail(int bNum) {
		// TODO Auto-generated method stub
		return bDAO.selectThumbnail(sqlSession, bNum);
	}
	
	// 검색기능
	@Override
	public ArrayList<Board> searchBoard(HashMap<String, String> search) {
		// TODO Auto-generated method stub
		return bDAO.searchBoard(sqlSession, search);
	}
	// 검색스크롤
	@Override
	public ArrayList<Board> scrollSearchList(HashMap<String, Object> scroll) {
		// TODO Auto-generated method stub
		return bDAO.scrollSearchList(sqlSession, scroll);
	}
	
	// 세부카테고리 필터
	// 찾아요
	@Override
	public ArrayList<Board> selectSearchTypeList(ArrayList<String> searchName) {
		// TODO Auto-generated method stub
		return bDAO.selectSearchTypeList(sqlSession, searchName);
	}
	// 컬럼
	@Override
	public ArrayList<Board> selectSearchColumnList(String nickName) {
		// TODO Auto-generated method stub
		return bDAO.selectSearchColumnList(sqlSession, nickName);
	}
	// 리뷰
	@Override
	public ArrayList<Board> selectSearchCateList(ArrayList<String> searchName) {
		// TODO Auto-generated method stub
		return bDAO.selectSearchCateList(sqlSession, searchName);
	}
	// 세부검색스크롤
	@Override
	public ArrayList<Board> scrollDetailSearchList(HashMap<String, Object> scroll) {
		// TODO Auto-generated method stub
		return bDAO.scrollDetailSearchList(sqlSession, scroll);
	}
	
	// allBoard타입 스크롤
	@Override
	public ArrayList<Board> scrollAllBoardList(int bnoToStart) {
		// TODO Auto-generated method stub
		return bDAO.scrollAllBoardList(sqlSession, bnoToStart);
	}
	
	// 카테고리별 스크롤
	@Override
	public ArrayList<Board> scrollCategoryBoard(HashMap<String, Object> scroll) {
		// TODO Auto-generated method stub
		return bDAO.scrollCategoryBoard(sqlSession, scroll);
	}
	
	// 규동
	@Override
	public int countBoard(String userId) {

		return bDAO.countBoard(sqlSession, userId);
	}
	
	
	// 좋아요 부분
	@Override
	public int selectlikeCount(int bNo) {
		// TODO Auto-generated method stub
		return bDAO.selectlikeCount(sqlSession, bNo);
	}
	
	// 해당게시글의 saveBoard가져오기
	@Override
	public SaveBoard selectSaveBoard(Map<String, Object> data) {
		// TODO Auto-generated method stub
		return bDAO.selectSaveBoard(sqlSession, data);
	}

	@Override
	public ArrayList<Board> getBoardList(String userId, int start, int end, int category) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("userId", userId);
		map.put("start", start);
		map.put("end", end);
		map.put("category", category);
		
		return bDAO.getBoardList(sqlSession, map);

	}

	@Override
	public int getboardAllCount(String userId, int category) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("userId", userId);
		map.put("category", category);
		
		return bDAO.getboardAllCount(sqlSession, map);
	}

}
