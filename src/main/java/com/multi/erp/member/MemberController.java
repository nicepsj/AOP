package com.multi.erp.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

//@SessionAttributes("user") user라는 것은 어트리뷰트명
//  컨트롤러에서 user라는 이름으로 Model객체에 저장된 어트리뷰트가 있으면 이를 세션에 저장해준다.
@Controller
@RequestMapping("/emp")
@SessionAttributes("user")
public class MemberController {
	MemberService service;

	@Autowired
	public MemberController(MemberService service) {
		super();
		this.service = service;
	}

	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public ModelAndView login(MemberDTO loginUserInfo, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		/*
		 * loginUserInfo => 로그인을 요청한 사용자의 정보 (id, pass)저장되는 객체 user => 로그인을 성공한 후 리턴되는
		 * 객체
		 */
		// 1.로그인 사용자가 있는지 db에서 인증하기
		MemberDTO user = service.login(loginUserInfo);
		// 2. 로그인한 사용자의 정보를 세션에 저장
		// 1) 세션을 생성
		// => getSession()을 이용해서 세션을 생성 : 세션이 이미 서버에 만들어진게 있으면 그 세션을 반환
		// 세션이 만들어진 게 없으면 무조건 새로 생성
		String viewName = "";
		if (user != null) {
			// 로그인 성공
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			viewName = user.getMenupath();
		} else {
			// 로그인실패
			viewName = "login";
		}
		mav.setViewName(viewName);
		return mav;
	}

	@RequestMapping(value = "/logout.do")
	public String logout(HttpSession session) {
		if (session != null) {
			session.invalidate();
		}
		return "redirect:/index.do";
	}

	@RequestMapping("/spring/login")
	public String springlogin(MemberDTO loginUserInfo,Model model) {
		System.out.println("스프링이 제공하는 @SessionAttributes를 이용해서 세션처리하기");
		MemberDTO user = service.login(loginUserInfo);
		String viewName = "";
		if (user != null) {
			model.addAttribute("user",user);
			viewName = user.getMenupath();
		} else { // 로그인실패
			viewName = "login";
		}
		return viewName;
	}
	@RequestMapping("/spring/logout")
	public String springlogout(SessionStatus status) {
		System.out.println("스프링내부 객체인 SessionStatus를 이용해서 로그아웃처리하기");
		status.setComplete();//세션에 있는 user객체를 제거하는 작업
		return "redirect:/index.do";
	}
	@RequestMapping("/mypage/myjob")
	public String myjob(HttpSession session ) {
		MemberDTO user = (MemberDTO)session.getAttribute("user");
		return user.getMenupath();
	}
}



















