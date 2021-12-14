package com.team.controller;


import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.domain.CartDTO;
import com.team.domain.ListDTO;
import com.team.domain.MemberDTO;
import com.team.domain.OrderDTO;
import com.team.service.CartServiceImpl;

@Controller
public class CartController {

	@Inject
	private CartServiceImpl cartService;
	
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public String join(HttpSession session, Model model) {
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("user");
		model.addAttribute("cartList", cartService.getCartList(memberDTO));
		model.addAttribute("cartSize", cartService.getCartList(memberDTO).size());
		return "member/mypage/cart";
	}
	
	
	
	@RequestMapping(value = "/deleteCart", method = RequestMethod.POST)
	@ResponseBody
	public int deleteCart(int cartId, CartDTO cartDTO, HttpSession session) {
		
		System.out.println(cartDTO.getCartId());
		int result = cartService.deleteCart(cartDTO);
		System.out.println("deleteAllCart");

		if(result != 0) {
			result = 1;
//			MemberDTO memberDTO = (MemberDTO)session.getAttribute("user");
//			int newCartCount = cartService.getCartCount(memberDTO.getMemId());
//			memberDTO.setCartCount(newCartCount);
//			session.setAttribute("user", memberDTO);
//			session.setAttribute("user", memberDTO);
		}
		
		return result;
	}
	
	
	@RequestMapping(value = "/deleteAllCart", method = RequestMethod.POST)
	@ResponseBody
	public int deleteAllCart(String memId, HttpSession session) {
		int result = cartService.deleteAllCart(memId);
		System.out.println("deleteAllCart");
		
		if(result != 0) {
			result = 1;
//			MemberDTO memberDTO = (MemberDTO)session.getAttribute("user");
//			int newCartCount = cartService.getCartCount(memberDTO.getMemId());
//			memberDTO.setCartCount(newCartCount);
//			session.setAttribute("user", memberDTO);
		}
		
		return result;
	}

	@RequestMapping(value = "/insertCart", method = RequestMethod.POST)
	@ResponseBody
	public int insertCart(int goodsNo, int amount, HttpSession session, CartDTO cartDTO) {
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("user");
		ListDTO listDTO = cartService.getProduct(goodsNo);
		cartDTO.setMemId(memberDTO.getMemId());
		cartDTO.setGoodsId(goodsNo);
		int isAmountPre = cartService.getIsAmount(cartDTO);
		System.out.println("cartInsert controllPass");
		System.out.println("기존 갯수가 있는지 없는지 확인  :" + isAmountPre );
		int result = 0;
		
		if(isAmountPre == 0) {
			
			cartDTO.setGoodsNm(listDTO.getGoodsNm());
			cartDTO.setGoodsPrice(listDTO.getGoodsPrice());
			cartDTO.setImagePath(listDTO.getImagePath());
			System.out.println(listDTO.getGoodsNo());
			
			
			result = cartService.insertCart(cartDTO);
			
		}else {
			int preAmount = cartService.getAmount(cartDTO);
			int existedAmount = cartDTO.getAmount();
			int afterAmount = preAmount + existedAmount;
			cartDTO.setAmount(afterAmount);
			result = cartService.updateAmount(cartDTO);
		}
		
		if(result != 0) {
			result = 1;
			
			
		}return result;
	}
	
	
	
	
	@RequestMapping(value = "/count", method = RequestMethod.POST)
	@ResponseBody
	public int count(HttpSession session, CartDTO cartDTO) {

		MemberDTO memberDTO = (MemberDTO)session.getAttribute("user");
		int result = cartService.getCartCount(memberDTO.getMemId());

		return result;
	}
	
	@RequestMapping(value = "/cartOrder", method = RequestMethod.POST)
	public String cartOrder(HttpSession session, Model model, HttpServletRequest request) {
		System.out.println("cartOrder controller pass");
		String[] ids = request.getParameterValues("cartId");
		List<CartDTO> carts = new ArrayList<CartDTO>();
		for(int i = 0; i < ids.length; i++) {
			carts.add(cartService.getCart(Integer.parseInt(ids[i])));
		}
		
		model.addAttribute("carts", carts);
				
		return "member/order/order"; // 주문 페이
	}
	
	
	@RequestMapping(value = "/orderPro", method = RequestMethod.POST)
	public String orderPro(HttpSession session, Model model, HttpServletRequest request, OrderDTO orderDTO) {
		System.out.println("insert order controller pass");
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("user");
		String[] ids = request.getParameterValues("cartId");
		String goodsId = "";
		String amount = "";
		for(int i = 0; i < ids.length; i++) {
			goodsId += cartService.getCart(Integer.parseInt(ids[i])).getGoodsId() + ",";
		}
		for(int i = 0; i < ids.length; i++) {
			amount += cartService.getCart(Integer.parseInt(ids[i])).getAmount() + ",";
		}
		
		String orderProduct = goodsId + "-" + amount;
		
		System.out.println("주문 아이디번호 : " + cartService.orderCount());
		orderDTO.setOrderId((cartService.orderCount()+1)+"");
		orderDTO.setOrderProduct(orderProduct);
		orderDTO.setMemId(memberDTO.getMemId());
		cartService.insertOrder(orderDTO);
		
		cartService.deleteAllCart(memberDTO.getMemId());
		
		model.addAttribute("msg", "결제가 완료되었음둥");
		model.addAttribute("url", "/main");
				
		return "/msgBox"; // 주문 페이
		
	}
	
}
