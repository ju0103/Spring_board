<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시물 수정</title>
	<script
		src="https://code.jquery.com/jquery-3.6.0.js"
		integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
		crossorigin="anonymous"></script>
</head>
	<script>
		$(document).ready(function() {
			var form = $("form[name = 'updateForm']");
			
			$(".update_btn").on("click", function() {
				if (validation_check()) {
					return false;
				}
				form.attr("action", "post_update");
				form.attr("method", "post");
				form.submit();
			});
		});
		
		function validation_check() {
			var chk_length = $("form[name = 'updateForm'] .check").length;
			for (var i = 0; i < chk_length; i++) {
				if($(".check").eq(i).val() == "" || $(".check").eq(i).val() == null) {
					alert($(".check").eq(i).attr("title"));
					return true;
				}
			}
		}
	</script>
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
					<td><input type="text" name="post_title" value="${update_view.post_title}" class="check" title="제목을 입력하세요."></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea cols="50" rows="5" name="post_content" class="check" title="내용을 입력하세요.">${update_view.post_content}</textarea></td>
				</tr>
				<tr>
					<th colspan="2"><button type="button" class="update_btn">수정</button></th>
				</tr>
			</table>
		</form>
	</section>
</body>
</html>