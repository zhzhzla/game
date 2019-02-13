<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>게임 정보 생성</title>

<style>
section#writeForm {
	width: 600px;
	text-align: left;
}

/* 글내용 쓰기 필드 크기 조절 방지 */
textarea {
	resize: none;
}

/* 에러 메시지 글자 : tr */
tr.err_msg {
	color: red;
	text-indent: 6em;
}

.err {
	font-size: 12px;
	color: red;
}
</style>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
  $( function() {
    $( "#gamePubDate" ).datepicker({
    	
    	changeMonth: true,
        changeYear: true,
        yearRange: "1990:2019",
        monthNames: ['1월','2월','3월','4월','5월','6월',
        	  '7월','8월','9월','10월','11월','12월'],
        	  monthNamesShort: ['1월','2월','3월','4월','5월','6월',
        	  '7월','8월','9월','10월','11월','12월']
    });
  } );
  </script>

</head>
<body>

	<!-- modelAttribute = "gameInfoVO" -->
	<form:form commandName="gameInfoVO" name="game_reg"
		action="game_reg.do" method="post">
		<label = for="gameName">게임명</label>
		<input type="text" name="gameName">
		<spring:hasBindErrors name="gameInfoVO">
			<c:if test="${errors.hasFieldErrors('gameName')}">
				<span class="err">${gameName_error}</span>
			</c:if>
		</spring:hasBindErrors>
		<br>

		<label = for="gameGenre">게임 장르</label>
		<select id="gameGenre" name="gameGenre" required="true">
			<option value="">선택하세요</option>
			<option value="MMORPG">MMORPG</option>
			<option value="FPS">FPS</option>
			<option value="RPG">RPG</option>
			<option value="RTS">RTS</option>
			<option value="시뮬레이션">시뮬레이션</option>
			<option value="스포츠">스포츠</option>
			<option value="CCG">CCG</option>
			<option value="고전 에뮬게임">고전 에뮬게임</option>
			<option value="액션 RPG">액션 RPG</option>
		</select>
		<br>

		<label = for="gameCompany">게임 회사</label>
		<select id="gameCompany" name="gameCompany" required="true">
			<option value="">선택하세요</option>
			<option value="EA">EA</option>
			<option value="블리자드">블리자드</option>
			<option value="엔씨소프트">엔씨소프트</option>
			<option value="넷마블">넷마블</option>
			<option value="PUBS">PUBS</option>
			<option value="아타리">아타리</option>
			<option value="액토즈소프트">액토즈소프트</option>
			<option value="액티비전">액티비전</option>
			<option value="라이엇 게임즈">라이엇 게임즈</option>
			<option value="이드 소프트웨어">이드 소프트웨어</option>
			<option value="스마일 게이트">스마일 게이트</option>
			<option value="니혼 팔콤">니혼 팔콤</option>
		</select>
		<br>

		<label for="gamePubDate">게임 출시일</label>
		<input type="text" id="gamePubDate" name="gamePubDate">
		<br>

		<label for="gameDetail">게임 설명</label>
		<textarea id="gameDetail" name="gameDetail" cols="20" rows="10"></textarea>
		<br>
		<spring:hasBindErrors name="gameInfoVO">
			<c:if test="${errors.hasFieldErrors('gameDetail')}">
				<span class="err">${gameDetail_error}</span>
			</c:if>
		</spring:hasBindErrors>
		<br>

		<section id="gameSubmit">

			<input type="submit" class="btn btn-info" value="등록"
				ng-disabled="boardForm.$invalid">&nbsp;&nbsp; <input
				type="reset" class="btn btn-info" value="취소" />

		</section>



	</form:form>
</body>
</html>