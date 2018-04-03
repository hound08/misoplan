<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
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
	background-image: url("images/spring_cherry_tree.jpg");
	position: absolute;
	left: 0px;
	width: 100%;
	height: 450px;
}

.imageText {
	padding-top: 100px;
	width: 1080px;
	text-align: center;
}

.imageTitle {
	font-size: 100px;
}

.imageDesc {
	font-size: 50px;
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
.tourListWrap {
	background-image: url("images/best_tour.jpg");
	position: absolute;
	left: 0px;
	width: 100%;
	height: 225px;
}

.tourListWrapText {
	width: 1080px;
	padding-top: 50px;
	color: white;
	text-align: center;
}

.tourListHeadTitle {
	font-size: 70px;
}

.tourListHeadContent {
	font-size: 35px;
}

.tourList {
	width: 100%;
	height: 450px;
	left: 0px;
}

.tourListContent {
	border: 1px solid black;
	padding-top: 300px;
}

/* ---------------------------- footer 영역 ---------------------------- */
.footer_wrap {
	position: absolute;
	left: 0px;
	width: 100%;
	margin-top: 50px;
	background-color: #0099ff;
}
</style>
</head>
<body>
	<div class="section">
		<div class="image">
			<div class="imageText">
				<p class="imageTitle">미소플랜</p>
				<p class="imageDesc">미소플랜에 오신 것을 환영합니다<br>자신만의 일정을 자유롭게 꾸며보세요</p>
			</div>
		</div>
		<div class="contents">
			<div class="mainmenu">
				<div class="mainmenuimage">
					<img class="mainimage" alt="searchimage" src="images/search.jpg">
					<p class="menutitle">관광지 검색</p>
					<p class="menudesc">국내에서 이용가능한 관광지를 실시간으로 검색하여 각종 정보들을 알아볼 수
						있고, 나만의 리스트에 추가할 수 있습니다.</p>
				</div>
				<div class="mainmenuimage">
					<img class="mainimage" alt="planimage" src="images/plan.jpg">
					<p class="menutitle">일정 만들기</p>
					<p class="menudesc">관광 계획, 이동순서, 세부일정 등의 놓치지 말아야 할 사항들을 편리하게
						작성하고 관리할 수 있습니다.</p>
				</div>
				<div class="mainmenuimage">
					<img class="mainimage" alt="accompanyimage"
						src="images/accompany.jpg">
					<p class="menutitle">동행 찾기</p>
					<p class="menudesc">원하는 관광지를 함께 여행할 동행을 검색할 수 있도록 도와드립니다.
						미소투어에서 동행을 찾아보세요.</p>
				</div>
				<div class="mainmenuimage">
					<img class="mainimage" alt="accompanyimage"
						src="images/otherplan.jpg">
					<p class="menutitle">다른 일정 보기</p>
					<p class="menudesc">다른 회원의 일정을 구경하거나 자신이 만든 일정을 공유할 수 있습니다.</p>
				</div>
			</div>
			<div class="tourList">
				<div class="tourListWrap">
					<div class="tourListWrapText">
						<p class="tourListHeadTitle">관광지 순위</p>
						<p class="tourListHeadContent">가장 인기있는 관광지를 알아보세요</p>
					</div>
				</div>
				<div class="tourListContent">
					<p>${tour_num }</p>
				</div>
			</div>
		</div>
		<div class="footer_wrap">
			<%@ include file="footer.jsp"%>
		</div>
	</div>
</body>
</html>