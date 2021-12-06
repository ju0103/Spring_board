<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시물 내용</title>
	<script
		src="https://code.jquery.com/jquery-3.6.0.js"
		integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
		crossorigin="anonymous"></script>
	<style type="text/css">
		table {
			border-collapse: collapse;
		}
		th, td {
			border: 1px solid #ccc;
			padding: 5px;
		}
	</style>
</head>
<body>
	<section id="container">
		<a href="post_list">목록으로</a>
		<hr />
		<h3>${post_content.post_title}</h3>
		<table>
			<colgroup>
				<col width="15%" />
				<col width="25%" />
				<col width="15%" />
				<col width="15%" />
				<col width="15%" />
				<col width="15%" />
			</colgroup>
			<tbody>
				<tr>
					<th>글번호</th>
					<td>${post_content.post_no}</td>
					<th>조회수</th>
					<td>${post_content.post_view}</td>
					<th>추천수</th>
					<td>${post_content.post_like}</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${post_content.post_writer}</td>
					<th>작성일</th>
					<td colspan="3"><fmt:formatDate value="${post_content.post_regdate}" pattern="yyyy년 MM월 dd일 hh시 mm분"/></td>
				</tr>
				<tr>
					<td colspan="6"><pre>${post_content.post_content}</pre></td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td colspan="5">
						<a href="download_file?post_no=${post_content.post_no}&file_name=${post_content.file_name}">${post_content.file_name }</a>
						(${post_content.file_size }KB)
					</td>
				</tr>
			</tbody>
		</table>
		<hr />
		<!-- 게시물 작성자에게만 나타날 부분 -->
		<a href="post_update_view?post_no=${post_content.post_no}">수정</a>
		<a href="post_delete?post_no=${post_content.post_no}">삭제</a>
	</section>
</body>
</html>