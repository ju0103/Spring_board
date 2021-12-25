package com.project.spring_board.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.project.spring_board.dto.CommentsDto;

public interface CommentsService {
	// 댓글 조회
	public ArrayList<CommentsDto> comm_list(int post_no);
	// 댓글 작성
	public void comm_write(CommentsDto dto);
	// 댓글 수정
	public void modify_comm(HashMap<String, String> param);
	// 댓글 삭제
	public void delete_comm(HashMap<String, String> param);
	// 댓글 신고 여부 확인
	public int chk_declare(HashMap<String, String> param);
	// 댓글 신고
	public void declare_comm(HashMap<String, String> param);
	// 신고된 댓글 목록
	public ArrayList<CommentsDto> received_comm();
}
