<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<title>개별 회원 정보</title>
<style>
table.member_view_tbl{
	width: 500px
}
</style>
</head>
<body>
	<table class="table table-hover member_view_tbl">
		<tr>
			<td>아이디</td>
			<td>${member.memberId}</td>
		</tr>
		
		<tr>
			<td>패쓰워드</td>
			<td>${member.memberPassword}</td>
		</tr>
		
		<tr>
			<td>닉네임</td>
			<td>${member.memberNickname}</td>
		</tr>
		
		<tr>
			<td>이름</td>
			<td>${member.memberName}</td>
		</tr>
		
		<tr>
			<td>성별</td>
			<td>${member.memberGender}</td>
		</tr>
		
		<tr>
			<td>나이</td>
			<td>${member.memberAge}</td>
		</tr>
		
		<tr>
			<td>이메일</td>
			<td>${member.memberEmail}</td>
		</tr>
		
		<tr>
			<td>휴대폰번호</td>
			<td>${member.memberPhone}</td>
		</tr>
		
		<tr>
			<td>생년월일</td>
			<td><fmt:formatDate value="${member.memberBirth}" pattern="yyyy년 MM월 dd일" /></td>
		</tr>
		
		<tr>
			<td>우편번호</td>
			<td>${member.memberZip}</td>
		</tr>
		
		<tr>
			<td>기본주소</td>
			<td>${member.memberAddressBasic}</td>
		</tr>
		
		<tr>
			<td>상세주소</td>
			<td>${member.memberAddressDetail}</td>
		</tr>

	</table>
</body>
</html>