package com.team.service;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team.dao.AProductDAO;
import com.team.domain.APageDTO;
import com.team.domain.AProductDTO;
import com.team.domain.CartegoryDTO;
import com.team.domain.ProductViewDTO;

@Service
public class AProductServcieImpl implements AProductServcie {
	@Inject
	AProductDAO aProductDAO;

	@Override
	public List<AProductDTO> productList(APageDTO pDTO) {
		// TODO Auto-generated method stub
		return aProductDAO.productList(pDTO);
	}

	@Override
	public int getProductCount() {
		// TODO Auto-generated method stub
		return aProductDAO.getProductCount();
	}@Override
	public List<CartegoryDTO> category() throws Exception {
		// TODO Auto-generated method stub
		return aProductDAO.category();
	}@Override
	public ProductViewDTO productView(int goodsNo) {
		// TODO Auto-generated method stub
		return aProductDAO.productView(goodsNo);
	}
	@Override
	public void productUpdate(AProductDTO aProductDTO) {
		// TODO Auto-generated method stub
		Timestamp date = new Timestamp(System.currentTimeMillis());
		aProductDTO.setModDt(date);
		aProductDAO.productUpdate(aProductDTO);
	}
	@Override
	public void goodsDelete(int goodsNo) {
		// TODO Auto-generated method stub
		aProductDAO.goodsDelete(goodsNo);
	}@Override
	public int auto(int goodsNo) {
		// TODO Auto-generated method stub
		
		 return aProductDAO.auto(goodsNo);
	}
	@Override
	public void insertProduct(AProductDTO aProductDTO) {
		// TODO Auto-generated method stub
		
		Timestamp date = new Timestamp(System.currentTimeMillis());
		aProductDTO.setRegDt(date);
		aProductDTO.setModDt(date);

			
		aProductDAO.insertProduct(aProductDTO);
	}
}
