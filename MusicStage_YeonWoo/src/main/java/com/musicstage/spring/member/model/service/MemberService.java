package com.musicstage.spring.member.model.service;

import java.util.ArrayList;
import java.util.List;

import com.musicstage.spring.board.model.vo.Board;
import com.musicstage.spring.friendselect.vo.upda;
import com.musicstage.spring.member.model.vo.Interest;
import com.musicstage.spring.member.model.vo.Member;
import com.musicstage.spring.member.model.vo.register_Pro;
import com.musicstage.spring.member.model.vo.register_file;

public interface MemberService {

	
	Member memberLogin(Member m);

	int insertMember(Member m);
	
	int isExistMember(String value, String keyword);

	int insertInterest(String[] list, String userId);

	int uploadImg(String profile_pic, String userId);

	int updateMember(Member m);

	int updatePwd(Member m);

	int createInterestView(String createSql);

	int updateInterest(String userId, String[] interests);

	int dropInterestView(String dropSql);

	ArrayList<Interest> lookupInterest(String userId);

	int updateInterest(String userId, ArrayList<Integer> originArr, ArrayList<Integer> newArr);

	int deleteMember(Member m);

	ArrayList<Member> getFollowing(String userId, int start, int end);

	ArrayList<Member> getFollower(String userId, int start, int end);

	int getFollowingAllCount(String userId);

	int getFollowerAllCount(String userId);

	Member getMemberInfo(String userId);
	
	int isExistFollow(String userId, String targetId);
	
	int insertFollow(String userId, String targetId);
	
	int doFollow(String userId, String targetId);
	
	int deleteFollow(int followCode);

	int cancleFollow(String userId, String targetId);
	
	String getFollowCheck(String userId, String targetId);
	
	int getFollowCode(String userId, String targetId);
	
	void updateFollow(int followCode);
	
	register_Pro getProInfo(String userId);
	
	int reportMember(int category, String content, String report_from, String report_to);
	
	// �삎以��씠�삎 �쟾臾멸��벑濡�
	
	int checkNo();
	
	int registerNum();
	
	int checkLast(int id);
	
	int checkfirstNumber();
	
	int fileNumber();
	
	int insertPro(register_Pro rp);
	
	int insertFile(register_file ff);

	List<register_file> userfileName(String user);

	List<register_Pro> register_pro(String userid);

	int updateW(upda d);

	register_Pro getProInfoShow(String targetId);

}
