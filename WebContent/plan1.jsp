<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="/lib/w3.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
/* 	절대위치(absolute)
	상대위치(relative) */
* {
	margin: 0px;
	padding: 0px;
}

div {
	margin: 0px auto;
	/* border: 1px solid black;  */
}

* {
	font-family: 'NanumSquareRound', sans-serif;
}

.second-bar1 { /* header 밑 이미지 영역 공간을 확보 */
	width: 1200px;
	height: 400px;
	border-radius: 5px;
	margin-left: auto;
	margin-right: auto;
	overflow: hidden;
}

.main-label { /* 메인 이미지에 글자 삽입시 중간 위치 조정 */
	position: absolute;
	top: 25%;
	left: 50%;
	transform: translate(-50%, -50%);
	font-size: 30px;
}

.center { /* 페이지의 body 핵심 내용 기술 */
	width: 1200px;
	/* height: 860px; */
	/* border: 1px solid black; */
	clear: both;
}

#text1 { /* 글자 간격/줄간격 조정 -묵-*/
	letter-spacing: 0.2em;
	line-height: 150%;
}

.center-second { /* center 의 세부 내용 쭉쭉~~*/
	border: 0.5px solid gray;
	width: 350px;
	height: 400px;
	display: inline-block; /* 가로형 정렬 */
	margin: 30px 22.5px;
	border-radius: 10px;
	vertical-align: middle; /* 텍스트 라인 높이 맞춤 */
}

.second-box { /* center-second 이미지 삽입 div */
	border-radius: 10px;
	width: 350px;
	height: 250px;
	clear: both;
	overflow: hidden;
}
.card_image {
	width: 350px;
	height: 250px;
}

.second-text { /* center-second 텍스트 삽입 */
	width: 340px;
	height: 50px;
	padding: px 10px;
	overflow: hidden;
}

#button1 { /* 오른쪽 상단 조회 버튼 삽입 */
	/* float: right; */
	/* border: 1px solid red; */
	width: 1190px;
	margin: 15px 10px 0 0;
}

.local { /* 말머리개념 지역명을 나타내기 위한 영역 확보 */
	paddin: 0 5px;
	margin: 5px 0 0 0;
	font-size: 8pt;
	width: 340px;
	height: 20px;
	overflow: hidden;
}

.tag {
	width: 340px;
	height: 20px;
	padding: px 10px;
	overflow: hidden;
	font-size: 10pt;
}

.idlocal { /* 아아디를 나타내기 위한 영역 확보 */
	width: 340px;
	height: 30px;
	padding: 0 10px 0 0;
	font-size: 13pt;
	overflow: hidden;
}

.datelocal { /* 날짜를 나타내기 위한 영역 확보 */
	width: 340px;
	height: 30px;
	padding: 0 20px 0 0;
	font-size: 11pt;
	overflow: hidden;
}

.bottom-page {
	width: 1200px;
	height: 35px;
	margin: 35px 0 0 0;
}

.search {
	width: 1200px;
	height: 35px;
	margin: 25px 0 50px 0;
}
</style>
</head>
<body>
	<div class="second-bar1" align="center">
		<img id="main-images" alt="image" src="images/1.jpg" width="1200px;">
		<div class="main-label">
			<span style="color: #FFFFFF">
				<p id="text1">
					나만의 BEST 여행지!<br> 공유하고 계획 세우자!
				</p>
			</span>
		</div>
	</div>
	<script type="text/javascript">
		var image = document.getElementById("main-images");
		var current = 0;
		var images = [ "images/1.jpg", "images/2.jpg", "images/3.jpg",
				"images/4.jpg" ]

		function replacePhoto() {
			++current;
			if (current >= images.length)
				current = 0;
			image.src = images[current];
		}
		setInterval(replacePhoto, 3000);
	</script>
	<%
		request.setAttribute("email", session.getAttribute("email"));
		request.setAttribute("nickname", session.getAttribute("nickname"));
	%>
	<div class="center">
		<div id="button1" align="right">
			<input type="button" value="글쓰기" style="width: 40pt; height: 20pt" onclick="location.href='boardselect.do?email=${email}'">
			<input type="button" value="최신순" style="width: 40pt; height: 20pt">
			<input type="button" value="오래된순" style="width: 40pt; height: 20pt">
			<input type="button" value="조회순" style="width: 40pt; height: 20pt"
				onClick="location.href='###'">
		</div>
		<c:forEach var="bs" items="${list }">
			<div class="center-second">
				<div class="second-box">
					<img alt="image" class="card_image" src="${bs.image_url }">
				</div>
				<div class="local">
					<p>${bs.local_names }</p>
				</div>
				<div class="second-text">
					<h1>제목 : ${dto.title }</h1>
				</div>
				<div class="tag">${tag }</div>
				<div class="idlocal">아이디 : </div>
				<div class="datelocal" align="right">${bs.board_date }</div>
			</div>
	
		</c:forEach>
	</div>
		<div class="bottom-page" align="center">
			<div style="text-align: center;">
				<%-- <c:if test="${startPage > blockSize }">
					<a href='list.do?pageNum=${startPage-blockSize }'>[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${startPage }" end="${endPage }">
					<a href='list.do?pageNum=${i}'>[${i}]</a>
				</c:forEach>
				<c:if test="${endPage < pageCnt}">
					<a href='list.do?pageNum=${startPage+blockSize}'>[다음]</a>
				</c:if> --%>
			</div>
			<div class="search" align="center">
				<select name="menu">
					<option value="##">###</option>
					<option value="##">###</option>
					<option value="##">###</option>
					<option value="##">###</option>
				</select> <input type="text" name="search"> 돋보기 이미지
			</div>
		</div>
		<%@ include file="footer.jsp"%>
</body>
</html>
