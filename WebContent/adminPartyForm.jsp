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
		width: 930px;
		text-align: center;
		float: left;
		margin-top: 20px;
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
		color: gray;
		width: 50%;
	}
	.tdParty {
		width: 50%;
		border-bottom: 4px solid #1A7AD9;
		font-weight: bold;
	}
	.tdPlan a {
		color: gray;
	}
	.tdPlan a:HOVER {
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
	  width: 250px;
	  max-width: 250px;
	  text-overflow: ellipsis;
	  overflow: hidden;
	  white-space: nowrap;
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
	.deleteButton {
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
	
	function deleteChk() {
		if ($(".chkbox:checked").length == 0) {
			alert("선택된 글이 없습니다.");
			
			return false;
		} else {
			if (confirm($(".chkbox:checked").length + "개의 글을 삭제합니다.\n계속 진행하시겠습니까?")) {
				var rowData = new Array();
				var tdArr = new Array();
				var checkbox = $(".chkbox:checked");
				
				checkbox.each(function(i) {
					var tr = checkbox.parent().parent().eq(i);
					var td = tr.children();
		
					rowData.push(tr.text());
					var post_num = td.eq(1).text();
					tdArr.push(post_num);
				});
				
				$('#hiddenDelete').val(tdArr);
				
				return true;
			} else {
				$('#hiddenDelete').val("");
				alert("취소하셨습니다.");
			}
			
			return false;
		}
	};
</script>
</head>
<body>
	<div id="center">
		<%@ include file="sidemenu.jsp"%>
		<div id="main">
			<h1>글 관리</h1>
			<div class="divTab">
				<table class="tableTab"><tr><td class="tdPlan"><a href="adminSubjectForm.do">일정 게시판</a></td><td class="tdParty"><a href="adminPartyForm.do">동행 찾기 게시판(${totCnt})</a></td></tr></table>
			</div>
			<table class="tableList">
				<tr><th><input type="checkbox" class="chkboxTop" name="chkboxTop"></th><th>번호</th><th>제목</th><th>작성자</th><th>이메일</th><th>지원자</th><th>마감</th><th>작성일</th></tr>
				<c:forEach var="list" items="${list}">
					<tr><td width="25px"><input type="checkbox" class="chkbox" name="chkbox"></td>
						<td width="35px">${list.post_num}</td>
						<td class="tdTitle">${list.title}</td>
						<td width="75px">${list.nickname}</td>
						<td width="170px">${list.email}</td>
						<td>${list.current_num}/${list.minimum_num}</td>
						<td><c:if test="${list.is_closed == 0}">진행중</c:if><c:if test="${list.is_closed == 1}">종료</c:if></td>
						<td>${list.post_date}</td>
					</tr>
				</c:forEach>
			</table>
			<div class="divButton">
				<form name="frm" action="partyDeletePro.do" onsubmit="return deleteChk()">
					<input type="hidden" id="hiddenDelete" name="hiddenDelete">
					<input type="submit" id="btnDelete" class="deleteButton" value="글 삭제">
				</form>
			</div>
			<div class="divPage">
				<c:if test="${startPage > blockSize }">
					<a href='adminPartyForm.do?pageNum=${startPage-blockSize }'>≪이전</a>
				</c:if>
				<c:forEach var="i" begin="${startPage }" end="${endPage }">
					<a href='adminPartyForm.do?pageNum=${i}'>[${i}]</a>
				</c:forEach>
				<c:if test="${endPage < pageCnt}">
					<a href='adminPartyForm.do?pageNum=${startPage+blockSize}'>다음≫</a>
				</c:if>
			</div>
			<div class="divSearch">
				<form action="adminPartyForm.do" name="frm">
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