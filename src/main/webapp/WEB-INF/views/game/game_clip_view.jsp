<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

<title>게임정보</title>
<style>
table {
	width: 700px
}
</style>
</head>
<body>
	<table class="table table-striped">
		<thead>
			<tr>
				<th>제목</th>
				<th>내용</th>
			</tr>
		</thead>

		<tr>
			<td>게임명</td>
			<td>${game.gameName}</td>
		</tr>

		<tr>
			<td>게임장르</td>
			<td>${game.gameGenre}</td>
		</tr>

		<tr>
			<td>게임 개발/배포사</td>
			<td>${game.gameCompany}</td>
		</tr>

		<tr>
			<td>게임 출시일</td>
			<td><fmt:formatDate value="${game.gamePubDate}"
					pattern="yyyy년 M월 d일" /></td>
		</tr>

		<tr>
			<td>게임 설명</td>
			<td>${game.gameDetail}</td>
		</tr>

		<tr>
			<td>게임 영상</td>
			<td><c:forEach items="${gameClip}" var="clip">

					<c:if test="${clip.clipKind == 'youtube'}">
						<iframe width="700" height="400"
							src="${clip.clipPath}?autoplay=1"> </iframe><br>
					</c:if>

					<c:if test ="${clip.clipKind=='pic'}">
						<img src="<c:url value='/image/${clip.clipPath}' />" width="700"><br>
					</c:if>
				</c:forEach></td>
		</tr>
	</table>
</body>
</html>