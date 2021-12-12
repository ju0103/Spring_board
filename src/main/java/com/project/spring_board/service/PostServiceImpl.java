package com.project.spring_board.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.project.spring_board.dao.PostDao;
import com.project.spring_board.dto.PostDto;
import com.project.spring_board.dto.SearchCriteria;

@Service("PostService")
public class PostServiceImpl implements PostService {
	
	@Autowired
	private SqlSession sqlSession;
	
	private String base_path = "";

	// 게시글 작성
	@Override
	public void post_write(HashMap<String, String> param, MultipartFile file) throws Exception {
		PostDao dao = sqlSession.getMapper(PostDao.class);
		
		if (!file.isEmpty()) {
			String orgFileName = file.getOriginalFilename();
			String extension = orgFileName.substring(orgFileName.lastIndexOf("."), orgFileName.length());
			UUID uuid = UUID.randomUUID();
			String storedFileName = uuid.toString().replaceAll("-", "") + extension;
			long fileSize = file.getSize();
			byte[] data = file.getBytes();
			
			mkDir();
			
			File target = new File(base_path + "\\", storedFileName);
			
			try {
				FileCopyUtils.copy(data, target);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			param.put("file_name", orgFileName);
			param.put("stored_file_name", storedFileName);
			param.put("file_size", Long.toString(fileSize));
			dao.post_with_file(param);
		} else {
			dao.post_write(param);
		}
		
	}

	// 날짜별 디렉토리 생성
	private void mkDir() {
		Date now = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
		String regdate = formatter.format(now);
		base_path = "C:\\uploadFiles\\" + regdate;
		
		File folder = new File(base_path);
		
		if (!folder.exists()) {
			folder.mkdir();
			System.out.println("새 폴더 생성");
		} else {
			System.out.println("폴더 존재");
		}
	}
	
	// 게시물 목록 조회
	@Override
	public ArrayList<PostDto> post_list(SearchCriteria searchCriteria) {
		PostDao dao = sqlSession.getMapper(PostDao.class);
		return dao.post_list(searchCriteria);
	}
	
	// 게시물 총 갯수 
	@Override
	public int post_total_cnt(SearchCriteria searchCriteria) {
		PostDao dao = sqlSession.getMapper(PostDao.class);
		return dao.post_total_cnt(searchCriteria);
	}

	// 게시물 상세 내용 조회 
	@Override
	public PostDto post_content(HashMap<String, String> param) {
		PostDao dao = sqlSession.getMapper(PostDao.class);
		return dao.post_content(param);
	}
	
	// 게시물 조회 수 증가
	@Transactional(isolation = Isolation.READ_COMMITTED)
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

	// 첨부파일 정보 조회
	@Override
	public PostDto file_info(HashMap<String, String> param) {
		PostDao dao = sqlSession.getMapper(PostDao.class);
		return dao.file_info(param);
	}

}
