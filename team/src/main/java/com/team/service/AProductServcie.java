package com.team.service;

import java.util.List;

import com.team.domain.APageDTO;
import com.team.domain.AProductDTO;
import com.team.domain.CartegoryDTO;
import com.team.domain.ProductViewDTO;

public interface AProductServcie {
	public List<AProductDTO> productList(APageDTO pDTO);
	public int getProductCount() ;
	public List<CartegoryDTO> category() throws Exception;
	public void insertProduct(AProductDTO aProductDTO) ;
	public ProductViewDTO productView(int goodsNo) ;
	public void productUpdate(AProductDTO aProductDTO);
	public void goodsDelete(int goodsNo);
}
