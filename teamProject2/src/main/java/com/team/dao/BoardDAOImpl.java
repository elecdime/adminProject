package com.team.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.team.domain.BoardDTO;
import com.team.domain.PageDTO;

@Repository
public class BoardDAOImpl implements BoardDAO{
	//마이바티스 객체생성
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.team.mapper.BoardMapper";
	
	@Override
	public void insertBoard(BoardDTO boardDTO) {
		System.out.println("BoardDAOImpl insertBoard()");
		//디비작업
		sqlSession.insert(namespace+".insertBoard", boardDTO);
	}

	@Override
	public Integer getMaxNum() {
		return sqlSession.selectOne(namespace+".getMaxNum");
	}

	@Override
	public List<BoardDTO> getBoardList(PageDTO pageDTO) {
		return sqlSession.selectList(namespace+".getBoardList", pageDTO);
	}

	@Override
	public Integer getBoardCount() {
		return sqlSession.selectOne(namespace+".getBoardCount");
	}
	
	@Override
	public BoardDTO getBoard(int ntcNo) {
		return sqlSession.selectOne(namespace+".getBoard", ntcNo);
	}


	@Override
	public void deleteBoard(int ntcNo) {
		sqlSession.selectOne(namespace+".deleteBoard", ntcNo);
	}

	@Override
	public void updateBoard(BoardDTO boardDTO) {
		sqlSession.selectOne(namespace+".updateBoard", boardDTO);
		
	}

	@Override
	public BoardDTO getBoard2(int ntcNo) {
		return sqlSession.selectOne(namespace+".getBoard", ntcNo);
	}

	@Override
	public List<BoardDTO> getBoardList2(PageDTO pageDTO) {
		return sqlSession.selectList(namespace+".getBoardList2", pageDTO);
	}

	@Override
	public Integer getBoardCount2() {
		return sqlSession.selectOne(namespace+".getBoardCount2");
	}
	
}
