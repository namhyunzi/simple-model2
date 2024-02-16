<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" ></script>
<title>모델2</title>
</head>
<body>
<c:set var="menu" value="게시판" />
<%@ include file="../common/navbar.jsp" %>
<div class="container">
	<div class="row mb-3">
		<div class="col-12">
			<h1>게시글 목록</h1>
			
			<p>현재 페이지 : <c:out value="${param.page }" default="1" /></p>
			<table class="table">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>조회수</th>
						<th>작성자</th>
						<th>등록일</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty boardList }">
							<tr>
								<td colspan="5" class="text-center">데이터가 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="board" items="${boardList }">
								<tr>
									<td>${board.no }</td>
									<td>${board.title }</td>
									<td>${board.readCount }</td>
									<td>${board.user.name }</td>
									<td><fmt:formatDate value="${board.createdDate }"/></td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
	</div>
	
	<div class="row mb-3">
		<div class="col-12">
			<nav class="pagination">
				<ul class="pagination justify-content-center">
					<c:forEach var="num" begin="1" end="5">
						<li class="page-item ${param.page eq num ? 'active' : ''}">
							<a href="list.do?page=${num }" class="page-link">${num }</a>
						</li>
					</c:forEach>
					
				</ul>
			</nav>
		</div>
	</div>
</div>
</body>
</html>