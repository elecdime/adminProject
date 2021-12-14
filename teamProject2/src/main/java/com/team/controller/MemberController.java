package com.team.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.domain.MailDTO;
import com.team.domain.MemberDTO;
import com.team.domain.OrderDTO;
import com.team.service.CartService;
import com.team.service.MailService;
import com.team.service.MemberService;

import javax.mail.internet.MimeMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;

@Controller
public class MemberController {
	
	@Inject
	private MemberService memberService;
	
	@Inject
	private MailService mailService;
	
	@Inject
	private CartService cartService;
	
	@Autowired
    private JavaMailSenderImpl mailSender;
	
	
//	@RequestMapping(value = "/main", method = RequestMethod.GET)
//	public String index(HttpSession session, Model model) {
//		MemberDTO mDTO = (MemberDTO)session.getAttribute("user");
//		MemberDTO mDTO2 = memberService.getMember(mDTO);
//		model.addAttribute("mDTO", mDTO2);
//		return "index";
//	}
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {
		return "member/join";
	}
	

	@RequestMapping(value = "/joinPro", method = RequestMethod.POST)
	public String insertPro(MemberDTO mDTO) {
		String mail_check = mDTO.getMal_cert();
		if(mDTO.getMal_cert() == null) {
			mail_check = "N";
			mDTO.setMal_cert(mail_check);
		}
		
		System.out.println("MemberController joinPro");
		System.out.println(mDTO.getMal_cert());
		memberService.insertMember(mDTO);
		
		
		return "redirect:/main";
	}
	
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "member/login";
	}
	
	@RequestMapping(value = "/loginPro", method = RequestMethod.POST)
	public String loginPro(MemberDTO memberDTO, HttpSession session, Model model) {
//		http://localhost:8181/myweb/member/loginPro?id=dd&pass=d
		
		System.out.println(" MemberController  loginPro ");
		
		MemberDTO memberDTO2 = memberService.userCheck(memberDTO);
		System.out.println(" loginPro correct");
		if(memberDTO2 != null) {
			if(memberDTO2.getMemberFA().equals("business") ) {
				memberDTO2.setCartCount(cartService.getCartCount(memberDTO2.getMemId()));
				session.setAttribute("user", memberDTO2);
				return "redirect:/aProduct/product";
			}else if(memberDTO2.getMemberFA().equals("black")){
				model.addAttribute("msg", "넌 나가리야");
				model.addAttribute("url", "/main");
				return "/msgBox";
			}else {
			System.out.println("if문 통과");
			memberDTO2.setCartCount(cartService.getCartCount(memberDTO2.getMemId()));
			System.out.println(memberDTO2.getMemId());
			System.out.println(" session into");
			session.setAttribute("user", memberDTO2);
			System.out.println(" session correct");
			return "redirect:/main";
			}
		}else {
			System.out.println(" no-session ");
			model.addAttribute("msg", "아이디 또는 비밀번호가 일치하지 않습니다");
			model.addAttribute("url", "/login");
			return "/msgBox";
		}
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session, Model model) {
		session.invalidate();
		model.addAttribute("msg", "로그아웃을 완료했습니다.");
		model.addAttribute("url", "/main");
		return "/msgBox";
	}
	
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypage(Model model, HttpSession session) {
		MemberDTO mDTO = (MemberDTO)session.getAttribute("user");
		MemberDTO mDTO2 = memberService.getMember(mDTO);
		model.addAttribute("mDTO", mDTO2);
//		model.addAttribute("cartList", memberService.getOrderList(mDTO2));
		return "member/mypage/mypage";
	}
	
	@RequestMapping(value = "/faq", method = RequestMethod.GET)
	public String faq() {
		return "faq";
	}
	

	
	@RequestMapping(value = "/memberDelete", method = RequestMethod.GET)
	public String memberDelete() {
		return "member/memberDelete";
	}
	
	
	@RequestMapping(value = "/deletePro", method = RequestMethod.POST)
	public String deletePro(HttpSession session, Model model, MemberDTO mDTO) {
		session.invalidate();
		model.addAttribute("msg", "회원탈퇴를 완료했습니다.");
		model.addAttribute("url", "/main");
		memberService.deleteMember(mDTO);
		System.out.println("controller pass");
		
		return "/msgBox";
	}
	
	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public String info(HttpSession session, Model model) {
		MemberDTO mDTO = (MemberDTO)session.getAttribute("user");
		MemberDTO mDTO2 = memberService.getMember(mDTO);
		model.addAttribute("mDTO", mDTO2);
		return "member/info";
	}
	
	
	@RequestMapping(value = "/infoUpdate", method = RequestMethod.POST)
	public ResponseEntity<String> infoUpdate(MemberDTO mDTO, Model model,HttpSession session) {
		System.out.println("update controll pass");
		
		// ajax 결과를 저장할 변수
        ResponseEntity<String> entity = null;
        String result = "";
        
		if(mDTO != null) {
			// 몇개의 쿼리가 실행 되었는지가 리턴 됨 ( 기대값 = 1 )
			result = memberService.updateMember(mDTO)+"";
			entity = new ResponseEntity<>(result, HttpStatus.OK);
		}else {
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
			
		return entity;
	}
	
	
	@RequestMapping(value = "/joinCheck", method = RequestMethod.POST)
    @ResponseBody
    public String idCheck(@RequestParam("id") String id){
        String result = memberService.idCheck(id);
        System.out.println(result);
        return result;
    }
    
    
	@RequestMapping(value = "/findId", method = RequestMethod.GET)
	public String findId(MemberDTO mDTO) {
		System.out.println("controller pass");
		return "member/findId";
	}
	
	
	@RequestMapping(value = "/findIdOk", method = RequestMethod.POST)
	public String findIdOk(MemberDTO mDTO, Model model) {
		MemberDTO DTO2 = memberService.findIdOk(mDTO);
		System.out.println("controller pass");
		System.out.println(mDTO.getMemNm() + "," + mDTO.getBirthDt()+ "," + mDTO.getEmail());
		if(DTO2 == null) {
			model.addAttribute("msg", "회원정보가 일치하지 않습니다");
			model.addAttribute("url", "/findId");
			return "/msgBox";
		}else {
			model.addAttribute("mDTO", DTO2);
			return "member/findIdOk";
		}
		
	}
	
	@RequestMapping(value = "/emailCheck", method = RequestMethod.POST)
    @ResponseBody
    public String mailCodeInsert(MemberDTO mDTO){
		System.out.println("email controller insert pass");
		String mDTO2 = mailService.mailCodeSelect(mDTO.getEmail());
		int result = 0;
		if(mDTO2 != null) {
			result = mailService.mailCodeUpdate(mDTO);
		} else {
			result = mailService.mailCodeInsert(mDTO);
		}
		
		if(result == 1) {
			final MailDTO mailDTO = new MailDTO();
			mailDTO.setSenderMail("khai84837521@gmail.com");
			mailDTO.setReceiveMail(mDTO.getEmail());
			mailDTO.setSubject("GHSHOP 인증 코드 입니다.");
			mailDTO.setMessage("인증코드는 : " + mDTO.getMalCode() + " 입니다.");
			
			final MimeMessagePreparator preparator = new MimeMessagePreparator() {
                @Override
                public void prepare(MimeMessage mimeMessage) throws Exception {
                    final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
                    helper.setFrom(mailDTO.getSenderMail());
                    helper.setTo(mailDTO.getReceiveMail());
                    helper.setSubject(mailDTO.getSubject());
                    helper.setText(mailDTO.getMessage(), true);
                }
			};
			
			mailSender.send(preparator);
		}
		
		System.out.println("email select pass");
        
        return result == 1 ? "true" : "false";
    }

	
	@RequestMapping(value = "/emailCodeCheck", method = RequestMethod.POST)
    @ResponseBody
    public String emailCodeCheck(MemberDTO mDTO){
		System.out.println("email controller get pass");
		String code = mailService.mailCodeSelect(mDTO.getEmail());
		int result = 0;
		System.out.println(mDTO.getEmail() + ", " + code + ", " + mDTO.getMalCode());
		if(code != null) {
			result = code.equals(mDTO.getMalCode()) ? 1:0;
		}
		
		System.out.println("email select pass");
        System.out.println(result);
        return result == 1 ? "true" : "false";
    }
	
	@RequestMapping(value = "/findPass", method = RequestMethod.GET)
	public String findPass(MemberDTO mDTO, Model model) {
		return "member/findPass";
	}

	
	@RequestMapping(value = "/findPassOk", method = RequestMethod.POST)
	public String findPassOk(MemberDTO mDTO, Model model) {
		MemberDTO member = memberService.findPass(mDTO);
		String mail = mailService.mailCodeSelect(mDTO.getEmail());
		System.out.println(mail);
		System.out.println(mDTO.getMalCode());
		System.out.println("findPassOk controller pass");
		if(member != null && mail.equals(mDTO.getMalCode())) {
			model.addAttribute("mDTO", mDTO);
			return "member/findPassOk";
		}else {
			model.addAttribute("msg", "회원정보가 일치하지 않습니다");
			model.addAttribute("url", "/findPass");
			return "/msgBox";
		}
	}
	
	@RequestMapping(value = "/findPassPro", method = RequestMethod.POST)
	public String findPassPro(MemberDTO mDTO, Model model) {
//		MemberDTO member = memberService.findPass(mDTO);
//		String pass = member.getPass();
		int result = memberService.findPassOk(mDTO);
		System.out.println("findPassPro controller pass");
		if(result != 0) {
			model.addAttribute("msg", "비밀번호가 변경되었습니다.");
			model.addAttribute("url", "/main");
			return "/msgBox";
		}else {
			model.addAttribute("msg", "이전 비밀번호는 사용할 수 없습니다.");
			model.addAttribute("url", "/findPassOk");
			return "/msgBox";
		}
	}
	
	
	@RequestMapping(value = "/passChecked", method = RequestMethod.POST)
	@ResponseBody
	public String passChecked(MemberDTO mDTO) {
		String result = "true";
		System.out.println(mDTO.getMemId()+","+mDTO.getMemPw()+ "," +mDTO.getEmail());
		MemberDTO member = memberService.findPass(mDTO);
		String pass = member.getMemPw();
		System.out.println(pass);
		System.out.println("passCheck controller pass");
		if(pass.equals(mDTO.getMemPw())) {
			return result = "false";
		}
		
		return result;
	}
	
	
	@RequestMapping(value = "/passChange", method = RequestMethod.GET)
	public String passChange(MemberDTO mDTO, HttpSession session) {
		session.getAttribute("user");
		System.out.println("passChage controller pass");
		
		return "/member/passChange";
		
	}
	
	@RequestMapping(value = "/mysubCart", method = RequestMethod.GET)
	public String mysubCart() {
		System.out.println("mysubOrder controller pass");
		
		return "/member/mypage/mysubCart";
		
	}
	
	@RequestMapping(value = "/mysubDeleteOrder", method = RequestMethod.GET)
	public String mysubDeleteOrder() {
		System.out.println("mysubOrder controller pass");
		
		return "/member/mypage/mysubDeleteOrder";
		
	}
	
	@RequestMapping(value = "/mysubOrder", method = RequestMethod.GET)
	public String mysub() {
		System.out.println("mysubOrder controller pass");
		
		return "/member/mypage/mysubOrder";
		
	}
	
}
