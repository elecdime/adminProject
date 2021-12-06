package com.team.dao;

import java.util.List;

import com.team.domain.APageDTO;
import com.team.domain.AProductDTO;
import com.team.domain.CartegoryDTO;

public interface AProductDAO {
	public List<AProductDTO> productList(APageDTO pDTO);
	public int getProductCount() ;
	public List<CartegoryDTO> category() throws Exception;
	public void insertProduct(AProductDTO aProductDTO);
	public AProductDTO productView(int goodsNo) ;
}
