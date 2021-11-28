<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시물 등록하기</title>
	<script
		src="https://code.jquery.com/jquery-3.6.0.js"
		integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
		crossorigin="anonymous"></script>
</head>
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
<body>
	<header>
		<h3>게시글 작성</h3>
	</header>
	<hr />
	<nav>
		게시글 작성
	</nav>	
	<hr />
	<section id="container">
		<form name="writeForm" method="post" action="post_write">
			<table width="500" border="1" cellspacing="0">
				<tr>
					<th>작성자</th>
					<td><input type="text" name="post_writer" class="check" title="작성자를 입력하세요."></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="post_title" class="check" title="제목을 입력하세요."></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea cols="50" rows="5" name="post_content" class="check" title="내용을 입력하세요."></textarea></td>
				</tr>
				<tr>
					<th colspan="2"><button type="button" class="write_btn">작성</button></td>
				</tr>
			</table>
		</form>
	</section>
</body>
</html>