<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>로그인</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
</head>
<body>
	<!-- 로그인 -->
	<c:if test="${empty sessionScope.mem_id}">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-7 mt-5">
					<h3>로그인</h3>
				</div>
			</div>
			<hr>
			<div class="row justify-content-center">
					<div class="col-lg-8 col-sm-4">
						<div class="card m-4">
							<div class="card-body">
								<form name="loginForm" method="post" action="login">
									<div class="mb-3">
										<label for="mem_id" class="form-label">아이디</label>
										<input type="text" name="mem_id" class="form-control" required>
									</div>
									<div class="mb-3">
										<label for="mem_pw" class="form-label">비밀번호</label>
										<input type="password" name="mem_pw" class="form-control" required>
									</div>
									<div class="mb-3">
										<button type="submit" class="btn btn-outline-primary">로그인</button>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="registerView">회원가입하기</a>
									</div>
								</form>						
							</div>
						</div>
					</div>
			</div>
		</div>
	</c:if>
	
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>