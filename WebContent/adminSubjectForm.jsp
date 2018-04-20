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
	table.tableList {
	  margin: auto;
	  border: 1px solid #1C6EA4;
	  background-color: #FFFFFF;
	  width: 90%;
	  text-align: left;
	  border-collapse: collapse;
	}
	table.tableList td, table.tableList th {
	  border: 1px solid #AAAAAA;
	  padding: 3px 2px;
	}
	table.tableList tbody td {
	  font-size: 13px;
	}
	.tdTitle {
	  width: 150px;
	  max-width: 150px;
	  text-overflow:ellipsis;
	  overflow:hidden;
	  white-space:nowrap;
	}
	.tdContent {
	  width: 270px;
	  max-width: 270px;
	  text-overflow:ellipsis;
	  overflow:hidden;
	  white-space:nowrap;
	}
	table.tableList tr:nth-child(odd) {
	  background: #D0E4F5;
	}
	table.tableList td {
	  text-align: center;
	}
	table.tableList th {
	  background: #1A7AD9;
	  border-bottom: 2px solid #444444;
	  font-size: 15px;
	  font-weight: bold;
	  color: #FFFFFF;
	  border-left: 2px solid #D0E4F5;
	  text-align: center;
	}
	table.tableList thead th:first-child {
	  border-left: none;
	}
	.divButton {
		margin: auto;
		width: 90%;
		text-align: right;
	}
	.adminButton {
		margin-top: 5px;
		width: 100px;
		height: 30px;
		color: white;
		background-color: #49B2E9;
		border-color: transparent;
	}
	.divPage {
		margin-top: 15px;
		text-align: center;
		font-size: 13px;
	}
	.divSearch {
		margin-top: 20px;
		margin-bottom: 20px;
		height: 30px;
	}
	.selSearch {
		height: 30px;
	}
	.textSearch {
		width: 300px;
		height: 30px;
	}
	.submitSearch {
		width: 50px;
		height: 30px;
		color: white;
		background-color: #1A7AD9;
		border-color: transparent;
	}
</style>
</head>
<body>
	<div id="center">
		<%@ include file="sidemenu.jsp"%>
		<div id="main">
			<h1>글 관리</h1>
			<div class="divTab">
				<table class="tableTab"><tr><td class="tdPlan"><a href="adminMainForm.do">일정 게시판(${totCnt})</a></td><td class="tdParty"><a href="adminBanForm.do">동행 찾기 게시판</a></td></tr></table>
			</div>
			<table class="tableList">
				<tr><th><input type="checkbox" class="chkboxTop" name="chkboxTop"></th><th>번호</th><th>제목</th><th>내용</th><th>작성자</th><th>이메일</th><th>작성일</th></tr>
				<c:forEach var="list" items="${list}">
					<tr><td width="25px"><input type="checkbox" class="chkbox" name="chkbox"></td>
						<td width="35px">${list.bs_num}</td>
						<td class="tdTitle">${list.title}</td>
						<td class="tdContent">${list.content}</td>
						<td width="70px">${list.nickname}</td>
						<td width="170px">${list.email}</td>
						<td>${list.board_date}</td>
					</tr>
				</c:forEach>
			</table>
			<div class="divButton">
				<form name="frm" action="adminBanPro.do" onsubmit="return memberBanChk()">
					<input type="hidden" id="hiddenBan" name="hiddenBan">
					<input type="submit" id="btnMemberBan" class="adminButton" value="글 삭제">
				</form>
			</div>
			<div class="divPage">
				<c:if test="${startPage > blockSize }">
					<a href='adminMainForm.do?pageNum=${startPage-blockSize }'>≪이전</a>
				</c:if>
				<c:forEach var="i" begin="${startPage }" end="${endPage }">
					<a href='adminMainForm.do?pageNum=${i}'>[${i}]</a>
				</c:forEach>
				<c:if test="${endPage < pageCnt}">
					<a href='adminMainForm.do?pageNum=${startPage+blockSize}'>다음≫</a>
				</c:if>
			</div>
			<div class="divSearch">
				<form action="adminMainForm.do" name="frm">
					<p><select name="selSearch" class="selSearch">
						<option>제목</option>
						<option>내용</option>
						<option>작성자</option>
						<option>이메일</option>
					</select>
					<input type="text" name="textSearch" class="textSearch" required="required">
					<input type="submit" name="submitSearch" class="submitSearch" value="검색"></p>
				</form>
			</div>
		</div>
	</div>
</body>
</html>