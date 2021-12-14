package com.team.controller;

import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.domain.AEventDTO;
import com.team.domain.PageDTO;
import com.team.service.AEventService;

@Controller
public class AEventController {

	@Inject
	private AEventService AEventService;
	
	@RequestMapping(value = "/aEvent/coupon", method = RequestMethod.GET)
	public String couponList(AEventDTO aDTO, Model model, HttpServletRequest re,PageDTO pDTO) {
		
		// 쿠폰만료 검사
		List<AEventDTO> couponList= AEventService.couponListNoPage();
		for (int i = 0; i < couponList.size(); i++) {
			aDTO = couponList.get(i);
			Timestamp giveTime = aDTO.getGiveDate();
			Timestamp endTime = aDTO.getEndDate();
			
			LocalDateTime giveDate = giveTime.toLocalDateTime();
			LocalDateTime endDate = endTime.toLocalDateTime();
			LocalDateTime today = LocalDateTime.now();
			
			if (!(aDTO.getUseable().equals("i")) && !(aDTO.getUseable().equals("u")) ) {
				
				if (today.isAfter(giveDate)) {
					aDTO.setUseable("t");
				}
				
				if (today.isAfter(endDate.plusDays(1))) {
					aDTO.setUseable("f");
				}
			}
				
			AEventService.useableUpdate(aDTO);
		}
		
		// 페이징
		int pageSize = 7;
		String pageNum = re.getParameter("pageNum");
		if (pageNum == null) {
			pageNum= "1";
			
		}
		pDTO.setPageSize(pageSize);
		pDTO.setPageNum(pageNum);
		
		int currentPage = Integer.parseInt(pDTO.getPageNum());
		int startRow=(currentPage-1)*pDTO.getPageSize()+1;
		int endRow= startRow + pDTO.getPageSize()-1;
		pDTO.setCurrentPage(currentPage);
		pDTO.setStartRow(startRow-1);
		pDTO.setEndRow(endRow);
		
		int count = AEventService.getCouponCount();
		pDTO.setCount(count);
		
		model.addAttribute("couponList", AEventService.couponList(pDTO));
		model.addAttribute("couponCount", AEventService.getCouponCount());
		model.addAttribute("pageDTO",pDTO);
		return "aEvent/coupon";
	}
	
	
	@RequestMapping(value = "/aEvent/newCoupon", method = RequestMethod.GET)
	public String insert() {
		return "aEvent/newCoupon";
	}
	
	@RequestMapping(value = "/aEvent/newCouponPro", method = RequestMethod.POST)
	public String insertPro(AEventDTO aDTO, PageDTO pDTO) {
		
		
		int num = AEventService.getMaxCoupon();
		aDTO.setCode(++num);
		
		String giveD = aDTO.getGiveD() + " 00:00:00";
		String endD = aDTO.getEndD() + " 00:00:00";
		
		Timestamp timeGive = Timestamp.valueOf(giveD);
        Timestamp timeEnd = Timestamp.valueOf(endD);
        
        aDTO.setGiveDate(timeGive);
        aDTO.setEndDate(timeEnd);
		
		String benefit = aDTO.getBenefit();
		
		if (aDTO.getType().equals("1")) {
			aDTO.setDiscountPer(Integer.parseInt(benefit));
		}else if(aDTO.getType().equals("2")) {
			aDTO.setDiscountNum(Integer.parseInt(benefit));
		}else if (aDTO.getType().equals("3")) {
			aDTO.setGift(Integer.parseInt(benefit));
		}else if (aDTO.getType().equals("5")) {
			aDTO.setMileage(Integer.parseInt(benefit));
		}
		
		if (aDTO.getNoEx()!= null) {
			aDTO.setUseable("i");
		}else {
			aDTO.setUseable("f");
		}
        
		AEventService.insertCoupon(aDTO);
		return "redirect:/aEvent/coupon";
	}
	
	@RequestMapping(value = "/aEvent/giveCoupon", method = RequestMethod.GET)
	public String giveCouponForm(Model model) {
		
		model.addAttribute("couponList", AEventService.couponListNoPage());
		model.addAttribute("memberList", AEventService.getMemberList());
		return "aEvent/giveCoupon";
	}
	
	@RequestMapping(value = "/aEvent/giveCouponPro", method = RequestMethod.POST)
	public String giveCouponPro(AEventDTO aDTO) {
		
		int maxCode = AEventService.getMaxAll_coupon();
		
		if (aDTO.getMemId().equals("all")) {
			List<AEventDTO> memList = AEventService.getMemberList();
			for (int i = 0; i < AEventService.getMemberList().size(); i++) {
				aDTO.setMemId(memList.get(i).getMemId());
				aDTO.setGiveCode(++maxCode);
				aDTO.setCode(Integer.parseInt(aDTO.getGiveCoupon_code()));
				aDTO.setUseable("f");
				AEventService.giveCoupon(aDTO);
			}
			
		}else {
			aDTO.setGiveCode(++maxCode);
			aDTO.setCode(Integer.parseInt(aDTO.getGiveCoupon_code()));
			aDTO.setUseable("f");
			AEventService.giveCoupon(aDTO);
		}
		
		return "redirect:/aEvent/all_coupon";
	}
	
	@RequestMapping(value = "/aEvent/deleteCoupon", method = RequestMethod.GET)
	public String deleteCoupon(AEventDTO aDTO, Model model) {
		
		model.addAttribute("couponList", AEventService.couponListNoPage());
		return "aEvent/deleteCoupon";
	}
	
