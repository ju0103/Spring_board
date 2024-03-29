<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>게시물 내용</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-7 mt-5">
				<h3><a href="post_list" style="text-decoration: none; color: black;">게시글 목록</a></h3>
			</div>
			<div class="col-lg-2 mt-5 align-self-end">
				<a href="post_list" class="text-end">목록으로</a>
				<c:if test="${not empty sessionScope.mem_id && sessionScope.mem_id eq post_content.post_writer}">
						&nbsp;&nbsp;&nbsp;&nbsp;<a href="post_update_view?post_no=${post_content.post_no}">수정</a>
						&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-outline-danger" onclick="confirmDelete();">삭제</button>
				</c:if>
				<c:if test="${not empty sessionScope.mem_id && sessionScope.mem_id eq 'admin'}">
						&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-outline-danger" onclick="confirmDelete();">삭제</button>
				</c:if>				
			</div>
		</div>
		<hr>
		<div class="row justify-content-center">
			<div class="col-9">
				<!-- 게시글 -->
				<div class="card m-4">
					<div class="card-header">
						<h1>${post_content.post_title}</h1>
						<h4 class="fs-3">${post_content.post_writer}</h4>
						<p class="card-text">
							<fmt:formatDate value="${post_content.post_regdate}" pattern="yyyy.MM.dd. hh:mm"/>
							조회수 ${post_content.post_view}
							추천수 ${post_content.post_like}
						</p>
					</div>
					<div class="card-body">
						<pre>${post_content.post_content}</pre>
					</div>
					<div class="card-footer">
						첨부파일 <c:if test="${post_content.file_name ne null}">
									<a href="download_file?post_no=${post_content.post_no}&file_name=${post_content.file_name}">${post_content.file_name }</a>
									(${post_content.file_size }KB)
								</c:if>
					</div>
				</div>
				<!-- 댓글 작성 폼 -->
				<c:if test="${not empty sessionScope.mem_id}">
					<div class="m-4 p-3">
						<form method="post" action="comm_write">
							<div class="card">
								<input type="hidden" name="post_no" value="${post_content.post_no}">
								<input type="hidden" name="comm_writer" value="${sessionScope.mem_id}">
								<div class="card-body align-middle" style="padding: 0;">
									<textarea rows="3" cols="160" name="comm_content" placeholder="댓글 작성란) 무분별한 비방이나 욕설은 삼가해 주세요."></textarea>
									<button type="submit" class="btn btn-outline-secondary">댓글 남기기</button>
								</div>
							</div>
						</form>
					</div>
				</c:if>
				<c:if test="${empty sessionScope.mem_id}">
					<div class="m-4 p-4">
						<p>댓글을 작성하려면 로그인해주세요.</p>
					</div>
				</c:if>
				<!-- 댓글 리스트 -->
				<div id="comments">
					<ol class="commentsList my-4 px-5" style="list-style: none;">
						<c:forEach items="${commentsList}" var="comments">
							<li>
								<p>
									작성자: ${comments.comm_writer}
									&nbsp;&nbsp;&nbsp; 작성일: <fmt:formatDate value="${comments.comm_regdate}" pattern="yyyy.MM.dd hh:mm" />
									<c:if test="${not empty sessionScope.mem_id}">
										<c:choose>
											<c:when test="${sessionScope.mem_id eq comments.comm_writer}">
												<button type="button" class="btn btn-outline-danger" id="modifyCommBtn">수정하기</button>
												<button type="button" class="btn btn-outline-danger" onclick="deleteComm(${post_content.post_no}, ${comments.comm_no});">삭제하기</button>
											</c:when>
											<c:when test="${sessionScope.mem_id eq 'admin'}">
												<button type="button" class="btn btn-outline-danger" onclick="deleteComm(${post_content.post_no}, ${comments.comm_no});">삭제하기</button>
											</c:when>
											<c:otherwise>
												<button type="button" class="btn btn-outline-secondary" onclick="declare('${post_content.post_no}', '${comments.comm_no}', '${sessionScope.mem_id}');">신고하기</button>
											</c:otherwise>
										</c:choose>
									</c:if>
									<c:if test="${sessionScope.mem_id eq comments.comm_writer}">
										<form method="post" action="modify_comm">
											<div class="card" id="modifyForm" style="display: none;">
												<input type="hidden" name="post_no" value="${post_content.post_no}">
												<input type="hidden" name="comm_no" value="${comments.comm_no}">
												<div class="card-body align-middle" style="padding: 0;">
													<textarea rows="3" cols="160" name="comm_content">${comments.comm_content}</textarea>
													<button type="submit" class="btn btn-outline-secondary">수정하기</button>
												</div>
											</div>
										</form>
									</c:if>
								</p>
								<p><pre>${comments.comm_content}</pre></p>
							</li>
						</c:forEach>
					</ol>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
<script>
	function confirmDelete() {
		var result = confirm("삭제 후에는 복구가 불가능합니다.\n삭제하시겠습니까?");
		
		if (result == true) {
			location.href = "post_delete?post_no=${post_content.post_no}";
		}
	}
	
	function deleteComm(postNo, commNo) {
		var result = confirm("삭제하시겠습니까?");
		
		if (result == true) {
			location.href = "delete_comm?post_no=" + postNo + "&comm_no=" + commNo;
		}
	}
	
	window.onload = function () {
		var modifyBtn = document.getElementById("modifyCommBtn");
		var modifyForm = document.getElementById("modifyForm");
		
		modifyBtn.onclick = function() {
			modifyForm.style.display = 'block';
		}
	}
	
	function declare(postNo, commNo, reporter) {
		if (confirm("신고하시겠습니까?")) {
			$.ajax({
				url: "comm_declare",
				type: "post",
				dataType: "json",
				data: {"post_no": postNo, "comm_no": commNo, "declare_reporter": reporter},
				success: function(data) {
					console.log(data);
					if (data >= 1) {
						alert("신고 접수 완료");
					} else {
						alert("신고 접수 오류");
					}
				},
				error: function(data) {
					console.log(data);
					alert("오류 발생");
				}
			});
		}
	}
</script>
</html>