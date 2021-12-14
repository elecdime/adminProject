package com.team.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.team.domain.CartDTO;
import com.team.domain.ListDTO;
import com.team.domain.MemberDTO;

@Repository
public class CartDAOImpl implements CartDAO{

	@Inject
	private SqlSession sqlSession;
	private static final String namespace = "com.team.mapper.cartMapper";
	

	
	
	@Override
	public List<CartDTO> getCartList(MemberDTO memberDTO) {
		return sqlSession.selectList(namespace+".getCartList", memberDTO);
	}


	@Override
	public int deleteCart(CartDTO cartDTO) {
		return sqlSession.delete(namespace+".deleteCart", cartDTO);
	}


	@Override
	public int deleteAllCart(String memId) {
		return sqlSession.delete(namespace+".deleteAllCart", memId);
	}


	@Override
	public int getCartCount(String memId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".getCartCount", memId);
	}

	@Override
	public int insertCart(CartDTO cartDTO) {
		System.out.println("cartInsert DAO");

		return sqlSession.insert(namespace+".insertCart", cartDTO);
	}


	@Override
	public ListDTO getProduct(int goodsNo) {
		return sqlSession.selectOne(namespace+".getProduct", goodsNo);
	}


	@Override
	public CartDTO getCart(int cartId) {
		return sqlSession.selectOne(namespace+".getCart", cartId);

	}


	@Override
	public int getAmount(CartDTO cartDTO) {
		return sqlSession.selectOne(namespace+".getAmount", cartDTO);
	}


	@Override
	public int updateAmount(CartDTO cartDTO) {
		return sqlSession.update(namespace+".updateAmount", cartDTO);
	}
	
	@Override
	public int getIsAmount(CartDTO cartDTO) {
		return sqlSession.selectOne(namespace+".getIsAmount", cartDTO);
	}
	
	
}
