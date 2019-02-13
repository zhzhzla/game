<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
/* 전체 회원가입 테이블 레이아웃  */
table.tbl_width {
	width: 800px
}

/* 폼필드 에러메시지 필드   */
td[id$=ErrMsg] {
	color: red;
}
</style>
<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> -->
<!--bootstrap css  -->
<link rel="stylesheet"
	href="<c:url value='/bootstrap/4.2.1/css/bootstrap.min.css' />">

<!-- jqueryui css -->
<link rel="stylesheet"
	href="<c:url value='/jqueryui/1.12.1/jquery-ui.min.css' />">
<!-- <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->

<!-- jquery -->
<script src="<c:url value='/jquery/3.3.1/jquery-3.3.1.min.js'/>"></script>
<!-- <script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script> -->

<!-- jqueryui js -->
<script src="<c:url value='/jqueryui/1.12.1/jquery-ui.min.js'/>"></script>

<!-- popper  -->
<script src="<c:url value='/bootstrap/4.2.1/popper.min.js'/>"></script>
<!-- <script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script> -->

<!-- bootstrap js -->
<script src="<c:url value='/bootstrap/4.2.1/js/bootstrap.min.js'/>"></script>

<!-- angular js  -->
<script src="<c:url value='/angular/1.7.5/angular.min.js'/>"></script>


<!-- custom js : datePicker -->
<script src="<c:url value='/custom/datepicker.ko.js'/>"></script>

<!-- daum post map -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script>
	/* 주소 검색  */
	//도로명 주소 검색
	function road_Postcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var fullAddr = ''; // 최종 주소 변수
				var extraAddr = ''; // 조합형 주소 변수

				// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				fullAddr = data.roadAddress;

				// 법정동명이 있을 경우 추가한다.
				if (data.bname !== '') {
					extraAddr += data.bname;
				}
				// 건물명이 있을 경우 추가한다.
				if (data.buildingName !== '') {
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName
							: data.buildingName);
				}
				// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
				fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')' : '');

				// 주소 정보 전체 필드 및 내용 확인 : javateacher
				var output = '';
				for ( var key in data) {
					output += key + ":" + data[key] + "\n";
				}

				//alert(output);

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('memberZip').value = data.zonecode; //5자리 새우편번호 사용
				document.getElementById('memberAddressBasic').value = fullAddr;

				// 커서를 상세주소 필드로 이동한다.
				document.getElementById('memberAddressDetail').focus();
			}
		}).open();
	}
</script>

<script>
	/*jqueryui*/
	$(function() {
		$("#memberBirth").datepicker({
			changeYear : true,
			changeMonth : true
		});
	});
</script>

<script>
	/*angular*/
	angular
			.module('updateApp', [])
			.controller(
					'updateController',
					[
							'$scope',
							function($scope) {

								$scope.checkFinal = function() {

									//신규 비밀번호 점검
									//두 개의 신규 비밀번호 모두 공백일 경우 => 폼점검 승인 : 기존 비밀번호 불변
									if ($('#memberPassword1').val() == ''
											&& $('#memberPassword2').val() == '') {

										alert("기존 비밀번호로 전송");
										//공란일경우 기존 패쓰워드 전송
										$scope.memberPassword1 = "${defaultMember.memberPassword}";
										$scope.memberPassword2 = "${defaultMember.memberPassword}";
									}
								}
							} ]);
</script>

