package com.team.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team.domain.AEventDTO;
import com.team.domain.PageDTO;

@Repository
public class AEventDAOImpl implements AEventDAO{
	
	@Inject
	private SqlSession sqlSession;
	private final static String namespace = "com.team.mappers.AEventMapper";

	@Override
	public void insertCoupon(AEventDTO aDTO) {
		sqlSession.insert(namespace + ".insertCoupon", aDTO);
		
	}

	@Override
	public List<AEventDTO> couponList(PageDTO pDTO) {
		
		return sqlSession.selectList(namespace + ".couponList", pDTO);
	}
	
	@Override
	public List<AEventDTO> couponListNoPage() {
		return sqlSession.selectList(namespace+".couponListNoPage");
	}
	
	@Override
	public List<AEventDTO> all_couponList(PageDTO pDTO) {
		return sqlSession.selectList(namespace + ".all_couponList", pDTO);
	}
	@Override
	public List<AEventDTO> all_couponListNoPage() {
		return sqlSession.selectList(namespace + ".all_couponListNoPage");
	}

	@Override
	public int getMaxCoupon() {
		if (sqlSession.selectOne(namespace+".getMaxCoupon") == null) {
			return 0;
		}
		return sqlSession.selectOne(namespace+".getMaxCoupon");
	}

	@Override
	public void useableUpdate(AEventDTO aDTO) {
		sqlSession.update(namespace + ".useableUpdate", aDTO);
		sqlSession.update(namespace + ".ac_useableUpdate", aDTO);
		
	}

	@Override
	public void giveCoupon(AEventDTO aDTO) {
		sqlSession.insert(namespace + ".giveCoupon",aDTO);
		
	}

	@Override
	public AEventDTO getCoupon(int code) {
		
		return sqlSession.selectOne(namespace + ".getCoupon", code);
	}

	@Override
	public void deleteCoupon(int code) {
		sqlSession.delete(namespace + ".deleteAll_coupon",code);
		sqlSession.delete(namespace + ".deleteCoupon",code);
	}

	@Override
	public List<AEventDTO> getMemberList() {
		
		return sqlSession.selectList(namespace + ".getMemberList");
	}

	@Override
	public int getMaxAll_coupon() {
		if (sqlSession.selectOne(namespace+".getMaxAll_coupon") == null) {
			return 0;
		}
		return sqlSession.selectOne(namespace + ".getMaxAll_coupon");
	}

	@Override
	public void deleteAll_coupon(AEventDTO aDTO) {
		sqlSession.delete(namespace + ".deleteAll_coupon", aDTO);
	}

	@Override
	public List<AEventDTO> searchCouponList(AEventDTO aDTO) {
		return sqlSession.selectList(namespace+ ".searchCouponList",aDTO);
	}

	@Override
	public List<AEventDTO> searchAll_couponList(AEventDTO aDTO) {
		return sqlSession.selectList(namespace+".searchAll_couponList", aDTO);
	}

	@Override
	public int getCouponCount() {
		return sqlSession.selectOne(namespace+".getCouponCount");
	}

	@Override
	public int getAll_couponCount() {
		return sqlSession.selectOne(namespace+".getAll_couponCount");
	}

	@Override
	public List<AEventDTO> giveCouponSearch(String searchText) {
		return sqlSession.selectList(namespace+".giveCouponSearch",searchText);
	}

	@Override
	public List<AEventDTO> giveCouponSearch_coup(String searchText) {
		return sqlSession.selectList(namespace+".giveCouponSearch_coup",searchText);
	}

	@Override
	public List<AEventDTO> delCouponSearch(String searchText) {
		return sqlSession.selectList(namespace + ".delCouponSearch", searchText);
	}
	



		
	
	
}
