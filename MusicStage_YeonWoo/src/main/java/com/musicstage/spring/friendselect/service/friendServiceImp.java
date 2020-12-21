package com.musicstage.spring.friendselect.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.musicstage.spring.friendselect.dao.friendDAO;
import com.musicstage.spring.friendselect.vo.selecVo;
import com.musicstage.spring.member.model.vo.Member;
import com.musicstage.spring.member.model.vo.register_Pro;
import com.musicstage.spring.member.model.vo.register_file;

@Service("fService")
public class friendServiceImp implements friendService {
	
	@Autowired
	private friendDAO fDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;


	
	
	@Override
	public List<String> useridList(selecVo sv) {
		// TODO Auto-generated method stub
		return fDAO.selectInterest(sqlSession,sv);
	}

	@Override
	public List<String> useridList1(selecVo sv) {
		// TODO Auto-generated method stub
		return fDAO.selectInterest1(sqlSession,sv);
	}

	@Override
	public List<String> useridList2(selecVo sv) {
		// TODO Auto-generated method stub
		return fDAO.selectInterest2(sqlSession,sv);
	}

	@Override
	public List<String> useridList3(selecVo sv) {
		// TODO Auto-generated method stub
		return fDAO.selectInterest3(sqlSession,sv);
	}

	@Override
	public List<selecVo> selectInt1(String id) {
			System.out.println("selectInt1");
			System.out.println("selectInt1"+id);
			
		return fDAO.selectInt(sqlSession,id);
	}

	@Override
	public int[] selectInt(String id) {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public Member selectListselectListList(String userid) {
		// TODO Auto-generated method stub
		return (Member) fDAO.selectIntselectListList(sqlSession,userid);
	}


	@Override
	public Member selectInfo(String userid) {
		return (Member) fDAO.selectIntselectListList(sqlSession,userid);
	}


	@Override
	public int checkIdDup2(String m_email) {
		// TODO Auto-generated method stub
		return fDAO.checkIdDup2(sqlSession,m_email);
	}

	@Override
	public int update(Member rv) {
		return fDAO.update(sqlSession,rv);
	}

	@Override
	public Member selectListList(String userid) {
		// TODO Auto-generated method stub
		return (Member) fDAO.selectIntselectListList(sqlSession,userid);
	}

	@Override
	public List<register_Pro>  pro(String userid) {
		// TODO Auto-generated method stub
		return (List<register_Pro>) fDAO.selectpro(sqlSession,userid);
	}

	@Override
	public Member checkIdDup(String m_nick, String emailAdress) {
	Member m =	new Member();
			m.setEmail(emailAdress);
			m.setUserName(m_nick);
			System.out.println(m);
		return fDAO.selectUserid(sqlSession,m);
	}

	@Override
	public int findPwd(Member email) {
		System.out.println("ggg");
		return fDAO.findPwd(sqlSession,email);
	}

	@Override
	public int filedelect(int num) {
		// TODO Auto-generated method stub
		return fDAO.filedelect(sqlSession,num);
	}

	@Override
	public int updatePro(register_Pro rp) {
		return fDAO.updatePro(sqlSession,rp);
	}

	@Override
	public int insertFile(register_file ff) {
		return fDAO.insertFile(sqlSession,ff);
		
	}


	
}
