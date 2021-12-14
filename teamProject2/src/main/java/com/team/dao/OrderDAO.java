package com.team.dao;


import java.util.List;

import com.team.domain.MemberDTO;
import com.team.domain.OrderDTO;

public interface OrderDAO {

	public void insertOrder(OrderDTO order);
	public int orderCount();
	public List<OrderDTO> getOrderList(MemberDTO memberDTO);
}
