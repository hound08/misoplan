<%@page import="java.util.ArrayList"%>
<%@page import="dao.mySchduleDao"%>
<%@page import="java.util.List"%>
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
	font-family: 'NanumSquareRound', sans-serif;
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
	height: 30px;
	padding: 0 0 0 10px;
	overflow: hidden;
}

#button1 { /* 오른쪽 상단 조회 버튼 삽입 */
	/* float: right; */
	/* border: 1px solid red; */
	width: 1190px;
	margin: 15px 13px 10px 10px;
}

.local { /* 말머리개념 지역명을 나타내기 위한 영역 확보 */
	paddin: 0 0 0 10px;
	margin: 5px 0 0 0;
	font-size: 8pt;
	width: 340px;
	height: 20px;
	overflow: hidden;
}

.tag {
	width: 340px;
	height: 20px;
	padding: 0 0 0 10px;
	overflow: hidden;
	font-size: 10pt;
}

.idlocal { /* 아아디를 나타내기 위한 영역 확보 */
	width: 340px;
	height: 25px;
	padding: 0 0 0 10px;
	font-size: 11pt;
	overflow: hidden;
}

.datelocal { /* 날짜를 나타내기 위한 영역 확보 */
	width: 340px;
	height: 20px;
	padding: 0 10px 0 10px;
	font-size: 11pt;
	overflow: hidden;
}
.count { 
	width: 340px;
	height: 20px;
	padding: 0 20px 0 0;
	font-size: 11pt;
	overflow: hidden;
}

.bottom-page {
	width: 1200px;
	height: 35px;
	margin: 35px 0 0 0;
}
.page-number{
	padding: 0 0 0 30px;
}
.page-num {
	widht: 1200px;
	height: 50px;
}

