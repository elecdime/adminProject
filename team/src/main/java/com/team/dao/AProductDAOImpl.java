package com.team.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.team.domain.APageDTO;
import com.team.domain.AProductDTO;
import com.team.domain.CartegoryDTO;

@Repository
public class AProductDAOImpl implements AProductDAO {
	@Inject
	private SqlSession sqlSession;
	private final static String namespace = "com.team.mappers.AProductMapper";
	
	
	@Override
public List<AProductDTO> productList(APageDTO pDTO) {
	// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".productList", pDTO);
}@Override
public int getProductCount() {
	// TODO Auto-generated method stub
	 return sqlSession.selectOne(namespace+".getProductCount");
}@Override
public List<CartegoryDTO> category() throws Exception {
	// TODO Auto-generated method stub
	return sqlSession.selectList(namespace+".category");
}
@Override
public void insertProduct(AProductDTO aProductDTO) {
	// TODO Auto-generated method stub
	 	sqlSession.insert(namespace+".insertProduct",aProductDTO);
}
@Override
public AProductDTO productView(int goodsNo) {
	// TODO Auto-generated method stub
	return sqlSession.selectOne(namespace+".productView",goodsNo);
}
}
