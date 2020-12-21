package com.musicstage.spring.board.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.musicstage.spring.board.model.exception.BoardException;
import com.musicstage.spring.board.model.service.BoardService;
import com.musicstage.spring.board.model.vo.Board;
import com.musicstage.spring.board.model.vo.BoardFile;
import com.musicstage.spring.board.model.vo.LikeBoard;
import com.musicstage.spring.board.model.vo.Reply;
import com.musicstage.spring.board.model.vo.ReportBoard;
import com.musicstage.spring.board.model.vo.SaveBoard;
import com.musicstage.spring.member.model.vo.Member;

@Controller

@SessionAttributes({"Rv","loginUser","registerUser_Pro","list","total","loginUser"})
public class BoardController {	
	
	  //로거설정
	   private Logger logger = LoggerFactory.getLogger(BoardController.class);

	   @Autowired
	   private BoardService bService;

	   //서영
	   // 피트타입 : 전체
	   @RequestMapping(value = "allFeed.bo", method = RequestMethod.GET)
	   public ModelAndView allFeed(ModelAndView mv, HttpSession session) {

	      List<Board> list = bService.allFeedList();

	      // 좋아요 목록 불러오기
	      // 로그인 된 유저 아이디 받아오기
	      String id = ((Member)session.getAttribute("loginUser")).getUserId();

	      // 좋아요.
	      List<LikeBoard> likeList = bService.likeList(id);
	      
	      // 보드 넘 담긴 list 만들기
	      List<Object> bNos = new ArrayList<>();
	      
	      for (LikeBoard e : likeList) {
	         bNos.add(e.getLike_board_number());
	      }
	      
	      
	      // 보관함 리스트 불러오기
	      List<SaveBoard> saveList = bService.saveList(id);
	      // 보관함 보드넘 담긴 리스트 만들기
	      List<Object> saveBoNos = new ArrayList<>();
	      for(SaveBoard e : saveList) {
	         saveBoNos.add(e.getSave_board_number());
	      }
	      
	      // 댓글 가져오기
	      List<Reply> reply = bService.replyList();
	      
	      
	      mv.addObject("list", list);
	      mv.addObject("likeNoList", bNos);
	      mv.addObject("saveBoNos", saveBoNos);
	      mv.setViewName("mainboard/all_feedType");
	      return mv;
	   }

	   // 피드타입 : 소셜 게시판
	   @RequestMapping(value = "socialFeed.bo", method = RequestMethod.GET)
	   public ModelAndView socialFeed(ModelAndView mv, HttpSession session, HttpServletRequest request) {

	      List<Board> list = bService.socialFeedList();

	      // 좋아요 목록 불러오기
	      // 로그인 된 유저 아이디 받아오기
	      session = request.getSession(false);
	      Member m = (Member)session.getAttribute("loginUser");
	      
	      
	      if(m != null && session != null) {
		      String id = m.getUserId();
		      
		      // 좋아요.
		      List<LikeBoard> likeList = bService.likeList(id);
		      
		      // 보드 넘 담긴 list 만들기
		      List<Object> bNos = new ArrayList<>();
		      
		      for (LikeBoard e : likeList) {
		         bNos.add(e.getLike_board_number());
		      }
		      
		      
		      // 보관함 리스트 불러오기
		      List<SaveBoard> saveList = bService.saveList(id);
		      // 보관함 보드넘 담긴 리스트 만들기
		      List<Object> saveBoNos = new ArrayList<>();
		      for(SaveBoard e : saveList) {
		         saveBoNos.add(e.getSave_board_number());
		      }
		      
		      
		      mv.addObject("list", list);
		      mv.addObject("likeNoList", bNos);
		      mv.addObject("saveBoNos", saveBoNos);
		      mv.setViewName("mainboard/social_feedType");
	      } else {
	    	  mv.addObject("list", list);
	    	  mv.setViewName("mainboard/social_feedType");
	      }
	      return mv;
	   }

	   // 피드타입 : 찾아요 게시판
	   @RequestMapping(value = "findFeed.bo", method = RequestMethod.GET)
	   public ModelAndView findFeed(ModelAndView mv, HttpSession session, HttpServletRequest request) {

	      List<Board> list = bService.findFeedList();

	      // 좋아요 목록 불러오기
	      // 로그인 된 유저 아이디 받아오기
	      session = request.getSession(false);
	      Member m = (Member)session.getAttribute("loginUser");
	      
	      if(m != null && session != null) {
		      String id = m.getUserId();
	
		      // 좋아요.
		      List<LikeBoard> likeList = bService.likeList(id);
		      
		      // 보드 넘 담긴 list 만들기
		      List<Object> bNos = new ArrayList<>();
		      
		      for (LikeBoard e : likeList) {
		         bNos.add(e.getLike_board_number());
		      }
		      
		      
		      // 보관함 리스트 불러오기
		      List<SaveBoard> saveList = bService.saveList(id);
		      // 보관함 보드넘 담긴 리스트 만들기
		      List<Object> saveBoNos = new ArrayList<>();
		      for(SaveBoard e : saveList) {
		         saveBoNos.add(e.getSave_board_number());
		      }
		      
		      // 댓글 가져오기
		      List<Reply> reply = bService.replyList();
		      
		      mv.addObject("list", list);
		      mv.addObject("likeNoList", bNos);
		      mv.addObject("saveBoNos", saveBoNos);
		      mv.setViewName("mainboard/find_feedType");
	      } else {
	    	  mv.addObject("list", list);
	    	  mv.setViewName("mainboard/find_feedType");
	      }
	      return mv;
	   }

	   // 피드타입 : 컬럼 게시판
	   @RequestMapping(value = "columnFeed.bo", method = RequestMethod.GET)
	   public ModelAndView columnFeed(ModelAndView mv, HttpSession session, HttpServletRequest request) {

	      List<Board> list = bService.columnFeedList();

	      // 좋아요 목록 불러오기
	      // 로그인 된 유저 아이디 받아오기
	      session = request.getSession(false);
	      Member m = (Member)session.getAttribute("loginUser");
	      
	      if(m != null && session != null) {
		      String id = m.getUserId();
	
		      // 좋아요.
		      List<LikeBoard> likeList = bService.likeList(id);
		      
		      // 보드 넘 담긴 list 만들기
		      List<Object> bNos = new ArrayList<>();
		      
		      for (LikeBoard e : likeList) {
		         bNos.add(e.getLike_board_number());
		      }
		      
		      
		      // 보관함 리스트 불러오기
		      List<SaveBoard> saveList = bService.saveList(id);
		      // 보관함 보드넘 담긴 리스트 만들기
		      List<Object> saveBoNos = new ArrayList<>();
		      for(SaveBoard e : saveList) {
		         saveBoNos.add(e.getSave_board_number());
		      }
		      
		      // 댓글 가져오기
		      List<Reply> reply = bService.replyList();
		      
		      mv.addObject("list", list);
		      mv.addObject("likeNoList", bNos);
		      mv.addObject("saveBoNos", saveBoNos);
		      mv.setViewName("mainboard/column_feedType");
	      } else {
	    	  mv.addObject("list", list);
	    	  mv.setViewName("mainboard/column_feedType");
	      }
	      return mv;
	   }

	   // 피드타입 : 리뷰 게시판
	   @RequestMapping(value = "reviewFeed.bo", method = RequestMethod.GET)
	   public ModelAndView reviewFeed(ModelAndView mv, HttpSession session, HttpServletRequest request) {

	      List<Board> list = bService.reviewFeedList();

	      // 좋아요 목록 불러오기
	      // 로그인 된 유저 아이디 받아오기
	      session = request.getSession(false);
	      Member m = (Member)session.getAttribute("loginUser");
	      if(m != null && session != null) {
		      String id = m.getUserId();
	
		      // 좋아요.
		      List<LikeBoard> likeList = bService.likeList(id);
		      
		      // 보드 넘 담긴 list 만들기
		      List<Object> bNos = new ArrayList<>();
		      
		      for (LikeBoard e : likeList) {
		         bNos.add(e.getLike_board_number());
		      }
		      
		      
		      // 보관함 리스트 불러오기
		      List<SaveBoard> saveList = bService.saveList(id);
		      // 보관함 보드넘 담긴 리스트 만들기
		      List<Object> saveBoNos = new ArrayList<>();
		      for(SaveBoard e : saveList) {
		         saveBoNos.add(e.getSave_board_number());
		      }
		      
		      // 댓글 가져오기
		      List<Reply> reply = bService.replyList();
		      
		      mv.addObject("list", list);
		      mv.addObject("likeNoList", bNos);
		      mv.addObject("saveBoNos", saveBoNos);
		      mv.setViewName("mainboard/review_feedType");
	      } else {
	    	  mv.addObject("list", list);
	    	  mv.setViewName("mainboard/review_feedType");
	      }
	      return mv;
	   }

