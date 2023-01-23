package com.multi.erp.member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class MemberDAOImpl implements MemberDAO {
	SqlSession sqlSession;
	
	@Autowired
	public MemberDAOImpl(SqlSession sqlSession) {
		super();
		this.sqlSession = sqlSession;
	}

	@Override
	public List<MemberDTO> getTreeEmpList(String deptno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(MemberDTO user) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<MemberDTO> getMemberList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int delete(String id) {
		return 0;
	}

	@Override
	public MemberDTO read(String id) {
		return null;
	}

	@Override
	public List<MemberDTO> search(String column, String search, String pass) {
		return null;
	}

	@Override
	public int update(MemberDTO user) {
		return 0;
	}

	@Override
	public MemberDTO login(MemberDTO loginUser) {
		System.out.println(loginUser+"-----------------dao--------------------");
		MemberDTO  user = sqlSession.selectOne("com.multi.erp.member.login", loginUser);
		System.out.println(user);
		return user;
	}

	@Override
	public boolean idCheck(String id) {
		return false;
	}

	@Override
	public MemberDTO findById(String id) {
		return null;
	}

}
