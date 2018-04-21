<%@page import="java.util.ArrayList"%>
<%@page import="dao.AccompanyBoardDto"%>
<%@page import="dao.AccompanyDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">
div {
	margin: 0px auto;
}
* {
	padding: 0px;
	margin: 0px;
	font-family: 'NanumSquareRound', sans-serif;
}

.card {
	height: 400px;
	width: 350px;
	border-radius: 15px;
	display: inline-block;
	margin-top: 30px;
	margin-left: 30px;
	margin-bottom: 30px;
	position: relative;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
	overflow: hidden;
}

.card-header {
	-webkit-transition: 0.5s; /*사파리 & 크롬*/
    -moz-transition: 0.5s;  /*파이어폭스*/
    -ms-transition: 0.5s;	/*인터넷 익스플로러*/
    -o-transition: 0.5s;  /*오페라*/
    transition: 0.5s;
	width: 100%;
	height: 270px;
	border-radius: 15px 15px 0 0;
}

.card:hover .card-header  {
	opacity: 0.7;
	height: 100px;
}

.card-header-is_not_closed{
	background-color: #DB0000 ;
    color: #FFF ;
    font-weight: bold ;
    text-align: center ;
    float: right;
    margin: 15px 15px 0 0;
    border-radius: 50%;
    font-weight: bold;
    padding: 10px 10px;
    line-height: 20px;
    width: 55px;
    height: 55px;
    display: table;
}

.card-header-is_closed{
    background-color: #8C8C8C ;
    color: #FFF ;
    font-weight: bold ;
    text-align: center ;
    float: right;
    margin: 15px 15px 0 0;
    border-radius: 50%;
    font-weight: bold;
    padding: 10px 10px;
    line-height: 20px;
    width: 55px;
    height: 55px;
    display: table;
}

h1 {
	color: black;
    font-size: 22px;
    font-weight: bold;
    border: solid;
}
p {
	display: inline-block;
}
.card-body {
	width: 100%;
	height: 100%;
}

.card-body-header{
	line-height: 25px;
	margin: 10px 20px 0px 20px;
}

.card-body-description  {
    opacity: 0;
    color: #757B82;
    line-height: 25px;
    -webkit-transition: .2s ease-in-out; /*사파리&크롬*/
    -moz-transition: .2s ease-in-out; /*파이어폭스*/
    -ms-transition: .2s ease-in-out; /*익스플로러*/
    -o-transition: .2s ease-in-out; /*오페라*/
    transition : .2s ease-in-out;
	margin: 5px 20px;
	overflow: hidden;
}

.card:hover .card-body-description {
    opacity: 1;
    height: 180px;
    -webkit-transition: .2s ease-in-out;
    -moz-transition: .2s ease-in-out;
    -ms-transition: .2s ease-in-out;
    -o-transition: .2s ease-in-out;
    transition : .2s ease-in-out;
    border: solid;
    overflow: hidden;
}
.card-body-title {
	margin-bottom: 5px;
	height: 25px;
	width: 100%;
	overflow: hidden;
}
.card-body-hashtag {
	height: 20px;
	width: 100%;
	color: #1266FF;
	font-weight:bold;
	font-style: italic;
	overflow: hidden;
}

.card-body-footer {
  	position: absolute; 
  	margin-top: 15px;
  	margin-bottom: 6px;
    bottom: 0; 
    width: 314px;
    font-size: 14px;
    color: #9FA5A8;
    padding: 0 15px;
}

.icon {
    display: inline-block;
    vertical-align: middle;
    margin-right: 2px;
}

.icon-view_count {
    width: 17px;
    height: 17px;
	background: url("images/eye.png") no-repeat;
}

.icon-comments_count {
	margin-left: 5px;
	width: 17px;
    height: 17px;
	background: url("images/comment.png") no-repeat;
}

.icon-vote_count{
	margin-left: 5px;
	width: 17px;
    height: 17px;
	background: url("images/thumbup.png") no-repeat;
}

.section {
	width: 1200px;
}

.main-image {
	border-radius: 5px;
	margin-left: auto;
	margin-right: auto;
	width: 100%;
	height: 400px;
	overflow: hidden;
	position: relative;
}
.centerimage {
	min-height: 100%;
	min-width: 100%;
	width: 100%;
	height: auto;
}

.section-card {
	border: 1px solid;
	border-color: #1294AB;
	border-radius: 30px;
	width: 100%;
	margin-top: 35px;
	margin-left: auto;
	margin-right: auto;
	display: inline-block;
}

