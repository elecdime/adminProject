package com.team.dao;


import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.team.domain.MemberDTO;
import com.team.domain.OrderDTO;

@Repository
public class OrderDAOImpl implements OrderDAO{

	@Inject
	private SqlSession sqlSession;
	private static final String namespace = "com.team.mapper.orderMapper";
	
	@Override
	public void insertOrder(OrderDTO order) {
		System.out.println("insert order DAO pass");
		sqlSession.insert(namespace+".insertOrder", order);
	}

	@Override
	public int orderCount() {
		System.out.println("orderCount DAO pass");
		return sqlSession.selectOne(namespace+".orderCount");
	}

	@Override
	public List<OrderDTO> getOrderList(MemberDTO memberDTO) {
		System.out.println("getOrderList DAO pass");
		return sqlSession.selectList(namespace+".getOrderList");
	}
	
	
	
	
}
