package com.project.spring_board.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("PostService")
public class PostServiceImpl {
	
	@Autowired
	private SqlSession sqlSession;
	
}
