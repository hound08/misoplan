<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
div {
	margin: 0px auto;
}
* {
	font-family: 'NanumSquareRound', sans-serif;
}

/*전체 div  */
.section {
	width: 1080px;
	height: 1120px;
	border: 1px solid red;
}
/* 검색 Area */
.searchSection{
	width: 1080px;
	height:300px;
	margin-top: 50px;
	border: 1px solid green;
}
.searchArea {
	width : 600px;
	height : 40px;
	border : 1px solid #1b5ac2;
	background: #ffffff;
	margin-bottom: 20px;
}

.searchButton{
	width: 50px;
	height : 100%;
	border : 0px;
	background: #1b5ac2;
	outline : none;
	float : right;
	color : #ffffff
}

.searchBar {
	font-size : 16px;
	width : 325px;
	padding : 10px;
	border : 0px;
	outline : none;
	float : left;
}

.areaButton{
	width: 950px;
	height : 200px;
	border : 1px solid blue;
	margin : 0px auto;
}

.contents {
	width : 1080px;
	height: 767px;
	border : 1px solid black;
}

.sidoButton{
	width: 100px;
	height : 50px;
	outline : none;
	margin : 10px auto;
}

.contentsTop{
	width: 1000px;
	height : 100px;
	border : 1px solid pink;
	margin : 10px auto;
}
.listArea{
	width: 1000px;
	height : 600px;
	border : 1px solid blue;
	margin : 10px auto;
}
.list {
	margin-left: 31px;
	margin-top : 15px;
	float: left;
}
.list .listImage{
	width : 200px;
	height : 200px;
}
.list .listTitle{
	height : 30px;
}

.footer_wrap {
	padding-top: 20px; width : 100%;
	background-color: #0099ff;
	margin: 20px auto 0px auto;
	width: 100%;
}
</style>
</head>
<body>
	<div class="section">
		<!--검색창 & 검색 버튼  -->
		<div class = "searchSection">
			<div class="searchArea">
				<input type = "text" placeholder = "검색어 입력" class = "searchBar">
				<button class = "searchButton"> 검색 </button>
			</div>
			<div class = "areaButton">
				<!-- 서울, 인천, 대전, 대구, 광주, 부산, 울산, 세종특별자치시, 경기도,
					강원도, 충청북도, 충청남도, 경상북도, 경상남도, 전라북도
				 --> 
				 <input type = "button" value = "서울" class = "sidoButton" id = "seoul">
				 <input type = "button" value = "인천" class = "sidoButton">
				 <input type = "button" value = "대전" class = "sidoButton">
				 <input type = "button" value = "대구" class = "sidoButton">
				 <input type = "button" value = "광주" class = "sidoButton">
				 <input type = "button" value = "부산" class = "sidoButton">
				 <input type = "button" value = "울산" class = "sidoButton">
				 <input type = "button" value = "세종특별자치시" class = "sidoButton">
				 <input type = "button" value = "경기도" class = "sidoButton">
				 <input type = "button" value = "강원도" class = "sidoButton">
				 <input type = "button" value = "충청북도" class = "sidoButton">
				 <input type = "button" value = "충청남도" class = "sidoButton">
				 <input type = "button" value = "경상북도" class = "sidoButton">
				 <input type = "button" value = "경상남도" class = "sidoButton">
				 <input type = "button" value = "전라북도" class = "sidoButton">
			</div>
		</div>

		<div class="contents">
			<div class = "contentsTop">
			
			</div>
			<div class = "listArea">
				<table class = "list" border = 1px>
					<tr>
						<td class = "listImage">이미지 공간</td>
					</tr>					
					<tr>
						<td class = "listTitle">제목 공간</td>
					</tr>					
				</table>
				<table class = "list" border = 1px>
					<tr>
						<td class = "listImage">이미지 공간</td>
					</tr>					
					<tr>
						<td class = "listTitle">제목 공간</td>
					</tr>					
				</table>
				<table class = "list" border = 1px>
					<tr>
						<td class = "listImage">이미지 공간</td>
					</tr>					
					<tr>
						<td class = "listTitle">제목 공간</td>
					</tr>					
				</table>
				<table class = "list" border = 1px>
					<tr>
						<td class = "listImage">이미지 공간</td>
					</tr>					
					<tr>
						<td class = "listTitle">제목 공간</td>
					</tr>					
				</table>
				<table class = "list" border = 1px>
					<tr>
						<td class = "listImage">이미지 공간</td>
					</tr>					
					<tr>
						<td class = "listTitle">제목 공간</td>
					</tr>					
				</table>
				<table class = "list" border = 1px>
					<tr>
						<td class = "listImage">이미지 공간</td>
					</tr>					
					<tr>
						<td class = "listTitle">제목 공간</td>
					</tr>					
				</table>
				<table class = "list" border = 1px>
					<tr>
						<td class = "listImage">이미지 공간</td>
					</tr>					
					<tr>
						<td class = "listTitle">제목 공간</td>
					</tr>					
				</table>
				<table class = "list" border = 1px>
					<tr>
						<td class = "listImage">이미지 공간</td>
					</tr>					
					<tr>
						<td class = "listTitle">제목 공간</td>
					</tr>					
				</table>
			</div>
			
		</div>
	</div>
	<div class="footer_wrap">
		<%@ include file="footer.jsp"%>
	</div>
</body>
</html>