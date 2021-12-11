package com.project.spring_board.service;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.spring_board.dao.MemberDao;
import com.project.spring_board.dto.MemberDto;

@Service("MemberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private SqlSession sqlSession;
	
	// 회원가입
	@Override
	public void register(HashMap<String, String> param) {
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		dao.register(param);
	}

	// 회원 정보 조회
	@Override
	public MemberDto selectMember(String mem_id) {
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		return dao.selectMember(mem_id);
	}

}
