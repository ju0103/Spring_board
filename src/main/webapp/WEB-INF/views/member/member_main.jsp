<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>마이페이지</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
</head>
<body>
	<!-- 회원 -->
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-7 mt-5">
				<h3>마이페이지</h3>
			</div>
			<div class="col-lg-2 mt-5">
				<a href="../post/post_list">목록으로</a>
				&nbsp;&nbsp;&nbsp;&nbsp;<a href="../member/logout">로그아웃</a>
			</div>
		</div>
		<hr>
		<div class="row justify-content-center">
			<c:choose>
				<c:when test="${sessionScope.mem_id eq 'admin'}">
					<div class="col-8">
						<div class="card">
							<div class="card-body">
								<table class="table table-hover">
									<tr>
										<th>아이디</th>
										<th>이름</th>
										<th>전화번호</th>
										<th>이메일</th>
										<th>가입일</th>
										<th>회원등급</th>
										<th>등업</th>
									</tr>
									<c:forEach items="${memberList}" var="list">
										<tr>
											<th>${list.mem_id}</th>
											<th>${list.mem_name}</th>
											<th>${list.mem_tel}</th>
											<th>${list.mem_email}</th>
											<th><fmt:formatDate value="${list.mem_regdate}" pattern="yyyy-mm-dd"/></th>
											<th>${list.mem_level}</th>
											<th>
												<button type="button" class="btn btn-outline-secondary" onclick="confirmLevelUp('${list.mem_id}', ${list.mem_level });">등업</button>
											</th>
										</tr>
									</c:forEach>
								</table>
							</div>
						</div>
					</div>
					<div class="col-2">
						<nav class="list-group">
							<a class="list-group-item list-group-item-action" href="updateMemberView?mem_id=${member.mem_id}">관리자 정보 수정</a>
							<a class="list-group-item list-group-item-action" href="../post/received_comm">신고된 댓글</a>
						</nav>
					</div>
				</c:when>
				<c:otherwise>
					<div class="col-2">
						<nav class="list-group">
							<a class="list-group-item list-group-item-action" href="updateMemberView?mem_id=${member.mem_id}">회원 정보 수정</a>
							<a class="list-group-item list-group-item-action" href="deleteMember?mem_id=${member.mem_id}">회원 탈퇴</a>
						</nav>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
<script type="text/javascript">
	function confirmLevelUp(memId, memLevel) {
		var result = confirm(memId + "님을 등업하시겠습니까?");
		
		if (result == true) {
			location.href = "updateLevel?mem_id=" + memId + "&mem_level=" + memLevel;
		}
	}
</script>
</html>