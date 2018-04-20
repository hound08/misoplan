<%@page import="java.util.ArrayList"%>
<%@page import="dao.mySchduleDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ include file="pageLoginCheck.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
/* 	절대위치(absolute)
	상대위치(relative) */
* {
	margin: 0px;
	padding: 0px;
}
div { /* 모두모두 가운데 정렬 !!!!! */
	margin: 0px auto; 
/*  	border: 1px solid black; */
}
* {
	font-family: 'NanumSquareRound', sans-serif;
}
.main-top {
	width: 1200px;
	height: 450px;
	padding: 15px 0 0 0;
	border: 1px solid #B5B2FF;
	border-radius: 10px;
}

.main-top-second1 {
	width: 610px;
	height: 410px;
 	margin: 5px 0 0 20px; 
	border: 1px solid #B5B2FF;
	display: inline-block;
 	vertical-align: top;
 	border-style: 1px solid #B5B2FF;
}
.image-size {
	width: 610px;
	height: 410px;
}
.card_image {
	width: 350px;
	height: 250px;
}
.main-top-second2 {
	border-radius: 10px;
	padding: 30px 40px 10px 60px;
 	vertical-align: top; 
	width: 400px;
	height: 320px;
 	margin: 25px 0 0 40px; 
	border: 1px solid #B5B2FF;
	display: inline-block;
	
}
.main-center {
	width: 1200px;
	height: 720px;
	padding: 15px 0 0 0;
	border: 1px solid #B5B2FF;
	border-radius: 10px;
	padding-bottom: 50px;
}
.center-text {
	/* display: inline-block; */
	/* vertical-align: middle; /* 텍스트 라인 높이 맞춤 */ */
	margin: 0 0 0 20px;
	width: 1100px;
	height: 50px;
	font-size: 20pt;
}
.center-main-card{
	margin-bottom: 10px;
	padding: 10px;
	width: 1100px;
	height: 280px;
	overflow: auto;
	border: 1px solid #B5B2FF;
	border-radius: 10px;
	display: block;
}

/* ------------------------- 일정 카드들 나오는 곳 시작 ------------------------- */
.divSmall {
	margin-left: 10px;
	margin-right: 10px;
	margin-bottom: 30px;
	border-radius: 10px;
	width: 245px;
	height: 265px;
	max-height: 260px;
	display: inline-block;
	vertical-align: top;
	border: 1px solid gray;
}
.imageSmall {
	width: 245px;
	height: 150px;
	border-radius: 10px;
}
.divTitleSmall {
	font-size: 17px;
	font-weight: bold;
	margin-top: 5px;
	margin-bottom: 5px;
	text-align: center;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}
/* ------------------------- 일정 카드들 나오는 곳 끝 ------------------------- */

.center-main-card2{
	font-size: 18pt;
	padding: 10px;
	width: 1100px;
	height: 300px;
	overflow: auto;
	border: 1px solid #B5B2FF;
	border-radius: 10px;
	display: block;
}
.card-box-title {
	vertical-align: top; /* 텍스트 라인 높이 맞춤 */
	width: 240px;
	height: 70px;
	overflow: hidden;
	overflow: auto;
	margin: 0 0 5px 2px;
	border: 1px solid #B5B2FF;
	font-size: 10pt;
}
.card-box-title2 {
	width: 240px;
	height: 30px;
	margin: 3px 0 0 0;
	vertical-align: middle;
}
.center-bottom-image {
	width: 1160px;
	height: 280px;
	margin: 20px 20px;
	font-size: 10pt;
	vertical-align: top;
	border-radius: 10px;
}
.button-bottom {
	width: 1100px;
	height: 30px;
	margin-top: 380px
}

.icon-vote {
	width: 17px;
    height: 17px;
	background: url("images/thumbup.png") no-repeat;
}
.icon-view {
	width: 17px;
    height: 17px;
	background: url("images/eye.png") no-repeat;
}
.icon {
    display: inline-block;
    vertical-align: middle;
    margin-right: 2px;
}
.span-icon-vote{
	cursor: pointer;
}

