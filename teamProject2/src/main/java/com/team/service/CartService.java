package com.team.service;

import java.util.List;

import com.team.domain.CartDTO;
import com.team.domain.ListDTO;
import com.team.domain.MemberDTO;
import com.team.domain.OrderDTO;


public interface CartService {
	
	public List<CartDTO> getCartList(MemberDTO memberDTO);
	public int deleteCart(CartDTO cartDTO);
	public int deleteAllCart(String memId);
	public int getCartCount(String memId);
	public int insertCart(CartDTO cartDTO);
	public ListDTO getProduct(int goodsNo);
	public CartDTO getCart(int cartId);
	public void insertOrder(OrderDTO order);
	public int orderCount();
	public int getAmount(CartDTO cartDTO);
	public int getIsAmount(CartDTO cartDTO);
	public int updateAmount(CartDTO cartDTO);
}
