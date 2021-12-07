package com.team.controller;

import java.io.File;
import java.lang.System.Logger;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale.Category;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.team.domain.APageDTO;
import com.team.domain.AProductDTO;
import com.team.domain.CartegoryDTO;
import com.team.domain.ProductViewDTO;
import com.team.service.AProductServcie;
import com.team.utils.UploadFilesUtils;

import net.sf.json.JSONArray;

@Controller
public class AProductController {
	@Resource(name = "uploadPath")
	private String uploadPath;
	@Inject
	private AProductServcie aProductServcie;
	
	@RequestMapping(value = "/aProduct/product", method = RequestMethod.GET)
	public String productList(AProductDTO aDTO, Model model, HttpServletRequest request) {
		int pageSize=10;
		 
		 //페이지 번호 가져오기 
		 String pageNum=request.getParameter("pageNum");
		 //페이지번호가 없으면 -> 1
		 if(pageNum==null){
		 	pageNum="1";
		 }
		
		 APageDTO pageDTO=new APageDTO();
		 pageDTO.setPageSize(pageSize);
		 pageDTO.setPageNum(pageNum);
		
		 List<AProductDTO> productList=aProductServcie.productList(pageDTO);
		 
		//게시판 전체 글 개수  select count(*) from board
		// int count=boardDAO.getBoardCount();
		 int count = aProductServcie.getProductCount();
		 pageDTO.setCount(count);
		 
		 // 데이터 담기
		 model.addAttribute("productList",productList);
		 model.addAttribute("pageDTO",pageDTO);
		 
		 
//		/WEB-INF/views/board/list.jsp  => 이동
	 
		
		return "/aProduct/product";
		
	}

	@RequestMapping(value = "/aProduct/productinsert", method = RequestMethod.GET)
	public void insertProduct(Model model) throws Exception {

		 
		 List<CartegoryDTO> category = null;
		 category = aProductServcie.category();
		 
		 model.addAttribute("category", JSONArray.fromObject(category));
		 System.out.println(category);
	
}
	@RequestMapping(value = "/aProduct/productInsertPro", method = RequestMethod.POST)
	public String insertProductPro(AProductDTO aDTO,MultipartFile file) throws Exception {
		
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFilesUtils.calcPath(imgUploadPath);
		String fileName = null;

		if(file != null) {
		 fileName =  UploadFilesUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
		} else {
		 fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}

		aDTO.setImagePath(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		aDTO.setGdsThumbImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		
		 aProductServcie.insertProduct(aDTO);
		 return "redirect:/aProduct/product"; 
	
}
	@RequestMapping(value = "/aProduct/productview", method = RequestMethod.GET)
	public void Productview(@RequestParam("n")int goodsNo, Model model) throws Exception {

			ProductViewDTO goods = aProductServcie.productView(goodsNo);
		 model.addAttribute("goods",goods);
	
		 
		 
		 
}
	
	@RequestMapping(value = "/aProduct/productupdate", method = RequestMethod.GET)
	public void Productupdate(@RequestParam("n")int goodsNo, Model model) throws Exception {

		ProductViewDTO goods = aProductServcie.productView(goodsNo);
		 model.addAttribute("goods",goods);
		 
		 List<CartegoryDTO> category = null;
		 category = aProductServcie.category();
		 
		 model.addAttribute("category", JSONArray.fromObject(category));
		 System.out.println(category);
}
	@RequestMapping(value = "/aProduct/productupdate", method = RequestMethod.POST)
	public String productupdate(AProductDTO aProductDTO) throws Exception {

		aProductServcie.productUpdate(aProductDTO);
		return "redirect:/aProduct/product";
	
}
	@RequestMapping(value = "/aProduct/deleteproduct", method = RequestMethod.POST)
	public String postGoodsDelete(@RequestParam("n") int gdsNum) throws Exception {
	 

	 aProductServcie.goodsDelete(gdsNum);
	 
	 return "redirect:/aProduct/product";
	}
	
}

	
	

