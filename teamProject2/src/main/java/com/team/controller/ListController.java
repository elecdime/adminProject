package com.team.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.team.domain.PageDTO;
import com.team.domain.CartegoryDTO;
import com.team.domain.HotKeywordDTO;
import com.team.domain.ListDTO;
import com.team.domain.MemberDTO;
import com.team.service.ListService;
import com.team.service.MemberService;

@Controller
public class ListController {
	
	@Inject
	private ListService listService;
	
	@Inject
	private MemberService memberService;
	
	//main 화면 리스트들 시작
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main( Model model, HttpSession session) {
		//main 오늘의 리스트
		List<ListDTO> getTodayNewList = listService.getTodayNewList();
		model.addAttribute("getTodayNewList",getTodayNewList);
		//main 카테고리 새입고 건강식품
		List<ListDTO> getHealthList = listService.healthList();
		model.addAttribute("getHealthList",getHealthList);
		//main 카테고리 새입고 가공식품
		List<ListDTO> getProcessedList =listService.getProcessedList();
		model.addAttribute("getProcessedList",getProcessedList);
		//main 카테고리 새입고 신선식품
		List<ListDTO> getfreshList =listService.getfreshList();
		model.addAttribute("getfreshList",getfreshList);
		//main 카테고리 새입고 차티백
		List<ListDTO> getTeaList =listService.getTeaList();
		model.addAttribute("getTeaList",getTeaList);
		//main 카테고리 새입고 생활잡화
		List<ListDTO> getDailyList =listService.getDailyList();
		model.addAttribute("getDailyList",getDailyList);
		//main 카테고리 새입고 주간베스트
		List<ListDTO> weekBestList =listService.weekBestList();
		model.addAttribute("weekBestList",weekBestList);
		//main 카테고리 menu
		List<CartegoryDTO> menuCategory =listService.menuCategory();
		model.addAttribute("menuCategory",menuCategory);

		MemberDTO mDTO = (MemberDTO)session.getAttribute("user");
		MemberDTO mDTO2 = memberService.getMember(mDTO);
		model.addAttribute("mDTO", mDTO2);
		
		
		return "main";
	}

	
	
	//메인	베스트 상품 리스트 Top100 시작
	@RequestMapping(value = "/sub_best", method = RequestMethod.GET)
	public String getBestList(HttpServletRequest request,Model model) {
		// 한화면에 보여줄 글개수  10개 설정
		 int pageSize=10;
		 
		 //페이지 번호 가져오기 
		 String pageNum=request.getParameter("pageNum");
		 //페이지번호가 없으면 -> 1
		 if(pageNum==null){
		 	pageNum="1";
		 }
		
		 PageDTO pageDTO=new PageDTO();
		 pageDTO.setPageSize(pageSize);
		 pageDTO.setPageNum(pageNum);
		
		 
		 List<ListDTO> getBestList=listService.getBestList(pageDTO);
		 //게시판 전체 글의 개수
		 int count =listService.Bestcount(pageDTO);
		 pageDTO.setCount(count);
		
		
		 // 데이터 담기
		 model.addAttribute("getBestList",getBestList);
		 model.addAttribute("pageDTO",pageDTO);
		 System.out.println("ListController sub_best");
		return "subpage/sub_best";
	}	//	베스트 상품 리스트 Top100 끝
	
	//메인  NEW 리스트 시작
	@RequestMapping(value = "/sub_new", method = RequestMethod.GET)
	public String getNewList(HttpServletRequest request,Model model
			) {
		// 한화면에 보여줄 글개수  10개 설정
				 int pageSize=10;
				 
				 //페이지 번호 가져오기 
				 String pageNum=request.getParameter("pageNum");
				 //페이지번호가 없으면 -> 1
				 if(pageNum==null){
				 	pageNum="1";
				 }
				
				 PageDTO pageDTO=new PageDTO();
				 pageDTO.setPageSize(pageSize);
				 pageDTO.setPageNum(pageNum);
				
				 
				 List<ListDTO> getNewList=listService.getNewList(pageDTO);
				 //게시판 전체 글의 개수
				 pageDTO.setCount(listService.Newcount(pageDTO));
				
				 // 데이터 담기
				 model.addAttribute("getNewList",getNewList);
				 model.addAttribute("pageDTO",pageDTO);
				 System.out.println("ListController getNewList");
		return "subpage/sub_new";
	}//메인 카테고리 NEW 리스트 끝//
	
