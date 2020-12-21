package com.musicstage.spring.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.musicstage.spring.board.model.vo.Board;
import com.musicstage.spring.board.model.vo.BoardFile;
import com.musicstage.spring.board.model.vo.LikeBoard;
import com.musicstage.spring.board.model.vo.Reply;
import com.musicstage.spring.board.model.vo.ReportBoard;
import com.musicstage.spring.board.model.vo.SaveBoard;

@Repository("bDAO")
public class BoardDAO {

	// 서영
	   // 피드타입 : 전체
	   public List<Board> allFeedList(SqlSessionTemplate sqlSession) {
		   
		  List<Board> bList = sqlSession.selectList("boardMapper.allFeedList");
		  List<Board> bList2 = new ArrayList<Board>();
		   for (Board b : bList) {
			   int bNo = b.getBoard_number();
			   List<Reply> rList = sqlSession.selectList("boardMapper.selectReply_feed", bNo);
			   b.setReply((ArrayList<Reply>) rList);
			   bList2.add(b);
		   }
		   
		   return bList2;
	   }


	   
	// 피드타입 : 소셜 게시판
	   public List<Board> socialFeedList(SqlSessionTemplate sqlSession) {
		  
		   List<Board> bList = sqlSession.selectList("boardMapper.socialFeedList");
		   List<Board> bList2 = new ArrayList<Board>();
		   for (Board b : bList) {
			   int bNo = b.getBoard_number();
			   List<Reply> rList = sqlSession.selectList("boardMapper.selectReply_feed", bNo);
			   b.setReply((ArrayList<Reply>) rList);
			   bList2.add(b);
		   }
		   
		   
		   return bList2;
	      
	   }

	   // 피드타입 : 찾아요 게시판
	   public List<Board> findFeedList(SqlSessionTemplate sqlSession) {
	      List<Board> bList =  sqlSession.selectList("boardMapper.findFeedList");
	      
	      List<Board> bList2 = new ArrayList<Board>();
		   for (Board b : bList) {
			   int bNo = b.getBoard_number();
			   List<Reply> rList = sqlSession.selectList("boardMapper.selectReply_feed", bNo);
			   b.setReply((ArrayList<Reply>) rList);
			   bList2.add(b);
		   }
		   
		   
		   return bList2;
	      
	   }

	   // 피드타입 : 컬럼 게시판
	   public List<Board> columnFeedList(SqlSessionTemplate sqlSession) {
		   List<Board> bList = sqlSession.selectList("boardMapper.columnFeedList");
		   
		   List<Board> bList2 = new ArrayList<Board>();
		   for (Board b : bList) {
			   int bNo = b.getBoard_number();
			   List<Reply> rList = sqlSession.selectList("boardMapper.selectReply_feed", bNo);
			   b.setReply((ArrayList<Reply>) rList);
			   bList2.add(b);
		   }
		   
		   
		   return bList2;
	   }

	   // 피드타입 : 리뷰 게시판
	   public List<Board> reviewFeedList(SqlSessionTemplate sqlSession) {
	      List<Board> bList = sqlSession.selectList("boardMapper.reviewFeedList");
	      
	      List<Board> bList2 = new ArrayList<Board>();
		   for (Board b : bList) {
			   int bNo = b.getBoard_number();
			   List<Reply> rList = sqlSession.selectList("boardMapper.selectReply_feed", bNo);
			   b.setReply((ArrayList<Reply>) rList);
			   bList2.add(b);
		   }
		   
		   
		   return bList2;
	   }

	   // 보드타입 : 전체
	   public List<Board> allBoardList(SqlSessionTemplate sqlSession) {
	      List<Board> bList = sqlSession.selectList("boardMapper.allBoardList");
	      
	      List<Board> bList2 = new ArrayList<Board>();
		   for (Board b : bList) {
			   int bNo = b.getBoard_number();
			   List<Reply> rList = sqlSession.selectList("boardMapper.selectReply_feed", bNo);
			   b.setReply((ArrayList<Reply>) rList);
			   bList2.add(b);
		   }
		   
		   
		   return bList2;
	   }
	   
	   // 보드타입 : 소셜
	   public List<Board> socialBoardList(SqlSessionTemplate sqlSession) {
		   return sqlSession.selectList("boardMapper.socialBoardList");
	   }
	   
	   // 보드타입 : 찾아요
	   public List<Board> findBoardList(SqlSessionTemplate sqlSession) {
		   return sqlSession.selectList("boardMapper.findBoardList");
	   }

