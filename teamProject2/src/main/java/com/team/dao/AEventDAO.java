package com.team.dao;

import java.util.List;

import com.team.domain.AEventDTO;
import com.team.domain.PageDTO;

public interface AEventDAO {
	public void insertCoupon(AEventDTO aDTO);
	public List<AEventDTO> couponList(PageDTO pDTO);
	public List<AEventDTO> couponListNoPage();
	public int getMaxCoupon();
	public int getMaxAll_coupon();
	public void useableUpdate(AEventDTO aDTO);
	public void giveCoupon(AEventDTO aDTO);
	public AEventDTO getCoupon(int code);
	public void deleteCoupon(int code);
	public List<AEventDTO> all_couponList(PageDTO pDTO);
	public List<AEventDTO> all_couponListNoPage();
	public List<AEventDTO> getMemberList();
	public void deleteAll_coupon(AEventDTO aDTO);
	public List<AEventDTO> searchCouponList(AEventDTO aDTO);
	public List<AEventDTO> searchAll_couponList(AEventDTO aDTO);
	public int getCouponCount();
	public int getAll_couponCount();
	public List<AEventDTO> giveCouponSearch(String searchText);
	public List<AEventDTO> giveCouponSearch_coup(String searchText);
	public List<AEventDTO> delCouponSearch(String searchText);
	
	
}
