<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>게시물 수정</title>
	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-7 mt-5">
				<h3>게시글 수정</h3>
			</div>
			<div class="col-lg-2 mt-5 align-self-end">
				<a href="post_list" class="text-end">목록으로</a>
			</div>
		</div>
		<hr>
		<div class="row justify-content-center">
			<div class="col-lg-8 col-sml-4">
				<div class="card m-4">
					<div class="card-header">
						<h1 class="text-muted">${update_view.post_title}</h1>
						<div class="col-lg-8 col-sm-12">
							<h4 class="fs-3 text-muted">${update_view.post_writer}</h4>
						</div>
						<div class="col-lg-4 col-sm-12">
							<p class="card-text text-muted text-end">
								<fmt:formatDate value="${update_view.post_regdate}" pattern="yyyy.MM.dd. hh:mm"/>
								조회수 ${update_view.post_view}
								추천수 ${update_view.post_like}
							</p>
						</div>
					</div>
					<div class="card-body">
						<form name="updateForm" method="post" action="post_update">
							<input type="hidden" name="post_no" value="${update_view.post_no}" readonly="readonly">
							<div class="mb-3">
								<label for="post_title" class="form-label">제목</label>
								<input type="text" name="post_title" value="${update_view.post_title}" class="check form-control" title="제목을 입력하세요.">
							</div>
							<div class="mb-3">
								<label for="post_content" class="form-label">내용</label>
								<textarea cols="50" rows="5" name="post_content" class="check form-control" title="내용을 입력하세요.">${update_view.post_content}</textarea>
							</div>
							<button type="button" class="btn btn-outline-warning update_btn">수정</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
</body>
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
</html>