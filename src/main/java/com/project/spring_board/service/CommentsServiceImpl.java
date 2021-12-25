package com.project.spring_board.service;

import java.util.ArrayList;
import java.util.HashMap;

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

	// 댓글 작성
	@Override
	public void comm_write(CommentsDto dto) {
		CommentsDao dao = sqlSession.getMapper(CommentsDao.class);
		dao.comm_write(dto);
	}

	// 댓글 수정
	@Override
	public void modify_comm(HashMap<String, String> param) {
		CommentsDao dao = sqlSession.getMapper(CommentsDao.class);
		dao.modify_comm(param);
	}
	
	// 댓글 삭제
	@Override
	public void delete_comm(HashMap<String, String> param) {
		CommentsDao dao = sqlSession.getMapper(CommentsDao.class);
		dao.delete_comm(param);
	}

	// 신고 확인
	@Override
	public int chk_declare(HashMap<String, String> param) {
		CommentsDao dao = sqlSession.getMapper(CommentsDao.class);
		return dao.chk_declare(param);
	}

	// 댓글 신고
	@Override
	public void declare_comm(HashMap<String, String> param) {
		CommentsDao dao = sqlSession.getMapper(CommentsDao.class);
		dao.declare_comm(param);
	}

	// 신고된 댓글 목록
	@Override
	public ArrayList<CommentsDto> received_comm() {
		CommentsDao dao = sqlSession.getMapper(CommentsDao.class);
		return dao.received_comm();
	}

}
