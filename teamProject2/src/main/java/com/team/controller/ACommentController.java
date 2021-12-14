package com.team.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.team.domain.ACommentDTO;
import com.team.domain.ACommentPageDTO;
import com.team.service.ACommentService;

@Controller
public class ACommentController {

	@Inject
	private ACommentService ACommentService;
	
	@RequestMapping(value="/commentPro")
    @ResponseBody
    public Map<String,Object> commmentget(@RequestParam Integer page , @RequestParam Integer goodsNo) {		
		List<Map<String,String>> datalist = new ArrayList<Map<String,String>>();
		
		Map<String,String> data = null;
		ACommentPageDTO PageDTO = new ACommentPageDTO();
		
		PageDTO.setPage((page-1)*3); 
		PageDTO.setPagesize(3); 
		PageDTO.setGoodsNo(goodsNo);
		
		List<ACommentDTO> ACommentdto = ACommentService.getcomments(PageDTO);
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy/MM/dd");
		
		for(ACommentDTO s : ACommentdto) {
			data = new HashMap<String, String>();
			
			data.put("memid",s.getMemId());
			data.put("star",Integer.toString(s.getStar()));
			data.put("comment",s.getComment());
			data.put("commentNum",Integer.toString(s.getCommentNum()));
			data.put("commentTime",simpleDateFormat.format(s.getCommentTime()));
			data.put("picture", s.getPicture());
			
			datalist.add(data);
		}

		
		Map<String , Object> ACommmentDatas = new HashMap<String, Object>();

		ACommmentDatas.put("datas", datalist);
		
        return ACommmentDatas;
    }
	
	@RequestMapping(value="/DcommentPro")
    @ResponseBody
    public Map<String,Object> Dcommmentget(@RequestParam Integer page , @RequestParam Integer goodsNo) {		
		List<Map<String,String>> datalist = new ArrayList<Map<String,String>>();
		
		Map<String,String> data = null;
		ACommentPageDTO PageDTO = new ACommentPageDTO();
		PageDTO.setPage((page-1)*3); PageDTO.setPagesize(3); PageDTO.setGoodsNo(goodsNo);
		List<ACommentDTO> ACommentdto = ACommentService.getDcomments(PageDTO);
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy/MM/dd");
		
		for(ACommentDTO s : ACommentdto) {
			data = new HashMap<String, String>();
			
			data.put("memid",s.getMemId());
			data.put("star",Integer.toString(s.getStar()));
			data.put("comment",s.getComment());
			data.put("commentNum",Integer.toString(s.getCommentNum()));
			data.put("commentTime",simpleDateFormat.format(s.getCommentTime()));
			data.put("picture", s.getPicture());
			
			datalist.add(data);
		}

		
		Map<String , Object> ACommmentDatas = new HashMap<String, Object>();

		ACommmentDatas.put("datas", datalist);
		
        return ACommmentDatas;
    }
	
	@RequestMapping(value="/commentCount")
	@ResponseBody
	public String commentcount(@RequestParam Integer goodsNo) {
		return Integer.toString(ACommentService.getcommentCount(goodsNo));
	}
	
	@RequestMapping(value="/commentSerialize")
	public void commentSerialize(ACommentDTO ACommentdto) {
		ACommentService.insertcomment(ACommentdto);
	}

	@RequestMapping(value="/recommentPro")
	@ResponseBody
    public Map<String,Object> recommmentget(@RequestParam Integer commentNum , @RequestParam Integer page) {		
		List<Map<String,String>> datalist = new ArrayList<Map<String,String>>();
		
		Map<String,String> data = null;
		
		ACommentPageDTO PageDTO = new ACommentPageDTO();
		PageDTO.setPage((page-1)*3); PageDTO.setPagesize(3); PageDTO.setCommentNum(commentNum);
		List<ACommentDTO> ACommentdto = ACommentService.getrecomments(PageDTO);
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy/MM/dd");
		
		for(ACommentDTO s : ACommentdto) {
			data = new HashMap<String, String>();
			data.put("recomment",s.getComment());
			data.put("memid", s.getMemId());
			data.put("commentTime" , simpleDateFormat.format(s.getCommentTime()));
			
			datalist.add(data);
		}
		
		Map<String , Object> ACommmentDatas = new HashMap<String, Object>();
		ACommmentDatas.put("datas", datalist);
		
        return ACommmentDatas;
    }
	
