<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
 	background-color: #EAEAEA;
}

.post-header-img {
	margin: auto 0px auto 20px;
	height: 100px;
	width: 100px;
	background-image: url("${profile_url}");
	background-color: white;
	border-radius: 50%;
	background-size: 100% 100%;
	border: solid;
}

table {
	margin: auto 20px;
}
.reply-wrapper{
	margin: 20px 0 0 0;
	width: 100%;
	border: solid;
	display: flex;
	left: 1em;
 	background-color: #EAEAEA;
}
.reply-image { 
	margin: auto 20px;
	background-size: 100% 100%; 
	width: 80px; 
	height: 80px; 
	border-radius: 50%;
}

.post-body {
	width: 100%;
	border: solid;
	padding : 1em 0 1em 1em;
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

fieldset {
	color: white;
	position: fixed;
	top: 50%;
	left: 50%;
	border: none;
}

tr.highlight td {
	padding-top: 1px; 
	padding-bottom: 1px
}

span {
	border: solid;
	border-color: gray;
}

.icon-view {
	background: url("images/eye.jpg");
}

</style>
</head>
<body>
	<div id="apply-div" style="display: none;">
	<fieldset>
		<form class ="form" action="applyActionAB.do">
			이메일: <input type="text" placeholder="${email } " name="email" disabled><p>
			메시지: <textarea rows="5" style="width: 30%" name="message"></textarea><p>
			카카오톡 아이디: <input type="text" name="kakao_id""><p>
			참가 인원 : 
			<select name="num_people">
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
			</select>
			<input type="submit">
		</form>
		<button onclick="apply()">취소</button>
	</fieldset>
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
						<span><i class="icon-view"></i>${board.view_count }명이 보았습니다.</span>
						<span><i class="icon-vote"></i>${board.view_count }명이 좋아합니다.</span>
					</td>
				</tr>
			</table>
		</div>
		<div class="post-body">
			<pre>${board.content }</pre>
			<img src="${board.image_url }">
		</div>
		<c:if test="${email != null }">
			<button onclick="apply()">동행 신청하기</button>
		</c:if>
		<hr>
		<c:forEach var="reply" items="${list }">
		<div class="reply-wrapper">
			 <div class ="reply-image" style="background-image: url('${reply.profile_url}');"></div>
				<h2>작성자: ${reply.nickname }</h2>
				등록일: ${reply.reply_date }<br>
				<pre>내용: ${reply.content }</pre>
		</div>
		</c:forEach>
		<div class="post-footer">
			<c:if test="${email != null }">
				<form action="writeReplyAB.do">
					<input type="hidden" value="${post_num }"name="post_num">
					<textarea rows="12" style="width: 70%;" name="content"></textarea>
					<input type="submit" value="확인">
				</form>
			</c:if>
			<c:if test="${email == null }">
				<form action="writeReplyAB.do">
					<input type="hidden" value="${post_num }"name="post_num">
					<textarea rows="12" style="width: 70%;" name="content" placeholder="로그인하고 댓글을 작성해 주세요!" disabled></textarea>
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