	   // 보드타입 : 전체
	   @RequestMapping(value = "allBoard.bo", method = RequestMethod.GET)
	   public ModelAndView allBoard(ModelAndView mv, HttpSession session) {

	      List<Board> list = bService.allBoardList();

	      // 로그인 된 유저 아이디 받아오기
	       String id = ((Member)session.getAttribute("loginUser")).getUserId();

	      mv.addObject("list", list);
	      mv.setViewName("mainboard/all_boardType");
	      return mv;
	   }

	   // 보드타입 : 소셜 게시판
	   @RequestMapping(value = "socialBoard.bo", method = RequestMethod.GET)
	   public ModelAndView socialBoard(ModelAndView mv, HttpSession session) {

	      List<Board> list = bService.socialBoardList();

	      // 로그인 된 유저 아이디 받아오기
	       String id = ((Member)session.getAttribute("loginUser")).getUserId();

	      mv.addObject("list", list);
	      mv.setViewName("mainboard/social_boardType");
	      return mv;
	   }

	   // 보드타입 : 찾아요 게시판
	   @RequestMapping(value = "findBoard.bo", method = RequestMethod.GET)
	   public ModelAndView findBoard(ModelAndView mv, HttpSession session) {

	      List<Board> list = bService.findBoardList();

	      // 로그인 된 유저 아이디 받아오기
	      String id = ((Member)session.getAttribute("loginUser")).getUserId();

	      mv.addObject("list", list);
	      mv.setViewName("mainboard/find_boardType");
	      return mv;
	   }


	   // 보드타입 : 컬럼 게시판
	   @RequestMapping(value = "columnBoard.bo", method = RequestMethod.GET)
	   public ModelAndView columnBoard(ModelAndView mv, HttpSession session) {

	      List<Board> list = bService.columnBoardList();

	      // 로그인 된 유저 아이디 받아오기
	      String id = ((Member)session.getAttribute("loginUser")).getUserId();

	      mv.addObject("list", list);
	      mv.setViewName("mainboard/column_boardType");
	      return mv;
	   }

	   // 보드타입 : 리뷰 게시판
	   @RequestMapping(value = "reviewBoard.bo", method = RequestMethod.GET)
	   public ModelAndView reviewBoard(ModelAndView mv, HttpSession session) {

	      List<Board> list = bService.reviewBoardList();

	      // 로그인 된 유저 아이디 받아오기
	       String id = ((Member)session.getAttribute("loginUser")).getUserId();

	      mv.addObject("list", list);
	      mv.setViewName("mainboard/review_boardType");
	      return mv;
	   }

	// 좋아요
	   @RequestMapping("socialLike.bo")
	   @ResponseBody
	   public int insertLike(int bNo, HttpSession session) {

	      // 로그인 된 유저 아이디 받아오기
	      String id = ((Member)session.getAttribute("loginUser")).getUserId();
	      

	      HashMap<String, Object> likePara = new HashMap<String, Object>();
	      likePara.put("id", id);
	      likePara.put("bNo", bNo);
	      
	      String like_status = bService.checkLike(likePara);
	      
	      int result;
	      
	      if(like_status == null) {
	         result = bService.insertLike(likePara);
	      } else {
	         result = bService.updateLike(likePara);
	      }

	      if (result > 0) {
		         int likeCount = bService.likeCount(bNo);
		         return likeCount;
		      } else {
		         throw new BoardException("좋아요 저장에 실패하였습니다. 고객센터로 문의 바랍니다.");
		         // 에러페이지 web.xml에 등록해야하는데 깃 합칠 때 충돌날까봐 등록안함.
		      }
		   }

		// 좋아요 취소
	   @RequestMapping("socialDeleteLike.bo")
	   @ResponseBody
	   public int deleteLike(int bNo, HttpSession session) {

	      // 로그인 된 유저 아이디 받아오기
	      String id = ((Member)session.getAttribute("loginUser")).getUserId();

	      HashMap<String, Object> likedeletePara = new HashMap<String, Object>();
	      likedeletePara.put("id", id);
	      likedeletePara.put("bNo", bNo);

	      int result = bService.deleteLike(likedeletePara);

	      if (result > 0) {
	         int likeCount = bService.likeCount(bNo);
	         return likeCount;
	      } else {
	         throw new BoardException("좋아요 취소에 실패하였습니다. 고객센터로 문의 바랍니다.");
	      }
	   }
	   

	   // 서영 - 보관함
	   @RequestMapping("socialKeep.bo")
	   @ResponseBody
	   public int insertKeep(int bNo, HttpSession session) {

	      // 로그인 된 유저 아이디 받아오기
	      String id = ((Member)session.getAttribute("loginUser")).getUserId();

	      HashMap<String, Object> keepPara = new HashMap<String, Object>();
	      keepPara.put("id", id);
	      keepPara.put("bNo", bNo);

	      String keep_status = bService.checkKeep(keepPara);
	      
	      System.out.println(keepPara);
	      
	      int result;

	      if(keep_status == null) {
	          result = bService.insertKeep(keepPara);
	       } else {
	          result = bService.updateKeep(keepPara);
	       }
	      
	      System.out.println(result);
	      
		return result;
	   }

	   // 서영 - 보관함 취소
	   @RequestMapping("socialDeleteKeep.bo")
	   @ResponseBody
	   public int deleteKeep(int bNo, HttpSession session) {

	      // 로그인 된 유저 아이디 받아오기
	      String id = ((Member)session.getAttribute("loginUser")).getUserId();

	      HashMap<String, Object> keepdeletePara = new HashMap<String, Object>();
	      keepdeletePara.put("id", id);
	      keepdeletePara.put("bNo", bNo);

	      int result = bService.deleteKeep(keepdeletePara);

	      if (result > 0) {
	         return result;
	      } else {
	         throw new BoardException("보관함 취소에 실패하였습니다. 고객센터로 문의 바랍니다.");
	      }
	   }

	   // 서영 - 신고하기
	   @RequestMapping(value = "notifyboard2", method = RequestMethod.POST)
	   @ResponseBody
	   public int[] notifyBoard2(@RequestParam(value = "op_val") int report_b,
	                          @RequestParam(value = "report_c") String report_c,
	                          @RequestParam(value = "report_f") String report_f,
	                          @RequestParam(value = "bno") int bno) {
	      ReportBoard report = new ReportBoard();
	      report.setReport_content(report_c);
	      report.setBoard_report_category(report_b);
	      report.setReport_board(bno);
	      report.setReport_from(report_f);
	      
	      int ynCheckReport = bService.ynCheckReport(report); // 이게 0보다 크면 이미 신고했던 게시물

	      // 신고가 들어가면 board의 신고횟수 1증가하게 하기
	      int insertRBoard = 0;
	      if (ynCheckReport == 0) { // 신고한 적 없으면 신고가능..
	         insertRBoard = bService.insertReportBoard2(report);
	      }

	      int result[] = {ynCheckReport, insertRBoard};
	      return result;
	   }
	   
