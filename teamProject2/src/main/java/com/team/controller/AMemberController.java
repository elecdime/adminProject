package com.team.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team.domain.AMemberDTO;
import com.team.domain.AOrderDTO;
import com.team.service.AMemberService;
import com.team.service.AOrderService;

@Controller
public class AMemberController {
	
	@Inject
	AMemberService AMemberService;
	
	@Inject
	AOrderService AOrderService;
	
	@RequestMapping(value = "/aMember/member", method = RequestMethod.GET)
	public String memberList(Model model, AMemberDTO aDTO) {
		aDTO.setMemberCount(AMemberService.memberCount());
		
		model.addAttribute("count", aDTO.getMemberCount());
		model.addAttribute("memberList", AMemberService.memberList());
		return "aMember/member";
	}
	
	@RequestMapping(value = "/aMember/memberInfo", method = RequestMethod.GET)
	public String memberInfo(Model model, HttpServletRequest re, AMemberDTO aDTO) {
		String memId = (String) re.getParameter("memId");
		List<AMemberDTO> list =  AMemberService.membersOrder(memId);
		
		for (int i = 0; i < list.size(); i++) {
			aDTO = list.get(i);
			String [] opArr = aDTO.getOrderProduct().split("-");
			String [] product = opArr[0].substring(0, opArr[0].length()-1).split(","); // 맨뒤의 "," 제거 후 다시 나눔
			
			aDTO.setGoodsNo(Integer.parseInt(product[0]));
			aDTO.setGoodsCount(product.length - 1);
			aDTO.setGoodsNm(AOrderService.searchGoodsNm(aDTO.getGoodsNo())); // 상품번호를 통해 상품이름을 가져와 리스트에 저장
			
		}
		
		
		aDTO.setMemberCount(AMemberService.membersOrderCount(memId));
		
		model.addAttribute("count", list.size());
		model.addAttribute("orderList", list);
		model.addAttribute("MemberDTO", AMemberService.memberInfo(memId));
		return "aMember/memberInfo";
	}
	
	@RequestMapping(value = "/aMember/searchMemberList", method = RequestMethod.POST)
	public String searchMemberList(Model model,AMemberDTO aDTO) {
		
		model.addAttribute("memberList", AMemberService.searchMemberList(aDTO));
		return "aMember/member";
		
	}
	
	@RequestMapping(value = "/aMember/insertBlack", method = RequestMethod.GET)
	public String insertBlack(AMemberDTO aDTO, Model model) {
		
		model.addAttribute("memId", aDTO.getMemId());
		return "aMember/insertBlack";
	}
	
	@RequestMapping(value = "/aMember/insertBlackPro", method = RequestMethod.POST)
	public String black(AMemberDTO aDTO) {
		 
		AMemberService.insertBlack(aDTO);
		
		return "redirect:/aMember/blackList";
	}
	
	@RequestMapping(value = "/aMember/blackList", method = RequestMethod.GET)
	public String blackList(Model model, AOrderDTO aDTO) {
		
		model.addAttribute("count", AMemberService.blackList().size());
		model.addAttribute("blackList", AMemberService.blackList());
		return "aMember/blackList";
	}
	@RequestMapping(value = "/aMember/resetBlack", method = RequestMethod.GET)
	public String resetBlack(Model model, AMemberDTO aDTO, HttpServletRequest re) {
		
		AMemberService.resetBlack(aDTO);
		
		model.addAttribute("blackList", AMemberService.blackList());
		return "redirect:/aMember/blackList";
	}
	
	@RequestMapping(value = "/aMember/searchBlackList", method = RequestMethod.POST)
	public String searchBlackList(Model model,AMemberDTO aDTO) {
		
		model.addAttribute("memberList", AMemberService.searchMemberList(aDTO));
		return "aMember/blackList";
		
	}
}
