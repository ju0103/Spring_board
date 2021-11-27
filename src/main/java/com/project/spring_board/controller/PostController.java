package com.project.spring_board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/post")
public class PostController {

	@RequestMapping(value = "/post_write")
	public String post_write() {
		System.out.println("===== post_write() =====");
		return "post/post_write";
	}
}
