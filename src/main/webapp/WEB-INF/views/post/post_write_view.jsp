<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>게시물 등록하기</title>
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
				<h3>게시글 작성</h3>
			</div>
			<div class="col-lg-1 mt-5 align-self-end">
				<a href="post_list" class="text-end">목록으로</a>
			</div>
		</div>
		<hr>
		<div class="row justify-content-center">
			<div class="col-lg-8 col-sml-4">
				<div class="card m-4">
					<div class="card-body">
						<form name="writeForm" method="post" action="post_write" enctype="multipart/form-data">
							<div class="mb-3">
								<label for="post_writer" class="form-label">작성자</label>
								<input type="text" name="post_writer" class="check form-control" title="작성자를 입력하세요.">
							</div>
							<div class="mb-3">
								<label for="post_title" class="form-label">제목</label>
								<input type="text" name="post_title" class="check form-control" title="제목을 입력하세요.">
							</div>
							<div class="mb-3">
								<label for="post_content" class="form-label">내용</label>
								<textarea cols="50" rows="5" name="post_content" class="check form-control" title="내용을 입력하세요."></textarea>
							</div>
							<div class="mb-3">
								<label for="formFile" class="form-label">파일</label>
								<input type="file" name="file" id="formFile">
							</div>
							<button type="button" class="write_btn btn btn-outline-primary">작성</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
<script>
	$(document).ready(function() {
		var form = $("form[name = 'writeForm']");
		
		$(".write_btn").on("click", function() {
			if (validation_check()) {
				return false;
			}
			form.attr("action", "post_write");
			form.attr("method", "post");
			form.submit();
		});
	});
	
	function validation_check() {
		var form = $("form[name = 'writeForm'] .check").length;
		for (var i = 0; i < form; i++) {
			if($(".check").eq(i).val() == "" || $(".check").eq(i).val() == null) {
				alert($(".check").eq(i).attr("title"));
				return true;
			}
		}
	}
</script>
</html>