	   // 보드타입 : 컬럼
	   public List<Board> columnBoardList(SqlSessionTemplate sqlSession) {
		   return sqlSession.selectList("boardMapper.columnBoardList");
	   }

	   // 보드타입 : 리뷰
	   public List<Board> reviewBoardList(SqlSessionTemplate sqlSession) {
		   return sqlSession.selectList("boardMapper.reviewBoardList");
	   }

	   // 좋아요
	   public int insertLike(SqlSessionTemplate sqlSession, HashMap<String, Object> likePara) {
	      return sqlSession.insert("boardMapper.insertLike", likePara);
	   }

	   // 좋아요 취소
	   public int deleteLike(SqlSessionTemplate sqlSession, HashMap<String, Object> likedeletePara) {
	      return sqlSession.update("boardMapper.deleteLike", likedeletePara);
	   }

	   // 좋아요 리스트
	   public List<LikeBoard> likeList(SqlSessionTemplate sqlSession, String id) {
	      return sqlSession.selectList("boardMapper.likeList", id);
	   }

	   // 좋아요 누르면 보드테이블 라이크 카운드 증가
	   public int addLikeCount(SqlSessionTemplate sqlSession, HashMap<String, Object> likePara) {
	      return sqlSession.update("boardMapper.addLikeCount", likePara);
	   }

	   // 좋아요 취소 시 보드테이블 라이크 카운드 감소
	   public int subtractLikeCount(SqlSessionTemplate sqlSession, HashMap<String, Object> likedeletePara) {
	      return sqlSession.update("boardMapper.subtractLikeCount", likedeletePara);
	   }
	   
	   
	   public int likeCount(SqlSessionTemplate sqlSession, int bNo) {
		   return sqlSession.selectOne("boardMapper.likeCount", bNo);
	   }
	   
		//연우 
		public String checkLike(SqlSessionTemplate sqlSession, HashMap<String, Object> likePara) {
		return sqlSession.selectOne("boardMapper.checkLike", likePara);
		}
		
		public int updateLike(SqlSessionTemplate sqlSession, HashMap<String, Object> likePara) {
		return sqlSession.update("boardMapper.updateLike", likePara);
		}
	   
		public String checkKeep(SqlSessionTemplate sqlSession, HashMap<String, Object> keepPara) {
			return sqlSession.selectOne("boardMapper.checkKeep", keepPara);
		}

		public int updateKeep(SqlSessionTemplate sqlSession, HashMap<String, Object> keepPara) {
			// TODO Auto-generated method stub
			return sqlSession.update("boardMapper.updateKeep", keepPara);
		}
		

		
	   
	   
	   
	   // 보관함
	   public int insertKeep(SqlSessionTemplate sqlSession, HashMap<String, Object> keepPara) {
		   return sqlSession.insert("boardMapper.insertKeep", keepPara);
	   }

	   // 보관함 취소
	   public int deleteKeep(SqlSessionTemplate sqlSession, HashMap<String, Object> keepdeletePara) {
		   return sqlSession.update("boardMapper.deleteKeep", keepdeletePara);
	   }

	   // 보관함 리스트
	   public List<SaveBoard> saveList(SqlSessionTemplate sqlSession, String id) {
		   return sqlSession.selectList("boardMapper.selectList", id);
	   }

	   // 서영 - 신고하기
	   public int insertReportBoard2(SqlSessionTemplate sqlSession, ReportBoard report) {
			return sqlSession.insert("boardMapper.insertReportBoard2", report);
		}

	   // 신고했던 게시물인지 확인
	   public int ynCheckReport(SqlSessionTemplate sqlSession, ReportBoard report) {
	      return sqlSession.selectOne("boardMapper.ynCheckReport", report);
	   }
	   
	   // 신고 카운드 올리기
	   public int updateReportCount2(SqlSessionTemplate sqlSession, ReportBoard report) {
	      return sqlSession.update("boardMapper.updateReportCount", report);
	   }
	   
