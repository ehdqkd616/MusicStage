package com.musicstage.spring.admin.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.musicstage.spring.admin.model.dao.AdminDAO;
import com.musicstage.spring.common.model.vo.BoardApprove;
import com.musicstage.spring.common.model.vo.ETCBoard;
import com.musicstage.spring.common.model.vo.PageInfo;
import com.musicstage.spring.common.model.vo.ReportBoard;
import com.musicstage.spring.common.model.vo.ReportMember;
import com.musicstage.spring.member.model.vo.RegisterPro;

@Service("adminService")
public class AdminServiceImpl implements AdminService {

	@Autowired
	AdminDAO adminDAO;
	
	@Override
	public int selectNoticeListCount() {
		return adminDAO.selectNoticeListCount();
	}

	@Override
	public ArrayList<ETCBoard> selectNoticeList(PageInfo pi) {
		return adminDAO.selectNoticeList(pi);
	}

	@Override
	public void insertNotice(ETCBoard etc_board) {
		adminDAO.insertNotice(etc_board);
	}

	@Override
	public ETCBoard selectNotice(int board_number) {
		return adminDAO.selectNotice(board_number);
	}

	@Override
	public void updateNotice(ETCBoard etc_board) {
		adminDAO.updateNotice(etc_board);
	}

	@Override
	public void deleteNotice(int board_number) {
		adminDAO.deleteNotice(board_number);
	}

	@Override
	public int selectBoardReportListCount() {
		return adminDAO.selectBoardReportListCount();
	}

	@Override
	public ArrayList<ReportBoard> selectBoardReportList(PageInfo pi) {
		return adminDAO.selectBoardReportList(pi);
	}

	@Override
	public int selectMemberReportListCount() {
		return adminDAO.selectMemberReportListCount();
	}

	@Override
	public ArrayList<ReportMember> selectMemberReportList(PageInfo pi) {
		return adminDAO.selectMemberReportList(pi);
	}

	@Override
	public ReportBoard selectBoardReport(int report_no) {
		return adminDAO.selectBoardReport(report_no);
	}

	@Override
	public ReportMember selectMemberReport(int report_no) {
		return adminDAO.selectMemberReport(report_no);
	}

	@Override
	public int selectProApproveListCount() {
		return adminDAO.selectProApproveListCount();
	}

	@Override
	public ArrayList<RegisterPro> selectProApproveList(PageInfo pi) {
		return adminDAO.selectProApproveList(pi);
	}

	@Override
	public int selectBoardApproveListCount() {
		return adminDAO.selectBoardApproveListCount();
	}

	@Override
	public ArrayList<BoardApprove> selectBoardApproveList(PageInfo pi) {
		return adminDAO.selectBoardApproveList(pi);
	}

	@Override
	public RegisterPro selectProApproveDetail(int register_no) {
		return adminDAO.selectProApproveDetail(register_no);
	}

	@Override
	public BoardApprove selectBoardApproveDetail(int board_number) {
		return adminDAO.selectBoardApproveDetail(board_number);
	}

	@Override
	public int selectSearchMemberReportListCount(String searchCondition) {
		return adminDAO.selectSearchMemberReportListCount(searchCondition);
	}

	@Override
	public ArrayList<ReportMember> selectSearchMemberReportList(String searchCondition, PageInfo pi) {
		return adminDAO.selectSearchMemberReportList(searchCondition, pi);
	}

	@Override
	public int selectSearchBoardReportListCount(String searchCondition) {
		return adminDAO.selectSearchBoardReportListCount(searchCondition);
	}

	@Override
	public ArrayList<ReportBoard> selectSearchBoardReportList(String searchCondition, PageInfo pi) {
		return adminDAO.selectSearchBoardReportList(searchCondition, pi);
	}

	@Override
	public int selectSearchProApproveListCount(String searchCondition) {
		return adminDAO.selectSearcProApproveListCount(searchCondition);
	}

	@Override
	public ArrayList<RegisterPro> selectSearchProApproveList(String searchCondition, PageInfo pi) {
		return adminDAO.selectSearchProApproveList(searchCondition, pi);
	}

	@Override
	public int selectSearchBoardApproveListCount(String searchCondition) {
		return adminDAO.selectSearchBoardApproveListCount(searchCondition);
	}

	@Override
	public ArrayList<BoardApprove> selectSearchBoardApproveList(String searchCondition, PageInfo pi) {
		return adminDAO.selectSearchBoardApproveList(searchCondition, pi);
	}

	@Override
	public void updateMemberReportYes(int report_no, String report_member) {
		adminDAO.updateMemberReportYes(report_no);
		adminDAO.updateMemberReportCount(report_member);	
	}

	@Override
	public void updateMemberReportNo(int report_no, String report_member) {
		adminDAO.updateMemberReportNo(report_no);
	}

	@Override
	public void updateBoardReportYes(int report_no, int report_board) {
		adminDAO.updateBoardReportYes(report_no);
		adminDAO.updateBoardReportCount(report_board);	
	}

	@Override
	public void updateBoardReportNo(int report_no, int report_board) {
		adminDAO.updateBoardReportNo(report_no);
	}

	@Override
	public void updateProApproveYes(int register_no, String register_user) {
		adminDAO.updateProApproveYes(register_no);
		adminDAO.updateProApproveStatusYes(register_user);
	}

	@Override
	public void updateProApproveNo(int register_no, String register_user) {
		adminDAO.updateProApproveNo(register_no);
		adminDAO.updateProApproveStatusNo(register_user);
	}

	@Override
	public void updateBoardApproveYes(int board_number) {
		adminDAO.updateBoardApproveYes(board_number);
	}

	@Override
	public void updateBoardApproveNo(int board_number) {
		adminDAO.updateBoardApproveNo(board_number);
	}

}
