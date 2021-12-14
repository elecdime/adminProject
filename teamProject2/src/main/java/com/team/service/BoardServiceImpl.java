 package com.team.service;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team.dao.BoardDAO;
import com.team.domain.BoardDTO;
import com.team.domain.PageDTO;

@Service
public class BoardServiceImpl implements BoardService{

//	BoardDAO boardDAO=new BoardDAOImpl() 객체생성
	@Inject
	private BoardDAO boardDAO;
	
	@Override
	public void insertBoard(BoardDTO boardDTO) {
		System.out.println("BoardServiceImpl insertBoard()");
		//처리작업  name pass subject content
		// num   max(num)+1 , readcount 0, date 현시스템 날짜
		boardDTO.setNtcHit(0);
		boardDTO.setRegDt(new Timestamp(System.currentTimeMillis()));
		if(boardDAO.getMaxNum()==null) {
			//글이 없는경우 1로 설정
			boardDTO.setNtcNo(1);
		}else {
			// 글이 있으면 max(num)+1
			boardDTO.setNtcNo(boardDAO.getMaxNum()+1);
		}
			
			boardDAO.insertBoard(boardDTO);
			
	}

	@Override
	public List<BoardDTO> getBoardList(PageDTO pageDTO) {
		// pageSize, pageNum 담아옴
		// currentPage startRow endRow 
		int currentPage=Integer.parseInt(pageDTO.getPageNum());
		int startRow=(currentPage-1)*pageDTO.getPageSize()+1;
		int endRow=startRow+pageDTO.getPageSize()-1;
		
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setStartRow(startRow-1); // 디비 startRow-1
		pageDTO.setEndRow(endRow);
		
		return boardDAO.getBoardList(pageDTO);
	}

	@Override
	public Integer getBoardCount() {
		return boardDAO.getBoardCount();
	}
	
	@Override
	public BoardDTO getBoard(int ntcNo) {
		return boardDAO.getBoard(ntcNo);
	}

	@Override
	public void deleteBoard(int ntcNo) {
		boardDAO.deleteBoard(ntcNo);
	}

	@Override
	public void updateBoard(BoardDTO boardDTO) {
		boardDAO.updateBoard(boardDTO);
	}

	@Override
	public BoardDTO getBoard2(int ntcNo) {
		return boardDAO.getBoard2(ntcNo);
	}

	public List<BoardDTO> getBoardList2(PageDTO pageDTO) {
		// pageSize, pageNum 담아옴
		// currentPage startRow endRow 
		int currentPage=Integer.parseInt(pageDTO.getPageNum());
		int startRow=(currentPage-1)*pageDTO.getPageSize()+1;
		int endRow=startRow+pageDTO.getPageSize()-1;
		
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setStartRow(startRow-1); // 디비 startRow-1
		pageDTO.setEndRow(endRow);
		
		return boardDAO.getBoardList2(pageDTO);
	}
	
	@Override
	public Integer getBoardCount2() {
		return boardDAO.getBoardCount2();
	}

	

}
