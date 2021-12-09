package com.project.spring_board.dto;

import java.sql.Timestamp;

public class CommentsDto {
	/* 게시글 번호 */
	private int post_no;
	/* 댓글 번호 */
	private int comm_no;
	/* 댓글 작성자 */
	private String comm_writer;
	/* 댓글 내용 */
	private String comm_content;
	/* 댓글 등록일 */
	private Timestamp comm_regdate;
	
	public int getPost_no() {
		return post_no;
	}
	public void setPost_no(int post_no) {
		this.post_no = post_no;
	}
	public int getComm_no() {
		return comm_no;
	}
	public void setComm_no(int comm_no) {
		this.comm_no = comm_no;
	}
	public String getComm_writer() {
		return comm_writer;
	}
	public void setComm_writer(String comm_writer) {
		this.comm_writer = comm_writer;
	}
	public String getComm_content() {
		return comm_content;
	}
	public void setComm_content(String comm_content) {
		this.comm_content = comm_content;
	}
	public Timestamp getComm_regdate() {
		return comm_regdate;
	}
	public void setComm_regdate(Timestamp comm_regdate) {
		this.comm_regdate = comm_regdate;
	}
}
