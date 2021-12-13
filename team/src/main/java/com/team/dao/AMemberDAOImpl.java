package com.team.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.team.domain.AMemberDTO;
import com.team.domain.AOrderDTO;

@Repository
public class AMemberDAOImpl implements AMemberDAO{
	
	@Inject
	private SqlSession sqlSession;
	private final static String namespace = "com.team.mappers.AMemberMapper";

	
	@Override
	public List<AMemberDTO> memberList() {
		return sqlSession.selectList(namespace + ".memberList");
	}


	@Override
	public AMemberDTO memberInfo(String memId) {
		return sqlSession.selectOne(namespace + ".memberInfo", memId);
	}


	@Override
	public int memberCount() {
		return sqlSession.selectOne(namespace+".memberCount");
	}
	
	@Override
	public List<AMemberDTO> searchMemberList(AMemberDTO aDTO) {
		return sqlSession.selectList(namespace+".searchMemberList", aDTO);
	}


	@Override
	public List<AMemberDTO> membersOrder(String memId) {
		return sqlSession.selectList(namespace+".membersOrder",memId);
	}


	@Override
	public int membersOrderCount(String memId) {
		return sqlSession.selectOne(namespace+".membersOrderCount",memId);
	}


	@Override
	public void insertBlack(AMemberDTO aDTO) {
		sqlSession.update(namespace + ".insertBlack", aDTO);
	}


	@Override
	public List<AMemberDTO> blackList() {
		return sqlSession.selectList(namespace + ".blackList");
	}


	@Override
	public void resetBlack(AMemberDTO aDTO) {
		sqlSession.update(namespace + ".resetBlack" , aDTO);
	}


	@Override
	public List<AMemberDTO> searchBlackList() {
		// TODO Auto-generated method stub
		return null;
	}



}