.pagenumber {
	width: 1080px;
	height: 100px;
}

.pagenumber {
	margin-top: 30px;
	text-align: center;
}

.pagination {
	display: flex;
	justify-content: center;
	margin: 50px 0 35px 0;
	clear: both;
}

.pagination a {
	color: black;
	padding: 8px 16px;
	font-size: 20px;
	text-decoration: none;
}

.pagination a.active {
	background-color: #4CAF50;
	color: white;
}

.pagination a:hover:not {
	background-color: #ddd;
	border-radius: 5px;
}

.search {
	display: flex;
	justify-content: center;
	margin: 50px 0 35px 0;
	clear: both;
}

.search-bar {
	font-size: 15px;
	width: 400px;
	height: 40px;
}

.search-submit {
	font-size: 15px;
	width: 70px;
	height: 42px;
	background-color: #AA1212;
	color: white;
}

.search-select {
	height: 40px;
	font-size: 15px;
	margin-right: 5px;
}

.align {
	margin-top: 30px;
	width: 100%;
	margin-left: auto;
	margin-right: auto;
}

.align-button {
	width: 100px;
	height: 35px;
	background-color: white;
	border-color: #1294AB;
	border-radius: 8px;
	font-size: 14px;
	font-weight: bold;
	transition-duration: 0.4s;
}

.align-button:HOVER{
	background-color: #1294AB;
	color: white;
}

.align-clicked{
	width: 100px;
	height: 35px;
	background-color: #1294AB;
	border-color: #1294AB;
	border-radius: 8px;
	font-size: 14px;
	font-weight: bold;
	transition-duration: 0.4s;
	color: white;
	opacity: 0.7;
}

.center-label {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	font-size: 30px
}

.write-button {
	width: 85px;
	height: 35px;
	display: flex;
	float: right;
	font-size: 18px;
	justify-content: center;
	margin-top: 20px;
	background-color: white;
	border-color: #1294AB;
	border-radius: 8px;
	transition-duration: 0.4s;
}

.write-button:HOVER{
	background-color: #1294AB;
	color: white;
}

.card-header-text {
	display: table-row;
}