.main-reply {
	width: 1100px;
	margin: auto;
}
.reply_write {
	margin-top: 20px;
	margin-bottom: 20px;
}
.reply_profile_write {
	display: inline-block;
	text-align: center;
	vertical-align: top;
}
.img_profile_write {
	width: 100px;
	height: 100px;
}
.reply_content_write {
	display: inline-block;
	width: 865px;
	height: 135px;
}
.reply_textarea {
	font-size: 16px;
}
.reply_button {
	position: absolute;
	display: inline-block;
}
.btn_reply {
	width: 120px;
	height: 120px;
	color: white;
	background-color: #1A7AD9;
	border-color: transparent;
	font-size: 20px;
}
.reply_hr {
	color: black;
	margin-top: 40px;
	margin-bottom: 40px;
}
.reply_title {
	margin-top: 20px;
	margin-bottom: 20px;
	font-size: 20px;
	font-weight: bold;
}
.img_profile_view {
	width: 100px;
	height: 100px;
}
.reply_profile_view {
	display: inline-block;
	text-align: center;
	vertical-align: top;
}
.reply_content_view{
	display: inline-block;
	width: 980px;
}
.reply_date {
	margin-top: 5px;
	color: #B5B2FF;
	font-size: 13px;
}
.area {
	height: 15px;
}
.buttonList {
	background-color: #A2C4FF;
	color: white;
	border-style: double;
	font-family: 굴림;
	font-weight: bold;
}
#id-title {
	font-size: 20pt;
}
#id-nickname {
	font-size: 13pt;
}
#id-area{
	font-size: 13pt;
}
#id-sdate{
	font-size: 13pt;
}
</style>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript">

	$(document).on('click', '.span-icon-vote', function() {
		
		var bs_num = '${bs_num}';
		var sendDate = "bs_num="+bs_num;
		$.post('vote.jsp', sendDate, function(msg) {
			
			var parseMsg = msg.trim();
			$('.span-icon-vote').html('<i class="icon-vote"></i>'+parseMsg);
			
		});
	});

	function replyChk() {
		if (!$('.reply_textarea').val()) {
			alert("글을 입력해 주시기 바랍니다.");
			
			return false;
		}
		
		return true;
	}
</script>
</head>
<body>
	<div class="area"></div>
	<div class="main-top">
		<div class="main-top-second1">
			<img alt="image" class="image-size" src="${dto.image_url }">		
		</div>
		<div class="main-top-second2">
			<p id="id-title">제 목 : ${dto.title }</p>
			<br>
			<p id="id-nickname">닉네임 : ${dto.nickname }</p>
			<br>
			<p id="id-area">여행지역 : ${dto.area_names }</p>
			<br>
			<p id="id-sdate">여행기간 : ${dto.schedule_date }</p>
			<br>
			<br>
			<p id="id-tag">${dto.tag}</p>
			<br>
			<span class="span-icon-view"><i class="icon icon-view"></i>${dto.view_count }명이 읽었어요</span>
			<span class="span-icon-vote"><i class="icon icon-vote"></i>${dto.vote_count }명이 좋아해요</span>
			<br>
			<p id="id-board_date">작성일 : ${dto.board_date }</p>
 			
		</div>
	</div>
	<div class="area"></div>
	<div class="main-center">
		<div class="center-text">
			My Plan List
		</div>
		<div class="center-bottom-image">
			<div class="center-main-card">
				<c:forEach var="list_small" items="${list_small}">
					<div class="divSmall">
						<div><img alt="관광지 사진" src="${list_small.image_url}" class="imageSmall"></div>
						<div class="divTitleSmall">${list_small.tour_name}</div>
						<div class="divTextSmall">${list_small.tour_text}</div>
					</div>
				</c:forEach>
			</div>
			<div class="center-main-card2">
				<p>${dto.content }</p>
			</div>
		</div>
		<div class="button-bottom" align="right">
			<c:if test="${email == dto.email}">
				<input type="button" value="수정" class="buttonList" style="width: 40pt; height: 20pt"
				onclick="location.href='planupdate.do?bs_num=${dto.bs_num}'">
				<input type="button" value="삭제" class="buttonList" style="width: 40pt; height: 20pt"
				onclick="location.href='plandelete.do?bs_num=${dto.bs_num}&email=${email }'">
			</c:if>
			<input type="button" value="목록" class="buttonList" style="width: 40pt; height: 20pt" 
			onclick="location.href='boardschedule.do'">
		</div>
	</div>
	<div class="main-reply">
		<div class="reply_view">
			<p class="reply_title">댓글(${list_size})</p>
			<c:forEach var="list_reply" items="${list_reply}">
				<div class="reply_profile_view">
					<img class="img_profile_view" alt="프로필 사진" src="${list_reply.profile_url}">
					<p>${list_reply.nickname}</p>
				</div>
				<div class="reply_content_view">
					<p class="reply_text">${list_reply.reply_content}</p>
					<p class="reply_date">${list_reply.reply_date}</p>
				</div>
			</c:forEach>
		</div>
		<hr class="reply_hr">
		<div class="reply_write">
			<form name="frm_reply" action="bsReplyPro.do" onsubmit="return replyChk()">
				<div class="reply_profile_write">
					<img class="img_profile_write" alt="프로필 사진" src="${profile_url}">
					<p>${nickname}</p>
				</div>
				<div class="reply_content_write">
					<input type="hidden" name="bs_num" value="${dto.bs_num }">
					<textarea rows="7" cols="105" class="reply_textarea" name="reply_content"></textarea>
				</div>
				<div class="reply_button">
					<input type="submit" class="btn_reply" value="댓글 작성">
				</div>
			</form>
		</div>
	</div>
	
	
	<%@ include file="footer.jsp"%>

</body>
</html>