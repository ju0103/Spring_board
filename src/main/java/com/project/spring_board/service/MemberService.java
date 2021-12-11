package com.project.spring_board.service;

import java.util.HashMap;

import com.project.spring_board.dto.MemberDto;

public interface MemberService {
	// 회원가입
	public void register(HashMap<String, String> param);
	// 회원 정보 조회
	public MemberDto selectMember(String mem_id);
}
