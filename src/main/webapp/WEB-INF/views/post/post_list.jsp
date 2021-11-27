<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시물 목록</title>
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
					<td>${list.post_title}</td>
					<td>${list.post_writer}</td>
					<td>${list.post_view}</td>
					<td>${list.post_like}</td>
					<td><fmt:formatDate value="${list.post_regdate}" pattern="yyyy-MM-dd"/></td>
				</tr>
			</c:forEach>
		</table>
	</section>
</body>
</html>