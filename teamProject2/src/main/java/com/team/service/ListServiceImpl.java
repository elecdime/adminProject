package com.team.service;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.team.dao.ListDAO;
import com.team.domain.PageDTO;
import com.team.domain.CartegoryDTO;
import com.team.domain.HotKeywordDTO;
import com.team.domain.ListDTO;

@Service
public class ListServiceImpl implements ListService{
	@Inject
	private ListDAO listDAO;
	

Timestamp pp_date=new Timestamp(System.currentTimeMillis());
	
	//검색어삽입
	@Override
	public void insertSearch(HotKeywordDTO hotKeywordDTO) {
		System.out.println("insertSearch 도착");
		
		hotKeywordDTO.setPp_date(new Timestamp(System.currentTimeMillis()));
			listDAO.insertSearch(hotKeywordDTO);
	}
	//검색어 조회
	@Override
	public List<HotKeywordDTO> hotKeyword() {
		System.out.println("hotKeyword 도착");
		return listDAO.hotKeyword();
	}
	//main 오늘 업뎃된 상품 조회
	@Override
	public List<ListDTO> getTodayNewList() {
		System.out.println("MainServiceImpl getTodayNewList 도착");
		return listDAO.getTodayNewList();
	}
	//main 인기상품 버튼 카테고리1 건강식품
	@Override
	public List<ListDTO> healthList() {
		System.out.println("MainServiceImpl healthList 도착");
		return listDAO.healthList();
	}
	//main 인기상품 버튼 카테고리2 홍삼
	@Override
	public List<ListDTO> getProcessedList() {
		System.out.println("MainServiceImpl getProcessedList 도착");
		return listDAO.getProcessedList();
	}
	//main 인기상품 버튼 카테고리3 즙류
	@Override
	public List<ListDTO> getfreshList() {
		System.out.println("MainServiceImpl getfreshList 도착");
		return listDAO.getfreshList();
	}
	//main 인기상품 버튼 카테고리4 비타민
	@Override
	public List<ListDTO> getTeaList() {
		System.out.println("MainServiceImpl getTeaList 도착");
		return listDAO.getTeaList();
	}
	//main 인기상품 버튼 카테고리5 캡슐/분말
	@Override
	public List<ListDTO> getDailyList() {
		System.out.println("MainServiceImpl getDailyList 도착");
		return listDAO.getDailyList();
	}
	//main 주간베스트
	@Override
	public List<ListDTO> weekBestList() {
		System.out.println("MainServiceImpl weekBestList 도착");
		return listDAO.weekBestList();
	}

	//==========================================================
	//이동페이지
	//sub_best
	@Override
	public List<ListDTO> getBestList(PageDTO pageDTO) {
		int currentPage=Integer.parseInt(pageDTO.getPageNum());
		int startRow=(currentPage-1)*pageDTO.getPageSize()+1;
		int endRow=startRow+pageDTO.getPageSize()-1;
		
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setStartRow(startRow-1); // 디비 startRow-1
		pageDTO.setEndRow(endRow);
		System.out.println("serviceImpl getBestList pass");
		return listDAO.getBestList(pageDTO);
	}

	//sub_new
	@Override
	public List<ListDTO> getNewList(PageDTO pageDTO) {
		int currentPage=Integer.parseInt(pageDTO.getPageNum());
		int startRow=(currentPage-1)*pageDTO.getPageSize()+1;
		int endRow=startRow+pageDTO.getPageSize()-1;
		
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setStartRow(startRow-1); // 디비 startRow-1
		pageDTO.setEndRow(endRow);
		System.out.println("serviceImpl getNewList pass");
		return listDAO.getNewList(pageDTO);
	}

	//상세페이지
	@Override
	public ListDTO goodsView(int goodsNo) {
		
		System.out.println("serviceImpl goodsView pass");
		return listDAO.goodsView(goodsNo);
	}

	//main카테고리 메뉴	리스트조회
	@Override
	public List<CartegoryDTO> menuCategory() {
		System.out.println("serviceImpl menuCategory pass");
		return listDAO.menuCategory();
	}

	//검색어입력시 상품 조회
	@Override
	public List<ListDTO> cateSubList(Map<String, Object> countMav) {

		System.out.println("MainServiceImpl cateSubList 도착");
		 System.out.println(String.valueOf("searchType : "+countMav.get("searchType")));
		return listDAO.cateSubList(countMav);
	}
	//============================================================
	//카운팅
	//전체 및 카테고리 카운팅
	@Override
	public Integer count(Map<String, Object> countMav) {
		System.out.println("MainServiceImpl count 도착");
		return listDAO.count(countMav);
	}
	@Override
	public Integer Newcount(PageDTO pageDTO) {
		return listDAO.Newcount(pageDTO);
	}
	@Override
	public Integer Bestcount(PageDTO pageDTO) {
		
		return listDAO.Bestcount(pageDTO);
	}

}
