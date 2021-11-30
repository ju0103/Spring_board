package com.project.spring_board.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.spring_board.dao.PostDao;
import com.project.spring_board.dto.Criteria;
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
	public ArrayList<PostDto> post_list(Criteria criteria) {
		PostDao dao = sqlSession.getMapper(PostDao.class);
		return dao.post_list(criteria);
	}
	
	// 게시물 총 갯수 
	@Override
	public int post_total_cnt() {
		PostDao dao = sqlSession.getMapper(PostDao.class);
		return dao.post_total_cnt();
	}

	// 게시물 상세 내용 조회 
	@Override
	public PostDto post_content(HashMap<String, String> param) {
		PostDao dao = sqlSession.getMapper(PostDao.class);
		return dao.post_content(param);
	}
	
	// 게시물 조회 수 증가
	@Override
	public void update_view(HashMap<String, String> param) {
		PostDao dao = sqlSession.getMapper(PostDao.class);
		dao.update_view(param);
	}

	// 게시물 수정
	@Override
	public void post_update(HashMap<String, String> param) {
		PostDao dao = sqlSession.getMapper(PostDao.class);
		dao.post_update(param);
	}

	// 게시물 삭제
	@Override
	public void post_delete(HashMap<String, String> param) {
		PostDao dao = sqlSession.getMapper(PostDao.class);
		dao.post_delete(param);
	}

}
