package com.team.controller;

import java.net.URLEncoder;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.dao.AOrderDAO;
import com.team.domain.AEventDTO;
import com.team.domain.AMemberDTO;
import com.team.domain.AOrderDTO;
import com.team.domain.AOrdersDTO;
import com.team.domain.APageDTO;
import com.team.domain.ListDTO;
import com.team.domain.PageDTO;
import com.team.service.AOrderService;
import com.team.service.AOrdersService;

import lombok.Getter;

@Controller
public class AOrderController {

	@Inject
	private AOrderService AOrderService;

	@Inject
	private AOrdersService AOrdersService;
	
	// 전체주문목록
	@RequestMapping(value = "/aOrder/aOrderList", method = RequestMethod.GET)
	public String getaOrderList(Model model, HttpServletRequest request, AOrderDTO aOrderDTO, APageDTO pageDTO) throws Exception {
		System.out.println("AOrderController :: aOrderList");
		
		pageDTO.setType(request.getParameter("sfl"));
		pageDTO.setContent(request.getParameter("stx"));
		System.out.println("Type : " + pageDTO.getType());
		System.out.println("Content : " + pageDTO.getContent());	
		String stx = pageDTO.getContent();
		if (pageDTO.getType() != null) {
			System.out.println("야호1");
			if (pageDTO.getType().equals("name")) {
				System.out.println("야호2");
				System.out.println("stx : "+stx);
				stx = URLEncoder.encode(stx,"UTF-8");
				return "redirect:/aOrder/searchOrder?sfl=name&stx="+stx;
				
			}
		}
		
		int pageSize = 10;

		// 페이지 번호 가져오기
		String pageNum = request.getParameter("pageNum");
		// 페이지번호가 없으면 -> 1
		if (pageNum == null) {
			pageNum = "1";
		}

		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);

		// pageSize, pageNum을 가져옴
		// currentPage / startRow / endRow /
		int currentPage = Integer.parseInt(pageDTO.getPageNum());
		int startRow = (currentPage - 1) * (pageDTO.getPageSize()) + 1;
		int endRow = startRow + (pageDTO.getPageSize()) - 1;

		pageDTO.setCurrentPage(currentPage);
		pageDTO.setStartRow(startRow - 1);
		pageDTO.setEndRow(endRow);

		List<AOrderDTO> aOrderList = AOrderService.aOrderList(pageDTO);

		for (int i = 0; i < aOrderList.size(); i++) {
			aOrderDTO = aOrderList.get(i);

			String op = aOrderDTO.getOrderProduct();
			System.out.println(op);
			
			String[] op1 = op.split("-");
			String[] opNo = op1[0].substring(0, op1[0].length() - 1).split(",");
			String[] opCnt = op1[1].substring(0, op1[1].length() - 1).split(",");
			System.out.println(opNo + "=======");
			System.out.println(opCnt);

			int orderProNo = Integer.parseInt(opNo[0]);
			int orderProCnt = Integer.parseInt(opCnt[0]);
			int excepCnt = opNo.length - 1;

			System.out.println("orderProNo : " + orderProNo);
			System.out.println("orderProCnt : " + orderProCnt);
			System.out.println("excepCnt : " + excepCnt);

			aOrderDTO.setGoodsNo(orderProNo);
			aOrderDTO.setOrderCnt(orderProCnt);
			aOrderDTO.setExcepCnt(excepCnt);
			model.addAttribute("goodsNo", orderProNo);
			model.addAttribute("orderCnt", orderProCnt);
			model.addAttribute("excepCnt", excepCnt);

			String orderProNm = AOrderService.getOrderProNm(aOrderDTO);
			aOrderDTO.setGoodsNm(orderProNm);
			model.addAttribute("goodsNm", orderProNm);
			System.out.println("goodsNm : "+aOrderDTO.getGoodsNm());
			
			
			
		}
		aOrderDTO.setOrderProduct(aOrderDTO.getGoodsNm());
		model.addAttribute("orderProduct", aOrderDTO.getGoodsNm());
		System.out.println("orderProduct : " + aOrderDTO.getGoodsNm());	

		// paging
		// 한화면에 보여줄 글개수 10개 설정
		// 게시판 전체 글 개수 select count(*) from board
		int cnt = AOrderService.allOrderCount();
		pageDTO.setCount(cnt);
			
		if (pageDTO.getType() != null) {
			model.addAttribute("search","search");
		}

		

