<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script> -->


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

<!-- popper  -->
<script src="<c:url value='/bootstrap/4.2.1/popper.min.js'/>"></script>
<!-- <script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script> -->

<!-- bootstrap js -->
<script src="<c:url value='/bootstrap/4.2.1/js/bootstrap.min.js'/>"></script>

<!-- custom js : datePicker -->
<script src="<c:url value='/custom/datepicker.ko.js'/>"></script>

<script>
	$(document).ready(function(e){
		
		$('[id ^= movie]').click(function(e){
		//alert("test");
			
			$.ajax({
	            
	             url : '전송 주소(액션)',
	             type : '전송방식',
	             dataType : '전송 미디어(MIME)',
	             data : {
	                       // 전송 데이터(키) : 값 => 다량 전송 가능
	                        id : $('#id_fld').val(), 
	                        email : $('#email_fld').val(), 
	             }, 
	             success : function(data) {
	                
	                // 클라이언트->서버 전송 및  서버->클라이언트회신 및  성공시 조치사항
	                // HTTP error code : 200 (성공)
	            	 $('#movie').html ("test1");
	 
	            }, // success
	             
	             error : function(xhr, status) {
	                 
	                console.log(xhr+" : "+status); // 에러 코드
	            } 
	 
	     }); // $.ajax
			
		});//
	});

</script>

<script>
	/*jqueryui*/
	$(function() {
		
		$("#searchKind").change(function(){
			
			if($("#searchKind").val() == '게임 출시일'){
			
				$("#searchWord").datepicker({
					changeYear : true,
					changeMonth : true
				});	
			}
		});
	});
</script>

<title>전체 게임정보</title>

<style>
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

