package com.project.spring_board.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.project.spring_board.dto.MemberDto;

public interface MemberDao {
	// 회원가입
	public void register(HashMap<String, String> param);
	// 회원 정보 조회
	public MemberDto selectMember(String mem_id);
	// 회원 정보 수정
	public void updateMember(HashMap<String, String> param);
	// 회원 탈퇴
	public void deleteMember(String mem_id);
	// 아이디 중복 확인
	public int chkId(String mem_id);
	// 회원 리스트 조회
	public ArrayList<MemberDto> selectMemList();
	// 회원 등업
	public void updateLevel(HashMap<String, String> param);
}
