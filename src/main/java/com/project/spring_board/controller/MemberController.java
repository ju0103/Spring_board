package com.project.spring_board.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.spring_board.dto.MemberDto;
import com.project.spring_board.service.MemberService;

@Controller
@RequestMapping(value = "/member")
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	// 회원 마이페이지
	@RequestMapping(value = "/memberMain")
	public String memberMain(String mem_id, Model model) {
		MemberDto member = memberService.selectMember(mem_id);
		model.addAttribute("member", member);
		return "member/member_main";
	}
	
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
					session.setAttribute("mem_level", member.getMem_level());
					session.setAttribute("mem_email", member.getMem_email());
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
	
	// 회원 정보 수정 화면
	@RequestMapping(value = "/updateMemberView")
	public String updateView(String mem_id, Model model) {
		MemberDto member = memberService.selectMember(mem_id);
		model.addAttribute("member", member);
		return "member/update_view";
	}
	
	// 회원 정보 수정
	@RequestMapping(value = "/updateMember")
	public String updateMember(@RequestParam HashMap<String, String> param, RedirectAttributes rttr) {
		memberService.updateMember(param);
		rttr.addAttribute("mem_id", param.get("mem_id"));
		return "redirect:memberMain";
	}
	
	// 탈퇴하기
	@RequestMapping(value = "/deleteMember")
	public String deleteMember(String mem_id, HttpSession session) {
		memberService.deleteMember(mem_id);
		session.invalidate();
		return "redirect:../post/post_list";
	}
}