@import url(http://fonts.googleapis.com/earlyaccess/nanummyeongjo.css);

table {
	width: 100%;
	border-top: 1px solid #444444;
	border-collapse: collapse;
}

th {
	border-bottom: 1px solid #444444;
	padding: 10px;
	text-align: center;
}

th {
	background-color: #E6E6FA;
}

td {
	border-bottom: 1px solid #444444;
	padding: 10px;
}
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

</style>

</head>
<body>

	<!-- 페이지 관련 변수들 -->
	<div id="paging_var">
		현재 페이지(curPage) : <b>${pageVO.curPage}</b><br> 
		총 페이지(totPage) : <b>${pageVO.totPage}</b><br>
		페이지당 행수(rowsPerPage) : <b>${pageVO.rowsPerPage}</b><br> 
		할당게임수(gameList.size()) : <b>${gameList.size()}</b><br> 
		시작 페이지(startPage) :<b>${pageVO.startPage}</b><br> 
		마지막 페이지(endPage) : <b>${pageVO.endPage}</b><br>
		이전 페이지(prePage) : <b>${pageVO.prePage}</b><br> 
		다음 페이지(nextPage) :<b>${pageVO.nextPage}</b><br> 
		총 게임수(gameNum) : <b>${gameNum}</b><br>
		페이지주소(pageLocation): <b>${pageLocation}</b><br> 
		검색구분(searchKind):<b>${searchKind}</b><br>
		검색어(searchWord):<b>${searchWord}</b><br>
	</div>
	
	<%-- 게임 정보가 없을 경우 --%>
	<c:if test="${gameList.size() == 0}">
		<div style="text-align: center; font-size: 12px">게임 정보 없음</div>
	</c:if>

	<%-- 게임 정보가 있을 경우 --%>
	<c:if test="${gameNum != 0}">
		<table class="table">
			<thead>
				<tr align="center">
					<th width="65">번호</th>
					<th width="100">게임 상세</th>
					<th width="150">게임 이름</th>
					<th width="130">게임 장르</th>
					<th width="150">게임 개발/배포사</th>
					<th width="180">게임 출시일</th>
					<th>게임 소개</th>
				</tr>
			</thead>
			
			<c:forEach var="game" items="${list2}" varStatus="status">
				${status.count} &nbsp; ${game}<br>
			</c:forEach>
			
			<c:forEach var="game" items="${gameList}" varStatus="status">
				<tr>
					<td>${status.count}</td>
					<td><a href="#" id="movie_${game.gameName}"
						data-toggle='modal' data-target='#myModal'><img
							src="<c:url value = '/icon/s_movie3.png'/>"></a></td>
					<td>${game.gameName}</td>
					<td>${game.gameGenre}</td>
					<td>${game.gameCompany}</td>
					<td><fmt:formatDate value="${game.gamePubDate}"
							pattern="yyyy년 M월 d일" /></td>
					<td>${game.gameDetail}</td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	<!--게임 무비 상세  -->

		<!--시작 -->
		<div class="modal" id="myModal">
			<div class="modal-dialog">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h6 class="modal-title">게임 영상</h6>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<!-- Modal body -->
					<div id="movie" class="modal-body"></div>



					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
					</div>

				</div>
			</div>
		</div>
		<!-- 끝 -->

		<!-- 게임 검색 시작 -->
				<div id="searchPanel">
					<form class="form-inline"
						action="../game/gameListSearchProc.do" method="POST">
						<select id="searchKind" name="searchKind"
							class="custom-select mb-2 mr-sm-2 search-margin-top1">
							<option>게임 이름</option>
							<option>게임 장르</option>
							<option>제작/배포회사</option>
							<option>게임 출시일</option>
						</select> <input type="text" id="searchWord" name="searchWord"
							class="form-control mb-2 mr-sm-2 search-margin-top1" autocomplete="off" /> 
							<input type="submit" id="searchBtn" name="searchBtn" value="검색"
							class="btn btn-outline-primary search-margin-top2" /> 
						<input type="hidden" id="curPage" name="curPage" value="${pageVO.curPage}">
						<input type="hidden" id="rowsPerPage" name="rowsPerPage" value="${pageVO.rowsPerPage}">
					
					
					<!-- 전체 목록 버튼 -->
					<button type="button" onClick="location.href='../game/game_all_view.do?curPage=1'"
							class="btn btn-outline-primary search-margin-top2 fld_gap">전체 목록</button>
					
					</form>
					
				</div>
				<!-- 게임 검색 끝 -->

		<!-- 페이징 시작 -->
		<div id="paging">

			<ul class="pagination justify-content-center">
				<!-- justify-content-center -->

				<!-- 3 페이지씩 출력되도록 조치 -->
				<c:choose>

					<c:when test="${gameNum <= pageVO.rowsPerPage}">
						<li class="page-item"><span style="font-size: 12px">1</span></li>
					</c:when>

					<%-- 게임 페이지 --%>
					<c:when test="${not empty pageVO.curPage}">

						<!-- 처음 페이지 -->
						<li class="page-item"><a class="page-link"
							href="${pageContext.request.contextPath}/game/${pageLocation}?curPage=1&searchKind=${searchKind}&searchWord=${searchWord}&rowsPerPage=${pageVO.rowsPerPage}">
								<!-- ◀◀  --> <span class="material-icons"
								style="color: #0079FF; font-size: 9pt"> fast_rewind </span>
						</a></li>
						<!-- 이전 페이지 -->
						<li class="page-item"><a class="page-link"
							href="${pageContext.request.contextPath}/game/${pageLocation}?curPage=${pageVO.prePage}&searchKind=${searchKind}&searchWord=${searchWord}&rowsPerPage=${pageVO.rowsPerPage}">
								<!-- ◀ --> <span class="material-icons"
								style="color: #0079FF; font-size: 9pt"> skip_previous </span>
						</a></li>

						<!-- 시작/끝 페이지 설정 -->
						<c:set var="startNo" value="1" />

						<c:set var="endNo"
							value="${gameNum <= pageVO.rowsPerPage ? 1 : 3}" />
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
							value="${gameNum > 10 && pageVO.curPage == pageVO.totPage ? 
       	 			     startNo-1 : startNo}" />
       	 			    <!-- 버그 패치 -->
       	 			     <c:set var="beginVar"
							value="${pageVO.curPage == 2 ? 1 : startNo}" />
						<c:set var="endVar"
							value="${pageVO.totPage < 2 ? pageVO.endPage+1 : endNo}" />
						<c:set var="endVar"
							value="${pageVO.curPage == pageVO.totPage ? endNo : endNo}" />
						<!-- 버그 패치 -->
       	 			     <c:set var="endVar"
							value="${pageVO.curPage == 2 ? 3 : endNo}" />

						<!-- 페이지 번호 나열 -->
						<c:forEach begin="${beginVar}" end="${endVar}" varStatus="st">

							<li class="active"><a class="page-link"
								href="${pageContext.request.contextPath}/game/${pageLocation}?curPage=${st.index + pageVO.curPage-2}&searchKind=${searchKind}&searchWord=${searchWord}&rowsPerPage=${pageVO.rowsPerPage}">

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

						<li class="page-item"><a class="page-link" class="page-link"
							href="${pageContext.request.contextPath}/game/${pageLocation}?curPage=${pageVO.nextPage}&searchKind=${searchKind}&searchWord=${searchWord}&rowsPerPage=${pageVO.rowsPerPage}">
								<!-- ▶ --> <span class="material-icons"
								style="color: #0079FF; font-size: 9pt"> skip_next </span>
						</a></li>

						<!-- 마지막 페이지 -->
						<li class="page-item"><a class="page-link"
							href="${pageContext.request.contextPath}/game/${pageLocation}?curPage=${pageVO.endPage}&searchKind=${searchKind}&searchWord=${searchWord}&rowsPerPage=${pageVO.rowsPerPage}">
								<!-- ▶▶ --> <span class="material-icons"
								style="color: #0079FF; font-size: 9pt"> fast_forward </span>
						</a></li>
					</c:when>
				</c:choose>
			</ul>
		</div>
		<!-- 페이징 끝 -->
</body>
</html>