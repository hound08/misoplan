<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"href="https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">
body, html {
    height: 100%;
}

div {
	margin: 0px auto;
}

* {
	padding: 0px;
	margin: 0px;
	font-family: 'NanumSquareRound', sans-serif;
	box-sizing: border-box;
    -moz-box-sizing: border-box;
    -webkit-box-sizing: border-box;
    -ms-box-sizing: border-box;
    -o-box-sizing: border-box;
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
.post-header {
	margin: 20px 0 0 0;
	width: 100%;
	height: 120px;
	display: flex;
	left: 1em;
	border: 1px solid;
	border-color: #D5D5D5;
	border-radius: 10px;
	margin-bottom: 10px;	
}

.post-header-img {
	margin: auto 0px auto 20px;
	height: 100px;
	width: 100px;
	background-image: url("${profile_url}");
	border-radius: 50%;
	background-size: 100% 100%;
}

table {
	margin: auto 20px;
}
.reply-wrapper{
	min-height: 100px;
	margin: 10px 0 10px 0;
	width: 100%;
	border: 1px solid;
	border-color: #D5D5D5;	
	display: flex;
	left: 1em;
 	border-radius: 5px;
}
.reply-image { 
	margin: 9px 0px auto 20px;
	background-size: 100% 100%; 
	width: 80px; 
	height: 80px; 
	border-radius: 50%;
}

.post-body {
	width: 100%;
	border: 1px solid;
	border-color: #D5D5D5;
	border-radius: 10px;
	padding: 1em 0 1em 1em;
	margin-bottom: 10px; 
}

tr.highlight td {
	padding-top: 1px; 
	padding-bottom: 1px
}

#apply-div {
	position: fixed;
	top:0;
	left:0;
    min-width: 100%;
    min-height: 100%;
    background-color: black;
    opacity: 0.8;
    z-index: 999;  /*stack order*/
}

tr.highlight td {
	padding-top: 1px; 
	padding-bottom: 1px
}

.span.icon {
	border: 1px solid;
	border-color: #D5D5D5;
	border-radius: 5px;	
	padding: 2px 3px;
}

.span-reply {
	border: 1px solid;
	border-color: #D5D5D5;
	border-radius: 5px;	
	background-color: #BC2424;
	text-align: center;
	color: white;
	padding: 2px 3px;
	height: 25px;
}

.icon-view {
	width: 25px;
    height: 17px;
	background: url("images/eye.jpg") no-repeat;
}

.icon {
    display: inline-block;
    vertical-align: middle;
    margin-right: 2px;
}

.image {
	width: 350px;
	height: 400px;
	background: url("${board.image_url }");
	background-size : 100% 100%;
}

.table-reply{
	margin-top: 15px;
}

.post-footer {
	margin-top: 15px;
}

.form-label{
	font-size: 20px;
	color: white;
	float: right;
}

.form-input {
	height: 30px;
	width: 100%;
	font-size: 20px;
}

.apply-table {
	width: 60%;
	position: absolute;
    top:0;
    bottom: 0;
    left: 0;
    right: 0;
    margin: auto auto;
}

.apply-table td:FIRST-CHILD {
	width: 150px;
}

.apply-submit-button{
	float:right;
	width: 100%;
	height: 35px;
	background-color: #59DA50;
	color: white;
	border-radius: 5px;
	font-size: 20px;
}

.cancel-button {
	float:right;
	width: 40px;
	height: 40px;
	color: white;
	background-color: #DB0000;
}

.form-select{
 height: 30px;
 font-size: 20px;
}

.reply-table{
	width:100%;
	margin: 0 0;
}

.reply-table td:FIRST-CHILD {
	width: 150px;
}

.write-reply-image{
	border-radius: 50%;
	background-size: 100% 100%; 
	width: 100px; 
	height: 100px; 
}

