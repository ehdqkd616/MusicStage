package com.musicstage.spring.admin.model.service;

import java.util.ArrayList;

import com.musicstage.spring.common.model.vo.BoardApprove;
import com.musicstage.spring.common.model.vo.ETCBoard;
import com.musicstage.spring.common.model.vo.PageInfo;
import com.musicstage.spring.common.model.vo.ReportBoard;
import com.musicstage.spring.common.model.vo.ReportMember;
import com.musicstage.spring.member.model.vo.RegisterPro;

public interface AdminService {

	int selectNoticeListCount();

	ArrayList<ETCBoard> selectNoticeList(PageInfo pi);

	void insertNotice(ETCBoard etc_board);

	ETCBoard selectNotice(int board_number);

	void updateNotice(ETCBoard etc_board);

	void deleteNotice(int board_number);

	int selectBoardReportListCount();

	ArrayList<ReportBoard> selectBoardReportList(PageInfo pi);

	int selectMemberReportListCount();

	ArrayList<ReportMember> selectMemberReportList(PageInfo pi);

	ReportBoard selectBoardReport(int report_no);

	ReportMember selectMemberReport(int report_no);

	int selectProApproveListCount();

	ArrayList<RegisterPro> selectProApproveList(PageInfo pi);

	int selectBoardApproveListCount();

	ArrayList<BoardApprove> selectBoardApproveList(PageInfo pi);

	RegisterPro selectProApproveDetail(int register_no);

	BoardApprove selectBoardApproveDetail(int board_number);

	int selectSearchMemberReportListCount(String searchCondition);

	ArrayList<ReportMember> selectSearchMemberReportList(String searchCondition, PageInfo pi);

	int selectSearchBoardReportListCount(String searchCondition);

	ArrayList<ReportBoard> selectSearchBoardReportList(String searchCondition, PageInfo pi);

	int selectSearchProApproveListCount(String searchCondition);

	ArrayList<RegisterPro> selectSearchProApproveList(String searchCondition, PageInfo pi);

	int selectSearchBoardApproveListCount(String searchCondition);

	ArrayList<BoardApprove> selectSearchBoardApproveList(String searchCondition, PageInfo pi);

	void updateMemberReportYes(int report_no, String report_member);

	void updateMemberReportNo(int report_no, String report_member);

	void updateBoardReportYes(int report_no, int report_board);

	void updateBoardReportNo(int report_no, int report_board);

	void updateProApproveYes(int register_no, String register_user);

	void updateProApproveNo(int register_no, String register_user);

	void updateBoardApproveYes(int board_number);

	void updateBoardApproveNo(int board_number);

	

}
