package com.project.spring_board.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.spring_board.dao.PostDao;
import com.project.spring_board.dto.PostDto;

@Service("PostService")
public class PostServiceImpl implements PostService {
	
	@Autowired
	private SqlSession sqlSession;

	// 게시글 작성
	@Override
	public void post_write(HashMap<String, String> param) {
		PostDao dao = sqlSession.getMapper(PostDao.class);
		dao.post_write(param);
	}

	// 게시물 목록 조회
	@Override
	public ArrayList<PostDto> post_list() {
		PostDao dao = sqlSession.getMapper(PostDao.class);
		return dao.post_list();
	}
	
}
