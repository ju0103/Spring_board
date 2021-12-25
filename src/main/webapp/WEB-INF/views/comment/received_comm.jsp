<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>신고된 댓글 목록</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
</head>
<body>
	<!-- 회원 -->
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-7 mt-5">
				<h3><a href="../member/memberMain?mem_id=${sessionScope.mem_id}">마이페이지</a></h3>
			</div>
			<div class="col-lg-2 mt-5">
				<a href="../post/post_list">목록으로</a>
				&nbsp;&nbsp;&nbsp;&nbsp;<a href="../member/logout">로그아웃</a>
			</div>
		</div>
		<hr>
		<div class="row justify-content-center">
			<div class="col-8">
				<div class="card">
					<div class="card-body">
						<table class="table table-hover">
							<tr>
								<th>번호</th>
								<th>작성자</th>
								<th>내용</th>
								<th>신고자</th>
								<th>삭제</th>
							</tr>
							<c:set value="1" var="count"></c:set>
							<c:forEach items="${commList}" var="list">
								<tr>
									<th>${count}</th>
									<th>${list.comm_writer}</th>
									<th>${list.comm_content}</th>
									<th>${list.declare_reporter}</th>
									<th>
										<button type="button" class="btn btn-outline-danger" onclick="deleteComm(${list.post_no}, ${list.comm_no});">삭제하기</button>
									</th>
								</tr>
								<c:set value="${count+1}" var="count"></c:set>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
<script type="text/javascript">
	function deleteComm(postNo, commNo) {
		if (confirm("삭제하시겠습니까?")) {
			location.href = "delete_comm?post_no=" + postNo + "&comm_no=" + commNo;
		}
	}
</script>
</html>