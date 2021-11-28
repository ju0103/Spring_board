<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시물 수정</title>
</head>
<body>
	<header>
		<h3>게시물 수정</h3>
	</header>
	<hr />
	<a href="post_list">목록으로</a>
	<p>작성자: ${update_view.post_writer}</p>
	<p>조회수: ${update_view.post_view}</p>
	<p>추천수: ${update_view.post_like}</p>
	<p>작성일: <fmt:formatDate value="${update_view.post_regdate}" pattern="yyyy년 MM월 dd일 hh:mm"/></p>
	<hr />
	<section id="container">
		<form name="updateForm" method="post" action="post_update">
			<input type="hidden" name="post_no" value="${update_view.post_no}" readonly="readonly">
			<table width="500" border="1" cellspacing="0">
				<tr>
					<th>제목</th>
					<td><input type="text" name="post_title" value="${update_view.post_title}"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea cols="50" rows="5" name="post_content">${update_view.post_content}</textarea></td>
				</tr>
				<tr>
					<th colspan="2"><button type="submit">수정</button></th>
				</tr>
			</table>
		</form>
	</section>
</body>
</html>