	   @RequestMapping("selectBoardModal.bo")
	   public String selectBoardModal(int bNo, Model m, HttpSession session) {
	     // 로그인 된 유저 아이디 받아오기
	      String id = ((Member)session.getAttribute("loginUser")).getUserId();
	      
	      Board b = bService.selectBoardModal(bNo);
	      int likeCount = bService.selectlikeCount(bNo);
	      
	      Map<String, Object> data = new HashMap<>();
	      data.put("id", id);
	      data.put("bNo", bNo);
	      
	    
	      LikeBoard like = bService.selectLikeBoard(data);
	      
	      SaveBoard save = bService.selectSaveBoard(data);
	      
	      System.out.println(b.getBoard_number());
	      
	      System.out.println("모달 board" + b);
	      m.addAttribute("board", b);
	      m.addAttribute("like", like);
	      m.addAttribute("likeCount", likeCount);
	      m.addAttribute("save", save);
	      return "mainboard/modalPage";
	   }
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   	// 하윤 시작
		// 공통으로 넘기는 부분
		// 검색
		@RequestMapping(value="search.bo", method=RequestMethod.GET)
		public ModelAndView serachBoard(@RequestParam(value="searchText") String searchText, @RequestParam(value="category") String category,
									ModelAndView mv, HttpServletRequest request) {
		
		HttpSession session = request.getSession(false);
		Member m = (Member)session.getAttribute("loginUser");
		
		
		HashMap<String, String> search = new HashMap<String, String>();
		
		search.put("text", searchText);
		search.put("category", category);
		
		ArrayList<Board> list = bService.searchBoard(search);
		
		if(m != null && session != null) {
			mv.addObject("list", list);
		mv.addObject("category", category);
		mv.addObject("searchText", searchText);
		mv.setViewName("sideboard/after_search_boardType");
		} else {
			mv.addObject("list", list);
		mv.addObject("category", category);
		mv.addObject("searchText", searchText);
		mv.setViewName("sideboard/before_search_boardType");
			}
			
			
			return mv;
		}
	
		// 검색후 나머지 값들 ajax로 가져오기
		@RequestMapping(value="scrollSearchList")
		@ResponseBody
		public ArrayList<Board> scrollSearchList(@RequestParam(value="lastbno", required=false, defaultValue="0") int bno, 
												@RequestParam(value="searchText", required=false, defaultValue="0") String searchText,
												 @RequestParam(value="category", required=false, defaultValue="0") String category,
												HttpServletResponse response,  HttpServletRequest request) {
			

			// -1의 이유 >> 화면에 보이는 마지막 게시물의 번호를 가져왔기때문에 그게시물은 빼고 가져와야하기때문에
			int bnoToStart = bno - 1;
			
			HashMap<String, Object> scroll = new HashMap<String, Object>();
			scroll.put("lastbno", bnoToStart);
			scroll.put("searchText", searchText);
			scroll.put("category", category);

			ArrayList<Board> newList = bService.scrollSearchList(scroll);
			
			
			return newList;
		}
		
	// 상세페이지
	@RequestMapping(value="bDetail.bo", method=RequestMethod.GET)
	public ModelAndView boardDetail(HttpSession session, @RequestParam(value="bNum", required = false, defaultValue="0") int bno, ModelAndView mv) {
		
		if(session.getAttribute("loginUser") == null) {
			mv.setViewName("detailPage");
		} else {
		
			// 조회수 count
			int boardCount = bService.updateCount(bno);
			if(boardCount > 0) {
		
				// 게시글내용 + 썸네일 + 작성자정보만 가져오기
				Board board = bService.selectBoard(bno);
				
				
				// 음악/사진/영상 각각가져오기
				ArrayList<BoardFile> music = bService.selectMusicFile(bno);
				ArrayList<BoardFile> image = bService.selectImageFile(bno);
				ArrayList<BoardFile> video = bService.selectVideoFile(bno);
				
				// 제공형식있을경우 가져오기
				ArrayList<String> deliveryFormat = new ArrayList<String>();
				if(board.getSub_delivery_format() != null) {
					String[] splitFormat = board.getSub_delivery_format().split(",");
					for(int i = 0; i < splitFormat.length; i++) {
						deliveryFormat.add(splitFormat[i]);
					}
					mv.addObject("deliveryFormat", deliveryFormat);
				}
				
	
				mv.addObject("board", board);
				mv.addObject("music", music);
				mv.addObject("image", image);
				mv.addObject("video", video);
				mv.setViewName("detailPage");
			}
		}
		return mv;
	}
	
	
	// 댓글가져오기
	@RequestMapping(value="selectParentreply", method=RequestMethod.POST)
	@ResponseBody
	public JSONArray selectParentReply(@RequestParam("bno") int bno, HttpServletResponse response){
		
		response.setContentType("application/json; charset=UTF-8");
		
		JSONArray parentReply = new JSONArray();
		
		// 부모댓글 갯수가져오기
		int parentReplyCount = bService.parentReplyCount(bno);
		if(parentReplyCount > 0) {
			ArrayList<Reply> bigReply = new ArrayList<Reply>();
			ArrayList<Integer> childCount = new ArrayList<Integer>();
			
			// 부모댓글 가져오기
			bigReply = bService.selectReply(bno);
			
			
			// 자식댓글 count
			for(int i = 0; i < bigReply.size(); i++) { 
				int parent_number = bigReply.get(i).getParent_number(); 
				
				int result = bService.childReplyCount(parent_number); 
				
				childCount.add(result);
				
				JSONObject jreply = new JSONObject();
				
				jreply.put("reply_number", bigReply.get(i).getReply_number());
				jreply.put("reply_content", bigReply.get(i).getReply_content());
				jreply.put("r_write_date", bigReply.get(i).getR_write_date());
				jreply.put("step_number", bigReply.get(i).getStep_number());
				jreply.put("reply_enabled", bigReply.get(i).getReply_enabled());
				jreply.put("parent_number", bigReply.get(i).getParent_number());
				jreply.put("r_writer", bigReply.get(i).getR_writer());
				jreply.put("r_writer_nickName", bigReply.get(i).getR_writer_nickName());
				jreply.put("profile_pic", bigReply.get(i).getProfile_pic());
				jreply.put("ref_board_number", bigReply.get(i).getRef_board_number());
				
				
				jreply.put("childCount", childCount.get(i));
				
				parentReply.add(jreply);
			};
			
		}
		
		return parentReply;
	}
	
	// 댓글등록하기
	@RequestMapping(value = "insertreply", method = RequestMethod.POST)
	@ResponseBody
	public ArrayList<Reply> insertReply(@RequestParam(value="replycontent") String replycontent, 
							  @RequestParam(value="boardnum") int boardnum, @ModelAttribute(value="loginUser") Member m) {
		
		String loginUser = m.getUserId();
		
		// Reply클래스에 넣어서 insert할 댓글 넘기기
		Reply insertRp = new Reply();
		insertRp.setReply_content(replycontent);
		insertRp.setR_writer(loginUser);
		insertRp.setRef_board_number(boardnum);
		
		
		int insertresult = bService.insertReply(insertRp);
		
		ArrayList<Reply> parentReply = new ArrayList<Reply>();
		if(insertresult > 0) {
			parentReply = bService.selectReply(boardnum);
		}
		
		return parentReply;
	}
	
	// 대댓글 등록하기
	@RequestMapping(value="childreplyInsert", method=RequestMethod.POST)
	@ResponseBody
	public JSONArray childreplyInsert(@RequestParam(value="cReplyContent") String cReplyContent, 
								@RequestParam(value="parent_num") int parent_num,
								@RequestParam(value="board_num") int board_num,
								@ModelAttribute(value="loginUser") Member m) {
		
		String loginUser = m.getUserId();
		
		Reply insertreply = new Reply(); insertreply.setParent_number(parent_num);
		insertreply.setReply_content(cReplyContent);
		insertreply.setR_writer(loginUser);
		insertreply.setRef_board_number(board_num);
		  
		int result = bService.insertChildReply(insertreply);
		
		JSONArray crArray = new JSONArray();
		if(result > 0) {
			ArrayList<Reply> childReply = bService.selectchildReply(parent_num);
			
			int childCount = bService.childReplyCount(parent_num);
			
			JSONObject object = new JSONObject();
			
			for(int r = 0; r < childReply.size(); r++) {
				
				object.put("reply_number", childReply.get(r).getReply_number());
				object.put("reply_content", childReply.get(r).getReply_content());
				object.put("r_write_date", childReply.get(r).getR_write_date());
				object.put("step_number", childReply.get(r).getStep_number());
				object.put("reply_enabled", childReply.get(r).getReply_enabled());
				object.put("parent_number", childReply.get(r).getParent_number());
				object.put("r_writer", childReply.get(r).getR_writer());
				object.put("r_writer_nickName", childReply.get(r).getR_writer_nickName());
				object.put("profile_pic", childReply.get(r).getProfile_pic());
				object.put("ref_board_number", childReply.get(r).getRef_board_number());
				
			}
			
			object.put("childCount", childCount);
			
			crArray.add(object);
			
		} else {
			//에러페이지로 보내기
		}
		
		return crArray;
		
	}
	
	
	// 대댓글 가져오기
	@RequestMapping(value="childReply", method=RequestMethod.POST)
	@ResponseBody
	public ArrayList<Reply> cildReply(@RequestParam(value="parent_num", required = false, defaultValue = "0") int parent_num) {
		
		ArrayList<Reply> childReply = bService.selectchildReply(parent_num);
		
		return childReply;
	}
	