<title>회원정보 수정</title>
</head>
<body ng-app="updateApp" ng-controller="updateController">

	<form:form modelAttribute="member" id="updateForm" name="updateForm"
		action="../member/memberUpdateProc.do" method="post">

		<table class="table tbl_width">

			<!--아이디 -->
			<tr>
				<td>아이디</td>
				<td>${defaultMember.memberId}<input type="hidden" id="memberId"
					name="memberId" value="${defaultMember.memberId}"></td>
			</tr>

			<!--패스워드  -->
			<tr>
				<td>비밀번호</td>
				<td><input type="hidden" id="memberPassword"
					name="memberPassword" value="${defaultMember.memberPassword}">
					<input type="text" id="memberPassword1" name="memberPassword1"
					maxlength="30" ng-model="memberPassword1"
					ng-pattern="/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W).{8,20}$/"
					required="true"></td>
			</tr>

			<tr>
				<td>비밀번호 확인</td>
				<td><input type="text" id="memberPassword2"
					name="memberPassword2" maxlength="30" ng-model="memberPassword2"
					ng-pattern="/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W).{8,20}$/"
					required="true"></td>
			</tr>
			<tr>
				<td colspan="2" id="pwErrMsg"
					ng-show="updateForm.memberPassword.$error.pattern || updateForm.memberPassword2.$error.pattern">특수/대소문자,숫자
					각 1자 이상 8~30자로 입력하세요</td>
			</tr>
			<tr>
				<!--  비밀번호 불일치시 에러메시지: 추후 완성 -->
				<td colspan="2" id="pw2ErrMsg"
					ng-show="updateForm.memberPassword1.$viewValue != updateForm.memberPassword2.$viewValue">
					비밀번호가 일치하지 않습니다</td>
			</tr>

			<!-- 닉네임 -->
			<tr>
				<td>별명</td>
				<td>${defaultMember.memberNickname}<input type="hidden"
					id="memberNickname" name="memberNickname"
					value="${defaultMember.memberNickname}"></td>
			</tr>

			<!-- 이름  -->
			<tr>
				<td>이름</td>
				<td>${defaultMember.memberName}<input type="hidden"
					id="memberName" name="memberName"
					value="${defaultMember.memberName}"></td>
			</tr>

			<!-- 성별  -->
			<tr>
				<td>성별</td>
				<td>${defaultMember.memberGender== 'f' ? '여자':'남자'}<input
					type="hidden" id="memberGender" name="memberGender"
					value="${defaultMember.memberGender}"></td>
			</tr>

			<!-- 나이  -->
			<tr>
				<td>나이</td>
				<td>${defaultMember.memberAge}<input type="hidden"
					id="memberAge" name="memberAge" min="6"
					value="${defaultMember.memberAge}"></td>
			</tr>

			<!-- 이메일 -->
			<tr>
				<td>이메일</td>
				<td><input type="text" id="memberEmail" name="memberEmail"
					ng-model="memberEmail"
					ng-pattern="/^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/"
					maxlength="50" placeholder="${defaultMember.memberEmail}"
					ng-init="memberEmail='${defaultMember.memberEmail}'"></td>
			</tr>
			<tr>
				<td colspan="2" id="memberEmailErrMsg"
					ng-show="updateForm.memberEmail.$error.pattern">이메일을 입력하세요</td>
			</tr>

			<!-- 핸드폰번호  -->
			<tr>
				<td>핸드폰번호</td>
				<td><input type="text" id="memberPhone" name="memberPhone"
					maxlength="13" ng-model="memberPhone"
					ng-pattern="/^\d{3}-\d{3,4}-\d{4}$/"
					placeholder="${defaultMember.memberPhone}"
					ng-init="memberPhone='${defaultMember.memberPhone}'"> ex)
					010-1234-5678</td>
			</tr>
			<tr>
				<td colspan="2" id="memberPhoneErrMsg"
					ng-show="updateForm.memberPhone.$error.pattern">핸드폰번호를 올바르게
					입력하세요</td>
			</tr>

			<!-- 생년월일 -->
			<tr>
				<td>생년월일</td>
				<td><fmt:formatDate value="${defaultMember.memberBirth}"
						pattern="yyyy년 MM월 dd일" /> <input type="hidden" id="memberBirth"
					name="memberBirth" value="${defaultMember.memberBirth}"></td>
			</tr>

			<!-- 우편번호  -->
			<tr>
				<td>우편번호</td>
				<td><input type="text" id="memberZip" name="memberZip" readonly
					maxlength="5" ng-model="memberZip" ng-pattern="/^\d{5}$/"
					placeholder="${defaultMember.memberZip}"
					ng-init="memberZip='${defaultMember.memberZip}'">&nbsp; <input
					type="button" id="postBtn" value="주소검색" onClick="road_Postcode()"><br></td>
			</tr>
			<tr>
				<td colspan="2" id="memberZipErrMsg"
					ng-show="updateForm.memberZip.$invalid" ng-model="memberZipErrMsg">우편번호를
					입력하세요</td>
			</tr>

			<!-- 주소 -->
			<tr>
				<td>주소</td>
				<td><input type="text" id="memberAddressBasic"
					ng-model="memberAddressBasic" name="memberAddressBasic" readonly
					ng-pattern="/^[a-zA-Z0-9 | 가-? | / | - |  (  |  ) | ,]{2,100}$/"
					maxlength="200" size="70"
					placeholder="${defaultMember.memberAddressBasic}"
					ng-init="memberAddressBasic='${defaultMember.memberAddressBasic}'"><br>
					<!-- valid : {{updateForm.memberAddressBasic.$valid}}<br>
					invalid : {{updateForm.memberAddressBasic.$invalid}}<br> --></td>
			</tr>
			<tr>
				<td colspan="2" id="memberAddressBasicErrMsg"
					ng-model="memberAddressBasicErrMsg"
					ng-show="updateForm.memberAddressBasic.$invalid">기본주소를 입력하세요</td>
			</tr>
			<!-- 상세주소 -->
			<tr>
				<td>상세주소</td>
				<td><input type="text" id="memberAddressDetail"
					ng-model="memberAddressDetail" name="memberAddressDetail"
					ng-pattern="/^[a-zA-Z0-9 | 가-? | / | - |  (  |  ) | ,]{2,50}$/"
					maxlength="100" size="70"
					placeholder="${defaultMember.memberAddressDetail}"
					ng-init="memberAddressDetail='${defaultMember.memberAddressDetail}'"></td>
			</tr>
			<tr>
				<td colspan="2" id="memberAddressDetailErrMsg"
					ng-show="updateForm.memberAddressDetail.$invalid">상세주소를 입력하세요</td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" id="update_submit_btn"
					ng-click="checkFinal()" value="회원정보 수정"
					class="btn btn-outline-primary">&nbsp; <input type="reset"
					class="btn btn-outline-primary" value="취소"></td>
			</tr>
		</table>
	</form:form>
</body>
</html>