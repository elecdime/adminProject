package com.team.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.team.domain.BoardDTO;
import com.team.domain.MemberDTO;
import com.team.domain.PageDTO;
import com.team.service.BoardService;

@Controller
public class BoardController {
	
	// BoardService boardService=new BoardServiceImpl() 객체생성
	@Inject
	private BoardService boardService;
	
	//업로드될 폴더경로
	@Resource(name="uploadPath") //서블릿에서 경로지정이름
	private String uploadPath; //변수
		
	//파일 업로드
	// http://localhost:8181/myweb/board/fwrite
	@RequestMapping(value = "/board/fwrite", method = RequestMethod.GET)
	public String finsert() {
//				/WEB-INF/views/board/fwriteForm.jsp  => 이동
		
		return "board/fwriteForm";
	}	
	
	// http://localhost:8181/myweb/board/fwritePro
	@RequestMapping(value = "/board/fwritePro", method = RequestMethod.POST)
	public String finsertPro(HttpServletRequest request, MultipartFile file) throws Exception {
		
		//수동으로 request 받을때 (HttpServletRequest request)
		System.out.println(" BoardController  fwritePro ");
		
		BoardDTO boardDTO = new BoardDTO();
		boardDTO.setMemId(request.getParameter("memId"));
		//boardDTO.setPass(request.getParameter("pass"));
		boardDTO.setNtcTitle(request.getParameter("ntcTitle"));
		boardDTO.setNtcCont(request.getParameter("ntcCont"));
		boardDTO.setNtc_type(1);
		
		//파일업로드
		//파일이름 랜덤문자_파일이름 변경
		 UUID uid=UUID.randomUUID();
		 System.out.println("#####################"+uid.toString());
		 
		 System.out.println(file);
		 String fileName = uid.toString()+"_"+file.getOriginalFilename();
		 System.out.println("@@@@@@@@@@@@@@@@@"+fileName);
		 boardDTO.setNtcFile(fileName);		 
		 
		
		//업로드 파일을 복사해서 => upload 폴더에 넣기
		//File targetFile=new File(경로, fileName);
		File targetFile=new File(uploadPath, fileName);
		
		//FileCopyUtils.copy(업로드파일(파라미터입력파일 MultipartFile), upload 폴더에 넣을 파일);
		FileCopyUtils.copy(file.getBytes(), targetFile);
		// BoardDTO 복사된 파일 이름 저장
		boardDTO.setNtcFile(fileName);
		
		boardService.insertBoard(boardDTO);		
		
		return "redirect:/board/flist";
	}			
				
	
		
	@RequestMapping(value = "/board/flist", method = RequestMethod.GET)
	public String listf(HttpSession session,HttpServletRequest request ,Model model) {
		

		MemberDTO memberDTO = (MemberDTO)session.getAttribute("user");
		model.addAttribute("mDTO",memberDTO);
		System.out.println(memberDTO.getMemberFA());
//		HttpSession session = request.getSession();
//		session.setAttribute("memId", "admin");
//		
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
		
		 List<BoardDTO> boardList=boardService.getBoardList(pageDTO);
		 
		 
		//게시판 전체 글 개수  select count(*) from board
		// int count=boardDAO.getBoardCount();
		 int count = boardService.getBoardCount();
		 pageDTO.setCount(count);
		 
		 // 데이터 담기
		 model.addAttribute("boardList",boardList);
		 model.addAttribute("pageDTO",pageDTO);
		 
		 
//		/WEB-INF/views/board/list.jsp  => 이동
		return "board/flist";
		}
	
		

		
		@RequestMapping(value = "/board/fview", method = RequestMethod.GET)
		public String fview(Model model, int ntcNo) {

			// 디비에 데이터 가져오기
			// 리턴할형 MemberDTO getMember(String id)
			BoardDTO boardDTO = boardService.getBoard(ntcNo);
			// memberDTO 담아서 이동
			model.addAttribute("boardDTO", boardDTO);
			
//			/WEB-INF/views/board/view.jsp  => 이동
			return "board/fview";
		}
		
		
		

		@RequestMapping(value = "/board/fdelete", method = RequestMethod.GET)
		public String fdelete() {
					
//			/WEB-INF/views/board/deleteForm.jsp  => 이동
			
			return "board/fdeleteForm";
		}
		

		
		@RequestMapping(value = "/board/fdeletePro", method = RequestMethod.GET)
		public String fdeletePro(BoardDTO boardDTO) {
//			http://localhost:8181/myweb/board/deletePro?id=dd&pass=d
			//삭제작업
			System.out.println(" BoardController  deletePro ");			
			boardService.deleteBoard(boardDTO.getNtcNo());
			
			return "redirect:/board/flist";			
			
		}
		

