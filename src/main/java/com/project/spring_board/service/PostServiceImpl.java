package com.project.spring_board.service;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.spring_board.dao.PostDao;

@Service("PostService")
public class PostServiceImpl implements PostService {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void post_write(HashMap<String, String> param) {
		PostDao dao = sqlSession.getMapper(PostDao.class);
		dao.post_write(param);
	}
	
}