		model.addAttribute("cnt", cnt);
		model.addAttribute("aOrderList", aOrderList);
		model.addAttribute("pageDTO", pageDTO);

		return "/aOrder/aOrderList";
	}
	
	////////////////////////////////////////////////////////////////////////////////////////////////
	
	@RequestMapping(value = "/aOrder/searchOrder", method = RequestMethod.GET)
	public String searchOrder(Model model, HttpServletRequest request, AOrderDTO aOrderDTO, APageDTO pageDTO) throws Exception {
		System.out.println("야호");
		String stx = request.getParameter("stx");
		System.out.println(request.getParameter("sfl") + " : 검색조건");
		System.out.println(request.getParameter("stx") + " : 검색어");
		
		
		List<AOrderDTO> result = new ArrayList<AOrderDTO>();
		
		List<AOrderDTO> list = AOrderService.goodsNmFindGoodsNo(stx);
		
		
		if(list.size() > 0) {
		for (int i = 0; i < list.size(); i++) {
			AOrderDTO listDTO =  list.get(i);
			
			String goodsNo = String.valueOf(listDTO.getGoodsNo());
			pageDTO.setContent(goodsNo);
			pageDTO.setType("name");
			System.out.println("goodsNo : "+pageDTO.getContent());
			List<AOrderDTO> goodsNmList =  AOrderService.aOrderList(pageDTO);
			
			for (int j = 0; j < goodsNmList.size(); j++) {
				AOrderDTO orderProductDTO = goodsNmList.get(j);
				String[] DTOarr = orderProductDTO.getOrderProduct().split("-");
				String[] DTOarr2 = DTOarr[0].split(",");
				String[] DTOarr3 = DTOarr[1].split(",");
				if (DTOarr2[0].equals(goodsNo)){
					result.add(goodsNmList.get(j));
					System.out.println("goodsNmList : "+goodsNmList.get(j));
					
					int orderCnt = Integer.parseInt(DTOarr3[0]);
					orderProductDTO.setOrderCnt(orderCnt);
					
					int excepCnt = DTOarr2.length - 1;
					orderProductDTO.setExcepCnt(excepCnt);
					
					int goodsNum = Integer.parseInt(DTOarr2[0]);
					orderProductDTO.setGoodsNo(goodsNum);
					
					String orderProNm = AOrderService.getOrderProNm(orderProductDTO);
					System.out.println("goodsNm : "+ orderProNm);
					orderProductDTO.setGoodsNm(orderProNm);
				}
				
			}
		}
		System.out.println("goodsNm22 : "+aOrderDTO.getGoodsNm());
		}
		
		model.addAttribute("search","search");
		model.addAttribute("cnt", result.size());
		model.addAttribute("aOrderList", result);
		
		return "aOrder/aOrderList";
	}
	
	
	
	
	////////////////////////////////////////////////////////////////////////////////////////////
	
	
	
	

	////////////////////////////////////////////////////////////////////////////////////////////////

	// 발송확인
	@RequestMapping(value = "/aOrder/sendaOrderCheck", method = RequestMethod.GET)
	public String getSendaOrderList(Model model, HttpServletRequest request, APageDTO pageDTO, AOrderDTO aOrderDTO)
			throws Exception {
		
//		System.out.println("postCode : "+aOrderDTO.getPostCode());


		System.out.println("OrderController :: sendaOrderList");
		pageDTO.setType(request.getParameter("sfl"));
		pageDTO.setContent(request.getParameter("stx"));

		// paging
		// 한화면에 보여줄 글개수 10개 설정
		int pageSize = 10;

		// 페이지 번호 가져오기
		String pageNum = request.getParameter("pageNum");
		// 페이지번호가 없으면 -> 1
		if (pageNum == null) {
			pageNum = "1";
		}

		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);

		// pageSize, pageNum을 가져옴
		// currentPage / startRow / endRow /
		int currentPage = Integer.parseInt(pageDTO.getPageNum());
		int startRow = (currentPage - 1) * (pageDTO.getPageSize()) + 1;
		int endRow = startRow + (pageDTO.getPageSize()) - 1;

		pageDTO.setCurrentPage(currentPage);
		pageDTO.setStartRow(startRow - 1);
		pageDTO.setEndRow(endRow);

		// 게시판 전체 글 개수 select count(*) from board
		int cnt = AOrderService.sendOrderCount();
		pageDTO.setCount(cnt);

		List<AOrderDTO> sendList = AOrderService.sendaOrderList(pageDTO);

		for (int i = 0; i < sendList.size(); i++) {
			aOrderDTO = sendList.get(i);

			String op = aOrderDTO.getOrderProduct();

			String[] op1 = op.split("-");
			String[] opNo = op1[0].substring(0, op1[0].length() - 1).split(",");
			String[] opCnt = op1[1].substring(0, op1[1].length() - 1).split(",");
			System.out.println(opNo + "dddd");
			System.out.println(opCnt);

			int orderProNo = Integer.parseInt(opNo[0]);
			int orderProCnt = Integer.parseInt(opCnt[0]);
			int excepCnt = opNo.length - 1;

			System.out.println("orderProNo : " + orderProNo);
			System.out.println("orderProCnt : " + orderProCnt);
			System.out.println("excepCnt : " + excepCnt);

			aOrderDTO.setGoodsNo(orderProNo);
			aOrderDTO.setOrderCnt(orderProCnt);
			aOrderDTO.setExcepCnt(excepCnt);
			model.addAttribute("goodsNo", orderProNo);
			model.addAttribute("orderCnt", orderProCnt);
			model.addAttribute("excepCnt", excepCnt);

			String orderProNm = AOrderService.getOrderProNm(aOrderDTO);
			aOrderDTO.setGoodsNm(orderProNm);
			model.addAttribute("goodsNm", orderProNm);
			System.out.println("goodsNm : " + orderProNm);

		}

		model.addAttribute("sendaOrderList", sendList);
		model.addAttribute("cnt", cnt);
		model.addAttribute("pageDTO", pageDTO);

		return "/aOrder/sendaOrderCheck";
	}
	
	////////////////////////////////////////////////////////////////////////////////////////////////
	
	
	@ResponseBody
	@RequestMapping(value = "/aOrder/sendaOrderCheckPro", method = RequestMethod.GET)
	public int getSendaOrderList(String postCode, String orderId, AOrderDTO aOrderDTO) {
		
		System.out.println("잇힝");
		System.out.println(aOrderDTO.getPostCode());
		System.out.println(aOrderDTO.getOrderId());
		int result = AOrderService.updatePostCode(aOrderDTO);
		if(result !=  0) {
			return result;
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "/aOrder/deliveryCheckPro", method = RequestMethod.GET)
	public int getdeliveryList(String postCode, AOrderDTO aOrderDTO) {
		
		System.out.println("잇힝");
		System.out.println("PostCode : "+aOrderDTO.getPostCode());
		int result = AOrderService.updateOrderStat(aOrderDTO);
		if(result !=  0) {
			return result;
		}
		return result;
	}
	
	
	
	
	
	////////////////////////////////////////////////////////////////////////////////////////////////
	
	//배송현황
		@RequestMapping(value="/aOrder/deliveryCheck", method = RequestMethod.GET)
		public String getDeliveryCheck(Model model, HttpServletRequest request, APageDTO pageDTO, AOrderDTO aOrderDTO) throws Exception 
		{

			System.out.println("aOrderController :: deliveryCheck");
			pageDTO.setType(request.getParameter("sfl"));
			pageDTO.setContent(request.getParameter("stx"));

			// paging
			// 한화면에 보여줄 글개수 10개 설정
			int pageSize = 10;

			// 페이지 번호 가져오기
			String pageNum = request.getParameter("pageNum");
			// 페이지번호가 없으면 -> 1
			if (pageNum == null) {
				pageNum = "1";
			}

			pageDTO.setPageSize(pageSize);
			pageDTO.setPageNum(pageNum);

			// pageSize, pageNum을 가져옴
			// currentPage / startRow / endRow /
			int currentPage = Integer.parseInt(pageDTO.getPageNum());
			int startRow = (currentPage - 1) * (pageDTO.getPageSize()) + 1;
			int endRow = startRow + (pageDTO.getPageSize()) - 1;

			pageDTO.setCurrentPage(currentPage);
			pageDTO.setStartRow(startRow - 1);
			pageDTO.setEndRow(endRow);

			// 게시판 전체 글 개수 select count(*) from board
			int cnt = AOrderService.deliveryCount();
			pageDTO.setCount(cnt);

			List<AOrderDTO> deliveryList = AOrderService.aDeliveryList(pageDTO);

			for (int i = 0; i < deliveryList.size(); i++) {
				aOrderDTO = deliveryList.get(i);

				String op = aOrderDTO.getOrderProduct();

				String[] op1 = op.split("-");
				String[] opNo = op1[0].substring(0, op1[0].length() - 1).split(",");
				String[] opCnt = op1[1].substring(0, op1[1].length() - 1).split(",");
				System.out.println(opNo + "dddd");
				System.out.println(opCnt);

				int orderProNo = Integer.parseInt(opNo[0]);
				int orderProCnt = Integer.parseInt(opCnt[0]);
				int excepCnt = opNo.length - 1;

				System.out.println("orderProNo : " + orderProNo);
				System.out.println("orderProCnt : " + orderProCnt);
				System.out.println("excepCnt : " + excepCnt);

				aOrderDTO.setGoodsNo(orderProNo);
				aOrderDTO.setOrderCnt(orderProCnt);
				aOrderDTO.setExcepCnt(excepCnt);
				model.addAttribute("goodsNo", orderProNo);
				model.addAttribute("orderCnt", orderProCnt);
				model.addAttribute("excepCnt", excepCnt);

				String orderProNm = AOrderService.getOrderProNm(aOrderDTO);
				aOrderDTO.setGoodsNm(orderProNm);
				model.addAttribute("goodsNm", orderProNm);
				System.out.println("goodsNm : " + orderProNm);

			}

			model.addAttribute("aDeliveryList", deliveryList);
			model.addAttribute("cnt", cnt);
			model.addAttribute("pageDTO", pageDTO);
			
			return "/aOrder/deliveryCheck";
		}
		
		
		   
		   @RequestMapping(value = "/aOrder/prepareProductList", method = RequestMethod.GET)
		   public String prepareProductList(AOrderDTO aDTO, Model model, PageDTO pDTO, HttpServletRequest re) {
		      
		      List<AOrderDTO> list = AOrderService.prepareProductList();
		      
		      for (int i = 0; i < list.size(); i++) {
		         
		         aDTO = list.get(i);
		         String [] opArr = aDTO.getOrderProduct().split("-");
		         String [] product = opArr[0].substring(0, opArr[0].length()-1).split(","); // 맨뒤의 "," 제거 후 다시 나눔
		         String [] quantity = opArr[1].substring(0, opArr[1].length()-1).split(",");
		         
		         String stock_product =""; String stock_quantity =""; // 재고가 있는 상품, 갯수 저장
		         String noStock_product=""; String noStock_quantity =""; // 재고가 없는 상품, 갯수 저장
		         
		         if (aDTO.getOrderId().contains("remain")) { // 재고확인 후 남은 주문을 다시 확인할 때
		            
		            
		            for (int j = 0; j < product.length; j++) {
		               aDTO.setProduct(Integer.parseInt(product[j]));
		               aDTO.setQuantity(Integer.parseInt(quantity[j]));
		               
		               AOrderDTO resultDTO = AOrderService.stockCheck(aDTO);
		               
		               if (resultDTO == null) {
		                  noStock_product += product[j] + ",";
		                  noStock_quantity += quantity[j]+",";
		               }else { // 재고있는 상품
		                  
		                  aDTO.setGoodsNo(aDTO.getProduct());
		                  int totalStock = (AOrderService.getStock(aDTO) - aDTO.getQuantity());
		                  aDTO.setTotalStock(totalStock);
		                  AOrderService.stockUpdate(aDTO);   // 재고 감소
		                  
		                  stock_product += product[j] + ",";
		                  stock_quantity += quantity[j]+",";
		               
		               }
		            }
		               if (stock_product.length() == 0) { // 주문한 모든 상품의 재고가없는 경우
		                  continue;
		            
		               }else if (noStock_product.length() != 0) { // 재확인 후에도 재고가 없는 주문이 있을 경우
		                     String copyOrderId = aDTO.getOrderId();
		                     
		                  if (stock_product.length() != 0) { // 다시 재고확인 했을 때 재고가 있는 경우
		                  
		                     String orderProduct = stock_product + "-" + stock_quantity; 
		                     
		                     int count;
		                     if (aDTO.getOrderId().contains("remain")) { // 
		                        String check_new_orderId = aDTO.getOrderId().substring(0, aDTO.getOrderId().length()-5); // xxxxxx-re까지만 카운트하여 reSend의 갯수유추
		                        count = AOrderService.reSend_count(check_new_orderId);
		                     
		                     }else {
		                        count = 0;
		                     }
		                     
		                     String [] new_OrderIdArr = aDTO.getOrderId().split("-");
		                     
		                     aDTO.setOrderProduct(orderProduct);
		                     
		                     aDTO.setBeforOrderId(aDTO.getOrderId());
		                     aDTO.setOrderId(new_OrderIdArr[0] + "-reSend" + (count));
		                     AOrderService.updateOrderId(aDTO);
		                     
		                     AOrderService.updateOrderProduct_stock(aDTO);
		                     
		                     AOrderService.updateStat_3(aDTO);
		                  }
		                  
		                  String orderProduct = noStock_product + "-" + noStock_quantity;
		                     
		                  AOrderService.delete_remain(copyOrderId); // xxxx-remain 이라는 이름을 계속 사용하기 위해 이전의 주문을 삭제하고 같은 이름으로 다시 사용
		                     
		                  aDTO.setOrderId(copyOrderId);
		                  aDTO.setOrderProduct(orderProduct);
		                  AOrderService.insertNoStock(aDTO);
		                  
		               }else {
		                  
		                  int count;
		                  if (aDTO.getOrderId().contains("remain")) { // 
		                     String check_new_orderId = aDTO.getOrderId().substring(0, aDTO.getOrderId().length()-5);
		                     count = AOrderService.reSend_count(check_new_orderId);
		                  
		                  }else {
		                     count = 0;
		                  }
		                  String [] new_OrderIdArr = aDTO.getOrderId().split("-");
		                  
		                  aDTO.setBeforOrderId(aDTO.getOrderId());
		                  aDTO.setOrderId(new_OrderIdArr[0] + "-reSend" + (count)); // -remain 제거 후 -reSend + count 형식으로 변환
		                  AOrderService.updateOrderId(aDTO);
		                  
		                  AOrderService.updateStat_3(aDTO);
		               }
		            
		         }else { // 첫 확인일 때
		         
		            for (int j = 0; j < product.length; j++) {
		               String product_check = product[j]; 
		               String quantity_check = quantity[j];
		               
		               aDTO.setProduct(Integer.parseInt(product_check));
		               aDTO.setQuantity(Integer.parseInt(quantity_check));
		               AOrderDTO resultDTO =  AOrderService.stockCheck(aDTO);
		               
		               if (resultDTO==null) { // 재고 모자란 상품
		                  noStock_product += (product_check + ",");
		                  noStock_quantity += (quantity_check + ",");
		               }else { // 재고있는 상품
		                  
		                  aDTO.setGoodsNo(aDTO.getProduct());
		                  int totalStock = (AOrderService.getStock(aDTO) - aDTO.getQuantity());
		                  aDTO.setTotalStock(totalStock);
		                  AOrderService.stockUpdate(aDTO);   // 재고 감소
		                  
		                  stock_product += (product_check+",");
		                  stock_quantity += (quantity_check+",");
		               
		               }
		            }
		            if (stock_product.length() == 0) { // 주문한 모든 상품의 재고가없는 경우
		               aDTO.setBeforOrderId(aDTO.getOrderId());
		               aDTO.setOrderId(aDTO.getBeforOrderId()+"-remain");
		               AOrderService.updateOrderId(aDTO);
		               
		            }else if (noStock_product.length() != 0) { 
		               
		               String orderProduct = stock_product + "-" + stock_quantity; 
		               if (stock_product.length() > 1) {
		               
		                  aDTO.setOrderProduct(orderProduct);
		                  AOrderService.updateOrderProduct_stock(aDTO);
		                  AOrderService.updateStat_3(aDTO);
		               }
		               
		               orderProduct = noStock_product + "-" + noStock_quantity;
		               
		               
		               aDTO.setOrderProduct(orderProduct);
		               aDTO.setOrderId(aDTO.getOrderId()+"-remain");
		               AOrderService.insertNoStock(aDTO);
		               
		            }else { 
		               AOrderService.updateStat_3(aDTO);
		            }
		            
		         }
		         
		      }
		      
		      
		      int pageSize = 8;
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
		      
		      int count = AOrderService.gerOrdersCount();
		      pDTO.setCount(count);
		      
		      List<AOrderDTO> list2 = AOrderService.prepareProductList(pDTO);
		      
		      for (int i = 0; i < list2.size(); i++) {
		         aDTO = list2.get(i);
		         String [] opArr = aDTO.getOrderProduct().split("-");
		         String [] product = opArr[0].substring(0, opArr[0].length()-1).split(","); // 맨뒤의 "," 제거 후 다시 나눔
		         
		         aDTO.setGoodsNo(Integer.parseInt(product[0]));
		         aDTO.setGoodsCount(product.length - 1);
		         aDTO.setGoodsNm(AOrderService.searchGoodsNm(aDTO.getGoodsNo())); // 상품번호를 통해 상품이름을 가져와 리스트에 저장
		         
		      }
		      
		      
		      model.addAttribute("pDTO", pDTO);
		      model.addAttribute("count", AOrderService.gerOrdersCount());
		      model.addAttribute("prepareProductList", list2);
		      
		      return "aOrder/prepareProductList";
		   }
		   
		   
		   // 검색
		   @RequestMapping(value = "/aOrder/searchPrepare", method = RequestMethod.GET)
		   public String searchPrepare(AOrderDTO aDTO, Model model) {
		      
		      if (aDTO.getSearchCulumn().equals("orderProduct")) {
		         
		         List<AOrderDTO> list = AOrderService.searchOrderProduct(aDTO); // 검색된 텍스트를 포함한 상품의 상품코드리스트(주문과는 상관없이 서치됨)
		         List<AOrderDTO> prepareProductList = new ArrayList<AOrderDTO>(); // 검색된 텍스트를 포함한 상품을 주문한 주문정보를 저장할 리스트
		         
		         // 상품 이름 검색
		         for (int i = 0; i < list.size(); i++) {
		            int goodsNo = list.get(i).getGoodsNo();
		            aDTO.setSearchText(goodsNo + ""); // 검색한 상품이름을 그에 맞는 상품번호로 바꿔서 검색
		            List<AOrderDTO> list2 = AOrderService.searchPrepare(aDTO); //  주문상품코드에 해당 상품코드를 포함하고있는 주문리스트
		            for (int j = 0; j < list2.size(); j++) {
		               String [] listArr = list2.get(j).getOrderProduct().split("-");
		               
		               if (listArr[0].contains(aDTO.getSearchText())) { // 주문상품코드 중 상품코드 부분에 상품코드를 포함하는 주문리스트를 리스트에 저장 ( 갯수가 상품코드로 인식될 수 있기 때문)
		               
		                  prepareProductList.add(list2.get(j));
		                     
		               }
		            }
		            
		            // 상품 이름표시
		            for (int j = 0; j < prepareProductList.size(); j++) {
		               aDTO = prepareProductList.get(j);
		               String [] opArr = aDTO.getOrderProduct().split("-");
		               String [] product = opArr[0].substring(0, opArr[0].length()-1).split(","); // 맨뒤의 "," 제거 후 다시 나눔
		               
		               aDTO.setGoodsNo(Integer.parseInt(product[0]));
		               aDTO.setGoodsCount(product.length - 1);
		               aDTO.setGoodsNm(AOrderService.searchGoodsNm(aDTO.getGoodsNo())); // 상품번호를 통해 상품이름을 가져와 리스트에 저장
		               
		            }
		         }
		         
		         aDTO.setIsSearch("search");
		         model.addAttribute("isSearch", aDTO.getIsSearch());
		         model.addAttribute("count", prepareProductList.size());
		         model.addAttribute("prepareProductList",  prepareProductList);
		         return "aOrder/prepareProductList";
		         
		      }else {
		         
		         List<AOrderDTO> list = AOrderService.searchPrepare(aDTO);
		      
		         for (int i = 0; i < list.size(); i++) {
		            aDTO = list.get(i);
		            String [] opArr = aDTO.getOrderProduct().split("-");
		            String [] product = opArr[0].substring(0, opArr[0].length()-1).split(","); // 맨뒤의 "," 제거 후 다시 나눔
		            
		            aDTO.setGoodsNo(Integer.parseInt(product[0]));
		            aDTO.setGoodsCount(product.length - 1);
		            aDTO.setGoodsNm(AOrderService.searchGoodsNm(aDTO.getGoodsNo())); // 상품번호를 통해 상품이름을 가져와 리스트에 저장
		            
		         }
		      
		      aDTO.setIsSearch("search");
		      model.addAttribute("isSearch", aDTO.getIsSearch());
		      model.addAttribute("count", list.size());
		      model.addAttribute("prepareProductList", list);
		      return "aOrder/prepareProductList";
		      }
		   }
		   
		   
		   @RequestMapping(value="/insertOrder")
		   public void subBasicOrder(
		         @RequestParam String memId ,@RequestParam String goodsNum ,@RequestParam String goodsCount ,
		         @RequestParam String orderAddr ,@RequestParam String orderSub ,@RequestParam String orderZipcode ,
		         @RequestParam String orderPhone ,@RequestParam Integer amount,@RequestParam String resipient) {
		         
		         AOrdersDTO AOrdersdto = new AOrdersDTO();
		         AOrdersdto.setMemId(memId);
		         String orderProduct = goodsNum + ",-" + goodsCount + ",";
		         AOrdersdto.setOrderProduct(orderProduct);
		         AOrdersdto.setOrderAddr(orderAddr);
		         AOrdersdto.setOrderSub(orderSub);
		         AOrdersdto.setOrderZipcode(orderZipcode);
		         AOrdersdto.setOrderPhone(orderPhone);
		         AOrdersdto.setAmount(amount);
		         AOrdersdto.setResipient(resipient);
		         
		         String postCode = "987654";
		         AOrdersdto.setPostCode(postCode);
		         Timestamp date = new Timestamp(System.currentTimeMillis()); 
		         AOrdersdto.setOrderDate(date);
		         
		         AOrdersService.insertOrder(AOrdersdto);
		   }
		   
		   @RequestMapping(value = "/orders", method = RequestMethod.GET)
		   public String Vieworders(@RequestParam Integer goodsNum , @RequestParam Integer goodsCount , Model model , HttpSession session, HttpServletRequest re){
		      
		      ListDTO Listdto = AOrdersService.getProductinfo(goodsNum);
		      
		      model.addAttribute("ListDTO" , Listdto);
		      model.addAttribute("goodsCount", goodsCount);
		      model.addAttribute("goodsNum", goodsNum);
		      
		      session = re.getSession();
		      session.setAttribute("id","helloWorld");
		      String memId = (String)session.getAttribute("id");
		      
		      AMemberDTO AMemberDTO = AOrdersService.getMemberinfo(memId);
		      
		      model.addAttribute("AMemberDTO" , AMemberDTO);
		      
		      List<AEventDTO> myCoupon =  new ArrayList<AEventDTO>();
		      List<AEventDTO> couponList =  AOrdersService.myCouponList(memId);
		      
		      for (int i = 0; i < couponList.size(); i++) {
		         AEventDTO mcDTO = couponList.get(i);
		         mcDTO.setType(AOrdersService.couponInfo(mcDTO.getCoupon_code()).getType());
		         mcDTO.setName(AOrdersService.couponInfo(mcDTO.getCoupon_code()).getName());
		         if ( (mcDTO.getUseable().equals("t") || mcDTO.getUseable().equals("i")) && !(mcDTO.getType().equals("5"))){
		            myCoupon.add(mcDTO);
		         }
		      }
		      
		      model.addAttribute("myCoupon", myCoupon);
		      return "/orders";
		   }
		   
		   @RequestMapping(value = "/couponResult")
		   public ResponseEntity<Map<String, Object>> couponResult(@RequestParam String memId , @RequestParam Integer coupon_code ,@RequestParam String right_product_amt,
		         @RequestParam String postPrice, Model model , HttpSession session, HttpServletRequest re){
		      AEventDTO aDTO = new AEventDTO();
		      aDTO = AOrdersService.couponInfo(coupon_code);
		      
		      String benefit = aDTO.getBenefit();
		      int amount = Integer.parseInt(right_product_amt.replace(",", ""));
		      int discount = 0;
		      if (aDTO.getType().equals("1")) {
		         discount = amount / (Integer.parseInt(benefit));
		         amount -= discount;
		         
		      }else if (aDTO.getType().equals("2")) {
		         discount  = Integer.parseInt(benefit);
		         amount -= discount;
		         
		      }else if (aDTO.getType().equals("3")) {
		         
		      }else if (aDTO.getType().equals("4")) {
		         if (!postPrice.equals("무료배송")) {
		            amount -= 3000;
		            discount = 3000;
		         }
		         
		      }
		      Map<String, Object> result = new HashMap<String,Object>();
		      result.put("amount", amount);
		      result.put("discount", discount);
		      
		      ResponseEntity<Map<String,Object>> entity = new ResponseEntity<Map<String,Object>>(result, HttpStatus.OK);
		      return entity;
		      
		   }
		   
		   
		}
