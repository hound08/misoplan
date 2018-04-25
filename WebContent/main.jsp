<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css">
<meta charset="UTF-8">
<title>미소플랜</title>

<style type="text/css">
/* ---------------------------- 화면 전체 적용 ---------------------------- */
* {
	font-family: 'NanumSquareRound', sans-serif;
}

div {
	margin: 0px auto;
}

.section {
	width: 1080px;
}

/* ---------------------------- 메인 메뉴 기능 소개 ---------------------------- */
.image {
/* 	background-image: url("images/main2.png") no-repeat; */
 	
	/* left: 0px;
	width: 100%;
	height: 450px; */
	
 	border-radius: 5px;
	margin-left: auto;
	margin-right: auto;
	overflow: hidden;
	position: absolute;
	
	left : 0px;
	width : 100%;
	 
}

.image img{
	width : 100%;
	height : 400px;
}

.imageText {
	padding-top: 150px;
	width: 1080px;
	text-align: center;
}

.imageDesc {
	font-size: 60px;
}

.contents {
	padding-top: 500px;
	width: 1080px;
}

.centerimage {
	width: 100%;
	height: auto;
}

.mainmenuimage {
	display: inline-block;
	width: 240px;
	height: 330px;
	margin: 30px 12px 30px 12px;
	vertical-align: middle;
}

.mainmenuimage:HOVER {
	cursor: pointer;
}

.mainimage {
	width: 240px;
	height: 140px;
}

.menutitle {
	padding-top: 20px;
	padding-bottom: 20px;
	text-align: center;
	font-size: 20px;
	font-weight: bold;
}

.menudesc {
	text-align: center;
	font-size: 14px;
}

/* ---------------------------- 관광지 순위 ---------------------------- */
.rankList {
	width: 100%;
	left: 0px;
}

.rankTitleWrap_true {
	background-color: #F6F6F6;
	position: absolute;
	left: 0px;
	width: 100%;
	height: 700px;
	z-index: 1;
}

.rankTitleWrap_false {
	background-color: #F6F6F6;
	position: absolute;
	left: 0px;
	width: 100%;
	height: 400px;
	z-index: 1;
}

.rankText {
	width: 1080px;
	padding-top: 70px;
	text-align: center;
}

.rankTextTitle {
	font-size: 25px;
	font-weight: bold;
	margin-bottom: 10px;
}

.rankTextContent {
	font-size: 17px;
	color: gray;
}

.rankListWrap_true {
	position: relative;
	padding-top: 150px;
	text-align: center;
	font-size: 20px;
	z-index: 2;
	height: 550px;
}

.rankListWrap_false {
	position: relative;
	padding-top: 230px;
	padding-bottom: 150px;
	text-align: center;
	font-size: 20px;
	z-index: 2;
	color: gray;
}

