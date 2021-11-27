<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시물 등록하기</title>
</head>
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
		<form method="post" action="post_write">
			<table width="500" border="1" cellspacing="0">
				<tr>
					<th>작성자</th>
					<td><input type="text" name="post_writer"></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="post_title"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea cols="50" rows="5" name="post_content"></textarea></td>
				</tr>
				<tr>
					<th colspan="2"><button type="submit">작성</button></td>
				</tr>
			</table>
		</form>
	</section>
</body>
</html>