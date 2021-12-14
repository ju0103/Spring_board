<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>게시물 목록</title>
	<style type="text/css">
		li {list-style: none; float: left; padding: 5px; }
	</style>
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
				<h3><a href="post_list" style="text-decoration: none; color: black;">게시글 목록</a></h3>
			</div>
			<div class="col-lg-2 mt-5">
				<c:if test="${empty sessionScope.mem_id}">
					<a href="../member/loginView">로그인</a>
					&nbsp;&nbsp;&nbsp;&nbsp;<a href="../member/registerView">회원가입</a>
				</c:if>
				<c:if test="${not empty sessionScope.mem_id}">
					<div class="card">
						<div class="card-header">
							Lv.${mem_level}&nbsp;&nbsp;<a href="../member/memberMain?mem_id=${sessionScope.mem_id}">[${mem_id}]</a>님 환영합니다.
						</div>
						<div class="card-body">
								<a href="post_write_view">글 작성</a>
								&nbsp;&nbsp;|&nbsp;&nbsp;<a href="logout">로그아웃</a>
						</div>
					</div>
				</c:if>
			</div>
		</div>
		<hr>
		<div class="row justify-content-center">
			<div class="col-lg-8 col-sml-4">
				<div class="row justify-content-end m-3">
					<!-- 검색창 -->
					<select name="searchType" class="form-select">
						<option value="none"<c:out value="${searchCriteria.searchType == null ? 'selected' : ''}" />>========</option>
						<option value="title"<c:out value="${searchCriteria.searchType eq 'title' ? 'selected' : ''}" />>제목</option>
						<option value="content"<c:out value="${searchCriteria.searchType eq 'content' ? 'selected' : ''}" />>내용</option>
						<option value="writer"<c:out value="${searchCriteria.searchType eq 'writer' ? 'selected' : ''}" />>작성자</option>
						<option value="titleContent"<c:out value="${searchCriteria.searchType eq 'titleContent' ? 'selected' : ''}" />>제목+내용</option>
					</select>
					<input type="text" name="keyword" id="keywordInput" value="${searchCriteria.keyword}">
					<button type="button" id="searchBtn" class="btn btn-outline-secondary">검색</button>
				</div>
				<div class="row justify-content-center">
					<table class="table table-hover">
						<thead class="thead-light">
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>조회수</th>
								<th>추천수</th>
								<th>등록일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${post_list}" var="list">
								<tr>
									<td>${list.post_no}</td>
									<td>
										<a href="post_content?post_no=${list.post_no}">${list.post_title}</a>
									</td>
									<td>${list.post_writer}</td>
									<td>${list.post_view}</td>
									<td>${list.post_like}</td>
									<td><fmt:formatDate value="${list.post_regdate}" pattern="yyyy-MM-dd"/></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="row justify-content-center">
					<!-- 페이지 -->
					<nav>
						<div class="d-flex justify-content-center">
							<ul class="pagination">
								<c:if test="${pageMaker.prev}">
									<li class="page-item"><a class="page-link" href="post_list${pageMaker.makeSearch(pageMaker.startPage - 1)}">Previous</a></li>
								</c:if>
								<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
									<li class="page-item"><a class="page-link" href="post_list${pageMaker.makeSearch(idx)}">${idx}</a></li>
								</c:forEach>
								<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
									<li class="page-item"><a class="page-link" href="post_list${pageMaker.makeSearch(pageMaker.endPage + 1)}">Next</a></li>
								</c:if>
							</ul>
						</div>
					</nav>
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
	$(function() {
		var form = $("form[name = 'writeForm']");
		
		$("#searchBtn").on("click", function() {
			self.location = "post_list" + '${pageMaker.makeQuery(1)}'
							+ "&searchType=" + $("select option:selected").val()
							+ "&keyword=" + encodeURIComponent($('#keywordInput').val());
		});
	});
</script>
</html>