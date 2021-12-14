package com.team.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.team.domain.ACommentDTO;
import com.team.domain.ACommentPageDTO;

@Repository
public class ACommentDAOImpl implements ACommentDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.team.mapper.ACommentMapper";

	@Override
	public List<ACommentDTO> getcomments(ACommentPageDTO PageDTO) {
		return sqlSession.selectList(namespace + ".getcomment" , PageDTO);
	}

	@Override
	public int getcommentCount(int goodsNo) {
		return sqlSession.selectOne(namespace + ".getcommentCount" , goodsNo);
	}

	@Override
	public void insertcomment(ACommentDTO ACommentdto) {
		sqlSession.insert(namespace + ".insertcomment", ACommentdto);
	}

	@Override
	public List<ACommentDTO> getrecomments(ACommentPageDTO PageDTO) {
		return sqlSession.selectList(namespace + ".getrecomment" , PageDTO);
	}

	@Override
	public int getrecommentCount(ACommentPageDTO PageDTO) {
		return sqlSession.selectOne(namespace + ".getrecommentCount" , PageDTO);
	}

	@Override
	public void insertRecomment(ACommentDTO ACommentdto) {
		sqlSession.insert(namespace + ".insertrecomment", ACommentdto);
	}

	@Override
	public void insertPiture(ACommentDTO ACommentdto) {
		sqlSession.insert(namespace + ".insertpicture", ACommentdto);
		
	}

	@Override
	public List<ACommentDTO> checkcomment(ACommentDTO ACommentdto) {
		return sqlSession.selectList(namespace + ".checkcomment",ACommentdto);
	}

	@Override
	public String deleteComment(int commentNum) {
		String filename = sqlSession.selectOne(namespace + ".getFilename" , commentNum);
		sqlSession.delete(namespace + ".deletecomment", commentNum);
		sqlSession.delete(namespace + ".deleterecommend" , commentNum);
		return filename;
	}

	@Override
	public List<ACommentDTO> checkrecomment(ACommentDTO ACommentdto) {
		
		return sqlSession.selectList(namespace + ".checkrecomment", ACommentdto);
	}

	@Override
	public void deleteRecomment(int commentNum) {
		sqlSession.delete(namespace + ".deleterecomment" , commentNum );
	}

	@Override
	public String updateComment(ACommentDTO ACommentdto) {
		String filename =  sqlSession.selectOne(namespace + ".getFilename" , ACommentdto);
		sqlSession.update(namespace + ".updatecomment" , ACommentdto);
		return filename;
	}

	@Override
	public void deleteFile(String picture) {
		sqlSession.update(namespace + ".deletefile",picture);
	}

	@Override
	public void updateFilename(String picture) {
		sqlSession.update(namespace + ".updatefile" , picture);
	}

	@Override
	public void updateRecomment(ACommentDTO ACommentdto) {
		sqlSession.update(namespace + ".updaterecomment" , ACommentdto);
	}

	@Override
	public void updatecommentNofile(ACommentDTO ACommentdto) {
		sqlSession.update(namespace + ".updatecommentNofile" , ACommentdto);
	}

	@Override
	public int getrecommendCount(ACommentDTO ACommentdto) {
		return sqlSession.selectOne(namespace + ".getrecommendCount" , ACommentdto);
	}

	@Override
	public void recommendadd(ACommentDTO ACommentdto) {
		sqlSession.insert(namespace + ".recommendAdd" , ACommentdto);
	}

	@Override
	public int checkmyComment(ACommentDTO ACommentdto) {
		return sqlSession.selectOne(namespace + ".checkmyComment", ACommentdto);
	}

	@Override
	public int checkmyReommend(ACommentDTO ACommentdto) {
		return sqlSession.selectOne(namespace + ".checkmyReommend" , ACommentdto);
	}

	@Override
	public void recommendremove(ACommentDTO ACommentdto) {
		sqlSession.delete(namespace + ".recommendRemove", ACommentdto);
	}

	@Override
	public List<ACommentDTO> getDcomments(ACommentPageDTO PageDTO) {
		return sqlSession.selectList(namespace + ".getDcomment" , PageDTO);
	}
	
}