.reply-submit{
	width: 90px;
	height: 40px;
	float:right;
}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<body>
	<div id="apply-div" style="display: none;">
		<form class ="form" action="applyActionAB.do">
			<table class="apply-table">
				<input type="hidden" value="${post_num }" name="post_num">
				<tr><td colspan="2"><button class="cancel-button" onclick="apply()">&#10006</button></td><tr>
				<tr><td><label class="form-label">이메일:</label></td><td><input type="text" class="form-input" placeholder="${email } " name="email" disabled></td></tr>
				<tr><td><label class="form-label">메시지:</label></td><td><textarea rows="7" style="width: 100%; font-size: 20px" name="message"></textarea></td></tr>
				<tr><td><label class="form-label">카카오톡 아이디:</label></td><td><input type="text" class="form-input" name="kakao_id"></td><tr>
				<tr><td><label class="form-label">참가 인원 :</label></td>
				<td><select name="num_people" class="form-select">
					<option value="1">1명</option>
					<option value="2">2명</option>
					<option value="3">3명</option>
					<option value="4">4명</option>
					<option value="5">5명</option>
					<option value="6">6명</option>
					<option value="7">7명</option>
					<option value="8">8명</option>
					<option value="9">9명</option>
					<option value="10">10명</option>
				</select></td>
				</tr>
				<tr class="highlight"><td></td><td></td></tr>
				<tr><td colspan="2"><input type="submit" class="apply-submit-button" value="동행신청 쪽지보내기"></td></tr>
			</table>
		</form>
	</div>
	<div class="section">
		<div class="main-image">
			<img id="center-image" alt="centerimage" src="images/korea1.jpg">
			<div class="center-label">
				<!-- 텍스트 ! -->
			</div>
		</div>
		
		<div class="post-header">
			<div class="post-header-img"></div>
			<table>
				<tr><td><h1>${board.title }</h1></td></tr>
				<tr class="highlight"><td></td><td></td></tr>
				<tr class="highlight"><td></td><td></td></tr>
				<tr style="font-size: 18px;"><td>작성자: ${board.nickname } | 등록일:${board.post_date } | 게시물 번호: ${post_num }</td></tr>
				<tr class="highlight"><td></td><td></td></tr>
				<tr style="font-size: 18px;">
					<td> 
						<span class="span-icon"><i class="icon icon-view"></i>${board.view_count }명이 읽었어요.</span>
						<span class="span-icon"><i class="icon icon-vote"></i>${board.vote_count }명이 좋아해요.</span>
					</td>
				</tr>
			</table>
		</div>
		<div class="post-body">
			<pre>${board.content }</pre>
			<div class="image"></div>
			<c:if test="${email != null }">
			<button onclick="apply()">동행 신청하기</button>
		</c:if>
		</div>
		<hr>
		<c:forEach var="reply" items="${list }">
		<div class="reply-wrapper">
			<div class ="reply-image" style="background-image: url('${reply.profile_url}')"></div>
			<table class="table-reply">
				<tr"><td><span class="span-reply">댓글 ${reply.rn }&nbsp</span><label style="font-size: 18px; font: bold">&nbsp&nbsp${reply.nickname }</label>&nbsp&nbsp<label style="color:#A6A6A6; font-size: 15px">|&nbsp&nbsp${reply.reply_date }</label></td></tr>
				<tr class="highlight"><td></td><td></td></tr>
				<tr class="highlight"><td></td><td></td></tr>
				<tr style="font-size: 18px;"><td><pre>${reply.content }</pre></td></tr>
				<tr class="highlight"><td></td><td></td></tr>
			</table>
		</div>
		</c:forEach>
		<hr>
		<div class="post-footer">
			<%-- <c:if test="${email == null }">
				<form action="writeReplyAB.do" method="post">
					<input type="hidden" value="${post_num }"name="post_num">
					<textarea rows="12" style="width: 70%;" name="content"></textarea>
					<input type="submit" value="확인">
				</form>
			</c:if> --%>
			<c:if test="${email != null }">
				<form action="writeReplyAB.do" method="post" id="replyForm">
					<input type="hidden" value="${post_num }"name="post_num">
					<table class="reply-table">
						<tr><td colspan="2">${nickname }님의 댓글을 남겨주세요!</td></tr>
						<tr><td><div class ="write-reply-image" style="background-image: url('${profile_url}')"></div></td><td><textarea rows="8" style="font-size: 20px; width: 100%;" name="content" placeholder="불량댓글 작성시 미소플랜 이용을 제한받을 수 있습니다."></textarea></td></tr>
						<tr><td colspan="2">
						<input type="submit" class="reply-submit" value="확인" id="writeReply"></td></tr>
					</table>
				</form>
			</c:if>
		</div>		
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
					   "images/korea5.jpg", ]
		function replacePhoto() {
			++current;
			if (current >= images.length)
				current = 0;
			image.src = images[current];
		}
		setInterval(replacePhoto, 3000);
			
		function apply() {
		    var apply_div = document.getElementById("apply-div");
		    if (apply_div.style.display === "none") {
		    	apply_div.style.display = "block";
		    	document.documentElement.style.overflow = 'hidden';
			    document.body.scroll = "no";
		    } else {
		    	apply_div.style.display = "none";
		    	document.documentElement.style.overflow = 'auto'; 
		        document.body.scroll = "yes";
		    }
		    
		}
	</script>
</body>
</html>