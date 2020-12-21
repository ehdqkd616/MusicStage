package com.musicstage.spring.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.musicstage.spring.board.model.vo.Board;
import com.musicstage.spring.friendselect.vo.upda;
import com.musicstage.spring.member.model.vo.Interest;
import com.musicstage.spring.member.model.vo.Member;
import com.musicstage.spring.member.model.vo.register_Pro;
import com.musicstage.spring.member.model.vo.register_file;

@Repository("mDAO")
public class MemberDAO {

	public Member memberLogin(SqlSessionTemplate sqlSession, Member m) {

		return (Member)sqlSession.selectOne("memberMapper.memberLogin", m);
	}

	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	public int isExistMember(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("memberMapper.isExistMember", map);
	}

	public int insertInterest(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		
		
		return sqlSession.insert("memberMapper.insertInterest", map);
	}

	public int uploadImg(SqlSessionTemplate sqlSession, HashMap<String, String> map) {

		return sqlSession.update("memberMapper.uploadImg", map);
	}

	public int updateMember(SqlSessionTemplate sqlSession, Member m) {

		return sqlSession.update("memberMapper.updateMember", m);
	}

	public int updatePwd(SqlSessionTemplate sqlSession, Member m) {

		return sqlSession.update("memberMapper.updatePwd", m);
	}

	public int createInterestView(SqlSessionTemplate sqlSession, HashMap<String, String> map) {

		return sqlSession.update("memberMapper.createInterestView", map);
	}

	public int updateInterest(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		
		return sqlSession.update("memberMapper.updateInterest", map);
	}
	
	public int dropInterestView(SqlSessionTemplate sqlSession, HashMap<String, String> map) {

		return sqlSession.update("memberMapper.dropInterestView", map);
	}

	public ArrayList<Interest> lookupInterest(SqlSessionTemplate sqlSession, String userId) {

		return (ArrayList)sqlSession.selectList("memberMapper.lookupInterest", userId);
	}

	public int deleteMember(SqlSessionTemplate sqlSession, Member m) {

		return sqlSession.update("memberMapper.deleteMember", m);
	}

	public ArrayList<Member> getFollowing(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {

		return (ArrayList)sqlSession.selectList("memberMapper.getFollowing", map);
	}
	
	public ArrayList<Member> getFollower(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		
		return (ArrayList)sqlSession.selectList("memberMapper.getFollower", map);
	}

	public int getFollowingAllCount(SqlSessionTemplate sqlSession, String userId) {

		return sqlSession.selectOne("memberMapper.getFollowingAllCount", userId);
	}

	public int getFollowerAllCount(SqlSessionTemplate sqlSession, String userId) {
		
		return sqlSession.selectOne("memberMapper.getFollowerAllCount", userId);
	}

	public Member getMemberInfo(SqlSessionTemplate sqlSession, String userId) {

		return sqlSession.selectOne("memberMapper.getMemberInfo", userId);
	}
	
	public int isExistFollow(SqlSessionTemplate sqlSession, HashMap<String, String> map) {

		return sqlSession.selectOne("memberMapper.isExistFollow", map);
	}

	public int insertFollow(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		
		return sqlSession.insert("memberMapper.insertFollow", map);
	}
	
	public int increaseFollowing(SqlSessionTemplate sqlSession, String userId) {
		
		return sqlSession.update("memberMapper.increaseFollowing", userId);
	}
	
	public int increaseFollower(SqlSessionTemplate sqlSession, String targetId) {

		return sqlSession.update("memberMapper.increaseFollower", targetId);
	}
	
	public int deleteFollow(SqlSessionTemplate sqlSession, int followCode) {
		
		return sqlSession.update("memberMapper.deleteFollow", followCode);
	}
	
	public int decreaseFollowing(SqlSessionTemplate sqlSession, String userId) {
		
		return sqlSession.update("memberMapper.decreaseFollowing", userId);
	}

	public int decreaseFollower(SqlSessionTemplate sqlSession, String targetId) {
		
		return sqlSession.update("memberMapper.decreaseFollower", targetId);
	}
	
	public String getFollowCheck(SqlSessionTemplate sqlSession, HashMap<String, String> map) {

		return sqlSession.selectOne("memberMapper.getFollowCheck", map);
	}
	
	public int getFollowCode(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		
		return sqlSession.selectOne("memberMapper.getFollowCode", map);
	}
	
	public void updateFollow(SqlSessionTemplate sqlSession, int followCode) {
		
		sqlSession.update("memberMapper.updateFollow", followCode);
	}
	
	public register_Pro getProInfo(SqlSessionTemplate sqlSession, String userId) {

		return (register_Pro) sqlSession.selectOne("memberMapper.getProInfo", userId);
	}
	
	public int reportMember(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {

		return sqlSession.insert("memberMapper.reportMember", map);
	}
			
	// �삎以��씠�삎 �쟾臾멸��벑濡�
	
	public int checkNumber(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("memberMapper.pronumberSelect");
	}

	public int registerNum(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("memberMapper.registerNum");
	}

	public int firstNumber(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("memberMapper.firstNumber");

	}

	public int LastCheck(SqlSessionTemplate sqlSession, int id) {
		
		return sqlSession.selectOne("memberMapper.LastCheck",id);

	}

	public int fileNumberselect(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("memberMapper.fileNumberselect");

	}
	
	public int insertProM(SqlSessionTemplate sqlSession, register_Pro rp) {
		
		return sqlSession.insert("memberMapper.proinsert", rp);
	}
	
	public int insertFile(SqlSessionTemplate sqlSession, register_file ff) {
		
		return sqlSession.insert("memberMapper.insertFile", ff);
	}

	public List<register_file> selectfile(SqlSessionTemplate sqlSession, String user) {
		List<register_file> list = 	sqlSession.selectList("friendMapper.selectfile", user);
		return list;
	}

	public List<register_Pro> selectpro(SqlSessionTemplate sqlSession, String userid) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("friendMapper.selectPro", userid);
	}

	public int updateMem(SqlSessionTemplate sqlSession, upda d) {
		// TODO Auto-generated method stub
		return sqlSession.update("friendMapper.updateMem", d);
	}

	public register_Pro getProInfoShow(SqlSessionTemplate sqlSession, String userId) {

		return (register_Pro) sqlSession.selectOne("memberMapper.getProInfoShow", userId);
	}
	
}
