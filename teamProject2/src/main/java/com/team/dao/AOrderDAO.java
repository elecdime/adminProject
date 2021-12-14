package com.team.dao;

import java.util.List;
import java.util.Map;

import com.team.domain.AOrderDTO;
import com.team.domain.APageDTO;
import com.team.domain.PageDTO;



public interface AOrderDAO {
	
	//주문목록 조회
	public List<AOrderDTO> aOrderList(APageDTO pageDTO) throws Exception;
	
	//주문 재고확인
	public List<AOrderDTO> prepareProductList();

//	//발송확인 조회
	public List<AOrderDTO> sendaOrderList(APageDTO pageDTO) throws Exception;
//		
//	//배송현황 조회
	public List<AOrderDTO> aDeliveryList(APageDTO pageDTO) throws Exception;
	
	// 전체 글 갯수
	public Integer allOrderCount();
	
	//발송목록  게시물 갯수
	public Integer sendOrderCount();
	
	//배송목록  게시물 갯수
	public Integer deliveryCount();
	
	
	public String getOrderProNm(AOrderDTO aOrderDTO) throws Exception;
	
	public String getOrderImg(AOrderDTO aOrderDTO) throws Exception;
	
	public int getOrderPrice(AOrderDTO aOrderDTO) throws Exception;
	
	public int getOrderCnt(AOrderDTO aOrderDTO) throws Exception;
	
	//////////////////////////////////
	
	public AOrderDTO stockCheck(AOrderDTO aDTO);
	public void stockUpdate(AOrderDTO aDTO);
	public void updateStat_3(AOrderDTO aDTO);
	public void insertNoStock(AOrderDTO aDTO);
	public void updateOrderProduct_stock(AOrderDTO aDTO);
	public int reSend_count(String orderId);
	public void delete_remain(String orderId);
	public AOrderDTO selectOrder(String orderId);
	public int getStock(AOrderDTO aDTO);
	public void updateOrderId(AOrderDTO aDTO);
	public AOrderDTO searchGoodsNm(AOrderDTO aDTO);
	public int updatePostCode(AOrderDTO aDTO);
	public int updateOrderStat(AOrderDTO aDTO);
	public List<AOrderDTO> searchOrderList();
	public List<AOrderDTO> goodsNmFindGoodsNo(String content);

	
	   public List<AOrderDTO> prepareProductList(PageDTO pDTO);
	   public String searchGoodsNm(int goodsNo);
	   public int gerOrdersCount();
	   public List<AOrderDTO> searchPrepare(AOrderDTO aDTO);
	   public int getSearchCount(AOrderDTO aDTO);
	   public List<AOrderDTO> searchOrderProduct(AOrderDTO aaDTO);


	

}
