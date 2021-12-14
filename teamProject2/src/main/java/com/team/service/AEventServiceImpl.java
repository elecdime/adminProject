package com.team.service;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.team.dao.AEventDAO;
import com.team.domain.AEventDTO;
import com.team.domain.PageDTO;

@Service
public class AEventServiceImpl implements AEventService{

	@Inject
	private AEventDAO AEventDAO;

	@Override
	public void insertCoupon(AEventDTO aDTO) {
		
		AEventDAO.insertCoupon(aDTO);
	}

	@Override
	public List<AEventDTO> couponList(PageDTO pDTO) {
//		List<AEventDTO> list = AEventDAO.couponList(pDTO);
//		for (int i = 0; i < list.size(); i++) {
//			AEventDTO aDTO = list.get(i);
//			if (aDTO.getType() != "3") {
//				aDTO.setGoodsNm("XXX");
//			}
//			
//		}
		return AEventDAO.couponList(pDTO);
	}
	
	@Override
	public List<AEventDTO> couponListNoPage() {
		return AEventDAO.couponListNoPage();
	}
	
	@Override
	public List<AEventDTO> all_couponList(PageDTO pDTO) {
		
		return AEventDAO.all_couponList(pDTO);
	}
	
	@Override
	public List<AEventDTO> all_couponListNoPage() {
		
		return AEventDAO.all_couponListNoPage();
	}

	@Override
	public int getMaxCoupon() {
		return AEventDAO.getMaxCoupon();
	}

	@Override
	public void useableUpdate(AEventDTO aDTO) {
		AEventDAO.useableUpdate(aDTO);
	}

	@Override
	public void giveCoupon(AEventDTO aDTO) {
		AEventDAO.giveCoupon(aDTO);
	}

	@Override
	public AEventDTO getCoupon(int code) {
		return AEventDAO.getCoupon(code);
	}

	@Override
	public void deleteCoupon(int code) {
		AEventDAO.deleteCoupon(code);
	}

	@Override
	public List<AEventDTO> getMemberList() {
		return AEventDAO.getMemberList();
	}

	@Override
	public int getMaxAll_coupon() {
		return AEventDAO.getMaxAll_coupon();
	}

	@Override
	public void deleteAll_coupon(AEventDTO aDTO) {
		AEventDAO.deleteAll_coupon(aDTO);
	}

	@Override
	public List<AEventDTO> searchCouponList(AEventDTO aDTO) {
		return AEventDAO.searchCouponList(aDTO);
	}

	@Override
	public List<AEventDTO> searchAll_couponList(AEventDTO aDTO) {
		return AEventDAO.searchAll_couponList(aDTO);
	}

	@Override
	public int getCouponCount() {
		return AEventDAO.getCouponCount();
	}

	@Override
	public int getAll_couponCount() {
		return AEventDAO.getAll_couponCount();
	}

	@Override
	public List<AEventDTO> giveCouponSearch(String searchText) {
		return AEventDAO.giveCouponSearch(searchText);
	}

	@Override
	public List<AEventDTO> giveCouponSearch_coup(String searchText) {
		return AEventDAO.giveCouponSearch_coup(searchText);
	}

	@Override
	public List<AEventDTO> delCouponSearch(String searchText) {
		return AEventDAO.delCouponSearch(searchText);
	}

	
	

}
