package com.project.spring_board.dto;

public class Criteria {
	/* 현재 페이지 */
	private int page;
	/* 한 페이지에 나타나는 페이지 범위 */
	private int perPageNum;
	/* 페이지에 나타나는 첫 번째 게시물의 rowNum(PostDao.xml의 rowStart) */
	private int rowStart;
	/* 페이지에 나타나는 마지막 게시물의 rowNum(PostDao.xml의 rowEnd) */
	private int rowEnd;
	
	// 기본 생성자: 기본 페이지는 1, 페이지 당 나타나는 페이지 범위는 1~10
	public Criteria() {
		this.page = 1;
		this.perPageNum = 10;
	}
	
	public int getPage() {
		return page;
	}
	
	public void setPage(int page) {
		if (page <= 0) {
			this.page = 1;
			return;
		}
		this.page = page;
	}
	
	public int getPerPageNum() {
		return perPageNum;
	}
	
	public void setPerPageNum(int perPageNum) {
		if (perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum = 10;
			return;
		}
		this.perPageNum = perPageNum;
	}
	
	public int getRowStart() {
		this.rowStart = ((this.page - 1) * perPageNum) + 1;
		return rowStart;
	}
	
	public void setRowStart(int rowStart) {
		this.rowStart = rowStart;
	}
	
	public int getRowEnd() {
		this.rowEnd = this.rowStart + this.perPageNum - 1;
		return rowEnd;
	}
	
	public void setRowEnd(int rowEnd) {
		this.rowEnd = rowEnd;
	}

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + ", rowStart=" + rowStart + ", rowEnd=" + rowEnd
				+ "]";
	}
}
