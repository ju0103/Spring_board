package com.project.spring_board.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.spring_board.dto.PostDto;
import com.project.spring_board.service.PostService;

@Controller
@RequestMapping("/post")
public class PostController {

	@Autowired
	private PostService postService;
	
	// 게시물 작성
	@RequestMapping(value = "/post_write_view")
	public String post_write_view() {
		System.out.println("===== post_write_view() =====");
		return "post/post_write_view";
	}
	
	// 게시물 등록
	@RequestMapping(value = "/post_write")
	public String post_write(@RequestParam HashMap<String, String> param) {
		System.out.println("===== post_write() =====");
		postService.post_write(param);
		return "redirect:post_list";
	}
	
	// 게시물 목록 조회
	@RequestMapping(value = "/post_list")
	public String post_list(Model model) {
		System.out.println("===== post_list() =====");
		ArrayList<PostDto> list = postService.post_list();
		model.addAttribute("post_list", list);
		return "post/post_list";
	}
	
	// 게시물 상세 내용 조회
	@RequestMapping(value = "/post_content")
	public String post_content(@RequestParam HashMap<String, String> param, Model model) {
		System.out.println("===== post_content() =====");
		model.addAttribute("post_content", postService.post_content(param));
		return "post/post_content";
	}
	
}