.rankListContent {
	width: 320px;
	display: inline-block;
	margin: 15px 15px 15px 15px;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

.rankName {
	padding-top: 10px;
}

.rankImage {
	width: 320px;
	height: 180px;
}

/* ---------------------------- 찜 리스트 순위 ---------------------------- */
.wishList {
	width: 100%;
	left: 0px;
}

.wishText {
	width: 1080px;
	padding-top: 70px;
	text-align: center;
}

.wishTextTitle {
	font-size: 25px;
	font-weight: bold;
	margin-bottom: 10px;
}

.wishTextContent {
	font-size: 17px;
	color: gray;
}

.wishListWrap_true {
	padding-top: 30px;
	text-align: center;
	font-size: 20px;
	height: 800px;
}

.wishListWrap_false {
	padding-top: 100px;
	text-align: center;
	font-size: 20px;
	height: 200px;
	color: gray;
}

.wishListContent {
	width: 320px;
	display: inline-block;
	margin: 15px 15px 15px 15px;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

.wishName {
	padding-top: 10px;
}

.wishImage {
	width: 320px;
	height: 180px;
}

/* ---------------------------- footer 영역 ---------------------------- */
.footer_wrap {
	float: right;
	position: absolute;
	left: 0px;
	width: 100%;
}
</style>
</head>
<body>
	<div class="section">
		<div class="image">
			<img id="center-image" alt="centerimage" src="images/main1.png">
		</div>
		<div class="contents">
			<div class="mainmenu">
				<div class="mainmenuimage" onclick="location.href='search.do'">
					<img class="mainimage" alt="searchimage" src="images/search.jpg">
					<p class="menutitle">일정 검색</p>
					<p class="menudesc">국내에서 이용가능한 관광지를 실시간으로 검색하여 각종 정보들을 알아볼 수
						있고, 나만의 리스트에 추가할 수 있습니다.</p>
				</div>
				<div class="mainmenuimage" onclick="location.href='makePlan.do'">
					<img class="mainimage" alt="planimage" src="images/plan.jpg">
					<p class="menutitle">일정 만들기</p>
					<p class="menudesc">관광 계획, 이동순서, 세부일정 등의 놓치지 말아야 할 사항들을 편리하게
						작성하고 관리할 수 있습니다.</p>
				</div>
				<div class="mainmenuimage" onclick="location.href='boardschedule.do'">
					<img class="mainimage" alt="accompanyimage"
						src="images/otherplan.jpg">
					<p class="menutitle">일정 게시판</p>
					<p class="menudesc">다른 회원의 일정을 구경하거나 자신이 만든 일정을 공유할 수 있습니다.</p>
				</div>
				<div class="mainmenuimage" onclick="location.href='listAction.do'">
					<img class="mainimage" alt="accompanyimage"
						src="images/accompany.jpg">
					<p class="menutitle">동행 구하기</p>
					<p class="menudesc">원하는 관광지를 함께 여행할 동행을 검색할 수 있도록 도와드립니다.
						미소투어에서 동행을 찾아보세요.</p>
				</div>
			</div>
			<div class="rankList">
				<c:if test="${listPlan.size() == 6 }">
					<div class="rankTitleWrap_true">
						<div class="rankText">
							<p class="rankTextTitle">인기 여행일정</p>
							<p class="rankTextContent">인기있는 관광지를 알아보세요</p>
						</div>
					</div>
					<div class="rankListWrap_true">
						<c:forEach var="listPlan" items="${listPlan }">
							<div class="rankListContent">
								<img class="rankImage" alt="${listPlan.tour_name }" src="${listPlan.image_url }">
								<p class="rankName"><strong>${listPlan.tour_name }</strong></p>
							</div>
						</c:forEach>
					</div>
				</c:if>
				<c:if test="${listPlan.size() < 6 }">
					<div class="rankTitleWrap_false">
						<div class="rankText">
							<p class="rankTextTitle">인기 여행일정</p>
							<p class="rankTextContent">인기있는 관광지를 알아보세요</p>
						</div>
					</div>
					<div class="rankListWrap_false">
						<p>현재 저장된 일정 개수가 충분하지 않습니다.<br>일정 만들기를 통해 자신만의 일정을 꾸며보세요.</p>
					</div>
				</c:if>
			</div>
			<div class="wishList">
				<div class="wishText">
					<p class="wishTextTitle">찜 리스트 Top 9</p>
					<p class="wishTextContent">가장 가 보고 싶은 관광지</p>
				</div>
				<c:if test="${listWish.size() == 9 }">
					<div class="wishListWrap_true">
						<c:forEach var="listWish" items="${listWish }">
							<div class="wishListContent">
								<img class="wishImage" alt="${listWish.tour_name }" src="${listWish.img_src }">
								<p class="wishName"><strong>${listWish.tour_name }</strong></p>
							</div>
						</c:forEach>
					</div>
				</c:if>
				<c:if test="${listWish.size() < 9 }">
					<div class="wishListWrap_false">
						<p>현재 찜 리스트 개수가 충분하지 않습니다.<br>검색을 통해 마음에 드는 관광지를 찜 해 보세요.</p>
					</div>
				</c:if>
			</div>
		</div>
		<div class="footer_wrap">
			<%@ include file="footer.jsp"%>
		</div>
	</div>
	<script type="text/javascript">
 			 var image = document.getElementById("center-image");
			var current = 0;
			var images = [ "images/main2.jpg",
			               "images/mainmodel.png",
			               "images/main3.jpg",
						   "images/main4.jpg", 
						   "images/main5.jpg",
						   "images/main1.png" ];
			function replacePhoto() {
				console.log(image);
				++current;
				if (current >= images.length)
					current = 0;
				image.src = images[current];
			}
			setInterval(replacePhoto, 2000); 
</script>
</body>
</html>