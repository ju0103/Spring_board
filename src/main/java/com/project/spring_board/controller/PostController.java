package com.project.spring_board.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.project.spring_board.dto.PageMaker;
import com.project.spring_board.dto.PostDto;
import com.project.spring_board.dto.SearchCriteria;
import com.project.spring_board.service.PostService;

@Controller
@RequestMapping("/post")
public class PostController {

	@Autowired
	private PostService postService;
	
	// 게시물 작성
	@RequestMapping(value = "/post_write_view")
	public String post_write_view() {
		System.out.println("===== post_write_view() =====");
		return "post/post_write_view";
	}
	
	// 게시물 등록
	@RequestMapping(value = "/post_write")
	public String post_write(@RequestParam HashMap<String, String> param, MultipartFile file) throws Exception {
		System.out.println("===== post_write() =====");
		postService.post_write(param, file);
		return "redirect:post_list";
	}
	
	// 게시물 목록 조회
	@RequestMapping(value = "/post_list")
	public String post_list(Model model, SearchCriteria searchCriteria) {
		System.out.println("===== post_list() =====");
		
		ArrayList<PostDto> list = postService.post_list(searchCriteria);
		model.addAttribute("post_list", list);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(searchCriteria);
		pageMaker.setTotal(postService.post_total_cnt(searchCriteria));
		model.addAttribute("pageMaker", pageMaker);
		
		return "post/post_list";
	}
	
	// 게시물 상세 내용 조회
	@RequestMapping(value = "/post_content")
	public String post_content(@RequestParam HashMap<String, String> param, SearchCriteria searchCriteria, Model model) {
		System.out.println("===== post_content() =====");
		
		// 게시물 조회 수 증가
		postService.update_view(param);
		
		model.addAttribute("post_content", postService.post_content(param));
		return "post/post_content";
	}
	
	// 게시물 수정 뷰
	@RequestMapping(value = "/post_update_view")
	public String post_update_view(@RequestParam HashMap<String, String> param, Model model) {
		System.out.println("===== post_update_view() =====");
		
		model.addAttribute("update_view", postService.post_content(param));
		
		return "post/post_update_view";
	}
	
	// 게시물 수정
	@RequestMapping(value = "/post_update")
	public String post_update(@RequestParam HashMap<String, String> param) {
		System.out.println("===== post_update() =====");
		
		postService.post_update(param);
		
		return "redirect:post_list";
	}
	
	// 게시물 삭제
	@RequestMapping(value = "/post_delete")
	public String post_delete(@RequestParam HashMap<String, String> param) {
		System.out.println("===== post_delete() =====");
		
		postService.post_delete(param);
		
		return "redirect:post_list";
	}
	
	// 첨부파일 다운로드
	@RequestMapping(value = "/download_file")
	public void download_file(@RequestParam HashMap<String, String> param, HttpServletResponse response) throws Exception {
		System.out.println("===== download_file() =====");
		
		PostDto postDto = postService.file_info(param);
		String regdate = postDto.getPost_regdate().toString().substring(0, 10).replaceAll("-", "");
		String storedFileName = postDto.getStored_file_name();
		
		byte[] fileByte = FileUtils.readFileToByteArray(new File("C:\\uploadFiles\\" + regdate + "\\" + storedFileName));
		
		response.setContentType(MediaType.APPLICATION_OCTET_STREAM_VALUE);
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(storedFileName, "UTF-8") + "\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();
	}
}
