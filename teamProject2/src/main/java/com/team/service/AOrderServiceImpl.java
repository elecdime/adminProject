package com.team.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team.dao.AOrderDAO;
import com.team.dao.AOrderDAOImpl;
import com.team.domain.AOrderDTO;
import com.team.domain.APageDTO;
import com.team.domain.PageDTO;

@Service
public class AOrderServiceImpl implements AOrderService{
	
	
	@Inject
	private AOrderDAO AOrderDAO;
	
	
	// 주문목록 조회
	@Override
	public List<AOrderDTO> aOrderList(APageDTO pageDTO) throws Exception {

		System.out.println("AOrderServiceImpl :: aOrderList");
		System.out.println("Count : "+AOrderDAO.allOrderCount());

		
		return AOrderDAO.aOrderList(pageDTO);
	}

	// 발송확인 조회
	@Override
	public List<AOrderDTO> sendaOrderList(APageDTO pageDTO) throws Exception {

		System.out.println("AOrderServiceImpl :: sendaOrderList");
		System.out.println(AOrderDAO.sendOrderCount());

		return AOrderDAO.sendaOrderList(pageDTO);
	}

	// 배송현황 조회
	@Override
	public List<AOrderDTO> aDeliveryList(APageDTO pageDTO) throws Exception {

		System.out.println("AOrderServiceImpl :: deliveryCheck");
		System.out.println(AOrderDAO.deliveryCount());

		return AOrderDAO.aDeliveryList(pageDTO);
	}
	
	
	// 전체 글 갯수
	@Override
	public Integer allOrderCount() {
		return AOrderDAO.allOrderCount();
	}
	
	// 발송목록 글 갯수
	@Override
	public Integer sendOrderCount() {
		return AOrderDAO.sendOrderCount();
	}
	
	// 배송목록 글 갯수
	@Override
	public Integer deliveryCount() {
		return AOrderDAO.deliveryCount();
	}

	//getOrderProNm
	@Override
	public String getOrderProNm(AOrderDTO aOrderDTO) throws Exception{
		return AOrderDAO.getOrderProNm(aOrderDTO);
	}
	
	//getOrderImg
	@Override
	public String getOrderImg(AOrderDTO aOrderDTO) throws Exception{
		return AOrderDAO.getOrderImg(aOrderDTO);
	}
	
	//getOrderPrice
	@Override
	public int getOrderPrice(AOrderDTO aOrderDTO) throws Exception{
		return AOrderDAO.getOrderPrice(aOrderDTO);
	}
	
	//getOrderCnt
	@Override
	public int getOrderCnt(AOrderDTO aOrderDTO) throws Exception{
		return AOrderDAO.getOrderCnt(aOrderDTO);
	}
	
	////////////////////////////
	//주문 재고확인
	@Override
	public List<AOrderDTO> prepareProductList() {
		return AOrderDAO.prepareProductList();
	}

	@Override
	public AOrderDTO stockCheck(AOrderDTO aDTO) {
		return AOrderDAO.stockCheck(aDTO);
	}

	@Override
	public void stockUpdate(AOrderDTO aDTO) {
		AOrderDAO.stockUpdate(aDTO);
		
	}

	@Override
	public void updateStat_3(AOrderDTO aDTO) {
		AOrderDAO.updateStat_3(aDTO);
	}

	@Override
	public void insertNoStock(AOrderDTO aDTO) {
		AOrderDAO.insertNoStock(aDTO);
	}

	@Override
	public void updateOrderProduct_stock(AOrderDTO aDTO) {
		AOrderDAO.updateOrderProduct_stock(aDTO);
	}

	@Override
	public int reSend_count(String orderId) {
		return AOrderDAO.reSend_count(orderId);
	}

	@Override
	public void delete_remain(String orderId) {
		AOrderDAO.delete_remain(orderId);
	}

	@Override
	public AOrderDTO selectOrder(String orderId) {
		return AOrderDAO.selectOrder(orderId);
	}

	@Override
	public int getStock(AOrderDTO aDTO) {
		return AOrderDAO.getStock(aDTO);
	}

	@Override
	public void updateOrderId(AOrderDTO aDTO) {
		AOrderDAO.updateOrderId(aDTO);
	}

	@Override
	public AOrderDTO searchGoodsNm(AOrderDTO aDTO) {
		return AOrderDAO.searchGoodsNm(aDTO);
	}

	@Override
	public int updatePostCode(AOrderDTO aDTO) {
		return AOrderDAO.updatePostCode(aDTO);
	}
	
	@Override
	public int updateOrderStat(AOrderDTO aDTO) {
		return AOrderDAO.updateOrderStat(aDTO);
	}

	@Override
	public List<AOrderDTO> searchOrderList() {
		return AOrderDAO.searchOrderList();
	}

	@Override
	public List<AOrderDTO> goodsNmFindGoodsNo(String content) {
		return AOrderDAO.goodsNmFindGoodsNo(content);
	}
	
	
	   
	   @Override
	   public List<AOrderDTO> prepareProductList(PageDTO pDTO) {
	      return AOrderDAO.prepareProductList(pDTO);
	   }


	   @Override
	   public String searchGoodsNm(int goodsNo) {
	      return AOrderDAO.searchGoodsNm(goodsNo);
	   }

	   @Override
	   public int gerOrdersCount() {
	      return AOrderDAO.gerOrdersCount();
	   }

	   @Override
	   public List<AOrderDTO> searchPrepare(AOrderDTO aDTO) {
	      return AOrderDAO.searchPrepare(aDTO);
	   }

	   @Override
	   public int getSearchCount(AOrderDTO aDTO) {
	      return AOrderDAO.getSearchCount(aDTO);
	   }

	   @Override
	   public List<AOrderDTO> searchOrderProduct(AOrderDTO aDTO) {
	      return AOrderDAO.searchOrderProduct(aDTO);
	   }



		
	

}
