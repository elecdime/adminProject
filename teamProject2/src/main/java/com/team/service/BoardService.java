package com.team.service;

import java.util.List;

import com.team.domain.BoardDTO;
import com.team.domain.PageDTO;

public interface BoardService {

	// boardService.insertBoard(boardDTO);
	public void insertBoard(BoardDTO boardDTO);
	
	//List<BoardDTO> boardList=boardService.getBoardList(pageDTO);
	public List<BoardDTO> getBoardList(PageDTO pageDTO);
	
	public Integer getBoardCount();
	
	public BoardDTO getBoard(int ntcNo);
	
	public void deleteBoard(int ntcNo);
	
	public void updateBoard(BoardDTO boardDTO);
	
	public BoardDTO getBoard2(int ntcNo);
	
	public List<BoardDTO> getBoardList2(PageDTO pageDTO);
	
	public Integer getBoardCount2();
}
