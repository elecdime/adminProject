package com.team.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.team.domain.MemberDTO;

@Repository //spring bin과 연결(Anotation)
public class MemberDAOImpl implements MemberDAO{
	
	//DB연결 객체생성한것 받아오기
	@Inject
	private SqlSession sqlSession;
	private static final String namespace = "com.team.mapper.memberMapper";
	
	
	@Override
	public MemberDTO findIdOk(MemberDTO memberDTO) {
		System.out.println("MemberDAOImpl findIDOk()");
		return sqlSession.selectOne(namespace+".findIdOk", memberDTO);
	}

	@Override	
	public void insertMember(MemberDTO memberDTO) {
		System.out.println("MemberDAOImpl insertMember()");

		sqlSession.insert(namespace+".insertMember", memberDTO);
	}

	@Override
	public MemberDTO userCheck(MemberDTO memberDTO) {
		System.out.println("MemberDAOImpl userCheck()");

		return sqlSession.selectOne(namespace+".userCheck", memberDTO);
	}

	@Override
	public void deleteMember(MemberDTO memberDTO) {
		System.out.println("DAO pass");
		
		sqlSession.delete(namespace+".deleteMember", memberDTO);
	}

	@Override
	public int updateMember(MemberDTO memberDTO) {
		System.out.println("DAO pass");
		return sqlSession.update(namespace+".updateMember", memberDTO);
	}

	@Override
	public MemberDTO getMember(MemberDTO memberDTO) {
		System.out.println("DAO pass");
		return sqlSession.selectOne(namespace+".getMember", memberDTO);
	}

	@Override
	public String idCheck(String id) {
		System.out.println("DAO pass");
		return sqlSession.selectOne(namespace+".idCheck", id);
	}

	@Override
	public int mailCodeInsert(MemberDTO memberDTO) {
		System.out.println("email insert DAO pass");
		return sqlSession.insert(namespace+".mailCodeInsert", memberDTO);
	}

	@Override
	public String mailCodeSelect(String email) {
		System.out.println("email select DAO pass");
		return sqlSession.selectOne(namespace+".mailCodeSelect", email);
	}

	@Override
	public int mailCodeUpdate(MemberDTO memberDTO) {
		System.out.println("email update DAO pass");
		return sqlSession.update(namespace+".mailCodeUpdate", memberDTO);
	}

	@Override
	public MemberDTO findPass(MemberDTO memberDTO) {
		System.out.println("MemberDAOImpl findPass()");
		return sqlSession.selectOne(namespace+".findPass", memberDTO);
	}

	@Override
	public int findPassOk(MemberDTO memberDTO) {
		System.out.println("findPassOk update DAO pass");
		return sqlSession.update(namespace+".findPassOk", memberDTO);
	}

}