	// 댓글삭제
	@RequestMapping(value="deleteParentReply")
	@ResponseBody
	public int deleteParentReply(@RequestParam("bno") int bno, @RequestParam("parent_num") int parent_num) {
		

		Reply r = new Reply();
		
		r.setParent_number(parent_num);
		r.setRef_board_number(bno);
		
		int result = bService.deleteParentReply(r);
		
		return result;
	}
	
	// 대댓글 삭제
	@RequestMapping("deleteChildReply")
	@ResponseBody
	public int deleteChildReply(@RequestParam(value="child_num") int child_num, @RequestParam(value="parent_num") int parent_num) {
		
		HashMap<String, Integer> childcomment = new HashMap<String, Integer>();
		
		childcomment.put("child_num", child_num);
		childcomment.put("parent_num", parent_num);
		
		int result = bService.deleteChildReply(childcomment);
		
		// 대댓글갯수 다시가져와서 보내기
		int child_count = 0;
		if(result > 0) {
			child_count = bService.childReplyCount(parent_num);
		}
		
		return child_count;
		
	}
	
	// detailPage에서 신고하기
	@RequestMapping(value="notifyboard", method=RequestMethod.POST)
	@ResponseBody
	public int notifyBoard(@RequestParam(value="op_val") int report_b,
							@RequestParam(value="report_c") String report_c,
							@RequestParam(value="bno") int bno, @ModelAttribute(value="loginUser") Member m) {
		
		String loginUser = m.getUserId();
		
		ReportBoard report = new ReportBoard();
		report.setReport_content(report_c);
		report.setBoard_report_category(report_b);
		report.setReport_from(loginUser);
		report.setReport_board(bno);
		
		int insertRBoard = bService.insertReportBoard(report);
		
		// 신고가 들어가면 board의 신고횟수 1증가하게 하기
		int reportCountUp = 0;
		if(insertRBoard > 0) {
			reportCountUp = bService.updateReportCount(bno);
		}
		
		return reportCountUp;
		
	}
	
	// 게시글삭제
	@RequestMapping(value="deleteBoard")
	public String deleteBoard(@RequestParam(value="bNum") int bno) {
		
		int result = bService.deleteBoard(bno);
		
		if(result > 0) {
			return "redirect:/";
		} else {
			return "../common/errorPage";
		}
	}
	
	
	// 하윤구현부분(사이드바)
	// 1. 소식게시판
	@RequestMapping("fresh.bo")
	public ModelAndView freshBoard(HttpSession session,ModelAndView mv) {
		
		if(session.getAttribute("loginUser") == null) {
			mv.setViewName("sideboard/fresh_feedType");
		} else {
			// 가입한 사람들이 처음 올린 글 가져오기
			List<Board> list = bService.selectFirstBoard();
			
			// 좋아요 목록 불러오기
		      // 로그인 된 유저 아이디 받아오기
		      String id = ((Member)session.getAttribute("loginUser")).getUserId();

		      // 좋아요.
		      List<LikeBoard> likeList = bService.likeList(id);
		      
		      // 보드 넘 담긴 list 만들기
		      List<Object> bNos = new ArrayList<>();
		      
		      for (LikeBoard e : likeList) {
		         bNos.add(e.getLike_board_number());
		      }
		      
		      
		      // 보관함 리스트 불러오기
		      List<SaveBoard> saveList = bService.saveList(id);
		      // 보관함 보드넘 담긴 리스트 만들기
		      List<Object> saveBoNos = new ArrayList<>();
		      for(SaveBoard e : saveList) {
		         saveBoNos.add(e.getSave_board_number());
		      }
		      
		      // 댓글 가져오기
		      List<Reply> reply = bService.replyList();
		      
		      mv.addObject("list", list);
		      mv.addObject("likeNoList", bNos);
		      mv.addObject("saveBoNos", saveBoNos);
		      mv.setViewName("sideboard/fresh_feedType");
		}
		
		return mv;
	}
	
	// 2. 팔로우게시판
	@RequestMapping(value="follow.bo", method = RequestMethod.GET)
	public ModelAndView followBoard(HttpSession session, ModelAndView mv) {
		
		
		if(session.getAttribute("loginUser") == null) {
			mv.setViewName("sideboard/follow_boardType");
		} else {
			Member m = (Member)session.getAttribute("loginUser");
			String loginUser = m.getUserId();
			// 팔로우한 사람들의 게시물 가져오기
			ArrayList<Board> list = bService.followBoardList(loginUser);
		
			mv.addObject("list",list);
			mv.setViewName("sideboard/follow_boardType");
		}
		
		return mv;
	}
	
	// 사이드 탭에서 스크롤 내릴때마다 ajax로 서버에서 데이터 가져오기
	@RequestMapping(value="scrollBoardList")
	@ResponseBody
	public ArrayList<Board> scrollBoardList(@ModelAttribute("loginUser") Member m, @RequestParam(value="lastbno", required=false, defaultValue="0") int bno, HttpServletResponse response) {
		// 들어온값이 없을때 무조건 0으로 시작하게
		
		
		// -1의 이유 >> 화면에 보이는 마지막 게시물의 번호를 가져왔기때문에 그게시물은 빼고 가져와야하기때문에
		String loginUser = m.getUserId();
		int bnoToStart = bno - 1;
		
		HashMap<String, Object> scroll = new HashMap<String, Object>();
		scroll.put("loginUser", loginUser);
		scroll.put("bnoToStart", bnoToStart);
		
		ArrayList<Board> newList = bService.scrollNewFollowList(scroll);
		
		return newList;
	}
	
	// allBoard타입 스크롤 내릴때 값가져오기
	@RequestMapping(value="scrollAllBoardList")
	@ResponseBody
	public ArrayList<Board> scrollAllBoardList(@RequestParam(value="lastbno", required=false, defaultValue="0") int bno, HttpServletResponse response){
		
		int bnoToStart = bno - 1;
		
		
		ArrayList<Board> newList = bService.scrollAllBoardList(bnoToStart);
		
		
		return newList;
	}
	
	// 4개의 메뉴 board타입 스크롤내릴때 값가져오기
	@RequestMapping(value="scrollCategoryBoard")
	@ResponseBody
	public ArrayList<Board> scrollCategroyBoard(@RequestParam(value="lastbno", required=false, defaultValue="0") int bno, 
												@RequestParam(value="category", required=false, defaultValue="0") int category,
												HttpServletResponse response){
		
		int bnoToStart = bno - 1;
		
		HashMap<String, Object> scroll = new HashMap<String, Object>();
		scroll.put("category", category);
		scroll.put("bnoToStart", bnoToStart);
		
		ArrayList<Board> newList = bService.scrollCategoryBoard(scroll);
		
		return newList;
	}
	
		
	// 3. 보관함
	@RequestMapping(value="save.bo")
	public ModelAndView saveBoard(HttpSession session, ModelAndView mv) {
		
		Member m = (Member)session.getAttribute("loginUser");
		String loginUser = m.getUserId();
		
		if(session.getAttribute("loginUser") == null) {
			mv.setViewName("sideboard/save_boardType");
		} else {
			
			ArrayList<SaveBoard> list = bService.selectSaveBoardList(loginUser);
			
			mv.addObject("list", list);
			mv.setViewName("sideboard/save_boardType");
		}
		
		
		
		return mv;
	}
	
	// 보관함 탭에서 보관한 list가져오기
	@RequestMapping(value="scrollSaveBoardList")
	@ResponseBody
	public ArrayList<SaveBoard> scrollSaveBoardList(@ModelAttribute("loginUser") Member m, @RequestParam(value="lastSbno", required=false, defaultValue="0") int lastSbno){
		// 들어온값이 없을때 무조건 0으로 시작하게
		
		String loginUser = m.getUserId();
		
		HashMap<String, Object> scroll = new HashMap<String, Object>();
		scroll.put("loginUser", loginUser);
		scroll.put("lastSbno", lastSbno - 1); // 해당하는 SAVE_BOARD_CODE는 이미왔기때문에(다음번호를 가져오기위해)
		
		ArrayList<SaveBoard> scrollList = bService.selectScrollSaveList(scroll);
		
		return scrollList;
	}
	
