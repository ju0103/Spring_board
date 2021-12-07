<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시물 목록</title>
	<style type="text/css">
		li {list-style: none; float: left; padding: 5px; }
	</style>
	<script
		src="https://code.jquery.com/jquery-3.6.0.js"
		integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
		crossorigin="anonymous"></script>
</head>
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
<body>
	<header>
		<h3>게시글 목록</h3>
	</header>
	<hr />
	<nav>
		게시글 목록
	</nav>	
	<hr />
	<section id="container">
		<a href="post_write_view">글 작성</a>
		<table width="1000" border="1" cellspacing="0">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>추천수</th>
				<th>등록일</th>
			</tr>
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
		</table>
		
		<!-- 검색창 -->
		<div class="search">
			<select name="searchType">
				<option value="none"<c:out value="${searchCriteria.searchType == null ? 'selected' : ''}" />>========</option>
				<option value="title"<c:out value="${searchCriteria.searchType eq 'title' ? 'selected' : ''}" />>제목</option>
				<option value="content"<c:out value="${searchCriteria.searchType eq 'content' ? 'selected' : ''}" />>내용</option>
				<option value="writer"<c:out value="${searchCriteria.searchType eq 'writer' ? 'selected' : ''}" />>작성자</option>
				<option value="titleContent"<c:out value="${searchCriteria.searchType eq 'titleContent' ? 'selected' : ''}" />>제목+내용</option>
			</select>
			
			<input type="text" name="keyword" id="keywordInput" value="${searchCriteria.keyword}">
			
			<button type="button" id="searchBtn">검색</button>
		</div>
		
		<!-- 페이지 -->
		<div>
			<ul>
				<c:if test="${pageMaker.prev}">
					<li><a href="post_list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
				</c:if>
				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
					<li><a href="post_list${pageMaker.makeSearch(idx)}">${idx}</a></li>
				</c:forEach>
				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<li><a href="post_list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
				</c:if>
			</ul>
		</div>
	</section>
</body>
</html>