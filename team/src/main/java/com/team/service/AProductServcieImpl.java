package com.team.service;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team.dao.AProductDAO;
import com.team.domain.APageDTO;
import com.team.domain.AProductDTO;
import com.team.domain.CartegoryDTO;

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
	public void insertProduct(AProductDTO aProductDTO) {
		// TODO Auto-generated method stub
		
		Timestamp date = new Timestamp(System.currentTimeMillis());
		aProductDTO.setRegDt(date);
		aProductDTO.setModDt(date);
		
		
		aProductDAO.insertProduct(aProductDTO);
	}@Override
	public AProductDTO productView(int goodsNo) {
		// TODO Auto-generated method stub
		return aProductDAO.productView(goodsNo);
	}
}