	// 4. 글쓰기
	@RequestMapping(value="boardWrite.bo")
	public String boardWrite() {
		
		return "writePage";
	}
	
	@RequestMapping(value="insertBoard.bo", method=RequestMethod.POST)
	public ModelAndView insertBoard(@ModelAttribute("loginUser") Member m, @RequestParam(value="title") String title, @RequestParam(value="menu_category") int menuCate, 
							  @RequestParam(value="find_category", required=false) String searchType, @RequestParam(value="review_top", required=false) String reviewTop,
							  @RequestParam(value="review_bottom", required=false) String review_bottom,
							  @RequestParam(value="content_area") String content, @RequestParam(value="thumbnail_file", required=false) MultipartFile thumbnail_file,
							  @RequestParam(value="image1", required=false) MultipartFile image1, @RequestParam(value="image2", required=false) MultipartFile image2,
							  @RequestParam(value="image3", required=false) MultipartFile image3, @RequestParam(value="image4", required=false) MultipartFile image4,
							  @RequestParam(value="audio",  required=false) MultipartFile audio[], @RequestParam(value="video", required=false) MultipartFile video[], 
							  @RequestParam(value="curriculum_content", required=false) String curriculum , @RequestParam(value="main_address", required=false) String mainAddress, 
							  @RequestParam(value="sub_address", required=false) String subAddress, @RequestParam(value="insertFormat", required=false) String format, HttpServletRequest request,
							  ModelAndView mv) {
		
		
		String loginUser = m.getUserId();
		
		// 게시글 승인여부 >> 소셜/리뷰/전문가찾아요는 Y로, 학생찾아요,연습실,컬럼은 W로 진행
		// 찾아요 구분(search_type)은 찾아요만 >> 전문가 찾아요는 ft / 학생 찾아요는 fs / 연습실은 fp
		// 세부카테고리는 나중에 입력하기
		// Board모음(필수조건)
		
		Board insertBoard = new Board();
  
		insertBoard.setBoard_title(title); 
		insertBoard.setBoard_content(content);
		insertBoard.setB_writer(loginUser); 
		insertBoard.setBoard_category(menuCate);
		
		
		// 커리큘럼
		if(!curriculum.equals("null")) {
			insertBoard.setSub_curriculum(curriculum);
		}
		// 장소
		if(!mainAddress.equals("null") && !subAddress.equals("null")) {
			insertBoard.setSub_address(mainAddress + " / " + subAddress);
		} else if(!mainAddress.equals("null") && subAddress.equals("null")) {
			insertBoard.setSub_address(mainAddress + " / ");
		} 
		// 제공 형식
		if(!format.equals("null")) {
			insertBoard.setSub_delivery_format(format);
		}
		// 상세카테고리
		if(!searchType.equals("null")) { 
			insertBoard.setSearch_type(searchType); 
		}
		if(!reviewTop.equals("null")) {
			// 리뷰선택카테고리 / 사용자가 입력한 세부카테고리 << 형식으로 들어가게 하기
			if(!review_bottom.equals("null")) {
				insertBoard.setSub_category(reviewTop + " / " + review_bottom);
			} else {
				insertBoard.setSub_category(reviewTop);
			}
		}
		
		
		bService.insertBoard(insertBoard);
		
		// boardNumber반환받기
		int boardNumber = insertBoard.getBoard_number();
		
		
		
		if(boardNumber > 0) {
			// BoardFile모음 
			ArrayList<BoardFile> boardFile = new ArrayList<BoardFile>();
			
			
			// 경로
//			String root = request.getSession().getServletContext().getRealPath("resources");
			String root = "/spring/resources/";
			String imageRoot = root + "boardImageFile/";
			String audioRoot = root + "boardAudioFile/";
			String videoRoot = root + "boardVideoFile/";
			
			// 썸네일 저장하는 vo
			BoardFile thumbnailList = new BoardFile();
			if(!thumbnail_file.getOriginalFilename().equals("")) {
				// 기존이름에 썸네일인지 알려주기
				String thumbnailChangeName =imageChangeName(thumbnail_file, request);
				String extention = thumbnail_file.getOriginalFilename().substring(thumbnail_file.getOriginalFilename().indexOf("."));
				thumbnailList.setFile_change_name(thumbnailChangeName);
				thumbnailList.setBoard_number(boardNumber);
				thumbnailList.setFile_origin_name(thumbnail_file.getOriginalFilename());
				thumbnailList.setFile_path(imageRoot);
				thumbnailList.setFile__extension_name(extention);
				thumbnailList.setFile_uploader(loginUser);
				thumbnailList.setFile_thumbnail(Integer.toString(1).charAt(0));
				thumbnailList.setFile_type(1);
				thumbnailList.setFile_size((thumbnail_file.getSize())+"");
				boardFile.add(thumbnailList);
				
			} else if(thumbnail_file.getOriginalFilename().equals("")) {
				// 썸내일 없을경우 기본이미지?
				thumbnailList.setFile_origin_name("썸네일-기본이미지.gif");
				thumbnailList.setFile_change_name("썸네일-기본이미지.gif");
				thumbnailList.setBoard_number(boardNumber);
				String defaultImageRoot = root + "/images";
				thumbnailList.setFile__extension_name(".gif");
				thumbnailList.setFile_path(defaultImageRoot);
				thumbnailList.setFile_uploader(loginUser);
				thumbnailList.setFile_thumbnail(Integer.toString(1).charAt(0));
				thumbnailList.setFile_type(1);
				thumbnailList.setFile_size("0");
				boardFile.add(thumbnailList);
				
			}
			
			// 이미지4개 저장하는 vo
			BoardFile imageinfo1 = new BoardFile();
			BoardFile imageinfo2 = new BoardFile();
			BoardFile imageinfo3 = new BoardFile();
			BoardFile imageinfo4 = new BoardFile();
			// 이미지가 들어올경우
			if(!image1.getOriginalFilename().equals("")) {
				String changeImage1 = imageChangeName(image1, request);
				String extention = image1.getOriginalFilename().substring(image1.getOriginalFilename().indexOf("."));
				imageinfo1.setFile_origin_name(image1.getOriginalFilename());
				imageinfo1.setFile_change_name(changeImage1);
				imageinfo1.setBoard_number(boardNumber);
				imageinfo1.setFile_path(imageRoot);
				imageinfo1.setFile__extension_name(extention);
				imageinfo1.setFile_uploader(loginUser);
				imageinfo1.setFile_thumbnail(Integer.toString(0).charAt(0));
				imageinfo1.setFile_type(1);
				imageinfo1.setFile_size((image1.getSize())+"");
				boardFile.add(imageinfo1);
			} 
			if(!image2.getOriginalFilename().equals("")) {
				String changeImage2 = imageChangeName(image2, request);
				String extention = image2.getOriginalFilename().substring(image2.getOriginalFilename().indexOf("."));
				imageinfo2.setFile_origin_name(image2.getOriginalFilename());
				imageinfo2.setFile_change_name(changeImage2);
				imageinfo2.setBoard_number(boardNumber);
				imageinfo2.setFile_path(imageRoot);
				imageinfo2.setFile__extension_name(extention);
				imageinfo2.setFile_uploader(loginUser);
				imageinfo2.setFile_thumbnail(Integer.toString(0).charAt(0));
				imageinfo2.setFile_type(1);
				imageinfo2.setFile_size((image2.getSize())+"");
				boardFile.add(imageinfo2);
			} 
			if(!image3.getOriginalFilename().equals("")) {
				String changeImage3 = imageChangeName(image3, request);
				String extention = image3.getOriginalFilename().substring(image3.getOriginalFilename().indexOf("."));
				imageinfo3.setFile_origin_name(image3.getOriginalFilename());
				imageinfo3.setFile_change_name(changeImage3);
				imageinfo3.setBoard_number(boardNumber);
				imageinfo3.setFile_path(imageRoot);
				imageinfo3.setFile__extension_name(extention);
				imageinfo3.setFile_uploader(loginUser);
				imageinfo3.setFile_thumbnail(Integer.toString(0).charAt(0));
				imageinfo3.setFile_type(1);
				imageinfo3.setFile_size((image3.getSize())+"");
				boardFile.add(imageinfo3);
			} 
			if(!image4.getOriginalFilename().equals("")) {
				String changeImage4 = imageChangeName(image4, request);
				String extention = image4.getOriginalFilename().substring(image4.getOriginalFilename().indexOf("."));
				imageinfo4.setFile_origin_name(image4.getOriginalFilename());
				imageinfo4.setFile_change_name(changeImage4);
				imageinfo4.setBoard_number(boardNumber);
				imageinfo4.setFile_path(imageRoot);
				imageinfo4.setFile__extension_name(extention);
				imageinfo4.setFile_uploader(loginUser);
				imageinfo4.setFile_thumbnail(Integer.toString(0).charAt(0));
				imageinfo4.setFile_type(1);
				imageinfo4.setFile_size((image4.getSize())+"");
				boardFile.add(imageinfo4);
			}
			
			// 음원이 들어올 경우
			if(!audio[0].isEmpty()) {
				ArrayList<String> changeName = audioChangeName(audio, request);
				for(int i = 0; i < audio.length; i++) {
					BoardFile audioList = new BoardFile();
					String extention = audio[i].getOriginalFilename().substring(audio[i].getOriginalFilename().indexOf("."));
					audioList.setFile_change_name(changeName.get(i));
					audioList.setFile_origin_name(audio[i].getOriginalFilename());
					audioList.setBoard_number(boardNumber);
					audioList.setFile_path(audioRoot);
					audioList.setFile__extension_name(extention);
					audioList.setFile_uploader(loginUser);
					audioList.setFile_thumbnail(Integer.toString(0).charAt(0));
					audioList.setFile_type(3);
					audioList.setFile_size((audio[i].getSize())+"");
					boardFile.add(audioList);
				}
			}
			
			// 비디오가 들어올 경우
			if(!video[0].isEmpty()) {
				ArrayList<String> changeName = videoChangeName(video, request);
				for(int i = 0; i < video.length; i++) {
					BoardFile videoList = new BoardFile();
					String extention = video[i].getOriginalFilename().substring(video[i].getOriginalFilename().indexOf("."));
					videoList.setFile_change_name(changeName.get(i));
					videoList.setFile_origin_name(video[i].getOriginalFilename());
					videoList.setBoard_number(boardNumber);
					videoList.setFile_path(videoRoot);
					videoList.setFile__extension_name(extention);
					videoList.setFile_uploader(loginUser);
					videoList.setFile_thumbnail(Integer.toString(0).charAt(0));
					videoList.setFile_type(2);
					videoList.setFile_size((video[i].getSize())+"");
					boardFile.add(videoList);
				}
			}
			
			if(boardFile.size() > 0) {
				//DB에 파일들 저장
				int fileResult = bService.insertBoardFile(boardFile);
			}
		}
		
		if(insertBoard.getBoard_category() == 2 && insertBoard.getSearch_type().equals("fs")) {
			mv.setViewName("redirect:allFeed.bo");
		} else if(insertBoard.getBoard_category() == 2 && insertBoard.getSearch_type().equals("fp")) {
			mv.setViewName("redirect:allFeed.bo");
		} else if(insertBoard.getBoard_category() == 3) {
			mv.setViewName("redirect:allFeed.bo");
		} else {
			mv.setViewName("redirect:bDetail.bo?bNum=" + boardNumber);
		}
		
		return mv;
	}

	
	
