<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<title>글 관리</title>
<style type="text/css">
	body {
		font-family: 'NanumSquareRound', sans-serif;
	}
	#center {
		margin: 0px auto;
		width: 1200px;
		height: 100%;
	}
	#main {
		background-color: #f0f0f0;
		width: 930px;
		text-align: center;
		float: left;
		margin-top: 20px;
		border-radius: 25px;
		padding-bottom: 20px;
	}
	h1 {
		margin: 50px;
	}
	.tableTab {
		margin: auto;
		width: 90%;
		text-align: center;
	}
	.tdPlan {
		width: 50%;
		border-bottom: 4px solid #1A7AD9;
		font-weight: bold;
	}
	.tdParty {
		color: gray;
		width: 50%;
	}
	.tdParty a {
		color: gray;
	}
	.tdParty a:HOVER {
		color: black;
	}
</style>
</head>
<body>
	<div id="center">
		<%@ include file="sidemenu.jsp"%>
		<div id="main">
			<h1>글 관리</h1>
			<div class="divTab">
				<table class="tableTab"><tr><td class="tdPlan"><a href="adminMainForm.do">일정 게시판(0)</a></td><td class="tdParty"><a href="adminBanForm.do">동행 찾기 게시판</a></td></tr></table>
			</div>
			<table class="tableList">
				<tr><th>번호</th><th>제목</th><th>내용</th><th>작성자</th><th>이메일</th><th>작성일</th></tr>
			</table>
		</div>
	</div>
</body>
</html>