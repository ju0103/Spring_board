<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>회원가입</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-7 mt-5">
				<h3>회원가입</h3>
			</div>
		</div>
		<hr>
		<div class="row justify-content-center">
			<div class="col-lg-8 col-sm-8">
				<div class="card m-4">
					<div class="card-body">
						<form name="regForm" method="post" action="register">
							<div class="mb-3">
								<label for="mem_id" class="form-label">아이디</label>
								<div class="input-group mb-1">
									<input type="text" name="mem_id" class="form-control" id="mem_id" aria-describedby="chkIdBtn" required>
									<button type="button" class="btn btn-outline-secondary float-right" id="chkIdBtn" onclick="chkId();" value="N">중복 확인</button>
								</div>
								<span class="form-text"></span>
							</div>
							<div class="mb-3">
								<label for="mem_pw" class="form-label">비밀번호</label>
								<input type="password" name="mem_pw" class="form-control" required>
							</div>
							<div class="mb-3">
								<label for="chk_pw" class="form-label">비밀번호 확인</label>
								<input type="password" name="chk_pw" class="form-control" required>
							</div>
							<div class="mb-3">
								<label for="mem_name" class="form-label">이름</label>
								<input type="text" name="mem_name" class="form-control" required>
							</div>
							<div class="mb-3">
								<label for="mem_tel" class="form-label">전화번호</label>
								<input type="tel" name="mem_tel" class="form-control" required>
							</div>
							<div class="mb-3">
								<label for="mem_email" class="form-label">이메일</label>
								<input type="email" name="mem_email" class="form-control" required>
							</div>
							<button type="submit" id="submit" class="btn btn-outline-primary">가입하기</button>
							<button type="button" id="cancel" class="btn btn-outline-secondary">취소</button>
						</form>						
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$("#cancel").on("click", function() {
			location.href = "../post/post_list";
		});
		$("#submit").on("click", function() {
			if($("input[name=mem_id]").val() == "") {
				$("input[name=mem_id]").focus();
				return false;
			}
			if($("input[name=mem_pw]").val() == "") {
				$("input[name=mem_pw]").focus();
				return false;
			}
			if($("input[name=mem_pw]").val().length < 8) {
				alert("비밀번호는 8자 이상으로 설정해주세요.");
				$("input[name=mem_pw]").focus();
				return false;
			}
			if($("input[name=chk_pw]").val() == "") {
				$("input[name=chk_pw]").focus();
				return false;
			}
			if($("input[name=mem_pw]").val() != $("input[name=chk_pw]").val()) {
				alert("비밀번호가 다릅니다. 비밀번호를 확인해주세요.");
				$("input[name=chk_pw]").focus();
				return false;
			}
			if($("input[name=mem_name]").val() == "") {
				$("input[name=mem_name]").focus();
				return false;
			}
			if($("input[name=mem_tel]").val() == "") {
				$("input[name=mem_tel]").focus();
				return false;
			}
			if($("input[name=mem_email]").val() == "") {
				$("input[name=mem_email]").focus();
				return false;
			}
			var chkIdVal = $("#chkIdBtn").val();
			if (chkIdVal == "N") {
				alert("아이디 중복 확인을 해주세요.");
				event.preventDefault();
			} else if (chkIdVal == "Y") {
				console.log(chkIdVal);
				$("form[name='regForm']").submit();
			}
		});
	});
	
	function chkId() {
		if ($("input[name=mem_id]").val() != "") {
			$.ajax({
				url: "chkId",
				type: "post",
				dataType: "json",
				data: {"mem_id": $("input[name=mem_id]").val()},
				success: function(data) {
					if (data >= 1) {
						$(".form-text").text("해당 아이디는 이미 존재합니다.").css({"color":"red"});
						$("input[name=mem_id]").focus();
					} else if (data == 0) {
						$(".form-text").text("사용 가능한 아이디입니다.").css({"color":"blue"});
						$("#chkIdBtn").attr("value", "Y");
					}
				}
			})
		} else {
			$(".form-text").text("아이디를 입력하세요.").css({"color":"red"});
			$("input[name=mem_id]").focus();
		}
	}
</script>
</html>