	// 5. 게시글수정
	@RequestMapping(value = "modifyBoard.bo")
	public ModelAndView modifyBoard(@RequestParam(value="bNum") int bNum, ModelAndView mv) {
		
		Board board = bService.selectBoard(bNum);
		
		ArrayList<BoardFile> imageFiles = bService.selectImageFile(bNum);
		ArrayList<BoardFile> audioFiles = bService.selectMusicFile(bNum);
		ArrayList<BoardFile> videoFiles = bService.selectVideoFile(bNum);
		
		
		mv.addObject("list", board);
		mv.addObject("imageFiles", imageFiles);
		mv.addObject("audioFiles", audioFiles);
		mv.addObject("videoFiles", videoFiles);
		mv.setViewName("modifyPage");
		
		return mv;
	}
	
	
	// 게시글 수정중 이미지삭제
	@RequestMapping(value="deleteFile")
	@ResponseBody
	public int deleteFile(@RequestParam(value="fileNum") int fileNum, @RequestParam(value="fileName") String fileName, @RequestParam(value="filePath") String filePath) {
		
		int deleteFile = bService.deleteFile(fileNum);
		if(deleteFile > 0) {
			File savefile = new File(filePath+ "/" + fileName);
			if(savefile.exists()) {
				savefile.delete();
			}
		}
		return deleteFile;
	}
	
