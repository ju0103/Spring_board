package com.project.spring_board.dto;

import java.sql.Timestamp;

public class MemberDto {
	/** 회원 아이디 */
	private String mem_id;
	/** 회원 비밀번호 */
	private String mem_pw;
	/** 회원 이름 */
	private String mem_name;
	/** 회원 전화번호 */
	private String mem_tel;
	/** 회원 이메일 */
	private String mem_email;
	/** 가입일 */
	private Timestamp mem_regdate;
	/** 가입일 수 */
	private int mem_days;
	/** 회원 등급 */
	private int mem_level;
	/** 회원 게시물 수 */
	private int mem_post;
	
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_pw() {
		return mem_pw;
	}
	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_tel() {
		return mem_tel;
	}
	public void setMem_tel(String mem_tel) {
		this.mem_tel = mem_tel;
	}
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	public Timestamp getMem_regdate() {
		return mem_regdate;
	}
	public void setMem_regdate(Timestamp mem_regdate) {
		this.mem_regdate = mem_regdate;
	}
	public int getMem_days() {
		return mem_days;
	}
	public void setMem_days(int mem_days) {
		this.mem_days = mem_days;
	}
	public int getMem_level() {
		return mem_level;
	}
	public void setMem_level(int mem_level) {
		this.mem_level = mem_level;
	}
	public int getMem_post() {
		return mem_post;
	}
	public void setMem_post(int mem_post) {
		this.mem_post = mem_post;
	}
}
