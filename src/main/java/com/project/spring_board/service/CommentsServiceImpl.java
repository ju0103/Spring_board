package com.project.spring_board.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.spring_board.dao.CommentsDao;
import com.project.spring_board.dto.CommentsDto;

@Service("CommentsService")
public class CommentsServiceImpl implements CommentsService {
	
	@Autowired
	private SqlSession sqlSession;

	// 댓글 조회
	@Override
	public ArrayList<CommentsDto> comm_list(int post_no) {
		CommentsDao dao = sqlSession.getMapper(CommentsDao.class);
		return dao.comm_list(post_no);
	}

}
