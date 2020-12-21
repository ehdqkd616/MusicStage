package com.musicstage.spring.friendselect.service;

import java.util.List;

import com.musicstage.spring.friendselect.vo.selecVo;
import com.musicstage.spring.friendselect.vo.upda;
import com.musicstage.spring.member.model.vo.Member;
import com.musicstage.spring.member.model.vo.register_Pro;
import com.musicstage.spring.member.model.vo.register_file;


public interface friendService {

	


	List<String> useridList(selecVo sv);


	List<String> useridList1(selecVo sv);


	List<String> useridList2(selecVo sv);


	List<String> useridList3(selecVo sv);


	int[] selectInt(String id);


	List<selecVo> selectInt1(String id);


	Member selectListselectListList(String userid);


	Member selectListList(String userid);


	Member selectInfo(String userid);


	Member checkIdDup(String m_nick, String emailAdress);


	int checkIdDup2(String m_email);


	int update(Member rv);


	List<register_Pro> pro(String userid);


	int findPwd(Member f);


	int filedelect(int num);


	int updatePro(register_Pro rp);


	int insertFile(register_file ff);










//	int userCount1(selecVo sv);
//
//
//	int userCount2(selecVo sv);
//
//
//	int userCount3(selecVo sv);
//
//
//	int userCount4(selecVo sv);
	
}
