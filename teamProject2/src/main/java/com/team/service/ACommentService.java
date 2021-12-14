package com.team.service;

import java.util.List;

import com.team.domain.ACommentDTO;
import com.team.domain.ACommentPageDTO;

public interface ACommentService {
	public List<ACommentDTO> getcomments(ACommentPageDTO PageDTO);
	
	public List<ACommentDTO> getDcomments(ACommentPageDTO PageDTO);
	
	public int getcommentCount(int goodsNo);
	
	public void insertcomment(ACommentDTO ACommentdto);
	
	public List<ACommentDTO> getrecomments(ACommentPageDTO PageDTO);
	
	public int getrecommentCount(ACommentPageDTO PageDTO);
	
	public void insertRecomment(ACommentDTO ACommentdto);
	
	public void insertPiture(ACommentDTO ACommentdto);
	
	public List<ACommentDTO> checkcomment(ACommentDTO ACommentdto);
	
	public String deleteComment(int commentNum);
	
	public List<ACommentDTO> checkrecomment(ACommentDTO ACommentdto);
	
	public void deleteRecomment(int commentNum);
	
	public String updateComment(ACommentDTO ACommentdto);
	
	public void deleteFile(String picture);
	
	public void updateFilename(String picture);
	
	public void updateRecomment(ACommentDTO ACommentdto);
	
	public void updatecommentNofile(ACommentDTO ACommentdto);
	
	public int getrecommendCount(ACommentDTO ACommentdto);
	
	public void recommendadd(ACommentDTO ACommentdto);
	
	public int checkmyComment(ACommentDTO ACommentdto);
	
	public int checkmyReommend(ACommentDTO ACommentdto);
	
	public void recommendremove(ACommentDTO ACommentdto);
}
