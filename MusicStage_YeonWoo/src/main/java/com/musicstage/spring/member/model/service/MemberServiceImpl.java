package com.musicstage.spring.member.model.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.musicstage.spring.friendselect.vo.upda;
import com.musicstage.spring.member.model.dao.MemberDAO;
import com.musicstage.spring.member.model.vo.Interest;
import com.musicstage.spring.member.model.vo.Member;
import com.musicstage.spring.member.model.vo.register_Pro;
import com.musicstage.spring.member.model.vo.register_file;

@Service("mService")
public class MemberServiceImpl implements MemberService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDAO mDAO;

	@Override
	public Member memberLogin(Member m) {

		return mDAO.memberLogin(sqlSession, m);
	}

	@Override
	public int insertMember(Member m) {

		return mDAO.insertMember(sqlSession, m);
	}

	@Override
	public int isExistMember(String value, String keyword) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("value", value);
		map.put("keyword", keyword);
		
		return mDAO.isExistMember(sqlSession, map);
	}

	@Override
	public int insertInterest(String[] list, String userId) {
		
		int result = 0;
		
		HashMap<String, String> map = new HashMap<>();
		
		for(int i = 0; i < list.length; i++) {
			
			map.put("interestName", list[i]);
			map.put("userId", userId);
			result = mDAO.insertInterest(sqlSession, map);
			// result揶쏉옙 0癰귣��뼄 占쎌삂占쎌몵筌롳옙 獄쏅뗀以� 嚥▲끇媛싷옙釉뤄쭪占� �⑥쥓占쏙옙
		}
		
		return result;
	}

	@Override
	public int uploadImg(String profile_pic, String userId) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("profile_pic", profile_pic);
		map.put("userId", userId);
		
		return mDAO.uploadImg(sqlSession, map);
	}

	@Override
	public int updateMember(Member m) {

		return mDAO.updateMember(sqlSession, m);
	}

	@Override
	public int updatePwd(Member m) {

		return mDAO.updatePwd(sqlSession, m);
	}
	
	@Override
	public int createInterestView(String createSql) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("sql", createSql);
		
		return mDAO.createInterestView(sqlSession, map);
	}

	@Override
	public int updateInterest(String userId, String[] interests) {
		
		HashMap<String, Object> map = new HashMap<>();
		
		int result = 0;
		int i = 0;
		for(String interest : interests) {
			map.put("userId", userId);
			map.put("interestName", interest);
			map.put("rnum", ++i);
			result = mDAO.updateInterest(sqlSession, map);
			// result揶쏉옙 0癰귣��뼄 占쎌삂占쎌몵筌롳옙 獄쏅뗀以� 嚥▲끇媛싷옙釉뤄쭪占� �⑥쥓占쏙옙
		}
		
		return result;
	}

	@Override
	public int dropInterestView(String dropSql) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("sql", dropSql);
		
		return mDAO.dropInterestView(sqlSession, map);
	}

	@Override
	public ArrayList<Interest> lookupInterest(String userId) {

		return mDAO.lookupInterest(sqlSession, userId);
	}

	@Override
	public int updateInterest(String userId, ArrayList<Integer> originArr, ArrayList<Integer> newArr) {

		HashMap<String, Object> map = removeDuplicate(originArr, newArr);
		
		List<Integer> origin = new ArrayList<>((Set<Integer>) map.get("origin"));
		List<Integer> newest = new ArrayList<>((Set<Integer>) map.get("newest"));
		
		int result = 0;
		
		for(int i = 0; i < origin.size(); i++) {
			map.put("userId", userId);
			map.put("origin", origin.get(i));
			map.put("newest", newest.get(i));
			
			result += mDAO.updateInterest(sqlSession, map);

		}
		return result;
	}
	
	public HashMap<String, Object> removeDuplicate(ArrayList<Integer> originArr, ArrayList<Integer> newArr) {
		
		Integer[] iArr1 = new Integer[4];
		Integer[] iArr2 = new Integer[4];
		
		for(int i = 0; i < originArr.size(); i++) {
			iArr1[i] = originArr.get(i);
		}
		
		for(int i = 0; i < newArr.size(); i++) {
			iArr2[i] = newArr.get(i);
		}
		
		for(int i = 0; i < iArr1.length; i++) {
			for(int j = 0; j < iArr2.length; j++) {
				if(iArr1[i] == iArr2[j]) {
					iArr1[i] = 0;
					iArr2[j] = 0;
					break;
				}
			}
		}
		
		Set<Integer> set1 = new HashSet<>(Arrays.asList(iArr1));
		Set<Integer> set2 = new HashSet<>(Arrays.asList(iArr2));
		
		set1.remove((Integer)0);
		set2.remove((Integer)0);
		
		HashMap<String, Object> map = new HashMap<>();
		
		map.put("origin", set1);
		map.put("newest", set2);
		
		return map;
		
	}

	@Override
	public int deleteMember(Member m) {

		return mDAO.deleteMember(sqlSession, m);
	}

	@Override
	public ArrayList<Member> getFollowing(String userId, int start, int end) {

		int result = 0;
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("userId", userId);
		map.put("start", start);
		map.put("end", end);
		
		return mDAO.getFollowing(sqlSession, map);
	}

	@Override
	public ArrayList<Member> getFollower(String userId, int start, int end) {
		
		int result = 0;
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("userId", userId);
		map.put("start", start);
		map.put("end", end);
		
		return mDAO.getFollower(sqlSession, map);
	}
	
	@Override
	public int getFollowingAllCount(String userId) {

		return mDAO.getFollowingAllCount(sqlSession, userId);
	}

	@Override
	public int getFollowerAllCount(String userId) {
		
		return mDAO.getFollowerAllCount(sqlSession, userId);
	}
	
	@Override
	public Member getMemberInfo(String userId) {

		return mDAO.getMemberInfo(sqlSession, userId);
	}
	
	@Override
	public int isExistFollow(String userId, String targetId) {

		HashMap<String, String> map = new HashMap<>();
		map.put("userId", userId);
		map.put("targetId", targetId);
		
		return mDAO.isExistFollow(sqlSession, map);
	}
	
	@Override
	public int insertFollow(String userId, String targetId) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("userId", userId);
		map.put("targetId", targetId);
		
		int result = mDAO.insertFollow(sqlSession, map);
		
		return result;
	}
	
	@Override
	public int doFollow(String userId, String targetId) {
		
		int result1 = mDAO.increaseFollowing(sqlSession, userId);
		int result2 = mDAO.increaseFollower(sqlSession, targetId);

		return result1 + result2;
	}
	
	@Override
	public int deleteFollow(int followCode) {
		
		return mDAO.deleteFollow(sqlSession, followCode);
	}
	
	@Override
	public int cancleFollow(String userId, String targetId) {
		
		int result1 = mDAO.decreaseFollowing(sqlSession, userId);
		int result2 = mDAO.decreaseFollower(sqlSession, targetId);

		return result1 + result2;
	}
	
	@Override
	public String getFollowCheck(String userId, String targetId) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("userId", userId);
		map.put("targetId", targetId);
		
		return mDAO.getFollowCheck(sqlSession, map);
	}
	
	@Override
	public int getFollowCode(String userId, String targetId) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("userId", userId);
		map.put("targetId", targetId);
		
		return mDAO.getFollowCode(sqlSession, map);
	}
	
	@Override
	public void updateFollow(int followCode) {
		
		mDAO.updateFollow(sqlSession, followCode);
	}
	
	@Override
	public register_Pro getProInfo(String userId) {
		register_Pro rp =(register_Pro)mDAO.getProInfo(sqlSession, userId);
		register_Pro result = null;
		if("".equals(rp.toString().trim()) || rp ==null) {
				result = null;
			}else {
				result=rp;
			}
		
		return result;
	}
	
	@Override
	public int reportMember(int category, String content, String report_from, String report_to) {

		HashMap<String, Object> map = new HashMap<>();
		map.put("report_content", content);
		map.put("member_report_category", category);
		map.put("report_to", report_to);
		map.put("report_from", report_from);
		
		return mDAO.reportMember(sqlSession, map);
	}
	
	// 占쎌굨餓ο옙占쎌뵠占쎌굨 占쎌읈�눧硫몌옙占쎈쾻嚥∽옙
	@Override
	public int checkNo() {
		return mDAO.checkNumber(sqlSession);
	}
	
	@Override
	public int registerNum() {
		return mDAO.registerNum(sqlSession);
	}

	@Override
	public int checkfirstNumber() {
		return mDAO.firstNumber(sqlSession);
	}

	@Override
	public int checkLast(int id) {
		return mDAO.LastCheck(sqlSession, id);
	}
	
	@Override
	public int fileNumber() {
		return mDAO.fileNumberselect(sqlSession);
	}

	@Override
	public int insertPro(register_Pro rp) {
		return mDAO.insertProM(sqlSession,rp);
	}

	@Override
	public int insertFile(register_file ff) {
		return mDAO.insertFile(sqlSession,ff);
	}

	@Override
	public List<register_file> userfileName(String user) {
		// TODO Auto-generated method stub
		return mDAO.selectfile(sqlSession,user);
	}

	@Override
	public List<register_Pro> register_pro(String userid) {
		// TODO Auto-generated method stub
		return (List<register_Pro>) mDAO.selectpro(sqlSession,userid);
	}

	@Override
	public int updateW(upda d) {
		// TODO Auto-generated method stub
		return mDAO.updateMem(sqlSession,d);
	}

	@Override
	public register_Pro getProInfoShow(String targetId) {
		// TODO Auto-generated method stub
		return mDAO.getProInfoShow(sqlSession, targetId);
	}

}