	// 수정한게시글 DB
	@RequestMapping(value="updateBoard.bo")
	public String updateBoard(@RequestParam(value="bNum") int bNum,@ModelAttribute("loginUser") Member m, @RequestParam(value="title") String title, @RequestParam(value="menu_category") int menuCate, 
							  @RequestParam(value="find_category", required=false) String searchType, @RequestParam(value="review_top", required=false) String reviewTop,
							  @RequestParam(value="review_bottom", required=false) String review_bottom,
							  @RequestParam(value="content_area") String content, @RequestParam(value="thumbnail_file", required=false) MultipartFile thumbnail_file,
							  @RequestParam(value="image1", required=false) MultipartFile image1, @RequestParam(value="image2", required=false) MultipartFile image2,
							  @RequestParam(value="image3", required=false) MultipartFile image3, @RequestParam(value="image4", required=false) MultipartFile image4,
							  @RequestParam(value="audio",  required=false) MultipartFile audio[], @RequestParam(value="video", required=false) MultipartFile video[], 
							  @RequestParam(value="curriculum_content", required=false) String curriculum , @RequestParam(value="main_address", required=false) String mainAddress, 
							  @RequestParam(value="sub_address", required=false) String subAddress, @RequestParam(value="insertFormat", required=false) String format, HttpServletRequest request) {
		
		
		String loginUser = m.getUserId();
		
		Board updateBoard = new Board();
		
		updateBoard.setBoard_number(bNum);
		updateBoard.setBoard_title(title); 
		updateBoard.setBoard_content(content);
		updateBoard.setBoard_category(menuCate);
		
		// 커리큘럼
		if(!curriculum.equals("null")) {
			updateBoard.setSub_curriculum(curriculum);
		}
		// 장소
		if(!mainAddress.equals("null") && !subAddress.equals("null")) {
			updateBoard.setSub_address(mainAddress + " / " + subAddress);
		} else if(!mainAddress.equals("null") && subAddress.equals("null")) {
			updateBoard.setSub_address(mainAddress + " / ");
		} 
		// 제공 형식
		if(!format.equals("null")) {
			updateBoard.setSub_delivery_format(format);
		}
		// 상세카테고리
		if(!searchType.equals("null")) { 
			updateBoard.setSearch_type(searchType); 
		}
		if(!reviewTop.equals("null")) {
			// 리뷰선택카테고리 / 사용자가 입력한 세부카테고리 << 형식으로 들어가게 하기
			if(!review_bottom.equals("null")) {
				updateBoard.setSub_category(reviewTop + " / " + review_bottom);
			} else {
				updateBoard.setSub_category(reviewTop);
			}
		}
		
		bService.updateBoard(updateBoard);
		
		
		// BoardFile모음
		ArrayList<BoardFile> boardFile = new ArrayList<BoardFile>();
		
		// 경로
//		String root = request.getSession().getServletContext().getRealPath("resources");
		String root = "/spring/resources/";
		String imageRoot = root + "boardImageFile/";
		String audioRoot = root + "boardAudioFile/";
		String videoRoot = root + "boardVideoFile/";
		
		
		BoardFile thumbnailList = new BoardFile();
		
		// 썸네일 여부 확인
		BoardFile thumbnailSelect = bService.selectThumbnail(bNum);
		
		// 새로운 썸네일이 들어올때
		if(!thumbnail_file.getOriginalFilename().equals("")) {
			
			// 기존에 썸네일이 있으면 삭제해주기
			// 새로들어온 값이있으면 삭제 아니면 그대로 가기
			if(thumbnailSelect.getFile_origin_name() != "") {
				int deleteFile = bService.deleteFile(thumbnailSelect.getFile_number());
				if(deleteFile > 0) {
					File savefile = new File(thumbnailSelect.getFile_path()+ "/" + thumbnailSelect.getFile_change_name());
					if(savefile.exists()) {
						savefile.delete();
					}
				}
			}
			
			// 들어온썸네일이 있을 경우 
			if(!thumbnail_file.getOriginalFilename().equals("")) {
				String thumbnailChangeName =imageChangeName(thumbnail_file, request);
				String extention = thumbnail_file.getOriginalFilename().substring(thumbnail_file.getOriginalFilename().indexOf("."));
				thumbnailList.setFile_change_name(thumbnailChangeName);
				thumbnailList.setBoard_number(bNum);
				thumbnailList.setFile_origin_name(thumbnail_file.getOriginalFilename());
				thumbnailList.setFile_path(imageRoot);
				thumbnailList.setFile__extension_name(extention);
				thumbnailList.setFile_uploader(loginUser);
				thumbnailList.setFile_thumbnail(Integer.toString(1).charAt(0));
				thumbnailList.setFile_type(1);
				thumbnailList.setFile_size((thumbnail_file.getSize())+"");
				boardFile.add(thumbnailList);
			} else if(thumbnail_file.getOriginalFilename().equals("")) {
				// 썸내일 없을경우 기본이미지
				thumbnailList.setFile_origin_name("썸네일-기본이미지.gif");
				thumbnailList.setFile_change_name("썸네일-기본이미지.gif");
				thumbnailList.setBoard_number(bNum);
				String defaultImageRoot = root + "/images";
				thumbnailList.setFile__extension_name(".gif");
				thumbnailList.setFile_path(defaultImageRoot);
				thumbnailList.setFile_uploader(loginUser);
				thumbnailList.setFile_thumbnail(Integer.toString(1).charAt(0));
				thumbnailList.setFile_type(1);
				thumbnailList.setFile_size("0");
				boardFile.add(thumbnailList);
				
			}
		}
			// 이미지4개 저장하는 vo
			BoardFile imageinfo1 = new BoardFile();
			BoardFile imageinfo2 = new BoardFile();
			BoardFile imageinfo3 = new BoardFile();
			BoardFile imageinfo4 = new BoardFile();
			// 이미지가 들어올경우
			if(!image1.getOriginalFilename().equals("")) {
				String changeImage1 = imageChangeName(image1, request);
				String extention = image1.getOriginalFilename().substring(image1.getOriginalFilename().indexOf("."));
				imageinfo1.setFile_origin_name(image1.getOriginalFilename());
				imageinfo1.setFile_change_name(changeImage1);
				imageinfo1.setBoard_number(bNum);
				imageinfo1.setFile_path(imageRoot);
				imageinfo1.setFile__extension_name(extention);
				imageinfo1.setFile_uploader(loginUser);
				imageinfo1.setFile_thumbnail(Integer.toString(0).charAt(0));
				imageinfo1.setFile_type(1);
				imageinfo1.setFile_size((image1.getSize())+"");
				boardFile.add(imageinfo1);
			} 
			if(!image2.getOriginalFilename().equals("")) {
				String changeImage2 = imageChangeName(image2, request);
				String extention = image2.getOriginalFilename().substring(image2.getOriginalFilename().indexOf("."));
				imageinfo2.setFile_origin_name(image2.getOriginalFilename());
				imageinfo2.setFile_change_name(changeImage2);
				imageinfo2.setBoard_number(bNum);
				imageinfo2.setFile_path(imageRoot);
				imageinfo2.setFile__extension_name(extention);
				imageinfo2.setFile_uploader(loginUser);
				imageinfo2.setFile_thumbnail(Integer.toString(0).charAt(0));
				imageinfo2.setFile_type(1);
				imageinfo2.setFile_size((image2.getSize())+"");
				boardFile.add(imageinfo2);
			} 
			if(!image3.getOriginalFilename().equals("")) {
				String changeImage3 = imageChangeName(image3, request);
				String extention = image3.getOriginalFilename().substring(image3.getOriginalFilename().indexOf("."));
				imageinfo3.setFile_origin_name(image3.getOriginalFilename());
				imageinfo3.setFile_change_name(changeImage3);
				imageinfo3.setBoard_number(bNum);
				imageinfo3.setFile_path(imageRoot);
				imageinfo3.setFile__extension_name(extention);
				imageinfo3.setFile_uploader(loginUser);
				imageinfo3.setFile_thumbnail(Integer.toString(0).charAt(0));
				imageinfo3.setFile_type(1);
				imageinfo3.setFile_size((image3.getSize())+"");
				boardFile.add(imageinfo3);
			} 
			if(!image4.getOriginalFilename().equals("")) {
				String changeImage4 = imageChangeName(image4, request);
				String extention = image4.getOriginalFilename().substring(image4.getOriginalFilename().indexOf("."));
				imageinfo4.setFile_origin_name(image4.getOriginalFilename());
				imageinfo4.setFile_change_name(changeImage4);
				imageinfo4.setBoard_number(bNum);
				imageinfo4.setFile_path(imageRoot);
				imageinfo4.setFile__extension_name(extention);
				imageinfo4.setFile_uploader(loginUser);
				imageinfo4.setFile_thumbnail(Integer.toString(0).charAt(0));
				imageinfo4.setFile_type(1);
				imageinfo4.setFile_size((image4.getSize())+"");
				boardFile.add(imageinfo4);
			}
			
			// 음원이 들어올 경우
			if(!audio[0].isEmpty()) {
				ArrayList<String> changeName = audioChangeName(audio, request);
				for(int i = 0; i < audio.length; i++) {
					BoardFile audioList = new BoardFile();
					String extention = audio[i].getOriginalFilename().substring(audio[i].getOriginalFilename().indexOf("."));
					audioList.setFile_change_name(changeName.get(i));
					audioList.setFile_origin_name(audio[i].getOriginalFilename());
					audioList.setBoard_number(bNum);
					audioList.setFile_path(audioRoot);
					audioList.setFile__extension_name(extention);
					audioList.setFile_uploader(loginUser);
					audioList.setFile_thumbnail(Integer.toString(0).charAt(0));
					audioList.setFile_type(3);
					audioList.setFile_size((audio[i].getSize())+"");
					boardFile.add(audioList);
				}
			}
			
			// 비디오가 들어올 경우
			if(!video[0].isEmpty()) {
				ArrayList<String> changeName = videoChangeName(video, request);
				for(int i = 0; i < video.length; i++) {
					BoardFile videoList = new BoardFile();
					String extention = video[i].getOriginalFilename().substring(video[i].getOriginalFilename().indexOf("."));
					videoList.setFile_change_name(changeName.get(i));
					videoList.setFile_origin_name(video[i].getOriginalFilename());
					videoList.setBoard_number(bNum);
					videoList.setFile_path(videoRoot);
					videoList.setFile__extension_name(extention);
					videoList.setFile_uploader(loginUser);
					videoList.setFile_thumbnail(Integer.toString(0).charAt(0));
					videoList.setFile_type(2);
					videoList.setFile_size((video[i].getSize())+"");
					boardFile.add(videoList);
				}
			}		
			
			if(boardFile.size() > 0) {
				//DB에 파일들 저장
				int fileResult = bService.insertBoardFile(boardFile);
			}
		
		return "redirect:bDetail.bo?bNum=" + bNum;
	}
	
	
	// 카테고리별 세부검색
	// 찾아요
	@RequestMapping(value="searchType.bo")
	public ModelAndView searchType(@RequestParam(value="searchType[]", required = false, defaultValue="0") String[] searchType, ModelAndView mv) {
		
		ArrayList<String> searchName= new ArrayList<>();
		
		
		for(int i = 0 ; i < searchType.length; i++) {
			searchName.add(searchType[i]);
		}
		
		
		ArrayList<Board> list = bService.selectSearchTypeList(searchName);
		
		
		if(!searchType[0].equals("0")) {
			mv.addObject("list", list);
			mv.addObject("boardCategory", 2);
			mv.addObject("searchType", searchName);
			mv.setViewName("mainboard/searchsubCate");
		} else {
			mv.setViewName("redirect:findFeed.bo");
		}
		
		
		return mv;
	}
	
