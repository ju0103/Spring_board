package com.project.spring_board.dto;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {
	/* 총 게시물 수 */
	private int total;
	/* 시작 페이지 */
	private int startPage;
	/* 끝 페이지 */
	private int endPage;
	/* 이전 페이지 존재 여부 */
	private boolean prev;
	/* 다음 페이지 존재 여부 */
	private boolean next;
	/* Criteria의 page(현재 페이지), perPageNum(한 페이지에 나타나는 페이지 범위) */
	private Criteria criteria;
	
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
		calcPageData();
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public Criteria getCriteria() {
		return criteria;
	}
	public void setCriteria(Criteria criteria) {
		this.criteria = criteria;
	}
	
	private void calcPageData() {
		int displayNum = criteria.getPerPageNum();
		endPage = (int) (Math.ceil(criteria.getPage() / (double) displayNum) * displayNum);
		startPage = (endPage - displayNum) + 1;
		
		int realEndPage = (int) (Math.ceil(total / (double) displayNum));
		if (endPage > realEndPage) {
			endPage = realEndPage;
		}
		
		prev = startPage == 1 ? false : true;
		next = endPage * displayNum >= total ? false : true;
	}
	
	public String makeQuery(int page) {
		UriComponents uriComponents = 
				UriComponentsBuilder.newInstance()
									.queryParam("page", page)
									.queryParam("perPageNum", criteria.getPerPageNum())
									.build();
		return uriComponents.toUriString();
	}
}
