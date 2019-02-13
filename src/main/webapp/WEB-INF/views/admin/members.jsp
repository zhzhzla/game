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
<title>전체 회원 정보 조회</title>
</head>
<body>
	<table class="table table-hover members_view_tbl">

		<tr align="center">
			<td id=title>번호</td>
			<td id=title>아이디</td>
			<td id=title>비밀번호</td>
			<td id=title>닉네임</td>
			<td id=title>이름</td>
			<td id=title>성별</td>
			<td id=title>나이</td>
			<td id=title>이메일</td>
			<td id=title>전화</td>
			<td id=title>생년월일</td>
			<td id=title>우편번호</td>
			<td id=title>기본주소</td>
			<td id=title>상세주소</td>
		</tr>

		<c:forEach var="member" items="${members}" varStatus="status">
			<tr align="center">
				<td>${status.count}</td>
				<td>${member.memberId}</td>
				<td>${member.memberPassword}</td>
				<td>${member.memberNickname}</td>
				<td>${member.memberName}</td>
				<td>${member.memberGender}</td>
				<td>${member.memberAge}</td>
				<td>${member.memberEmail}</td>
				<td>${member.memberPhone}</td>
				<td><fmt:formatDate value="${member.memberBirth}"
						pattern="yyyy년 M월 d일" /></td>
				<td>${member.memberZip}</td>
				<td>${member.memberAddressBasic}</td>
				<td>${member.memberAddressDetail}</td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>