	// 컬럼
	@RequestMapping(value="searchColumn.bo")
	public ModelAndView searchColumn(@RequestParam(value="searchUserNickName") String nickName, ModelAndView mv) {
		
		ArrayList<Board> list = bService.selectSearchColumnList(nickName);
		
		mv.addObject("list", list);
		mv.addObject("searchUserNickName", nickName);
		mv.addObject("boardCategory", 3);
		mv.setViewName("mainboard/searchsubCate");
		
		return mv;
	}
	
	// 리뷰
	@RequestMapping(value="searchCate.bo")
	public ModelAndView searchCate(@RequestParam(value="subCate[]",required = false, defaultValue="0") String[] subCate, 
								   @RequestParam(value="detailSearch",required = false) String detailText, ModelAndView mv) {
		
		ArrayList<String> searchName = new ArrayList<>();
		ArrayList<String> subCategory = new ArrayList<>();
		
		System.out.println("detailText : " + detailText);
		
		if(detailText != "") {
			for(int i = 0 ; i < subCate.length; i++) {
				// DB로 보낼값
				searchName.add(subCate[i] + " /"); // 앞검색을 해주기 위해서(상위카테고리 / 세부카테고리입력) << 이런식으로 입력되어있음
				// view로 보낼값
				subCategory.add(subCate[i]);
			}
			
			if(!detailText.equals("")) {
				searchName.add("/ " + detailText); // 뒷검색을 해주기 위해서(상위카테고리 / 세부카테고리입력) << 이런식으로 입력되어있음
			}
		} else {
			for(int i = 0 ; i < subCate.length; i++) {
				// DB로 보낼값
				searchName.add(subCate[i]); // 앞검색을 해주기 위해서(상위카테고리 / 세부카테고리입력) << 이런식으로 입력되어있음
				// view로 보낼값
				subCategory.add(subCate[i]);
			}
			
		}
		
		
		
		ArrayList<Board> list = bService.selectSearchCateList(searchName);
		
		if(!subCate[0].equals("0")) {
			mv.addObject("list", list);
			mv.addObject("boardCategory", 4);
			mv.addObject("subCate", subCategory);
			mv.addObject("detailSearch", detailText);
			mv.setViewName("mainboard/searchsubCate");
		} else {
			mv.setViewName("redirect:reviewFeed.bo");
		}
		
		return mv;
	}
	
	// 세부검색 스크롤ajax
	@RequestMapping(value="scrollsearchType")
	@ResponseBody
	public ArrayList<Board> scrollSearchType(@RequestParam(value="lastSbno") int bno, 
											 @RequestParam(value="searchType", required = false, defaultValue="0") String[] searchType,
											 @RequestParam(value="searchUserNickName", required = false, defaultValue="0") String searchUserNickName,
											 @RequestParam(value="subCate", required = false, defaultValue="0") String[] subCate,
											 @RequestParam(value="detailText", required = false, defaultValue="0")String detailText){
		
		ArrayList<String> array = new ArrayList<>();
		HashMap<String, Object> scroll = new HashMap<>();
		ArrayList<Board> list = new ArrayList<>();
		
		int bnoToStart  = bno - 1;
		
		if(!searchType[0].equals("0")) {
			for(int i = 0; i < searchType.length; i++) {
				array.add(searchType[i]);
			}
			scroll.put("category", 2);
			scroll.put("searchType", array);
			scroll.put("bno", bnoToStart);
			
			list = bService.scrollDetailSearchList(scroll);
			
		} else if(!searchUserNickName.equals("0")) {
			scroll.put("category", 3);
			scroll.put("nickName", searchUserNickName);
			scroll.put("bno", bnoToStart);
			
			list = bService.scrollDetailSearchList(scroll);
			
		} else if(!subCate[0].equals("0")) {
			for(int i = 0; i < subCate.length; i++) {
				array.add(subCate[i] + " /");
			}
			scroll.put("category", 4);
			scroll.put("subCate", array);
			scroll.put("bno", bnoToStart);
			
			if(!detailText.equals("0")) {
				scroll.put("detailText", "/ " + detailText);
			}
			
			list = bService.scrollDetailSearchList(scroll);
			
		}
		
		return list;
	}
	
	
	
	// 썸네일/이미지 >> 업로드된 파일명 바꿔주고 경로저장해주는메소
	public String imageChangeName(MultipartFile file, HttpServletRequest request) {
		
		// 경로가져오기
		String root = request.getSession().getServletContext().getRealPath("resources");
		// view단에있는 resources접근 >> 저장하는 경로
		// window버젼
		String saveRoot = root + "\\boardImageFile";
		// Mac버젼
//		String saveRoot = root + "/boardImageFile";
		
		File folder = new File(saveRoot);
		
		// 만약 폴더가 없다면
		if(!folder.exists()) {
			// 폴더 생성
			folder.mkdir();
		}
		
		// changeName생성
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originName = file.getOriginalFilename();
		String extention = file.getOriginalFilename().substring(file.getOriginalFilename().indexOf("."));
		// 현재날짜 + originName에서 확장자 명까지 >> subString(문자열자르기) indexOf(".") +
		String changeName = sdf.format(new Date(System.currentTimeMillis())) + "(" + originName.replace(extention, "") + ")" +originName.substring(originName.indexOf("."));	
		
		// 실제 경로저장
		// window버젼
		String reNamePath = folder + "\\" + changeName;
		// Mac버젼
//		String reNamePath = folder + "/" + changeName;
		
		try {
			file.transferTo(new File(reNamePath));
			// 폴더명\changeName.확장자명으로 저장
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return changeName;
	}
	
	// 오디오
	public ArrayList<String> audioChangeName(MultipartFile audio[], HttpServletRequest request) {
		
		ArrayList<String> changeNameArr = new ArrayList<String>();
		String changeName = "";
		
		for(int i = 0; i < audio.length; i++) {
			String root = request.getSession().getServletContext().getRealPath("resources");
			
			// window버젼
			String saveRoot = root + "\\boardAudioFile";
			// Mac버젼
//			String saveRoot = root + "/boardAudioFile";
			
			File folder = new File(saveRoot);
			
			if(!folder.exists()) {
				folder.mkdir();
			}
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String originName = audio[i].getOriginalFilename();
			String extention = audio[i].getOriginalFilename().substring(audio[i].getOriginalFilename().indexOf("."));
			// 현재날짜 + originName에서 확장자 명까지 >> subString(문자열자르기) indexOf(".") +
			changeName = sdf.format(new Date(System.currentTimeMillis())) + "(" + (audio[i].getOriginalFilename()).replace(extention, "") + ")" +audio[i].getOriginalFilename().substring(audio[i].getOriginalFilename().indexOf("."));
			
			
			// window버젼
			String reNamePath = folder + "\\" + changeName;
			// Mac버젼
//			String reNamePath = folder + "/" + changeName;
			
			try {
				audio[i].transferTo(new File(reNamePath));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			changeNameArr.add(changeName);
			
		}
		
		return changeNameArr;
	}
	
	// 비디오
	public ArrayList<String> videoChangeName(MultipartFile video[], HttpServletRequest request) {
		
		ArrayList<String> changeNameArr = new ArrayList<String>();
		String changeName = null;
		for(int i = 0; i < video.length; i++) {
			String root = request.getSession().getServletContext().getRealPath("resources");
			
			// window버젼
			String saveRoot = root + "\\boardVideoFile";
			// Mac버젼
//			String saveRoot = root + "/boardVideoFile";
			
			File folder = new File(saveRoot);
			
			if(!folder.exists()) {
				folder.mkdir();
			}
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String originName = video[i].getOriginalFilename();
			String extention = video[i].getOriginalFilename().substring(video[i].getOriginalFilename().indexOf("."));
			// 현재날짜 + originName에서 확장자 명까지 >> subString(문자열자르기) indexOf(".") +
			changeName = sdf.format(new Date(System.currentTimeMillis())) + "(" + originName.replace(extention, "") + ")" +originName.substring(originName.indexOf("."));
			
			// window버젼
			String reNamePath = folder + "\\" + changeName;
			// Mac버젼
//			String reNamePath = folder + "/" + changeName;
			
			try {
				video[i].transferTo(new File(reNamePath));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			changeNameArr.add(changeName);
		}
		return changeNameArr;
	}
	
}