	@RequestMapping(value = "/aEvent/deleteCouponPro", method = RequestMethod.POST)
	public String deleteCouponPro(AEventDTO aDTO) {
		
		int code = Integer.parseInt(aDTO.getDeleteCoupon_code());
		AEventService.deleteCoupon(code);
		
		return "redirect:/aEvent/coupon";
	}
	
	
	@RequestMapping(value = "/aEvent/all_coupon", method = RequestMethod.GET)
	public String all_couponList(AEventDTO aDTO, Model model, HttpServletRequest re, PageDTO pDTO) {
		
		// 쿠폰만료 검사
		List<AEventDTO> all_couponList = AEventService.all_couponListNoPage();
		for (int i = 0; i < all_couponList.size(); i++) {
			aDTO = all_couponList.get(i);
			Timestamp giveTime = aDTO.getGiveDate();
			Timestamp endTime = aDTO.getEndDate();
					
			LocalDateTime giveDate = giveTime.toLocalDateTime();
			LocalDateTime endDate = endTime.toLocalDateTime();
			LocalDateTime today = LocalDateTime.now();
					
			if (!(aDTO.getUseable().equals("i")) && !(aDTO.getUseable().equals("u")) ) {
						
				if (today.isAfter(giveDate)) {
					aDTO.setUseable("t");
				}
						
				if (today.isAfter(endDate.plusDays(1))) {
					aDTO.setUseable("f");
				}
			}
						
			AEventService.useableUpdate(aDTO);
		}
		
		
		int pageSize = 7;
		String pageNum = re.getParameter("pageNum");
		if (pageNum == null) {
			pageNum= "1";
		}
		pDTO.setPageSize(pageSize);
		pDTO.setPageNum(pageNum);
		
		int currentPage = Integer.parseInt(pDTO.getPageNum());
		int startRow=(currentPage-1)*pDTO.getPageSize()+1;
		int endRow= startRow + pDTO.getPageSize()-1;
		pDTO.setCurrentPage(currentPage);
		pDTO.setStartRow(startRow-1);
		pDTO.setEndRow(endRow);
		
		int count = AEventService.getAll_couponCount();
		pDTO.setCount(count);
		
		model.addAttribute("pageDTO",pDTO);
		model.addAttribute("all_couponList", AEventService.all_couponList(pDTO));
		model.addAttribute("all_couponCount",AEventService.getAll_couponCount());
		return "aEvent/all_coupon";
	}
	
	@RequestMapping(value = "/aEvent/deleteAll_coupon", method = RequestMethod.GET)
	public String deleteAll_coupon(Model model, PageDTO pDTO, HttpServletRequest re) {
		
		int pageSize = 7;
		String pageNum = re.getParameter("pageNum");
		if (pageNum == null) {
			pageNum= "1";
		}
		pDTO.setPageSize(pageSize);
		pDTO.setPageNum(pageNum);
		
		int currentPage = Integer.parseInt(pDTO.getPageNum());
		int startRow=(currentPage-1)*pDTO.getPageSize()+1;
		int endRow= startRow + pDTO.getPageSize()-1;
		pDTO.setCurrentPage(currentPage);
		pDTO.setStartRow(startRow-1);
		pDTO.setEndRow(endRow);
		
		int count = AEventService.getAll_couponCount();
		pDTO.setCount(count);
		

		model.addAttribute("pageDTO",pDTO);
		model.addAttribute("all_couponList", AEventService.all_couponList(pDTO));
		return "aEvent/deleteAll_coupon";
	}
	
	
	
	@RequestMapping(value = "/aEvent/deleteAll_couponPro", method = RequestMethod.GET)
	public String deleteAll_couponPro(HttpServletRequest re) {
		AEventDTO aDTO = new AEventDTO();
		
		int giveCode = Integer.parseInt(re.getParameter("giveCodeStr"));
		aDTO.setGiveCode(giveCode);
		AEventService.deleteAll_coupon(aDTO);
		
		return "redirect:/aEvent/deleteAll_coupon";
		
	}
	
	@RequestMapping(value = "/aEvent/searchCouponList", method = RequestMethod.POST)
	public String searchCouponList(Model model,AEventDTO aDTO) {
		
		model.addAttribute("couponCount", AEventService.searchCouponList(aDTO).size());
		model.addAttribute("isSearch", "search");
		model.addAttribute("couponList", AEventService.searchCouponList(aDTO));
		return "aEvent/coupon";
			
	}
	@RequestMapping(value = "/aEvent/searchAll_couponList", method = RequestMethod.POST)
	public String searchAll_couponList(Model model,AEventDTO aDTO) {
		
		model.addAttribute("all_couponCount", AEventService.searchAll_couponList(aDTO).size());
		model.addAttribute("isSearch", "search");
		model.addAttribute("all_couponList", AEventService.searchAll_couponList(aDTO));
		return "aEvent/all_coupon";
		
	}
	
	@RequestMapping(value = "/aEvent/searchDel_couponList", method = RequestMethod.POST)
	public String searchDel_couponList(Model model,AEventDTO aDTO) {
		
		model.addAttribute("all_couponCount", AEventService.searchAll_couponList(aDTO).size());
		model.addAttribute("isSearch", "search");
		model.addAttribute("all_couponList", AEventService.searchAll_couponList(aDTO));
		return "aEvent/deleteAll_coupon";
		
	}
	
	
	
	
}
