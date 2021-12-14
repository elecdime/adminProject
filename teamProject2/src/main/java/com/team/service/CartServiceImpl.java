package com.team.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team.dao.CartDAO;
import com.team.dao.OrderDAO;
import com.team.domain.CartDTO;
import com.team.domain.ListDTO;
import com.team.domain.MemberDTO;
import com.team.domain.OrderDTO;


@Service
public class CartServiceImpl implements CartService{

	@Inject
	CartDAO cartDAO;
	
	@Inject
	OrderDAO orderDAO;

	@Override
	public List<CartDTO> getCartList(MemberDTO memberDTO) {
		return cartDAO.getCartList(memberDTO);
	}

	@Override
	public int deleteCart(CartDTO cartDTO) {
		return cartDAO.deleteCart(cartDTO);
	}
	
	@Override
	public int deleteAllCart(String memId) {
		return cartDAO.deleteAllCart(memId);
	}

	@Override
	public int getCartCount(String memId) {
		return cartDAO.getCartCount(memId);
	}
	
	@Override
	public int insertCart(CartDTO cartDTO) {
		System.out.println("cartInsert service");

		return cartDAO.insertCart(cartDTO);
	}

	@Override
	public ListDTO getProduct(int goodsNo) {
		return cartDAO.getProduct(goodsNo);
	}

	@Override
	public CartDTO getCart(int cartId) {
		return cartDAO.getCart(cartId);
	}

	@Override
	public void insertOrder(OrderDTO order) {
		System.out.println("insert order service pass");
		orderDAO.insertOrder(order);
		
	}
	
	@Override
	public int orderCount() {
		System.out.println("orderCount order service pass");
		return orderDAO.orderCount();
		
	}

	@Override
	public int getIsAmount(CartDTO cartDTO) {
		return cartDAO.getIsAmount(cartDTO);
	}
	
	@Override
	public int getAmount(CartDTO cartDTO) {
		return cartDAO.getAmount(cartDTO);
	}

	@Override
	public int updateAmount(CartDTO cartDTO) {
		return cartDAO.updateAmount(cartDTO);
	}
	
	
	
	
}
