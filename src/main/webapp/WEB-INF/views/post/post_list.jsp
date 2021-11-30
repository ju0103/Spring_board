<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시물 목록</title>
	<style type="text/css">
		li {list-style: none; float: left; padding: 5px; }
	</style>
</head>
<body>
	<header>
		<h3>게시글 목록</h3>
	</header>
	<hr />
	<nav>
		게시글 목록
	</nav>	
	<hr />
	<section id="container">
		<a href="post_write_view">글 작성</a>
		<table width="500" border="1" cellspacing="0">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>추천수</th>
				<th>등록일</th>
			</tr>
			<c:forEach items="${post_list}" var="list">
				<tr>
					<td>${list.post_no}</td>
					<td>
						<a href="post_content?post_no=${list.post_no}">${list.post_title}</a>
					</td>
					<td>${list.post_writer}</td>
					<td>${list.post_view}</td>
					<td>${list.post_like}</td>
					<td><fmt:formatDate value="${list.post_regdate}" pattern="yyyy-MM-dd"/></td>
				</tr>
			</c:forEach>
		</table>
		
		<!-- 페이지 -->
		<div>
			<ul>
				<c:if test="${pageMaker.prev}">
					<li><a href="post_list${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
				</c:if>
				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
					<li><a href="post_list${pageMaker.makeQuery(idx)}">${idx}</a></li>
				</c:forEach>
				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<li><a href="post_list${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
				</c:if>
			</ul>
		</div>
	</section>
</body>
</html>