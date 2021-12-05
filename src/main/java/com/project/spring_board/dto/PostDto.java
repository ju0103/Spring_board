package com.project.spring_board.dto;

import java.sql.Timestamp;

public class PostDto {
	/* 게시글 번호 */
	private int post_no;
	/* 게시글 작성자 */
	private String post_writer;
	/* 게시글 제목 */
	private String post_title;
	/* 게시글 내용 */
	private String post_content;
	/* 게시글 조회수 */
	private int post_view;
	/* 게시글 좋아요 수 */
	private int post_like;
	/* 게시글 등록일 */
	private Timestamp post_regdate;
	/* 게시글 수정일 */
	private Timestamp post_moddate;
	/* 파일 원본명 */
	private String file_name;
	/* 파일 저장명 */
	private String stored_file_name;
	/* 파일 크기 */
	private String file_size;
	
	public PostDto() {
		super();
	}
	public PostDto(int post_no, String post_writer, String post_title, String post_content, int post_view,
			int post_like, Timestamp post_regdate, Timestamp post_moddate) {
		super();
		this.post_no = post_no;
		this.post_writer = post_writer;
		this.post_title = post_title;
		this.post_content = post_content;
		this.post_view = post_view;
		this.post_like = post_like;
		this.post_regdate = post_regdate;
		this.post_moddate = post_moddate;
	}
	public int getPost_no() {
		return post_no;
	}
	public void setPost_no(int post_no) {
		this.post_no = post_no;
	}
	public String getPost_writer() {
		return post_writer;
	}
	public void setPost_writer(String post_writer) {
		this.post_writer = post_writer;
	}
	public String getPost_title() {
		return post_title;
	}
	public void setPost_title(String post_title) {
		this.post_title = post_title;
	}
	public String getPost_content() {
		return post_content;
	}
	public void setPost_content(String post_content) {
		this.post_content = post_content;
	}
	public int getPost_view() {
		return post_view;
	}
	public void setPost_view(int post_view) {
		this.post_view = post_view;
	}
	public int getPost_like() {
		return post_like;
	}
	public void setPost_like(int post_like) {
		this.post_like = post_like;
	}
	public Timestamp getPost_regdate() {
		return post_regdate;
	}
	public void setPost_regdate(Timestamp post_regdate) {
		this.post_regdate = post_regdate;
	}
	public Timestamp getPost_moddate() {
		return post_moddate;
	}
	public void setPost_moddate(Timestamp post_moddate) {
		this.post_moddate = post_moddate;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public String getStored_file_name() {
		return stored_file_name;
	}
	public void setStored_file_name(String stored_file_name) {
		this.stored_file_name = stored_file_name;
	}
	public String getFile_size() {
		return file_size;
	}
	public void setFile_size(String file_size) {
		this.file_size = file_size;
	}
}