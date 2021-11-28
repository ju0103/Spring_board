<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시물 내용</title>
</head>
<body>
	<header>
		<h3>${post_content.post_title}</h3>
	</header>
	<hr />
	<a href="post_list">목록으로</a>
	<hr />
	<p>작성자: ${post_content.post_writer}</p>
	<p>조회수: ${post_content.post_view}</p>
	<p>추천수: ${post_content.post_like}</p>
	<p>작성일: <fmt:formatDate value="${post_content.post_regdate}" pattern="yyyy년 MM월 dd일 hh:mm"/></p>
	<hr />
	<p>${post_content.post_content}</p>
	<hr />
	<a href="post_update_view?post_no=${post_content.post_no}">수정하기</a>
	<a href="post_delete?post_no=${post_content.post_no}">삭제</a>
</body>
</html>