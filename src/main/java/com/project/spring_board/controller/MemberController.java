package com.project.spring_board.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.spring_board.dto.MemberDto;
import com.project.spring_board.service.MemberService;

@Controller
@RequestMapping(value = "/member")
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	// 회원가입 화면 조회
	@RequestMapping(value = "/registerView")
	public String registerView() {
		return "member/register_view";
	}
	
	// 회원가입
	@RequestMapping(value = "/register")
	public String register(@RequestParam HashMap<String, String> param) {
		memberService.register(param);
		return "member/login_view";
	}
	
	// 로그인 화면 조회
	@RequestMapping(value = "/loginView")
	public String loginView() {
		return "member/login_view";
	}
	
	// 로그인
	@RequestMapping(value = "/login")
	public String login(String mem_id, String mem_pw, HttpSession session, Model model) {
		MemberDto member = memberService.selectMember(mem_id);
		
		if (member != null) {
			String dbPwd = member.getMem_pw();
			
			if (dbPwd == null) {
				model.addAttribute("msg", "NOT_VALID_USER");
			} else {
				if (dbPwd.equals(mem_pw)) {
					session.setAttribute("mem_id", mem_id);
					session.setAttribute("mem_name", member.getMem_name());
					session.setAttribute("mem_email", member.getMem_email());
					System.out.println("session mem_id >> " + session.getAttribute("mem_id"));
					System.out.println("session mem_name >> " + session.getAttribute("mem_name"));
					System.out.println("session mem_email >> " + session.getAttribute("mem_email"));
					return "redirect:/post/post_list";
				} else {
					model.addAttribute("msg", "WRONG_PASSWORD");
				}
			}
		} else {
			model.addAttribute("msg", "USER_NOT_FOUND");
		}
		
		session.invalidate();
		return "member/login_view";
	}
	
	// 로그아웃
	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:../post/post_list";
	}
}
