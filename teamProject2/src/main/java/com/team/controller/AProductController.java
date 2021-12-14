package com.team.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
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
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpRequest;
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

	
		// 페이징
		APageDTO pDTO= new APageDTO();
		    pDTO.setType(request.getParameter("sfl"));
			pDTO.setContent(request.getParameter("stx"));

			System.out.println("Type : " + pDTO.getType());
			System.out.println("Content : " + pDTO.getContent());
				int pageSize = 10;
				String pageNum = request.getParameter("pageNum");
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
				List<AProductDTO> productList=aProductServcie.productList(pDTO);
				int count = aProductServcie.getProductCount();
				pDTO.setCount(count);

				
				
				
		// 데이터 담기
		model.addAttribute("productList", productList);
		model.addAttribute("pageDTO", pDTO);

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
	public String insertProductPro(AProductDTO aDTO, MultipartFile file) throws Exception {
	
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFilesUtils.calcPath(imgUploadPath);
		String fileName = null;

		if (file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			fileName = UploadFilesUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
		} else {
			fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}

		aDTO.setImagePath(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		aDTO.setGdsThumbImg(
				File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);

		aProductServcie.insertProduct(aDTO);
		return " direct:/aProduct/product";

	}

	@RequestMapping(value = "/aProduct/productview", method = RequestMethod.GET)
	public void Productview(@RequestParam("n") int goodsNo, Model model) throws Exception {

		ProductViewDTO goods = aProductServcie.productView(goodsNo);
		model.addAttribute("goods", goods);

	}

	@RequestMapping(value = "/aProduct/productupdate", method = RequestMethod.GET)
	public void Productupdate(@RequestParam("n") int goodsNo, Model model) throws Exception {

		ProductViewDTO goods = aProductServcie.productView(goodsNo);
		model.addAttribute("goods", goods);

		List<CartegoryDTO> category = null;
		category = aProductServcie.category();

		model.addAttribute("category", JSONArray.fromObject(category));
		System.out.println(category);
	} // 업뎃

	@RequestMapping(value = "/aProduct/productupdate", method = RequestMethod.POST)
	public String productupdate(AProductDTO vo, MultipartFile file, HttpServletRequest req) throws Exception {

		// 새로운 파일이 등록되었는지 확인
		if (file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			// 기존 파일을 삭제
			new File(uploadPath + req.getParameter("gdsImg")).delete();
			new File(uploadPath + req.getParameter("gdsThumbImg")).delete();

			// 새로 첨부한 파일을 등록
			String imgUploadPath = uploadPath + File.separator + "imgUpload";
			String ymdPath = UploadFilesUtils.calcPath(imgUploadPath);
			String fileName = UploadFilesUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(),
					ymdPath);

			vo.setImagePath(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			vo.setGdsThumbImg(
					File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);

		} else { // 새로운 파일이 등록되지 않았다면
			// 기존 이미지를 그대로 사용
			vo.setImagePath(req.getParameter("gdsImg"));
			vo.setGdsThumbImg(req.getParameter("gdsThumbImg"));

		}

		aProductServcie.productUpdate(vo);
		return "redirect:/aProduct/product";

	}

	@RequestMapping(value = "/aProduct/deleteproduct", method = RequestMethod.POST)
	public String postGoodsDelete(@RequestParam("n") int gdsNum) throws Exception {

		aProductServcie.goodsDelete(gdsNum);

		return "redirect:/aProduct/product";
	}

	// ck 에디터에서 파일 업로드
	@RequestMapping(value = "/aProduct/ckUpload", method = RequestMethod.POST)
	public void postCKEditorImgUpload(HttpServletRequest req, HttpServletResponse res,
			@RequestParam MultipartFile upload) throws Exception {

		// 랜덤 문자 생성
		UUID uid = UUID.randomUUID();

		OutputStream out = null;
		PrintWriter printWriter = null;

		// 인코딩
		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html;charset=utf-8");

		try {

			String fileName = upload.getOriginalFilename(); // 파일 이름 가져오기
			byte[] bytes = upload.getBytes();

			// 업로드 경로
			String ckUploadPath = uploadPath + File.separator + "ckUpload" + File.separator + uid + "_" + fileName;

			out = new FileOutputStream(new File(ckUploadPath));
			out.write(bytes);
			out.flush(); // out에 저장된 데이터를 전송하고 초기화

			String callback = req.getParameter("CKEditorFuncNum");
			printWriter = res.getWriter();
			String fileUrl = "/ckUpload/" + uid + "_" + fileName; // 작성화면

			// 업로드시 메시지 출력
//	  printWriter.println("<script type='text/javascript'>"
//	     + "window.parent.CKEDITOR.tools.callFunction("
//	     + callback+",'"+ fileUrl+"','이미지를 업로드하였습니다.')"
//	     +"</script>");
//	  
			printWriter.println("{\"filename\" : \"" + fileName + "\", \"uploaded\" : 1, \"url\":\"" + fileUrl + "\"}");
			printWriter.flush();

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (out != null) {
					out.close();
				}
				if (printWriter != null) {
					printWriter.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		return;
	}

}
