package com.musicstage.spring.admin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.musicstage.spring.common.model.vo.BoardApprove;
import com.musicstage.spring.common.model.vo.ETCBoard;
import com.musicstage.spring.common.model.vo.PageInfo;
import com.musicstage.spring.common.model.vo.ReportBoard;
import com.musicstage.spring.common.model.vo.ReportMember;
import com.musicstage.spring.member.model.vo.RegisterPro;

@Repository("adminDAO")
public class AdminDAOImpl implements AdminDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public int selectNoticeListCount() {
		return sqlSession.selectOne("adminMapper.getNoticeListCount");
	}
	
	@Override
	public ArrayList<ETCBoard> selectNoticeList(PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectNoticeList", null, rowBounds);		
	}
	
	@Override
	public void insertNotice(ETCBoard etc_board) {
		sqlSession.insert("adminMapper.insertNotice", etc_board);
	}

	@Override
	public ETCBoard selectNotice(int board_number) {
		return sqlSession.selectOne("adminMapper.selectNotice", board_number);
	}

	@Override
	public void updateNotice(ETCBoard etc_board) {
		sqlSession.update("adminMapper.updateNotice", etc_board);
	}

	@Override
	public void deleteNotice(int board_number) {
		sqlSession.update("adminMapper.deleteNotice", board_number);
	}

	@Override
	public int selectBoardReportListCount() {
		return sqlSession.selectOne("adminMapper.getBoardReportListCount");
	}

	@Override
	public ArrayList<ReportBoard> selectBoardReportList(PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectBoardReportList", null, rowBounds);	
	}

	@Override
	public int selectMemberReportListCount() {
		return sqlSession.selectOne("adminMapper.getMemberReportListCount");
	}

	@Override
	public ArrayList<ReportMember> selectMemberReportList(PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectMemberReportList", null, rowBounds);	
	}

	@Override
	public ReportBoard selectBoardReport(int report_no) {
		return sqlSession.selectOne("adminMapper.selectBoardReport", report_no);
	}

	@Override
	public ReportMember selectMemberReport(int report_no) {
		return sqlSession.selectOne("adminMapper.selectMemberReport", report_no);
	}

	@Override
	public int selectProApproveListCount() {
		return sqlSession.selectOne("adminMapper.getProApproveListCount");
	}

	@Override
	public ArrayList<RegisterPro> selectProApproveList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectProApproveList", null, rowBounds);	
	}

	@Override
	public int selectBoardApproveListCount() {
		return sqlSession.selectOne("adminMapper.getBoardApproveListCount");
	}

	@Override
	public ArrayList<BoardApprove> selectBoardApproveList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectBoardApproveList", null, rowBounds);	
	}

	@Override
	public RegisterPro selectProApproveDetail(int register_no) {		
		return (RegisterPro)sqlSession.selectOne("adminMapper.selectProApprove", register_no);
	}

	@Override
	public BoardApprove selectBoardApproveDetail(int board_number) {
		return (BoardApprove)sqlSession.selectOne("adminMapper.selectBoardApprove", board_number);
	}

	@Override
	public int selectSearchMemberReportListCount(String searchCondition) {
		return sqlSession.selectOne("adminMapper.getSearchMemberReportListCount", searchCondition);
	}

	@Override
	public ArrayList<ReportMember> selectSearchMemberReportList(String searchCondition, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectSearchMemberReportList", searchCondition, rowBounds);
	}

	@Override
	public int selectSearchBoardReportListCount(String searchCondition) {
		return sqlSession.selectOne("adminMapper.getSearchBoardReportListCount", searchCondition);
	}

	@Override
	public ArrayList<ReportBoard> selectSearchBoardReportList(String searchCondition, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectSearchBoardReportList", searchCondition, rowBounds);
	}

	@Override
	public int selectSearcProApproveListCount(String searchCondition) {
		return sqlSession.selectOne("adminMapper.getSearchProApproveListCount", searchCondition);
	}

	@Override
	public ArrayList<RegisterPro> selectSearchProApproveList(String searchCondition, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectSearchProApproveList", searchCondition, rowBounds);
	}

	@Override
	public int selectSearchBoardApproveListCount(String searchCondition) {
		return sqlSession.selectOne("adminMapper.getSearchBoardApproveListCount", searchCondition);
	}

	@Override
	public ArrayList<BoardApprove> selectSearchBoardApproveList(String searchCondition, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectSearchBoardApproveList", searchCondition, rowBounds);
	}
	
	@Override
	public void updateMemberReportYes(int report_no) {
		sqlSession.update("adminMapper.updateMemberReportYes", report_no);		
	}

	@Override
	public void updateMemberReportCount(String report_member) {
		sqlSession.update("adminMapper.updateMemberReportCount", report_member);		
	}

	@Override
	public void updateMemberReportNo(int report_no) {
		sqlSession.update("adminMapper.updateMemberReportNo", report_no);		
	}

	@Override
	public void updateBoardReportYes(int report_no) {
		sqlSession.update("adminMapper.updateBoardReportYes", report_no);		
	}

	@Override
	public void updateBoardReportCount(int report_board) {
		sqlSession.update("adminMapper.updateBoardReportCount", report_board);		
	}

	@Override
	public void updateBoardReportNo(int report_no) {
		sqlSession.update("adminMapper.updateBoardReportNo", report_no);		
	}

	@Override
	public void updateProApproveYes(int register_no) {
		sqlSession.update("adminMapper.updateProApproveYes", register_no);		
	}

	@Override
	public void updateProApproveStatusYes(String register_user) {
		sqlSession.update("adminMapper.updateProApproveStatusYes", register_user);		
	}

	@Override
	public void updateProApproveStatusNo(String register_user) {
		sqlSession.update("adminMapper.updateProApproveStatusNo", register_user);		
	}

	@Override
	public void updateProApproveNo(int register_no) {
		sqlSession.update("adminMapper.updateProApproveNo", register_no);		
	}

	@Override
	public void updateBoardApproveYes(int board_number) {
		sqlSession.update("adminMapper.updateBoardApproveYes", board_number);		
	}

	@Override
	public void updateBoardApproveNo(int board_number) {
		sqlSession.update("adminMapper.updateBoardApproveNo", board_number);		
	}	

	
}
