<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">

<!-- google material icon -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

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

<!-- bootstrap js -->
<script src="<c:url value='/bootstrap/4.2.1/js/bootstrap.min.js'/>"></script>

<!-- 검색 css -->
<style>
/* 검색 선택/입력창  */
.search-margin-top1 {
	margin-top: 10px;
}

/* 검색 버튼 */
.search-margin-top2 {
	margin-top: 2px;
}

/* 검색 패널 */
#searchPanel {
	width: 700px;
	margin: 20px 0;
	height: 50px;
	padding-top: 5px;
	padding-left: 50px;
	float: left;
}

/* 페이징 */
#paging {
	width: 50%;
	height: 50px;
	float: right;
	margin: 20px 0;
	padding-top: 15px;
}

/* 검색/페이징(wrap) */
#search-paging {
	width: 100%;
}

/* 필드간격 */
.fld_gap {
	margin-left:10px;	
}

</style>

<title>전체 회원 목록</title>
</head>
<body>

	<!-- 페이지 관련 변수들 -->
	<div id="paging_var">
		현재 페이지(curPage) : <b>${pageVO.curPage}</b><br> 총 페이지(totPage) : <b>${pageVO.totPage}</b><br>
		페이지당 행수(rowsPerPage) : <b>${pageVO.rowsPerPage}</b><br> 할당
		인원수(members.size()) : <b>${members.size()}</b><br> 시작
		페이지(startPage) : <b>${pageVO.startPage}</b><br> 마지막 페이지(endPage)
		: <b>${pageVO.endPage}</b><br> 이전 페이지(prePage) : <b>${pageVO.prePage}</b><br>
		다음 페이지(nextPage) : <b>${pageVO.nextPage}</b><br> 총 인원수(memberNum)
		: <b>${memberNum}</b><br>
		
		페이지주소(pageLocation): <b>${pageLocation}</b><br>
		검색구분(searchKind):<b>${searchKind}</b><br>
		검색어(searchWord):<b>${searchWord}</b><br>
	</div>

	<%-- 회원 정보가 없을 경우 --%>
	<c:if test="${members.size() == 0}">
		<div style="text-align: center; font-size: 12px">회원 정보 없음</div>
	</c:if>

	<%-- 회원 정보가 있을 경우 --%>
	<c:if test="${memberNum != 0}">

		<table id="memberAllView"
			class="table table-sm table-striped table-hover">

			<table class="table table-hover member_list_tbl">

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
						<td>${member.memberGender == 'f' ? '여자':'남자'}</td>
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
			</c:if>


			<div id="search-paging">

				<!-- 검색 시작 -->
				<div id="searchPanel">
					<form class="form-inline"
						action="../member/memberListSearchProc.do" method="POST">
						<select id="searchKind" name="searchKind"
							class="custom-select mb-2 mr-sm-2 search-margin-top1">
							<option>아이디</option>
							<option>이름</option>
							<option>별명</option>
							<option>주소</option>
							<option>이메일</option>
						</select> <input type="text" id="searchWord" name="searchWord"
							class="form-control mb-2 mr-sm-2 search-margin-top1" /> 
							<input type="submit" id="searchBtn" name="searchBtn" value="검색"
							class="btn btn-outline-primary search-margin-top2" /> 
						<input type="hidden" id="curPage" name="curPage" value="${pageVO.curPage}">
						<input type="hidden" id="rowsPerPage" name="rowsPerPage" value="${pageVO.rowsPerPage}">
					
					
					<!-- 전체 목록 버튼 -->
					<button type="button" onClick="location.href='../member/memberList.do?curPage=1'"
							class="btn btn-outline-primary search-margin-top2 fld_gap">전체 목록</button>
					
					</form>
					
				</div>
				<!-- 검색 끝 -->

				<!-- 페이징 시작 -->
				<div id="paging">

					<ul class="pagination">
						<!-- justify-content-center -->

						<!-- 3 페이지씩 출력되도록 조치 -->
						<c:choose>

							<c:when test="${memberNum <= pageVO.rowsPerPage}">
								<li class="page-item"><span style="font-size: 12px">1</span></li>
							</c:when>

							<%-- 회원 페이지 --%>
							<c:when test="${not empty pageVO.curPage}">

								<!-- 처음 페이지 -->
								<li class="page-item"><a class="page-link"
									href="${pageContext.request.contextPath}/member/${pageLocation}?curPage=1&searchKind=${searchKind}&searchWord=${searchWord}&rowsPerPage=${pageVO.rowsPerPage}">
										<!-- ◀◀  --> <span class="material-icons"
										style="color: #0079FF; font-size: 9pt"> fast_rewind </span>
								</a></li>
								<!-- 이전 페이지 -->
								<li class="page-item"><a class="page-link"
									href="${pageContext.request.contextPath}/member/${pageLocation}?curPage=${pageVO.prePage}&searchKind=${searchKind}&searchWord=${searchWord}&rowsPerPage=${pageVO.rowsPerPage}">
										<!-- ◀ --> <span class="material-icons"
										style="color: #0079FF; font-size: 9pt"> skip_previous </span>
								</a></li>

								<!-- 시작/끝 페이지 설정 -->
								<c:set var="startNo" value="1" />

								<c:set var="endNo"
									value="${memberNum <= pageVO.rowsPerPage ? 1 : 3}" />
								<!-- 3 페이지 단위 -->

								<c:choose>
									<c:when test="${pageVO.curPage == 1}">
										<c:set var="startNo" value="${startNo+1}" />
										<c:set var="endNo" value="4" />
										<!-- patch -->
									</c:when>
									<c:when test="${pageVO.curPage == pageVO.endPage}">
										<c:set var="endNo" value="${endNo-1}" />
									</c:when>
								</c:choose>

								<!-- 마지막 페이지 2페이지 출력 : 버그 패치 -->
								<c:set var="beginVar"
									value="${memberNum > 10 && pageVO.curPage == pageVO.totPage ? 
       	 			     startNo-1 : startNo}" />
								<c:set var="endVar"
									value="${pageVO.totPage < 2 ? pageVO.endPage+1 : endNo}" />
								<c:set var="endVar"
									value="${pageVO.curPage == pageVO.totPage ? endNo : endNo}" />

								<!-- 페이지 번호 나열 -->
								<c:forEach begin="${beginVar}" end="${endVar}" varStatus="st">

									<li class="active"><a class="page-link"
										href="${pageContext.request.contextPath}/member/${pageLocation}?curPage=${st.index + pageVO.curPage-2}&searchKind=${searchKind}&searchWord=${searchWord}&rowsPerPage=${pageVO.rowsPerPage}">

											<%-- 현재 페이지 = bold <b> 처리 --%> <c:choose>
												<c:when
													test="${pageVO.curPage == (st.index + pageVO.curPage-2)}">
				 	 ${st.index + pageVO.curPage-2}
				 	</c:when>
												<c:otherwise>
				 	 ${st.index + pageVO.curPage - 2}
				 	</c:otherwise>
											</c:choose>

									</a></li>

								</c:forEach>

								<!-- 다음 페이지 -->

								<li class="page-item"><a class="page-link"
									class="page-link"
									href="${pageContext.request.contextPath}/member/${pageLocation}?curPage=${pageVO.nextPage}&searchKind=${searchKind}&searchWord=${searchWord}&rowsPerPage=${pageVO.rowsPerPage}">
										<!-- ▶ --> <span class="material-icons"
										style="color: #0079FF; font-size: 9pt"> skip_next </span>
								</a></li>

								<!-- 마지막 페이지 -->
								<li class="page-item"><a class="page-link"
									href="${pageContext.request.contextPath}/member/${pageLocation}?curPage=${pageVO.endPage}&searchKind=${searchKind}&searchWord=${searchWord}&rowsPerPage=${pageVO.rowsPerPage}">
										<!-- ▶▶ --> <span class="material-icons"
										style="color: #0079FF; font-size: 9pt"> fast_forward </span>
								</a></li>

							</c:when>

						</c:choose>

					</ul>

				</div>
				<!-- 페이징 끝 -->

			</div>
</body>
</html>