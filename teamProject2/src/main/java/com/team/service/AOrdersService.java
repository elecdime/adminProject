package com.team.service;

import com.team.domain.AMemberDTO;
import com.team.domain.AOrdersDTO;
import com.team.domain.ListDTO;

public interface AOrdersService {

	public ListDTO getProductinfo(int goodsNo);
	
	public AMemberDTO getMemberinfo(String memId);
	
	public void insertOrder(AOrdersDTO AOrdersdto);
}
