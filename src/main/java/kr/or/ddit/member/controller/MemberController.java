package kr.or.ddit.member.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.common.vo.MemberVO;
import kr.or.ddit.member.service.MemberServiceI;

@RequestMapping("/login")
@Controller
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Resource(name="MemberService")
	private MemberServiceI memberService;
	
	// 로그인 localhost/ourbox/login
//	@RequestMapping(path="/view", method= RequestMethod.GET)
	@RequestMapping("/view")
	public String login() {
		logger.debug("MemberController.login()");
		logger.debug("로그인");
		return "main/login";
	}
	
	@RequestMapping("/process")
	public String process(MemberVO memberVo,HttpSession session, Model model) {
		logger.debug("memberVo.getMem_id : {} " , memberVo.getMem_id());
		logger.debug("memberVo.getMem_pass : {} " , memberVo.getMem_pass());
		
		MemberVO loginVo = memberService.loginMember(memberVo);
		logger.debug("loginVo : {}", loginVo);
		
		session.setAttribute("S_MEMBER", loginVo);
		return "ourbox/ourboxmember";
	}
	
	

}