.search {
	width: 1200px;
	height: 35px;
	padding: 25px 0 0 0;
}
.menu{
	font-size: 15px;
	height: 35px;
}
.search-bar{
	font-size: 15px;
	width: 300px;
	height: 35px;
}
.buttonList {
	background-color: #A2C4FF;
	color: white;
	border-style: double;
	font-family: 굴림;
	font-weight: bold;
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
		
		function listChk(list) {
			listCode = list;
		}
	</script>
	<%
		String email = (String) session.getAttribute("email");
		String nickname = (String) session.getAttribute("nickname");
	%>
	<div class="center">
		<div id="button1" align="left">
			<input type="button" value="최신순" class="buttonList" style="width: 70pt; height: 25pt;"
				onclick="location.href='boardschedule.do'">
			<input type="button" value="조회순" class="buttonList" style="width: 70pt; height: 25pt;"
				onClick="location.href='view_count.do'">
			<input type="button" value="글쓰기" class="buttonList" style="width: 70pt; height: 25pt"
				onclick="location.href='boardselect.do?email=${email}&nickname=${nickname }'">
		</div>
		<c:forEach var="bs" items="${pagelist }">
			<a href="planview.do?bs_num=${bs.bs_num }">
				<div class="center-second">
					<div class="second-box">
						<img alt="image" class="card_image" src="${bs.image_url }">
					</div>
					<div class="local" style="color:#10620A">&nbsp;&nbsp;&nbsp;${bs.area_names } 
					<input type="hidden" value="${bs.sl_code }"></div>
					<div class="second-text">
						<h2>제목 : ${bs.title }</h2>
						${schedule_date }
					</div>
					<div class="tag"style="color:#050099">${bs.tag }</div>
					<div class="idlocal" align="right"></div>
					<div class="count" align="right">nick : ${bs.nickname }</div>
					<div class="datelocal" align="center">조회수 &nbsp;${bs.view_count }&nbsp;&nbsp;&nbsp; 좋아요 ♥&nbsp;${bs.vote_count }
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${bs.board_date }</div>
				</div>
			</a>
		</c:forEach>
	</div>
	<div align="center">
	<div class="page-num"></div>
	<c:if test="${startPage!=1 }">
		<c:if test="${click == 0 }">
			<a href='boardschedule.do?pageNum=${startPage-blockSize }'>&laquo;</a>
		</c:if>
		<c:if test="${click == 1 }">
			<a href='view_count.do?pageNum=${startPage-blockSize }'>&laquo;</a>
		</c:if>
		<c:if test="${click == 2 }">
			<a href='plansearch.do?pageNum=${startPage-blockSize }'>&laquo;</a>
		</c:if>
	</c:if>
	<c:if test="${startPage==1 }">
		<c:if test="${click == 0 }">
			<a href='boardschedule.do?pageNum=1'>&laquo;</a>
		</c:if>
		<c:if test="${click == 1 }">
			<a href='view_count.do?pageNum=1'>&laquo;</a>
		</c:if>
		<c:if test="${click == 2 }">
			<a href='plansearch.do?pageNum=1'>&laquo;</a>
		</c:if>
	</c:if>
	<c:if test="${currentPage!=1 }">
		<c:if test="${click == 0 }">
			<a href='boardschedule.do?pageNum=${currentPage-1}'>&#9665</a>
		</c:if>
		<c:if test="${click == 1 }">
			<a href='view_count.do?pageNum=${currentPage-1}'>&#9665</a>
		</c:if>
		<c:if test="${click == 2 }">
			<a href='plansearch.do?pageNum=${currentPage-1}'>&#9665</a>
		</c:if>
	</c:if>
	<c:if test="${currentPage==1 }">
		<c:if test="${click == 0 }">
			<a href='boardschedule.do?pageNum=1'>&#9665</a>
		</c:if>
		<c:if test="${click == 1 }">
			<a href='view_count.do?pageNum=1'>&#9665</a>
		</c:if>
		<c:if test="${click == 2 }">
			<a href='plansearch.do?pageNum=1'>&#9665</a>
		</c:if>
	</c:if>

	<c:forEach var="i" begin="${startPage }" end="${endPage }">
		<c:if test="${click == 0 }">
			<a href='boardschedule.do?pageNum=${i }'>${i }</a>
		</c:if>
		<c:if test="${click == 1 }">
			<a href='view_count.do?pageNum=${i }'>${i }</a>
		</c:if>
		<c:if test="${click == 2 }">
			<a href='plansearch.do?pageNum=${i }'>${i }</a>
		</c:if>
	</c:forEach>

	<c:if test="${currentPage==totalPage }">
		<c:if test="${click == 0 }">
			<a href='boardschedule.do?pageNum=${totalPage }'>&#9655</a>
		</c:if>
		<c:if test="${click == 1 }">
			<a href='view_count.do?pageNum=${totalPage }'>&#9655</a>
		</c:if>
		<c:if test="${click == 2 }">
			<a href='plansearch.do?pageNum=${totalPage }'>&#9655</a>
		</c:if>
	</c:if>
	<c:if test="${currentPage!=totalPage }">
		<c:if test="${click == 0 }">
			<a href='boardschedule.do?pageNum=${currentPage+1 }'>&#9655</a>
		</c:if>
		<c:if test="${click == 1 }">
			<a href='view_count.do?pageNum=${currentPage+1 }'>&#9655</a>
		</c:if>
		<c:if test="${click == 2 }">
			<a href='plansearch.do?pageNum=${currentPage+1 }'>&#9655</a>
		</c:if>
	</c:if>
	<c:if test="${endPage>=totalPage }">
		<c:if test="${click == 0 }">
			<a href='boardschedule.do?pageNum=${totalPage}'>&raquo;</a>
		</c:if>
		<c:if test="${click == 1 }">
			<a href='view_count.do?pageNum=${totalPage}'>&raquo;</a>
		</c:if>
		<c:if test="${click == 2 }">
			<a href='plansearch.do?pageNum=${totalPage}'>&raquo;</a>
		</c:if>
	</c:if>
	<c:if test="${endPage<totalPage }">
		<c:if test="${click == 0 }">
			<a href='boardschedule.do?pageNum=${endPage+blockSize }'>&raquo;</a>
		</c:if>
		<c:if test="${click == 1 }">
			<a href='view_count.do?pageNum=${endPage+blockSize }'>&raquo;</a>
		</c:if>
		<c:if test="${click == 2 }">
			<a href='plansearch.do?pageNum=${endPage+blockSize }'>&raquo;</a>
		</c:if>
	</c:if>
	</div>
	<form action="plansearch.do">
	<div class="search" align="center">
		<select class="menu" name="search-option">
			<!-- <option value="1">전체</option> -->
			<option value="1">제목</option>
			<option value="2">지역명</option>
			<option value="3">닉네임</option>
			<option value="4">내용</option>
		</select> <input type="text" class="search-bar" placeholder="일정 보기 검색" name="search-bar">
		<input type="submit" value="검색" class="buttonList" style="width: 50pt; height: 27pt;">
	</div>
	</form>
	<%@ include file="footer.jsp"%>
</body>
</html>
