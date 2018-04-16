<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="header.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메뉴</title>
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
	.tdAll {
		width: 50%;
		border-bottom: 4px solid #1A7AD9;
		font-weight: bold;
	}
	.tdBan {
		color: gray;
		width: 50%;
	}
	.tdBan a {
		color: gray;
	}
	.tdBan a:HOVER {
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
	table.tableList tr:nth-child(odd) {
	  background: #D0E4F5;
	}
	table.tableList td {
	  text-align: center;
	}
	table.tableList td:nth-child(6) {
	  text-align: right;
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
		margin-left: 5px;
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
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('.chkboxTop').click(function(){
			if ($('.chkboxTop').prop('checked')) {
				$('.chkbox').prop('checked', true);
			} else {
				$('.chkbox').prop('checked', false);
			}
		});
		
		$('.chkbox').click(function(){
			if ($(".chkbox").length == $(".chkbox:checked").length) {
				$('.chkboxTop').prop('checked', true);
			} else {
				$('.chkboxTop').prop('checked', false);
			}
		});
	});
	
	function memberBan() {
		if ($(".chkbox:checked").length == 0) {
			alert("선택된 회원이 없습니다.");
			
			return;
		} else {
			if (confirm($(".chkbox:checked").length + "명의 회원을 정지 처리합니다.\n계속 진행하시겠습니까?")) {
				var rowData = new Array();
				var tdArr = new Array();
				var checkbox = $(".chkbox:checked");
				
				checkbox.each(function(i) {
					var tr = checkbox.parent().parent().eq(i);
					var td = tr.children();
		
					rowData.push(tr.text());
					var email = td.eq(2).text();
					tdArr.push(email);
				});
				
				location.href="adminBanPro.do";
			} else {
				alert("취소하셨습니다.");
				
				return;
			}
		}
	}
</script>
</head>
<body>
	<div id="center">
		<%@ include file="sidemenu.jsp"%>
		<div id="main">
			<h1>관리자 메뉴</h1>
			<div class="divTab">
				<table class="tableTab"><tr><td class="tdAll"><a href="adminMainForm.do">전체 회원(${totCnt})</a></td><td class="tdBan"><a href="adminBanForm.do">정지된 회원</a></td></tr></table>
			</div>
			<table class="tableList">
				<tr><th width="25px"><input type="checkbox" class="chkboxTop" name="chkboxTop"></th>
					<th width="35px">번호</th><th width="170px">이메일</th><th width="70px">별명</th><th width="100px">연락처</th><th>점수</th><th>관리자</th>
					<th>정지</th><th>정지 기간</th><th>탈퇴</th><th>가입일</th></tr>
				<c:set var="num" value="1" />
				<c:forEach var="list" items="${memberList }">
					<tr><td><input type="checkbox" class="chkbox" name="chkbox"></td>
						<td>${num}</td><td>${list.email }</td><td>${list.nickname }</td><td>${list.phone }</td>
						<td><fmt:formatNumber value="${list.member_score}" type="number" /></td>
						<td><c:if test="${list.member_admin == 0 }">일반</c:if><c:if test="${list.member_admin == 1 }">관리자</c:if></td>
						<td><c:if test="${list.ban == 0 }">-</c:if><c:if test="${list.ban == 1 }">정지</c:if></td>
						<td><c:if test="${list.ban_date == null }">-</c:if><c:if test="${list.ban_date != null }">${list.ban_date }</c:if></td>
						<td><c:if test="${list.leave == 0 }">-</c:if><c:if test="${list.leave == 1 }">탈퇴</c:if></td><td>${list.join_date_time }</td></tr>
					<c:set var="num" value="${num + 1 }" />
				</c:forEach>
			</table>
			<div class="divButton">
				<p><input type="button" class="adminButton" value="회원 정지" onclick="memberBan()"><input type="button" class="adminButton" value="회원 정지 해제">
				<input type="button" class="adminButton" value="관리자 지정"><input type="button" class="adminButton" value="관리자 해제"></p>
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
						<option>이메일</option>
						<option>별명</option>
						<option>연락처</option>
					</select>
					<input type="text" name="textSearch" class="textSearch" required="required">
					<input type="submit" name="submitSearch" class="submitSearch" value="검색"></p>
				</form>
			</div>
		</div>
	</div>
</body>
</html>