		@RequestMapping(value = "/board/fupdate", method = RequestMethod.GET)
		public String fupdate(Model model, int ntcNo) {
			// 디비에 데이터 가져오기
			// 리턴할형 MemberDTO getMember(String id)
			BoardDTO boardDTO = boardService.getBoard(ntcNo);
			// memberDTO 담아서 이동
			model.addAttribute("boardDTO", boardDTO);
			
//			/WEB-INF/views/member/updateForm.jsp  => 이동
			return "board/fupdateForm";
		}
		
		
		@RequestMapping(value = "/board/fupdatePro", method = RequestMethod.POST)
		public String fupdatePro(BoardDTO boardDTO) {
//			http://localhost:8181/myweb/member/updatePro?id=dd&pass=d
			//수정작업
			
			System.out.println(boardDTO.getNtcNo());
			System.out.println(boardDTO.getNtcCont());

			System.out.println(" boardController  updatePro ");
			//BoardDTO boardDTO = boardService.getBoard(ntcNo);
			
				boardService.updateBoard(boardDTO); 
				return "redirect:/board/fview?ntcNo="+boardDTO.getNtcNo();					
			
		}
		
		
		
		
		@RequestMapping(value = "/board/blist", method = RequestMethod.GET)
		public String blist(HttpServletRequest request,Model model) {
			
			HttpSession session = request.getSession();
			session.setAttribute("memId", "admin");
			
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
			 
			 
			 List<BoardDTO> boardList=boardService.getBoardList2(pageDTO);
			 
			 
			 
			 
			//게시판 전체 글 개수  select count(*) from board
			// int count=boardDAO.getBoardCount();
			 int count = boardService.getBoardCount2();
			 pageDTO.setCount(count);
			 
			 // 데이터 담기
			 model.addAttribute("boardList",boardList);
			 model.addAttribute("pageDTO",pageDTO);
			 
			 
//			/WEB-INF/views/board/list.jsp  => 이동
			return "board/blist";
			}
	
	
		@RequestMapping(value = "/board/bwrite", method = RequestMethod.GET)
		public String binsert() {
//					/WEB-INF/views/board/fwriteForm.jsp  => 이동
			
			return "board/bwriteForm";
		}	
		
		// http://localhost:8181/myweb/board/fwritePro
		@RequestMapping(value = "/board/bwritePro", method = RequestMethod.POST)
		public String binsertPro(HttpServletRequest request) throws Exception {
			
			//수동으로 request 받을때 (HttpServletRequest request)
			System.out.println(" BoardController  bwritePro ");
			
			BoardDTO boardDTO = new BoardDTO();
			boardDTO.setMemId(request.getParameter("memId"));
			//boardDTO.setPass(request.getParameter("pass"));
			boardDTO.setNtcTitle(request.getParameter("ntcTitle"));
			boardDTO.setNtcCont(request.getParameter("ntcCont"));
			boardDTO.setNtc_type(2);
			
			boardService.insertBoard(boardDTO);		
			
			return "redirect:/board/blist";
		}
	
		
		@RequestMapping(value = "/board/bupdate", method = RequestMethod.GET)
		public String bupdate(Model model, int ntcNo) {
			// 디비에 데이터 가져오기
			// 리턴할형 MemberDTO getMember(String id)
			BoardDTO boardDTO = boardService.getBoard(ntcNo);
			// memberDTO 담아서 이동
			model.addAttribute("boardDTO", boardDTO);
			
//			/WEB-INF/views/member/updateForm.jsp  => 이동
			return "board/bupdateForm";
		}
		
		
		
		
		
		@RequestMapping(value = "/board/bview", method = RequestMethod.GET)
		public String bview(Model model, int ntcNo) {

			// 디비에 데이터 가져오기
			// 리턴할형 MemberDTO getMember(String id)
			BoardDTO boardDTO = boardService.getBoard2(ntcNo);
			// memberDTO 담아서 이동
			model.addAttribute("boardDTO", boardDTO);
			
//			/WEB-INF/views/board/view.jsp  => 이동
			return "board/bview";
		}
		
		
		
		@RequestMapping(value = "/board/bupdatePro", method = RequestMethod.POST)
		public String bupdatePro(BoardDTO boardDTO) {
//			http://localhost:8181/myweb/member/updatePro?id=dd&pass=d
			//수정작업
			
			System.out.println(boardDTO.getNtcNo());
			System.out.println(boardDTO.getNtcCont());

			System.out.println(" boardController  updatePro ");
			//BoardDTO boardDTO = boardService.getBoard(ntcNo);
			
				boardService.updateBoard(boardDTO); 
				return "redirect:/board/bview?ntcNo="+boardDTO.getNtcNo();					
			
		}
		
		
		
}
