	//   // 게시글 클릭했을 때 모달창 데이터
	//   public Board selectBoardModal(SqlSessionTemplate sqlSession, int bNo) {
//	      return sqlSession.selectOne("boardMapper.selectBoardModal", bNo);
	//   }

	  
	   public Board selectBoardModal(SqlSessionTemplate sqlSession, int bNo) {
	          Board b = sqlSession.selectOne("boardMapper.selectBoardModal", bNo);
	          List<Reply> rList = sqlSession.selectList("boardMapper.selectReply", bNo);
	          
	          List<Reply> rList2 = new ArrayList<Reply>();
	          for(Reply r : rList) {
	             int parent_num = r.getReply_number();
	             ArrayList<Reply> crList = (ArrayList)sqlSession.selectList("boardMapper.selectChildReply", parent_num);
	             r.setChild_reply(crList);
	             rList2.add(r);
	          }
	          b.setReply((ArrayList<Reply>) rList2);
	          return b; 
	      }

	   
	   
	   
	   public LikeBoard selectLikeBoard(SqlSessionTemplate sqlSession, Map data) {
			
			return sqlSession.selectOne("boardMapper.selectLikeBoard", data);
		}
	   
	   
	   
	  
	   
	   
	   
	   
	   
	   
	   
	   
	// 하윤
	// 사이드바메뉴
	// 팔로우
	public ArrayList<Board> followBoardList(SqlSessionTemplate sqlSession, String loginUser) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("boardMapper.followBoardList", loginUser);
	}

	public ArrayList<Board> scrollNewFollowList(SqlSessionTemplate sqlSession, HashMap<String, Object> scroll) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("boardMapper.scrollNewFollowList", scroll);
	}

	public int updateCount(SqlSessionTemplate sqlSession, int bno) {
		// TODO Auto-generated method stub
		return sqlSession.update("boardMapper.updateCount", bno);
	}
	
	public Board selectBoard(SqlSessionTemplate sqlSession, int bno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("boardMapper.selectBoard", bno);
	}
	
	// 음악/사진/영상 각각가져오기
	public ArrayList<BoardFile> selectImageFile(SqlSessionTemplate sqlSession, int bno){
		return (ArrayList)sqlSession.selectList("boardMapper.selectImageList", bno);
	}
	public ArrayList<BoardFile> selectMusicFile(SqlSessionTemplate sqlSession, int bno){
		return (ArrayList)sqlSession.selectList("boardMapper.selectMusicList", bno);
	}
	public ArrayList<BoardFile> selectVideoFile(SqlSessionTemplate sqlSession, int bno){
		return (ArrayList)sqlSession.selectList("boardMapper.selectVideoList", bno);
	}
	
	
	public int parentReplyCount(SqlSessionTemplate sqlSession, int bno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("boardMapper.parentReplyCount", bno);
	}
	
	public ArrayList<Reply> selectReply(SqlSessionTemplate sqlSession, int bno) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectReply", bno);
	}
	
	public int insertReply(SqlSessionTemplate sqlSession, Reply insertRp) {
		return sqlSession.insert("boardMapper.insertReply", insertRp);
	}
	
	public int childReplyCount(SqlSessionTemplate sqlSession, int parent_number) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("boardMapper.childReplyCount", parent_number);
	}

	public ArrayList<Reply> selectChildReply(SqlSessionTemplate sqlSession, int parent_num) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("boardMapper.selectChildReply", parent_num);
	}

	public int insertChildReply(SqlSessionTemplate sqlSession, Reply insertreply) {
		// TODO Auto-generated method stub
		return sqlSession.insert("boardMapper.insertChildReply", insertreply);
	}

	public int deleteParentReply(SqlSessionTemplate sqlSession, Reply r) {
		// TODO Auto-generated method stub
		return sqlSession.update("boardMapper.deleteParentReply", r);
	}
	
	public int deleteChildReply(SqlSessionTemplate sqlSession, HashMap<String, Integer> childcomment) {
		// TODO Auto-generated method stub
		return sqlSession.update("boardMapper.deleteCildReply", childcomment);
	}

	public int insertReportBoard(SqlSessionTemplate sqlSession, ReportBoard report) {
		// TODO Auto-generated method stub
		return sqlSession.insert("boardMapper.insertReportBoard", report);
	}

	public int updateReportCount(SqlSessionTemplate sqlSession, int bno) {
		// TODO Auto-generated method stub
		return sqlSession.update("boardMapper.updateReportCount", bno);
	}

	public int deleteBoard(SqlSessionTemplate sqlSession, int bno) {
		// TODO Auto-generated method stub
		return sqlSession.update("boardMapper.deleteBoard", bno);
	}
	
	// 보관함
	public ArrayList<SaveBoard> selectSaveBoardList(SqlSessionTemplate sqlSession, String loginUser) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("boardMapper.selectSaveBoardList", loginUser);
	}

	public ArrayList<SaveBoard> selectScrollSaveList(SqlSessionTemplate sqlSession, HashMap<String, Object> scroll) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("boardMapper.selectScrollSaveList", scroll);
	}

	public ArrayList<Board> selectFirstBoard(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		List<Board> bList = sqlSession.selectList("boardMapper.selectFirstBoard");
		
		ArrayList<Board> bList2 = new ArrayList<Board>();
		   for (Board b : bList) {
			   int bNo = b.getBoard_number();
			   List<Reply> rList = sqlSession.selectList("boardMapper.selectReply_feed", bNo);
			   b.setReply((ArrayList<Reply>) rList);
			   bList2.add(b);
		   }
		   
		   
		   return bList2;
	}
	
	
	// boardInsert모음
	public int insertBoard(SqlSessionTemplate sqlSession, Board insertBoard) {
		return sqlSession.insert("boardMapper.insertBoard", insertBoard);
	}

	public int insertBoardFile(SqlSessionTemplate sqlSession, ArrayList<BoardFile> boardFile) {
		// TODO Auto-generated method stub
		return sqlSession.update("boardMapper.insertBoardFile", boardFile);
	}
	
	// 수정페이지
	public int deleteFile(SqlSessionTemplate sqlSession, int fileNum) {
		// TODO Auto-generated method stub
		return sqlSession.delete("boardMapper.deleteFile", fileNum);
	}

	public int updateBoard(SqlSessionTemplate sqlSession, Board updateBoard) {
		// TODO Auto-generated method stub
		return sqlSession.update("boardMapper.updateBoard", updateBoard);
	}
	public BoardFile selectThumbnail(SqlSessionTemplate sqlSession, int bNum) {
		return sqlSession.selectOne("boardMapper.selectThumbnail", bNum);
	}
	
	
	// 검색기능
	public ArrayList<Board> searchBoard(SqlSessionTemplate sqlSession, HashMap<String, String> search) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("boardMapper.searchBoardList", search);
	}
	// 검색스크롤
	public ArrayList<Board> scrollSearchList(SqlSessionTemplate sqlSession, HashMap<String, Object> scroll) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("boardMapper.scrollSearchList", scroll);
	}
	
	// 세부검색기능
	// 찾아요
	public ArrayList<Board> selectSearchTypeList(SqlSessionTemplate sqlSession, ArrayList<String> searchName) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("boardMapper.selectSearchTypeList", searchName);
	}
	// 컬럼
	public ArrayList<Board> selectSearchColumnList(SqlSessionTemplate sqlSession, String nickName) {
		// TODO Auto-generated method stub
		return  (ArrayList)sqlSession.selectList("boardMapper.selectSearchColumList", nickName);
	}
	// 리뷰
	public ArrayList<Board> selectSearchCateList(SqlSessionTemplate sqlSession, ArrayList<String> searchName) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("boardMapper.selectSearchCateList", searchName);
	}
	// 세부검색스크롤
	public ArrayList<Board> scrollDetailSearchList(SqlSessionTemplate sqlSession, HashMap<String, Object> scroll) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("boardMapper.scrollDetailSearchList", scroll);
	}

	// allBoard스크롤
	public ArrayList<Board> scrollAllBoardList(SqlSessionTemplate sqlSession, int bnoToStart) {
		
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("boardMapper.scrollAllBoardList", bnoToStart);
	}
	
	// 카테고리별 스크롤
	public ArrayList<Board> scrollCategoryBoard(SqlSessionTemplate sqlSession, HashMap<String, Object> scroll) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("boardMapper.scrollCategoryList", scroll);
	}
	
	
	// 규동
	public int countBoard(SqlSessionTemplate sqlSession, String userId) {

		return sqlSession.selectOne("boardMapper.countBoard", userId);
	}
	
	// 좋아요 기능
	public int selectlikeCount(SqlSessionTemplate sqlSession, int bNo) {
		return sqlSession.selectOne("boardMapper.selectlikeCount", bNo);
	}
	
	
	
	// 해당게시글의 saveBoard가져오기
	public SaveBoard selectSaveBoard(SqlSessionTemplate sqlSession, Map<String, Object> data) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("boardMapper.selectSaveBoard", data);
	}



	public int replyCount(SqlSessionTemplate sqlSession, int bNo) {
		return sqlSession.selectOne("boardMapper.replyCount", bNo);
		
	}

	


	public ArrayList<Board> getBoardList(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return (ArrayList) sqlSession.selectList("boardMapper.getBoardList", map);

	}



	public int getboardAllCount(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("boardMapper.getboardAllCount", map);

	}





	



}
