package com.project.spring_board.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.spring_board.service.PostService;

@Controller
@RequestMapping("/post")
public class PostController {

	@Autowired
	private PostService postService;
	
	@RequestMapping(value = "/post_write_view")
	public String post_write_view() {
		System.out.println("===== post_write_view() =====");
		return "post/post_write_view";
	}
	
	@RequestMapping(value = "/post_write")
	public String post_write(@RequestParam HashMap<String, String> param) {
		System.out.println("===== post_write() =====");
		postService.post_write(param);
		return "";
	}
}
