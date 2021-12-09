package com.project.spring_board.service;

import java.util.ArrayList;

import com.project.spring_board.dto.CommentsDto;

public interface CommentsService {
	// 댓글 조회
	public ArrayList<CommentsDto> comm_list(int post_no);
}
