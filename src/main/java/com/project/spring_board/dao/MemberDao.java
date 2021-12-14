package com.project.spring_board.dao;

import java.util.HashMap;

import com.project.spring_board.dto.MemberDto;

public interface MemberDao {
	// 회원가입
	public void register(HashMap<String, String> param);
	// 회원 정보 조회
	public MemberDto selectMember(String mem_id);
	// 회원 정보 수정
	public void updateMember(HashMap<String, String> param);
	// 회원 정보 수정
	public void deleteMember(String mem_id);
}
