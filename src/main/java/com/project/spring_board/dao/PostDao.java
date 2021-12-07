package com.project.spring_board.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.project.spring_board.dto.PostDto;
import com.project.spring_board.dto.SearchCriteria;

public interface PostDao {
	// 게시글 작성
	public void post_write(HashMap<String, String> param);
	// 게시글 작성
	public void post_with_file(HashMap<String, String> param);
	// 게시물 목록 조회
	public ArrayList<PostDto> post_list(SearchCriteria searchCriteria);
	// 게시물 총 갯수
	public int post_total_cnt(SearchCriteria searchCriteria);
	// 게시물 상세 내용 조회
	public PostDto post_content(HashMap<String, String> param);
	// 게시물 조회 수 증가
	public void update_view(HashMap<String, String> param);
	// 게시물 수정
	public void post_update(HashMap<String, String> param);
	// 게시물 삭제
	public void post_delete(HashMap<String, String> param);
	// 첨부파일 정보 조회
	public PostDto file_info(HashMap<String, String> param);
}
