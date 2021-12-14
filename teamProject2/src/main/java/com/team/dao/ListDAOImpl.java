package com.team.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.team.domain.PageDTO;
import com.team.domain.CartegoryDTO;
import com.team.domain.HotKeywordDTO;
import com.team.domain.ListDTO;
@Repository
public class ListDAOImpl implements ListDAO{
	private final static String namespace = "com.team.mapper.ListMapper";
	
	@Inject
	private SqlSession sqlSession;
	
	//main 화면에 는 메서드 시작
	@Override
	public void insertSearch(HotKeywordDTO hotKeywordDTO) {
		System.out.println("MainDAOImpl insertSearch pass");
			sqlSession.insert(namespace + ".insertSearch", hotKeywordDTO);
			
	}


	@Override
	public List<HotKeywordDTO> hotKeyword(){
		System.out.println("MainDAOImpl hotKeyword pass");
		return sqlSession.selectList(namespace+".HotKeyword");
	}


	@Override
	public List<ListDTO> getTodayNewList() {
		System.out.println("MainDAOImpl getNewList pass");
		return sqlSession.selectList(namespace+".getTodayNewList");
	}


	@Override
	public List<ListDTO> healthList() {
		System.out.println("MainDAOImpl getHotList pass");
		return sqlSession.selectList(namespace+".healthList");
	}


	@Override
	public List<ListDTO> getProcessedList() {
		System.out.println("MainDAOImpl getProcessedList pass");
		return sqlSession.selectList(namespace+".getProcessedList");
	}


	@Override
	public List<ListDTO> getfreshList() {
		System.out.println("MainDAOImpl getfreshList pass");
		return sqlSession.selectList(namespace+".getfreshList");
	}


	@Override
	public List<ListDTO> getTeaList() {
		System.out.println("MainDAOImpl getTeaList pass");
		return sqlSession.selectList(namespace+".getTeaList");
	}


	@Override
	public List<ListDTO> getDailyList() {
		System.out.println("MainDAOImpl getDailyList pass");
		return sqlSession.selectList(namespace+".getDailyList");
	}


	@Override
	public List<ListDTO> weekBestList() {
		System.out.println("MainDAOImpl weekBestList pass");
		return sqlSession.selectList(namespace+".weekBestList");
	}


	@Override
	public List<ListDTO> getBestList(PageDTO pageDTO) {
		System.out.println("ListDAOImpl getBestList pass");
		return sqlSession.selectList(namespace+".getBestList",pageDTO);
	}
	
	//main 화면에 는 메서드 끝
	
	@Override
	public List<ListDTO> getNewList(PageDTO pageDTO) {
		System.out.println("ListDAOImpl getNewList pass");
		return sqlSession.selectList(namespace+".getNewList",pageDTO);
	}


	//상세페이지
	@Override
	public ListDTO goodsView(int goodsNo) {
		System.out.println("ListDAOImpl goodsView pass");
		return sqlSession.selectOne(namespace+".goodsView",goodsNo);
	}

	@Override
	public List<CartegoryDTO> menuCategory() {
		System.out.println("ListDAOImpl menuCategory pass");
		return sqlSession.selectList(namespace+".menuCategory");
	}

	@Override
	public List<ListDTO> cateSubList(Map<String, Object> countMav) {

			System.out.println("DAOlmp else cateSubList 조회");
			return sqlSession.selectList(namespace+".cateSubList",countMav);
	}
	@Override
	public Integer count(Map<String, Object> countMav) {
	
			return sqlSession.selectOne(namespace+".Count",countMav);
		
	}
	@Override
	public Integer Newcount(PageDTO pageDTO) {
		return sqlSession.selectOne(namespace+".Newcount",pageDTO);
	}
	@Override
	public Integer Bestcount(PageDTO pageDTO) {
		return sqlSession.selectOne(namespace+".Bestcount",pageDTO);
	}





	
}