	@RequestMapping(value="/recommentCount")
	@ResponseBody
	public String recommentcount(@RequestParam Integer commentNum) {
		ACommentPageDTO PageDTO = new ACommentPageDTO();
		PageDTO.setCommentNum(commentNum);
		return Integer.toString(ACommentService.getrecommentCount(PageDTO));
	}
	
	@RequestMapping(value="/recommentSerialize")
	public void recommentSerialize(ACommentDTO ACommentdto) {
		ACommentService.insertRecomment(ACommentdto);
	}
	
	@RequestMapping(value="/upload", method = RequestMethod.POST , consumes= {"multipart/form-data"})
	public void upload(MultipartFile file, HttpServletRequest request) throws IOException {
		
		UUID uid = UUID.randomUUID();
		String fileName = uid.toString()+"_"+file.getOriginalFilename();
		System.out.println(file.getOriginalFilename());
		
		String root_path = request.getSession().getServletContext().getRealPath("/");
		String attach_path = "resources/upload/";
		System.out.println(root_path + attach_path);
		
		File targetFile = new File(root_path + attach_path,fileName);
//		File targetFile = new File(uploadPath, fileName);
		FileCopyUtils.copy(file.getBytes(),targetFile);
		
		ACommentDTO acommentdto = new ACommentDTO();
		acommentdto.setPicture(fileName);
		
		ACommentService.insertPiture(acommentdto);
	}
	
	@RequestMapping(value="/checkcomment")
	@ResponseBody
    public Map<String,Object> checkcomment(@RequestParam String memid , @RequestParam Integer goodsNo) {		
		List<Map<String,String>> datalist = new ArrayList<Map<String,String>>();
		
		Map<String,String> data = null;
		ACommentDTO acommentdto = new ACommentDTO();
		acommentdto.setMemId(memid); acommentdto.setGoodsNo(goodsNo);
		
		List<ACommentDTO> ACommentdto = ACommentService.checkcomment(acommentdto);
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy/MM/dd");
		
		for(ACommentDTO s : ACommentdto) {
			data = new HashMap<String, String>();
			
			data.put("memid",s.getMemId());
			data.put("star",Integer.toString(s.getStar()));
			data.put("comment",s.getComment());
			data.put("commentNum",Integer.toString(s.getCommentNum()));
			data.put("commentTime",simpleDateFormat.format(s.getCommentTime()));
			data.put("picture", s.getPicture());
			
			datalist.add(data);
		}

		
		Map<String , Object> ACommmentDatas = new HashMap<String, Object>();

		ACommmentDatas.put("datas", datalist);
		
        return ACommmentDatas;
    }
	
	@RequestMapping(value="/deletecomment")
	public void deletecomment(@RequestParam Integer commentnum , HttpServletRequest request) {
		String fileName = ACommentService.deleteComment(commentnum);
		
		String root_path = request.getSession().getServletContext().getRealPath("/");
		String attach_path = "resources/upload/";
		
		File targetFile = new File(root_path + attach_path,fileName);
		if(targetFile.exists()) {
			targetFile.delete();
		}
	}
	
	@RequestMapping(value="/checkrecomment")
	@ResponseBody
    public Map<String,Object> checkrecomment(@RequestParam String memid , @RequestParam Integer recommentNum) {		
		List<Map<String,String>> datalist = new ArrayList<Map<String,String>>();
		
		Map<String,String> data = null;
		
		ACommentDTO acommentdto = new ACommentDTO();
		acommentdto.setMemId(memid);acommentdto.setCommentNum(recommentNum);
		
		List<ACommentDTO> ACommentdto = ACommentService.checkrecomment(acommentdto);
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy/MM/dd");
		
		for(ACommentDTO s : ACommentdto) {
			data = new HashMap<String, String>();
			
			data.put("memid",s.getMemId());
			data.put("comment",s.getComment());
			data.put("commentNum",Integer.toString(s.getCommentNum()));
			data.put("commentTime",simpleDateFormat.format(s.getCommentTime()));
			data.put("recomment",Integer.toString(s.getRecomment()));
			
			datalist.add(data);
		}

		
		Map<String , Object> ACommmentDatas = new HashMap<String, Object>();

		ACommmentDatas.put("datas", datalist);
		
        return ACommmentDatas;
    }
	