.card-header-number{
	display: table-row;
}
</style>
<body>
	<div class="section">
		<div class="main-image">
			<img id="center-image" alt="centerimage" src="images/korea1.jpg">
			<div class="center-label">
				<!-- 텍스트 ! -->
			</div>
		</div>
		<div class="align">
			<c:if test="${a == 0 }">
				<a href="listActionVIEW.do"><button class="align-button">조회순</button></a>
				<a href="listActionVOTE.do"><button class="align-button">인기순</button></a>
				<a href="listAction.do"><button class="align-clicked">최신순</button></a>
			</c:if>
			<c:if test="${a == 1 }">
				<a href="listActionVIEW.do"><button class="align-clicked">조회순</button></a>
				<a href="listActionVOTE.do"><button class="align-button">인기순</button></a>
				<a href="listAction.do"><button class="align-button">최신순</button></a>
			</c:if>
			<c:if test="${a == 2 }">
				<a href="listActionVIEW.do"><button class="align-button">조회순</button></a>
				<a href="listActionVOTE.do"><button class="align-clicked">인기순</button></a>
				<a href="listAction.do"><button class="align-button">최신순</button></a>
			</c:if>
		</div>
		<div class="section-card">
			
		<c:forEach var="board" items="${list }">
			<a href="viewActionAB.do?post_num=${board.post_num }">
			<div class="card">
				<div class="card-header" style="background: url('${board.image_url}'); background-size: 100% 280px; background-repeat: no-repeat;">
					
						<c:if test="${board.is_closed == 0 }">
							<div class="card-header-is_not_closed">
								<div class="card-header-text">모집중</div>
								<div class="card-header-number">${board.current_num } / ${board.minimum_num }</div>
							</div>
						</c:if>
						<c:if test="${board.is_closed == 1 }">
							<div class="card-header-is_closed">
								<div class="card-header-text">마감</div>
								<div class="card-header-number">${board.current_num } / ${board.minimum_num }</div>
							</div>
						</c:if>
					
				</div>
				<!--  카드 바디 -->
				<div class="card-body">
					<!--  카드 바디 헤더 -->
					<div class="card-body-header">
						<div class="card-body-title"><h3>${board.title }</h3></div>
						<c:set var="tags" value="${fn:split(board.tag, ' ')}"/>
						<div class="card-body-hashtag">
								<c:forEach var="t" items="${tags }">
									<c:out value="${t }"></c:out>
								</c:forEach>
						</div>
						<p class="card-body-nickname"><label style="color:#BDBDBD; font-size: 15px;">글쓴이:</label><label style="font-weight: bold; color:#757575;">${board.nickname }</label></p>
					</div>
					<!--  카드 바디 본문 -->
					<textarea class="card-body-description" disabled="disabled" style="background-color: white; width:87%; border:none; overflow:hidden; resize: none">${board.content }</textarea>
					<!--  카드 바디 푸터 -->
					<div class="card-body-footer">
						<hr style="margin-bottom: 8px; opacity: 0.5; border-color: #EF5A31">
						<i class="icon icon-view_count"></i>조회 ${board.view_count }회 
						<i class="icon icon-comments_count"></i>댓글 ${board.comment_count }개
						<i class="icon icon-vote_count"></i>좋아요 ${board.vote_count }개
					</div>
				</div>
			</div>
			</a>
			</c:forEach>
			</div>
				<!--section card -->
				<div>
					<c:if test="${email != null }">
						<a href="writeFormAB.jsp"><button class="write-button">글쓰기</button></a>
					</c:if>
				</div>
				<div class="pagination-wrapper">
				<div class="pagination">
					
					<c:if test="${startPage!=1 }">
						<c:if test="${a == 0 }">					
							<a href='listAction.do?pageNum=${startPage-blockSize }'>&laquo;</a>
						</c:if>
						<c:if test="${a == 1 }">					
							<a href='listActionVIEW.do?pageNum=${startPage-blockSize }'>&laquo;</a>
						</c:if>
						<c:if test="${a == 2 }">					
							<a href='listActionVOTE.do?pageNum=${startPage-blockSize }'>&laquo;</a>
						</c:if>
						<c:if test="${a == 3 }">					
							<a href='searchActionAB.do?pageNum=${startPage-blockSize }&keyword=${keyword}&selected=${selected}'>&laquo;</a>
						</c:if>
					</c:if>
					<c:if test="${startPage==1 }">
						<c:if test="${a == 0 }">
							<a href='listAction.do?pageNum=1'>&laquo;</a>
						</c:if>
						<c:if test="${a == 1 }">
							<a href='listActionVIEW.do?pageNum=1'>&laquo;</a>
						</c:if>
						<c:if test="${a == 2 }">
							<a href='listActionVOTE.do?pageNum=1'>&laquo;</a>
						</c:if>
						<c:if test="${a == 3 }">
							<a href='searchActionAB.do?pageNum=1&keyword=${keyword}&selected=${selected}'>&laquo;</a>
						</c:if>
						
					</c:if>
					<c:if test="${currentPage!=1 }">
						<c:if test="${a == 0 }">
							<a href='listAction.do?pageNum=${currentPage-1}'>&#9665</a>
						</c:if>
						<c:if test="${a == 1 }">
							<a href='listActionVIEW.do?pageNum=${currentPage-1}'>&#9665</a>
						</c:if>
						<c:if test="${a == 2 }">
							<a href='listActionVOTE.do?pageNum=${currentPage-1}'>&#9665</a>
						</c:if>
						<c:if test="${a == 3 }">
							<a href='searchActionAB.do?pageNum=${currentPage-1}&keyword=${keyword}&selected=${selected}'>&#9665</a>
						</c:if>
					</c:if>
					<c:if test="${currentPage==1 }">
						<c:if test="${a == 0 }">
							<a href='listAction.do?pageNum=1'>&#9665</a>
						</c:if>
						<c:if test="${a == 1 }">
							<a href='listActionVIEW.do?pageNum=1'>&#9665</a>
						</c:if>
						<c:if test="${a == 2 }">
							<a href='listActionVOTE.do?pageNum=1'>&#9665</a>
						</c:if>
						<c:if test="${a == 3 }">
							<a href='searchActionAB.do?pageNum=1&keyword=${keyword}&selected=${selected}'>&#9665</a>
						</c:if>
					</c:if>

					<c:forEach var="i" begin="${startPage }" end="${endPage }">
						<c:if test="${a == 0 }">
							<a href='listAction.do?pageNum=${i }'>${i }</a>
						</c:if>
						<c:if test="${a == 1 }">
							<a href='listActionVIEW.do?pageNum=${i }'>${i }</a>
						</c:if>
						<c:if test="${a == 2 }">
							<a href='listActionVOTE.do?pageNum=${i }'>${i }</a>
						</c:if>
						<c:if test="${a == 3 }">
							<a href='searchActionAB.do?pageNum=${i }&keyword=${keyword}&selected=${selected}'>${i }</a>
						</c:if>
					</c:forEach>

					<c:if test="${currentPage==totalPage }">
						<c:if test="${a == 0 }">
							<a href='listAction.do?pageNum=${totalPage }'><label style="color: #1294AB">&#9655</a>
						</c:if>
						<c:if test="${a == 1 }">
							<a href='listActionVIEW.do?pageNum=${totalPage }'>&#9655</a>
						</c:if>
						<c:if test="${a == 2 }">
							<a href='listActionVOTE.do?pageNum=${totalPage }'>&#9655</a>
						</c:if>
						<c:if test="${a == 3 }">
							<a href='searchActionAB.do?pageNum=${totalPage }&keyword=${keyword}&selected=${selected}'>&#9655</a>
						</c:if>
					</c:if>
					<c:if test="${currentPage!=totalPage }">
						<c:if test="${a == 0 }">
							<a href='listAction.do?pageNum=${currentPage+1 }'>&#9655</a>
						</c:if>
						<c:if test="${a == 1 }">
							<a href='listActionVIEW.do?pageNum=${currentPage+1 }'>&#9655</a>
						</c:if>
						<c:if test="${a == 2 }">
							<a href='listActionVOTE.do?pageNum=${currentPage+1 }'>&#9655</a>
						</c:if>
						<c:if test="${a == 3 }">
							<a href='searchActionAB.do?pageNum=${currentPage+1 }&keyword=${keyword}&selected=${selected}'>&#9655</a>
						</c:if>
					</c:if>
					<c:if test="${endPage>=totalPage }">
						<c:if test="${a == 0 }">
							<a href='listAction.do?pageNum=${totalPage}'>&raquo;</a>
						</c:if>
						<c:if test="${a == 1 }">
							<a href='listActionVIEW.do?pageNum=${totalPage}'>&raquo;</a>
						</c:if>
						<c:if test="${a == 2 }">
							<a href='listActionVOTE.do?pageNum=${totalPage}'>&raquo;</a>
						</c:if>
						<c:if test="${a == 3 }">
							<a href='searchActionAB.do?pageNum=${totalPage}&keyword=${keyword}&selected=${selected}'>&raquo;</a>
						</c:if>
					</c:if>
					<c:if test="${endPage<totalPage }">
						<c:if test="${a == 0 }">
							<a href='listAction.do?pageNum=${endPage+blockSize }'>&raquo;</a>
						</c:if>
						<c:if test="${a == 1 }">
							<a href='listActionVIEW.do?pageNum=${endPage+blockSize }'>&raquo;</a>
						</c:if>
						<c:if test="${a == 2 }">
							<a href='listActionVOTE.do?pageNum=${endPage+blockSize }'>&raquo;</a>
						</c:if>
						<c:if test="${a == 3 }">
							<a href='searchActionAB.do?pageNum=${endPage+blockSize }&keyword=${keyword}&selected=${selected}'>&raquo;</a>
						</c:if>
					</c:if>
				</div>
				</div>
				<div class="search">
					<form action="searchActionAB.do">
						<select class="search-select" name="search-selected">
							<option value="1">제목</option>
							<option value="4">내용</option>
							<option value="3">해시태그</option>
							<option value="2">닉네임</option>
						</select> 
						<input type="text" class="search-bar" placeholder="지금 바로 동행을 검색해보세요!" name="search-keyword">
						<input type="submit" class="search-submit" value="검색">
						
						
					</form>
				</div>
		</div>
		<div class="footer_wrap">
			<%@ include file="footer.jsp"%>
		</div>

		<script type="text/javascript">
						var image = document.getElementById("center-image");
			var current = 0;
			var images = [ "images/korea2.jpg", 
			               "images/korea3.jpg",
						   "images/korea4.jpg", 
						   "images/korea5.jpg",
						   "images/korea1.jpg" ]
			function replacePhoto() {
				++current;
				if (current >= images.length)
					current = 0;
				image.src = images[current];
			}
			setInterval(replacePhoto, 3000);

			var submit = document.getElementByClassName("search-submit");
			function replaceCard() {
				submit.style.color = "Orange";
			}
		</script>
</body>
</html>