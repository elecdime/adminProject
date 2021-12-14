package com.team.dao;

import java.util.List;

import com.team.domain.BoardDTO;
import com.team.domain.PageDTO;

public interface BoardDAO {
	// boardService.insertBoard(boardDTO);
	public void insertBoard(BoardDTO boardDTO);
	
	// getMaxNum
	public Integer getMaxNum();
	
	// List<BoardDTO> boardList=boardService.getBoardList(pageDTO);
	public List<BoardDTO> getBoardList(PageDTO pageDTO);
	
//	 int count = boardService.getBoardCount();
	public Integer getBoardCount();
	
	public BoardDTO getBoard(int ntcNo);
	
	public void deleteBoard(int ntcNo);
	
	public void updateBoard(BoardDTO boardDTO);
	
	public BoardDTO getBoard2(int ntcNo);
	
	public List<BoardDTO> getBoardList2(PageDTO pageDTO);
	
	public Integer getBoardCount2();
}
