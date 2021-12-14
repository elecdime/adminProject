package com.team.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.team.domain.AOrderDTO;
import com.team.domain.APageDTO;


@Repository
public class AOrderDAOImpl implements AOrderDAO {
	@Inject
	private SqlSession sqlSession;

	private static final String namespace = "com.team.mapper.AOrderMapper";	
		
	
	//주문목록 조회
	@Override
	public List<AOrderDTO> aOrderList(APageDTO pageDTO) throws Exception {	
		
		
		System.out.println("AOrderDAOImpl :: aOrderList");
		return sqlSession.selectList(namespace+".aOrderSearch", pageDTO);
	}
	

		// 발송확인 조회
		@Override
		public List<AOrderDTO> sendaOrderList(APageDTO pageDTO) throws Exception {

		System.out.println("AOrderDAOImpl :: sendaOrderList");

		return sqlSession.selectList(namespace + ".sendaOrderList", pageDTO);
	}

		// 배송현황 조회
		@Override
		public List<AOrderDTO> aDeliveryList(APageDTO pageDTO) throws Exception {

			System.out.println("AOrderDAOImpl :: deliveryCheck");

			return sqlSession.selectList(namespace+".deliveryList", pageDTO);
		}
	
	
	
	
	//총 주문목록 갯수
	@Override
	public Integer allOrderCount(){
		return sqlSession.selectOne(namespace+".allOrderCount");
	}
	
	//발송목록 갯수
	@Override
	public Integer sendOrderCount(){
		return sqlSession.selectOne(namespace+".sendOrderCount");
	}
	
	//배송목록 갯수
	@Override
	public Integer deliveryCount(){
		return sqlSession.selectOne(namespace+".deliveryCount");
	}
	

	// getOrderProNm
	public String getOrderProNm(AOrderDTO aOrderDTO) throws Exception {
		return sqlSession.selectOne(namespace + ".getOrderProNm", aOrderDTO);
	}

	// getOrderImg
	public String getOrderImg(AOrderDTO aOrderDTO) throws Exception {
		return sqlSession.selectOne(namespace + ".getOrderImg", aOrderDTO);
	}

	// getOrderPrice
	public int getOrderPrice(AOrderDTO aOrderDTO) throws Exception {
		return sqlSession.selectOne(namespace + ".getOrderPrice", aOrderDTO);
	}

	// getOrderCnt
	public int getOrderCnt(AOrderDTO aOrderDTO) throws Exception {
		return sqlSession.selectOne(namespace + ".getOrderCnt", aOrderDTO);
	}
	
	///////////////////////////////
	//주문 재고확인
	@Override
	public List<AOrderDTO> prepareProductList() {
		return sqlSession.selectList(namespace+".prepareProductList");
	}


	@Override
	public AOrderDTO stockCheck(AOrderDTO aDTO) {
		return sqlSession.selectOne(namespace + ".stockCheck", aDTO);
	}


	@Override
	public void stockUpdate(AOrderDTO aDTO) {
		sqlSession.update(namespace + ".stockUpdate", aDTO);
	}

	@Override
	public void updateStat_3(AOrderDTO aDTO) {
		sqlSession.update(namespace + ".updateStat_3", aDTO);
	}


	@Override
	public void insertNoStock(AOrderDTO aDTO) {
		sqlSession.insert(namespace + ".insertNoStock", aDTO);
	}


	@Override
	public void updateOrderProduct_stock(AOrderDTO aDTO) {
		sqlSession.update(namespace + ".updateOrderProduct_stock", aDTO);
	}


	@Override
	public int reSend_count(String orderId) {
		return sqlSession.selectOne(namespace + ".reSend_count", orderId);
	}


	@Override
	public void delete_remain(String orderId) {
		sqlSession.delete(namespace + ".delete_remain", orderId);
	}


	@Override
	public AOrderDTO selectOrder(String orderId) {
		return sqlSession.selectOne(namespace + ".selectOrder", orderId);
	}


	@Override
	public int getStock(AOrderDTO aDTO) {
		return sqlSession.selectOne(namespace + ".getStock", aDTO);
	}


	@Override
	public void updateOrderId(AOrderDTO aDTO) {
		sqlSession.update(namespace + ".updateOrderId", aDTO);
	}


	@Override
	public AOrderDTO searchGoodsNm(AOrderDTO aDTO) {
		return sqlSession.selectOne(namespace + ".searchGoodsNm", aDTO);
	}


	@Override
	public int updatePostCode(AOrderDTO aDTO) {
		return sqlSession.update(namespace + ".updatePostCode", aDTO);
	}
	
	@Override
	public int updateOrderStat(AOrderDTO aDTO) {
		return sqlSession.update(namespace + ".updateOrderStat", aDTO);
	}


	@Override
	public List<AOrderDTO> searchOrderList() {
		return sqlSession.selectList(namespace + ".searchOrderList");
	}


	@Override
	public List<AOrderDTO> goodsNmFindGoodsNo(String content) {
		return sqlSession.selectList(namespace + ".goodsNmFindGoodsNo" , content);
	}
	
	
	
	///////////////////////////////////////////////////////////////////////////
	
	
	   
	   @Override
	   public List<AOrderDTO> prepareProductList(PageDTO pDTO) {
	      return sqlSession.selectList(namespace + ".prepareProductList_page", pDTO);
	   }



	   @Override
	   public String searchGoodsNm(int goodsNo) {
	      return sqlSession.selectOne(namespace + ".searchGoodsNm", goodsNo);
	   }
	   @Override
	   public int gerOrdersCount() {
	      return sqlSession.selectOne(namespace + ".gerOrdersCount");
	   }


	   @Override
	   public List<AOrderDTO> searchPrepare(AOrderDTO aDTO) {
	      return sqlSession.selectList(namespace + ".searchPrepare", aDTO);
	   }


	   @Override
	   public int getSearchCount(AOrderDTO aDTO) {
	      return sqlSession.selectOne(namespace + ".getSearchCount", aDTO);
	   }


	   @Override
	   public List<AOrderDTO> searchOrderProduct(AOrderDTO aDTO) {
	      return sqlSession.selectList(namespace + ".searchOrderProduct", aDTO);
	   }	



	


}
