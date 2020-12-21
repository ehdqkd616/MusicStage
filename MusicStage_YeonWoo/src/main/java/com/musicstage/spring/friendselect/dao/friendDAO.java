package com.musicstage.spring.friendselect.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.musicstage.spring.friendselect.vo.selecVo;
import com.musicstage.spring.member.model.vo.Member;
//sqlSession.selectOne("boardMapper.selectInt", id);
import com.musicstage.spring.member.model.vo.register_Pro;
import com.musicstage.spring.member.model.vo.register_file;

@Repository("fDAO")
public class friendDAO {

	
	public List<selecVo> selectInt(SqlSessionTemplate sqlSession, String id) {
		System.out.println("id : "+ id);
	List<selecVo> arr =	sqlSession.selectList("friendMapper.selectInt", id);
	List<selecVo> result = null;
	System.out.println(	arr);
	if(arr == null || arr.isEmpty()) {
		result = null;
	}else {
		result = arr;
	}
		return result ;
		
		
	}



	public List<String> selectInterest(SqlSessionTemplate sqlSession, selecVo sv) {
		 List<String> li =		sqlSession.selectList("friendMapper.selectIntList", sv);
		 System.out.println("DAO 1����"+li);
		return li;
	}


	public List<String> selectInterest1(SqlSessionTemplate sqlSession, selecVo sv) {
		 List<String> li = sqlSession.selectList("friendMapper.selectIntList1", sv);
		 System.out.println("DAO 2����"+li);
		return li;
	}


	public List<String> selectInterest2(SqlSessionTemplate sqlSession, selecVo sv) {
		 List<String> li = sqlSession.selectList("friendMapper.selectIntList2", sv);
		 System.out.println("DAO 3����"+li);
		return li;
	}


	public List<String> selectInterest3(SqlSessionTemplate sqlSession, selecVo sv) {
		
		 List<String> li = sqlSession.selectList("friendMapper.selectIntList3", sv);
		 System.out.println("DAO 4����"+li);
			return li;
	}



	public Member selectIntselectListList(SqlSessionTemplate sqlSession, String userid) {
		Member rv =	sqlSession.selectOne("friendMapper.selectIntselectListList", userid);
		System.out.println("rv : dao Ȯ��");
		System.out.println("rv : "+rv);
		return rv;
	}



	public int checkIdDup(SqlSessionTemplate sqlSession, String m_nick) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("friendMapper.selectNick", m_nick);
	}



	public int checkIdDup2(SqlSessionTemplate sqlSession, String m_email) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("friendMapper.selectEmail", m_email);
	}



	public int update(SqlSessionTemplate sqlSession, Member rv) {
		return sqlSession.update("friendMapper.update", rv);
	}


	public List<register_Pro> selectpro(SqlSessionTemplate sqlSession, String userid) {
		List<register_Pro> arr =	sqlSession.selectList("friendMapper.selectPro", userid);
		List<register_Pro> result = null;
		System.out.println(arr);
		if(arr.size()>0) {
			result = arr;
		}else {
			result = null;
		}
			return result ;
	}

	

	public Member selectUserid(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("friendMapper.selectUserId", m);
	}



	public int findPwd(SqlSessionTemplate sqlSession, Member email) {
		// TODO Auto-generated method stub
		System.out.println("�̸��� Ȯ��");
		System.out.println(email);
		System.out.println(sqlSession);
		return sqlSession.update("friendMapper.findPwd", email);
	}



	public int filedelect(SqlSessionTemplate sqlSession, int num) {
		// TODO Auto-generated method stub
		return sqlSession.delete("friendMapper.filedelect", num);
	}



	public int updatePro(SqlSessionTemplate sqlSession, register_Pro rp) {
		// TODO Auto-generated method stub
		return sqlSession.update("friendMapper.updatePro", rp);
	}



	public int insertFile(SqlSessionTemplate sqlSession, register_file ff) {
		System.out.println("breaber");
		return sqlSession.insert("friendMapper.insertFile", ff);
		
		
	}





	

	/*
	 * public int userCount1(SqlSessionTemplate sqlSession, selecVo sv) { // TODO
	 * Auto-generated method stub return
	 * sqlSession.selectOne("boardMapper.selectcount1", sv); }
	 * 
	 * 
	 * public int userCount2(SqlSessionTemplate sqlSession, selecVo sv) { // TODO
	 * Auto-generated method stub return
	 * sqlSession.selectOne("boardMapper.selectcount2", sv); }
	 * 
	 * 
	 * public int userCount3(SqlSessionTemplate sqlSession, selecVo sv) { // TODO
	 * Auto-generated method stub return
	 * sqlSession.selectOne("boardMapper.selectcount3", sv);
	 * sqlSession.selectList(statement, parameter) }
	 * 
	 * 
	 * public int userCount4(SqlSessionTemplate sqlSession, selecVo sv) { // TODO
	 * Auto-generated method stub return
	 * sqlSession.selectOne("boardMapper.selectcount4", sv); }
	 */
}
