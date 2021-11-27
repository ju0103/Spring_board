package com.project.spring_board.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.project.spring_board.dto.PostDto;

public interface PostService {
	// 게시글 작성
	public void post_write(HashMap<String, String> param);
	// 게시물 목록 조회
	public ArrayList<PostDto> post_list();
}
