package com.run.pjt.member.control;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.run.pjt.member.Member;
import com.run.pjt.member.service.MemSvc;

@Controller
@RequestMapping("/mem")
public class MemCon {
	@Autowired
	MemSvc service;
	
	@ModelAttribute("cp")
	public String getContextPath(HttpServletRequest request) {
		return request.getContextPath();
	}
	
	
	
	@ModelAttribute("serverTime") 
	// model.addAttribute("serverTime", getServerTime(locale));
	public String getServerTime(Locale locale) {
		Date date = new Date();
		DateFormat dateFormat 
		= DateFormat.getDateTimeInstance
		(DateFormat.LONG, DateFormat.LONG, locale);
		
		return dateFormat.format(date);
	}
	
	@RequestMapping("/memJoinForm")
	public String memJoinForm(Member mem) {
		return "/memJoinForm";
	}
	
	@RequestMapping("/pjt")
	public ModelAndView home() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/pjt");
	return mav;
	}

	@RequestMapping(value="/memJoin", method=RequestMethod.POST)
	public ModelAndView memJoin(Member mem) {
		// SQL문 실행
		int result = service.memReg(mem);
		System.out.println(result);
		
		ModelAndView mav = new ModelAndView();
		
		if(result == 0) {
			mav.addObject("res", "fail");
			mav.setViewName("/memJoinForm");
		}
		else {
			// ModelAndView 객체에 뷰의 정보 저장
			mav.addObject("res", "success");
			mav.setViewName("/memLoginForm");
		}
		return mav;
	}
	
	@RequestMapping("/memLoginForm")
	public String memLoginForm(Member mem) {
		return "/memLoginForm";
	}

	@RequestMapping(value="/memLogin", method=RequestMethod.POST)
	public ModelAndView memLogin(Member mem, HttpSession session, HttpServletResponse response) {
		
		Member m = service.memSrch(mem);
		ModelAndView mav = new ModelAndView();
		
		if(m == null) {
			mav.addObject("res", "fail");
			mav.setViewName("/memLoginForm");
		}
		else {
			//HttpSession session = request.getSession();
			session.setAttribute("mem", m); // 세션 생성
			
			Cookie cookie = new Cookie("memId", m.getMemId()); // 쿠키 생성
			cookie.setMaxAge(5*60); // seconds (초) 단위
			response.addCookie(cookie);
			
			mav.addObject("res", "success");
			// ModelAndView 객체에 데이터 저장
			//mav.addObject("mem", mem);
			
			// ModelAndView 객체에 뷰의 정보 저장
			mav.setViewName("/home");
		}
		return mav;
	}
	
	@RequestMapping(value="/memLogout")
	public String memLogout(Member mem, HttpSession session, 
			// 쿠키 사용
			// memId이라는 쿠키가 없으면 exception 발생하는데
			// 만약 없어도 exception 발생하지 않게 하려면 required=false
			@CookieValue(value="memId", required=false) Cookie cookie) {
		//HttpSession session = request.getSession();
		if(cookie != null) {
			cookie.setMaxAge(0); // 쿠키 삭제
		}
		session.invalidate(); // 세션 삭제
		System.out.println("logout");
		return "/home";
	}
	
	@RequestMapping("/start")
	public ModelAndView start() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/start");
		
		return mav;
	}
	
	@RequestMapping("/memOthers")
	public ModelAndView memOthers() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/memOthers");
		
		return mav;
	}
	
	@RequestMapping("/bst")
	public ModelAndView bst() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/bst");
	
		return mav;
	}
	
	@RequestMapping("/position")
	public ModelAndView position() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/position");
		
		return mav;
	}
	
	
	
	@RequestMapping("/memDeleteForm")
	public ModelAndView memDeleteForm(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		Member mem = (Member)session.getAttribute("mem");
		mav.addObject("mem", mem);
		mav.setViewName("/memDeleteForm");
		
		return mav;
	}
	
	@RequestMapping(value="/memDelete", method=RequestMethod.POST)
	public ModelAndView memDelete(Member mem, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		int result = service.memRmv(mem);
		if(result == 0) {
			mav.addObject("res", "fail");
			mav.setViewName("/memDeleteForm");
		}
		else {
			HttpSession session = request.getSession();
			session.invalidate();
			
			mav.addObject("res", "success");
			mav.setViewName("/memDeleteForm");
		}
		return mav;
	}
	
}