	//main 화면 리스트들 끝===========================

	//상품 상세페이지goods_view 
	//@RequestParam("n") ==> 상품번호로 받아오기
	@RequestMapping(value = "/goods_view", method = RequestMethod.GET)
	public String goods_view(@RequestParam("n") int goodsNo,Model model,HttpServletRequest request) {
		ListDTO goodsView = listService.goodsView(goodsNo);
		List<ListDTO> weekBestList =listService.weekBestList();
		model.addAttribute("weekBestList",weekBestList);
		model.addAttribute("goodsView",goodsView);
		return "/goods_view";
	}
	
	

	//서브리스트
	@RequestMapping(value = "/sub", method = RequestMethod.GET)
	public ModelAndView categoryList(
			@RequestParam(value = "pageSize", required = true, defaultValue = "10")String pageSize,
			@RequestParam(value = "c")String cateCode,
			@RequestParam(value = "l")String level,
			@RequestParam(value = "keyword")String value,
			@RequestParam(value = "sK")String subKeyword,
			@RequestParam(value = "sT", required = true, defaultValue = "orderCnt desc,reviewCnt desc")String searchType,
			@RequestParam(value = "s", required = false, defaultValue="0")String sprice,
			@RequestParam(value = "e", required = false, defaultValue="10000000")String eprice,
			HotKeywordDTO hotKeywordDTO,
			Model model,
			HttpServletRequest request
			) throws Exception{
		//메서드시작
		
		 PageDTO pageDTO=new PageDTO();
		 String pageNum=request.getParameter("pageNum");
		 //페이지번호가 없으면 -> 1
		 if(pageNum==null){
		 	pageNum="1"; }
		 
		 try {pageDTO.setCurrentPage(Integer.parseInt(pageNum));} 
			catch (NumberFormatException e) {pageDTO.setCurrentPage(1);}
		
		
		/*자바코드로 최근주소 받아오는법 String referer = (String)request.getHeader("REFERER"); */
		
		 pageDTO.setPageSize(Integer.parseInt(pageSize)); //상품갯수
		 
		 pageDTO.setPageNum(pageNum); //페이지넘버
		 ModelAndView mav = new ModelAndView();
		 Map<String, Object> countMav = new HashMap<String, Object>();
			 countMav.put("value", value);//대검색
			 countMav.put("pageDTO", pageDTO);
			 countMav.put("cateCode", cateCode);//카테고리 코드
			 countMav.put("level", level);//카테고리 분리 레벨
			 countMav.put("subKeyword", subKeyword); //서브검색
			 countMav.put("sprice", Integer.parseInt(sprice)); //최저가
			 countMav.put("eprice", Integer.parseInt(eprice)); //최고가
			 countMav.put("searchType", searchType); //서브검색
			 
			 mav.addObject("countMav", countMav); 
			 mav.setViewName("subpage/subAll");   
			

			 System.out.println("===전달값확인===");
			 System.out.println(String.valueOf("searchType : "+countMav.get("searchType")));
			 System.out.println(String.valueOf("value : "+countMav.get("value")));
			 System.out.println(String.valueOf("sprice : "+countMav.get("sprice")));
			 System.out.println(String.valueOf("eprice : "+countMav.get("eprice")));
			 System.out.println(String.valueOf("cateCode : "+countMav.get("cateCode")));
			 System.out.println("pageSize : "+pageSize);
			 System.out.println("pageNum : "+pageNum);
			 
			 pageDTO.setCount(listService.count(countMav));
			 System.out.println(pageDTO.getCount());
			 pageDTO.setStartRow((pageDTO.getCurrentPage() - 1) * pageDTO.getPageSize());
			
		//검색어로 화면조회 관련 메서드.
			 if(!value.equals("")) {
				 listService.insertSearch(hotKeywordDTO); // DTO에 저장
			 }
	
			 //검색어입력 X 상태에서 엔터 or 카테고리 전체보기
			 	List<ListDTO>categoryList=listService.cateSubList(countMav);//검색리스트 나오게
				List<CartegoryDTO> menuCategory =listService.menuCategory();
				model.addAttribute("menuCategory",menuCategory);
				model.addAttribute("categoryList",categoryList);
				model.addAttribute("pageDTO",pageDTO);
				return mav; 
		
		 
		}
	
}