	@RequestMapping(value="/deleterecomment")
	public void deleterecomment(@RequestParam Integer commentnum) {
		ACommentService.deleteRecomment(commentnum);
	}
	
	@RequestMapping(value="/ucommentSerialize" , produces = "application/text; charset=UTF-8") //produces 한글 깨짐 방지
	@ResponseBody
	public String ucommentSerialize(ACommentDTO ACommentdto) {
		String deleteFilename =  ACommentService.updateComment(ACommentdto);
		
		return deleteFilename;
	}
	
	@RequestMapping(value="/deletefile")
	public void deletefile(@RequestParam String filename , HttpServletRequest request) {
		String root_path = request.getSession().getServletContext().getRealPath("/");
		String attach_path = "resources/upload/";
		
		if(filename!=null&&filename!="") {
			File targetFile = new File(root_path + attach_path,filename);
			if(targetFile.exists()) {
				targetFile.delete();
				ACommentService.deleteFile(filename);
			}
		}
	}
	
	@RequestMapping(value="/uploadupdate", method = RequestMethod.POST , consumes= {"multipart/form-data"})
	public void uploadupdate(MultipartFile ufile, HttpServletRequest request) throws IOException {
		
		UUID uid = UUID.randomUUID();
		String fileName = uid.toString()+"_"+ufile.getOriginalFilename();
		
		String root_path = request.getSession().getServletContext().getRealPath("/");
		String attach_path = "resources/upload/";
		
		File targetFile = new File(root_path + attach_path,fileName);
		FileCopyUtils.copy(ufile.getBytes(),targetFile);
		
		ACommentService.updateFilename(fileName);
	}
	
	@RequestMapping(value="/urecommentSerialize")
	public void urecommentSerialize(ACommentDTO ACommentdto) {
		ACommentService.updateRecomment(ACommentdto);
	}
	
	@RequestMapping(value="/updatecommentNofile")
	public void updatecommentNofile(ACommentDTO ACommentdto) {
		ACommentService.updatecommentNofile(ACommentdto);
	}
	
	
	@RequestMapping(value="/recommendCount")
	@ResponseBody
	public String recommendCount(@RequestParam Integer commentNum) {
		ACommentDTO ACommentdto = new ACommentDTO();
		ACommentdto.setCommentNum(commentNum);
		return Integer.toString(ACommentService.getrecommendCount(ACommentdto));
	}
	
	@RequestMapping(value="/recommendAdd")
	public void recommendAdd(@RequestParam Integer commentNum , @RequestParam String id) {
		ACommentDTO ACommentdto = new ACommentDTO();
		ACommentdto.setCommentNum(commentNum); ACommentdto.setMemId(id);
		
		ACommentService.recommendadd(ACommentdto);
	}
	
	@RequestMapping(value="/recommendRemove")
	public void recommendRemove(@RequestParam Integer commentNum , @RequestParam String id) {
		ACommentDTO ACommentdto = new ACommentDTO();
		ACommentdto.setCommentNum(commentNum); ACommentdto.setMemId(id);
		
		ACommentService.recommendremove(ACommentdto);
	}
	
	@RequestMapping(value="/checkmyComment")
	@ResponseBody
	public String checkmyComment(@RequestParam Integer commentNum , @RequestParam String id) {
		ACommentDTO ACommentdto = new ACommentDTO();
		ACommentdto.setCommentNum(commentNum); ACommentdto.setMemId(id);
		return Integer.toString(ACommentService.checkmyComment(ACommentdto));
	}
	
	@RequestMapping(value="/checkmyReommend")
	@ResponseBody
	public String checkmyReommend(@RequestParam Integer commentNum , @RequestParam String id) {
		ACommentDTO ACommentdto = new ACommentDTO();
		ACommentdto.setCommentNum(commentNum); ACommentdto.setMemId(id);
		return Integer.toString(ACommentService.checkmyReommend(ACommentdto));
	}
}
