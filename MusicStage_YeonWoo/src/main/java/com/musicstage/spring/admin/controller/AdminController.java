package com.musicstage.spring.admin.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;
import com.musicstage.spring.admin.model.exception.AdminException;
import com.musicstage.spring.admin.model.service.AdminService;
import com.musicstage.spring.board.model.vo.Board;
import com.musicstage.spring.common.model.vo.BoardApprove;
import com.musicstage.spring.common.model.vo.ETCBoard;
import com.musicstage.spring.common.model.vo.PageInfo;
import com.musicstage.spring.common.model.vo.Pagination;
import com.musicstage.spring.common.model.vo.ReportBoard;
import com.musicstage.spring.common.model.vo.ReportMember;
import com.musicstage.spring.member.model.vo.RegisterPro;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	// 공지사항 글 목록
	@RequestMapping("noticeList.ad")
	public ModelAndView noticeList(@RequestParam(value="page", required = false) Integer page, ModelAndView mv) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = adminService.selectNoticeListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<ETCBoard> list = adminService.selectNoticeList(pi);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("admin_Notice_List");
		}
		
		return mv;
	}
	
	// 공지사항 Detail View
	@RequestMapping("noticeDetail.ad")
	@ResponseBody
	public String noticeDetail(@RequestParam("board_number") int board_number, HttpServletResponse response) {
		response.setContentType("application/json; charset=UTF-8");
		
		ETCBoard etc_board = adminService.selectNotice(board_number);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		JSONObject job = new JSONObject();
		job.put("board_number", etc_board.getBoard_number());
		job.put("board_title", etc_board.getBoard_title());
		job.put("board_content", etc_board.getBoard_content());
		job.put("b_writer", etc_board.getB_writer());
		job.put("b_writer_nickName", etc_board.getB_writer_nickName());
		job.put("b_write_date", sdf.format(etc_board.getB_write_date()));
		
		System.out.println(job.toJSONString());
		
		return job.toJSONString();
	}
	
	
	// 공지사항 글쓰기
	@RequestMapping("insertNotice.ad")
	public String insertNotice(@ModelAttribute ETCBoard etc_board, HttpServletRequest request) {
		
		adminService.insertNotice(etc_board);
		
		return "redirect:/noticeList.ad";
	}	
	
	// 공지사항 글 수정
	@RequestMapping("updateNotice.ad")
	public String updateNotice(@ModelAttribute ETCBoard etc_board, HttpServletRequest request) {
		
		adminService.updateNotice(etc_board);
		
		return "redirect:/noticeList.ad";
	}
	
	// 공지사항 글 삭제
	@RequestMapping("deleteNotice.ad")
	public String deleteNotice(@RequestParam("board_number") int board_number) {

		adminService.deleteNotice(board_number);
		
		return "redirect:/noticeList.ad";
	}
	
	// 게시글 신고 글 목록
	@RequestMapping("boardReportList.ad")
	public ModelAndView boardReportList(@RequestParam(value="page", required = false) Integer page, ModelAndView mv) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = adminService.selectBoardReportListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<ReportBoard> list = adminService.selectBoardReportList(pi);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("admin_Board_Report_List");
			mv.addObject("searchCondition", "W");
		}
		
		return mv;
	}
	
	// 게시글 신고 글 목록(검색)
	@RequestMapping("searchBoardReportList.ad")
	public ModelAndView searchBoardReportList(@RequestParam(value="page", required = false) Integer page,
											   @RequestParam("searchCondition") String searchCondition, ModelAndView mv) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = adminService.selectSearchBoardReportListCount(searchCondition);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<ReportBoard> list = adminService.selectSearchBoardReportList(searchCondition, pi);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.addObject("searchCondition", searchCondition);
			mv.setViewName("admin_Board_Report_List");
		}
		
		return mv;
	}	
	
	// 게시글 신고 Detail View
	@RequestMapping("boardReportDetail.ad")
	@ResponseBody
	public String boardReportDetail(@RequestParam("report_no") int report_no, HttpServletResponse response) {
		response.setContentType("application/json; charset=UTF-8");
		
		ReportBoard reportBoard = adminService.selectBoardReport(report_no);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		JSONObject job = new JSONObject();
		job.put("report_no", reportBoard.getReport_no());
		job.put("board_report_category", reportBoard.getBoard_report_category());
		job.put("board_report_category_name", reportBoard.getBoard_report_category_name());
		job.put("report_content", reportBoard.getReport_content());
		job.put("report_board", reportBoard.getReport_board());
		job.put("report_board_title", reportBoard.getReport_board_title());
		job.put("report_board_writer", reportBoard.getReport_board_writer());
		job.put("report_board_writer_nickName", reportBoard.getReport_board_writer_nickName());
		job.put("report_from", reportBoard.getReport_from());
		job.put("report_from_nickName", reportBoard.getReport_from_nickName());
		job.put("report_date", sdf.format(reportBoard.getReport_date()));		
		job.put("report_status", reportBoard.getReport_status());

		
		System.out.println(job.toJSONString());
		
		return job.toJSONString();
	}
	
	// 계정 신고 글 목록
	@RequestMapping("memberReportList.ad")
	public ModelAndView memberReportList(@RequestParam(value="page", required = false) Integer page, ModelAndView mv) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = adminService.selectMemberReportListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<ReportMember> list = adminService.selectMemberReportList(pi);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("admin_Member_Report_List");
			mv.addObject("searchCondition", "W");
		}
		
		return mv;
	}
	
	
	// 계정 신고 글 목록(검색)
	@RequestMapping("searchMemberReportList.ad")
	public ModelAndView searchMemberReportList(@RequestParam(value="page", required = false) Integer page,
											   @RequestParam("searchCondition") String searchCondition, ModelAndView mv) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = adminService.selectSearchMemberReportListCount(searchCondition);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<ReportMember> list = adminService.selectSearchMemberReportList(searchCondition, pi);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.addObject("searchCondition", searchCondition);
			mv.setViewName("admin_Member_Report_List");
		}
		
		return mv;
	}	
	
	// 계정 신고 Detail View
	@RequestMapping("memberReportDetail.ad")
	@ResponseBody
	public String memberReportDetail(@RequestParam("report_no") int report_no, HttpServletResponse response) {
		response.setContentType("application/json; charset=UTF-8");
		
		ReportMember reportMember = adminService.selectMemberReport(report_no);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		JSONObject job = new JSONObject();
		job.put("report_no", reportMember.getReport_no());
		job.put("member_report_category", reportMember.getMember_report_category());
		job.put("member_report_category_name", reportMember.getMember_report_category_name());
		job.put("report_content", reportMember.getReport_content());
		job.put("report_from", reportMember.getReport_from());
		job.put("report_from_nickName", reportMember.getReport_from_nickName());
		job.put("report_to", reportMember.getReport_to());
		job.put("report_to_nickName", reportMember.getReport_to_nickName());
		job.put("report_date", sdf.format(reportMember.getReport_date()));		
		job.put("report_status", reportMember.getReport_status());	
		
		
		System.out.println(job.toJSONString());
		
		return job.toJSONString();
	}
	
	
	// 전문가 등록 글 목록
	@RequestMapping("proApproveList.ad")
	public ModelAndView proApproveList(@RequestParam(value="page", required = false) Integer page, ModelAndView mv) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = adminService.selectProApproveListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<RegisterPro> list = adminService.selectProApproveList(pi);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("admin_Pro_Approve_List");
			mv.addObject("searchCondition", "W");			
		}
		
		return mv;
	}
	
	// 전문가 등록 글 목록(검색)
	@RequestMapping("searchProApproveList.ad")
	public ModelAndView searchProApproveList(@RequestParam(value="page", required = false) Integer page,
											   @RequestParam("searchCondition") String searchCondition, ModelAndView mv) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = adminService.selectSearchProApproveListCount(searchCondition);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<RegisterPro> list = adminService.selectSearchProApproveList(searchCondition, pi);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.addObject("searchCondition", searchCondition);
			mv.setViewName("admin_Pro_Approve_List");
		}
		
		return mv;
	}		

	// 전문가 등록 디테일 뷰
	@RequestMapping("proApproveDetail.ad")
	public ModelAndView proApproveDetail(@RequestParam("register_no") int register_no, @RequestParam("page") int page, 
										 @RequestParam("searchCondition") String searchCondition, ModelAndView mv) {
		
		RegisterPro registerPro = adminService.selectProApproveDetail(register_no);		
		
		if(registerPro != null) {
			mv.addObject("registerPro", registerPro)
			  .addObject("page", page)
			  .addObject("searchCondition", searchCondition)
			  .setViewName("admin_Pro_Approve_Detail");
		} else {
			throw new AdminException("전문가 등록 상세 조회에 실패하였습니다.");
		}
		
		return mv;
		
	}
	
	// 게시글 승인 대기 글 목록
	@RequestMapping("boardApproveList.ad")
	public ModelAndView boardApproveList(@RequestParam(value="page", required = false) Integer page, ModelAndView mv) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = adminService.selectBoardApproveListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<BoardApprove> list = adminService.selectBoardApproveList(pi);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.addObject("searchCondition", "W");			
			mv.setViewName("admin_Board_Approve_List");
		}
		
		return mv;
	}
	
	// 게시글 승인 대기 글 목록(검색)
	@RequestMapping("searchBoardApproveList.ad")
	public ModelAndView searchBoardApproveList(@RequestParam(value="page", required = false) Integer page,
											   @RequestParam("searchCondition") String searchCondition, ModelAndView mv) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = adminService.selectSearchBoardApproveListCount(searchCondition);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<BoardApprove> list = adminService.selectSearchBoardApproveList(searchCondition, pi);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.addObject("searchCondition", searchCondition);
			mv.setViewName("admin_Board_Approve_List");
		}
		
		return mv;
	}		

	// 게시글 승인 디테일 뷰	
	@RequestMapping("boardApproveDetail.ad")
	public ModelAndView boardApproveDetail(@RequestParam("board_number") int board_number, @RequestParam("page") int page, 
										   @RequestParam("searchCondition") String searchCondition, ModelAndView mv) {
		
		BoardApprove boardApprove = adminService.selectBoardApproveDetail(board_number);
		
		if(boardApprove != null) {
			mv.addObject("boardApprove", boardApprove)
			  .addObject("page", page)
			  .addObject("searchCondition", searchCondition)
			  .setViewName("admin_Board_Approve_Detail");
		} else {
			throw new AdminException("게시글 상세 조회에 실패하였습니다.");
		}
		
		return mv;
		
	}
	
	
	// 회원 신고 승인 처리
	@RequestMapping("memberReportYes.ad")
	public String memberReportYes(@RequestParam("report_no") int report_no, @RequestParam("report_member") String report_member,
								  @RequestParam("page") int page, @RequestParam("searchCondition") String searchCondition) {
		
		adminService.updateMemberReportYes(report_no, report_member);		
//		adminService.insertAlarm(no_select);
		
		return "redirect:/searchMemberReportList.ad?page="+page+"&searchCondition="+searchCondition;

	}
	
	// 회원 신고 거절 처리
	@RequestMapping("memberReportNo.ad")
	public String memberReportNo(@RequestParam("report_no") int report_no, @RequestParam("report_member") String report_member,
								 @RequestParam("no_select") String no_select, @RequestParam("page") int page, @RequestParam("searchCondition") String searchCondition) {
		
		adminService.updateMemberReportNo(report_no, report_member);
//		adminService.insertAlarm(no_select);
		
		return "redirect:/searchMemberReportList.ad?page="+page+"&searchCondition="+searchCondition;

	}	
	
	// 게시글 신고 승인 처리
	@RequestMapping("boardReportYes.ad")
	public String boardReportYes(@RequestParam("report_no") int report_no, @RequestParam("report_board") int report_board, 
								 @RequestParam("page") int page, @RequestParam("searchCondition") String searchCondition) {
		
		adminService.updateBoardReportYes(report_no, report_board);		
//		adminService.insertAlarm(no_select);
		
		return "redirect:/searchBoardReportList.ad?page="+page+"&searchCondition="+searchCondition;

	}
	
	// 게시글 신고 거절 처리
	@RequestMapping("boardReportNo.ad")
	public String boardReportNo(@RequestParam("report_no") int report_no, @RequestParam("report_board") int report_board, 
								@RequestParam("no_select") String no_select, @RequestParam("page") int page, @RequestParam("searchCondition") String searchCondition) {
		
		adminService.updateBoardReportNo(report_no, report_board);		
//		adminService.insertAlarm(no_select);
		
		return "redirect:/searchBoardReportList.ad?page="+page+"&searchCondition="+searchCondition;
	}		
	
	// 전문가 등록 승인 처리
	@RequestMapping("proApproveYes.ad")
	public String proApproveYes(@RequestParam("register_no") int register_no, @RequestParam("register_user") String register_user, 
								@RequestParam("page") int page, @RequestParam("searchCondition") String searchCondition) {
		
		adminService.updateProApproveYes(register_no, register_user);		
//		adminService.insertAlarm(no_select);
		
		return "redirect:/searchProApproveList.ad?page="+page+"&searchCondition="+searchCondition;

	}
	
	// 전문가 등록 거절 처리
	@RequestMapping("proApproveNo.ad")
	public String proApproveNo(@RequestParam("register_no") int register_no, @RequestParam("register_user") String register_user, 
							   @RequestParam("no_select") String no_select, @RequestParam("page") int page, @RequestParam("searchCondition") String searchCondition) {
		
		adminService.updateProApproveNo(register_no, register_user);		
//		adminService.insertAlarm(no_select);
		
		return "redirect:/searchProApproveList.ad?page="+page+"&searchCondition="+searchCondition;
	}	
	
	// 게시글 등록 승인 처리
	@RequestMapping("boardApproveYes.ad")
	public String boardApproveYes(@RequestParam("board_number") int board_number, @RequestParam("page") int page, 
								  @RequestParam("searchCondition") String searchCondition) {
		
		adminService.updateBoardApproveYes(board_number);		
//		adminService.insertAlarm(no_select);

		return "redirect:/searchBoardApproveList.ad?page="+page+"&searchCondition="+searchCondition;
	}
	
	// 게시글 등록 거절 처리
	@RequestMapping("boardApproveNo.ad")
	public String boardApproveNo(@RequestParam("board_number") int board_number, @RequestParam("no_select") String no_select, 
								 @RequestParam("page") int page, @RequestParam("searchCondition") String searchCondition) {
		
		adminService.updateBoardApproveNo(board_number);		
//		adminService.insertAlarm(no_select);
		
		return "redirect:/searchBoardApproveList.ad?page="+page+"&searchCondition="+searchCondition;
	}
	
	
}
