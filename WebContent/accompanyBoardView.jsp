<%@page import="java.util.TreeSet"%>
<%@page import="dao.ScheduleLoadDto"%>
<%@page import="dao.ScheduleDao"%>
<%@page import="java.net.InetAddress"%>
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
	background-image: url("${profile_url_writer}");
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
	margin-bottom: 10px; 
	padding-top: 10px;
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

.span-icon-vote{
	cursor: pointer;
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
	width: 17px;
    height: 17px;
	background: url("images/eye.png") no-repeat;
}

.icon-vote{
	width: 17px;
    height: 17px;
	background: url("images/thumbup.png") no-repeat;
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
	margin-left: 0px;
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
	width: 130px; 
	height: 130px; 
}

.reply-submit{
	width: 90px;
	height: 40px;
	float:right;
	background-color: #AA1212;
	color: white;
	border-radius: 5px;
	font-size: 18px;
	cursor: pointer;
}

.like-button{
	vertical-align: baseline;
	margin: auto;
}

.body-table{
	width: 100%;
	margin: 10 20;
	font-size: 18px;
}

.post-plan{
	width: 100%;
	height: 450px;
	border: 1px solid;
	border-color: #D5D5D5;
	border-radius: 10px;
	margin-bottom: 10px;
}

.post-plan-header{
	width: 100%;
	height: 50px;
	border: 1px solid;
	border-color: #D5D5D5;
	border-radius: 10px 10px 0 0;
	display: table;
}


.tab{
	display: table-cell;
	height: 100%;
	border: 1px solid;
	border-color: #D5D5D5;
	border-radius: 10px 10px 0 0;
	font-size: 18px;
	text-align:center;
	width: 11%;
	vertical-align: middle;
	font-weight: bold;
	cursor: pointer;
}

.tab-clicked{
	display: table-cell;
	height: 100%;
	border: 1px solid;
	border-color: #D5D5D5;
	border-radius: 10px 10px 0 0;
	font-size: 18px;
	text-align:center;
	width: 11%;
	vertical-align: middle;
	background-color: #48CAE1;
	color: white;
	font-weight: bold;
}

.tab p {
	text-align: center;
	margin-top: 5px;
}

.post-plan-body{
	width: 100%;
	height: 400px;
	position: relative;
	white-space: nowrap;
}

.plan-wrapper{
	display: inline-block;
	width: 25%;
	height:100%;
}

.plan{
	width: 100%;
	height: 400px;
	border: 1px solid gray;	
	position:absolute;
	left: 0;
	top: 0;
	overflow-x: scroll;
	overflow-y: hidden;
	
	
}
.plan-transparent{
	width: 0%;
	border: 1px solid gray;	
	opacity: 0;
	position:absolute;
	left: 0;
	top: 0;
}
.plan-area{
	margin-top: 10px;
	width: 100%;
	overflow: hidden;
	text-align: center;
	font-size: 18px; 
}
.plan-tourName{
	text-align: center;
	overflow: hidden;
}

.plan-image{
	width: 80%;
	height: 300px;
	border: 1px solid;
	border-color: #D5D5D5;
	border-radius: 10px;
	margin-top: 10px;
}

.toList{
	float: right;
	width: 80px;
	height: 30px;
	cursor: pointer;
}

.refresh{
	width: 80px;
	height: 30px;
	cursor: pointer;
}

.refresh-icon {
	width: 17px;
	height: 17px;
	background-image: url("images/refresh.png");
	background-size: 100% 100%;
	background-repeat: no-repeat;
	margin-left: 10px;
	cursor: pointer;
}

hr{
	margin-top: 10px;
}

.post-body-bottom {
	width: 100%;
	margin-bottom: 55px;
	position: relative; 
}
.center-button{
	width: 90px;
	height: 30px;
	cursor: pointer;
	position: absolute;
	left: 50%;
}

.label_vote{
	cursor: pointer;
}

textarea {
    box-sizing: border-box;
    resize: none;
}

</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript">
	(function(){
	    var resize = function (node) {
	        var offset = node.offsetHeight - node.clientHeight;
	        jQuery(node).css('height', 'auto').css('height', node.scrollHeight + offset);
	    };
	    jQuery(document).bind("ready", function(){
	        jQuery('textarea[data-autoresize]')
	            .bind('keyup input', function () {
	                resize(this);
	            })
	            .removeAttr('data-autoresize')
	            .addClass("resizing")
	            .trigger("input");
	    });
	    jQuery(document).trigger("ready");
	})();

	$(document).ready(function(){
		$('.plan-transparent').eq(0).removeClass('plan-transparent').addClass('plan');
		$('.post-plan-header').children().eq(0).addClass('tab-clicked');
		//console.log("plans : " + plans);
		//var plan = plans[0];
		//console.log("plan : " + plan);
		//plan.removeClass('plan-transparent').addClass('plan');
		//plan.attr("plan-transparent", "plan");	
		
	});
	
	$(document).on('click', '.tab', function(){
		$this = $(this);
		$('.post-plan-body').children().attr('class','plan-transparent');
		var date = $this.children().text();
			//console.log("date : " + date);
		date = "#"+date;
		$(date).removeClass('plan-transparent').addClass('plan');
		
		var tabs = $('.post-plan-header').children().removeClass('tab-clicked');
			//console.log($('.post-plan-header').children());
		$this.addClass('tab-clicked');
		
	});
	
	
	
	$(document).on('click', '.span-icon-vote', function(){
		
		var post_num = '${post_num}';
		var sendData = "post_num="+post_num;
		$.post('likey.jsp', sendData, function(msg){
			
		var parsedMsg = msg.trim();
		$('.span-icon-vote').html('<i class="icon icon-vote"></i>'+parsedMsg);
			
		});
	
	});
	
	var aa = "${planList}";
	console.log("aa : " + aa[0]);
	function getSl_code(){
		var sl_code = "${row.sl_code}";
		$(".post-plan-body").append("<div class='aa'>"+sl_code+"</div>");
	}

</script>

<body>
	<div id="apply-div" style="display: none;">
				<button class="cancel-button" onclick="apply()">&#10006</button>
		<form class ="form" action="applyActionAB.do">
			<table class="apply-table">
				<input type="hidden" value="${post_num }" name="post_num">
				<tr><td><label class="form-label">이메일:</label></td><td><input type="text" class="form-input" placeholder="${email } " name="email" disabled></td></tr>
				<tr><td><label class="form-label">메시지:</label></td><td><textarea rows="7" style="width: 100%; font-size: 20px" name="message" required></textarea></td></tr>
				<tr><td><label class="form-label">카카오톡 아이디:</label></td><td><input type="text" class="form-input" name="kakao_id" required></td><tr>
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
						<span class="span-icon-view"><i class="icon icon-view"></i>${board.view_count }명이 읽었어요</span>
						<span class="span-icon-vote"><i class="icon icon-vote"></i><label class="label_vote">${board.vote_count }명이 좋아해요</label></span>
					</td>
				</tr>
			</table>
		</div>
		
		<!-- 일정 -->
		<div class="post-plan">
			<div class="post-plan-header">
				<%
/* 					ArrayList<ScheduleLoadDto> arr = (ArrayList<ScheduleLoadDto>)request.getAttribute("planList");
					ScheduleLoadDto sldto = arr.get(0);
					String firstDate = sldto.getTour_date();
					String[] firstArr = firstDate.split(" ");
					firstDate = firstArr[0];
					request.setAttribute("firstDate", firstDate);

 */					
					ArrayList<ScheduleLoadDto> planList = (ArrayList<ScheduleLoadDto>)request.getAttribute("planList");
					TreeSet<String> dateTree = new TreeSet<>();
 					for(int i = 0; i < planList.size(); i++){
						ScheduleLoadDto dto = planList.get(i);
						String date1 = dto.getTour_date();
						String[] date2 = date1.split(" ");
						dateTree.add(date2[0]);
						dto.setTour_date(date2[0]);
						planList.set(i, dto);
					}
 					request.setAttribute("dateTree", dateTree);
 					request.setAttribute("planList", planList);
					
				%>
				
				<c:forEach var="date" items="${dateTree }">
					<div class="tab"><p>${date}</p></div>
				</c:forEach>
			</div>
			<div class="post-plan-body">
				<% 
					ScheduleLoadDto sldto = planList.get(0);
				%>
					<% 
					for(String date : dateTree){
						%>
						<div class="plan-transparent" id="<%=date %>">
						<%
						for(int i = 0; i < planList.size(); i++){
							
							while(date.equals(planList.get(i).getTour_date())){
								String imagePath = planList.get(i).getImage_url();
								String areaName = planList.get(i).getArea_name();
								String sigunguName = planList.get(i).getSigungu_name();
								String tourName = planList.get(i).getTour_name();
								%>
								<div class="plan-wrapper">
									<div class="plan-image" style="background: url('<%=imagePath%>'); background-size: 100% 100%"></div>
									<div class="plan-area"><%=areaName %>-<%=sigunguName %></div>
									<div class="plan-tourName"><%=tourName %></div>
								</div>
								<%
								if(i < planList.size()-2)
									i++;
								else
									break;
							}
						}
						%>
						</div>
						<%
					}
				
					%>
			</div>
		</div>
		
		<!-- 바디 -->
		<div class="post-body">
		<c:if test="${board.image_url != null}">
			<table class="body-table">
				<tr>
					<td><div class="image"></div></td>
				</tr>
				<tr>
					<td><textarea data-autoresize disabled rows="2" style="width: 96%; background-color: white; border: none; font-size: 20px;">${board.content }</textarea></td>
				</tr>
			</table>
		</c:if>
		<c:if test="${board.image_url == null}">
			<table class="body-table">
				<tr>
					<td><pre>${board.content }</pre></td>
				</tr>
			</table>
		</c:if>
			<div class="post-body-bottom">
			<c:if test="${email != null and board.is_closed != 1 and email != board.email}">
				<button onclick="apply()" class="center-button">동행 신청하기</button>
			</c:if>
			<c:if test="${email == board.email and board.is_closed != 1}">
				<a href="closeActionAB.do?post_num=<%=request.getParameter("post_num") %>" ><button  class="center-button">마감하기</button></a>
			</c:if>
			</div>
		</div>
		
		<a href="listAction.do"><button class="toList">목록보기</button></a>
		<button onclick="refresh()" class="refresh">새로고침</button>
		<c:if test="">
			<button>수정하기</button>
		</c:if>
		<hr>
		<c:forEach var="reply" items="${list }">
		<div class="reply-wrapper">
			<div class ="reply-image" style="background-image: url('${reply.profile_url}')"></div>
			<table class="table-reply">
				<tr><td><span class="span-reply">댓글 ${reply.rn }&nbsp</span><label style="font-size: 18px; font: bold">&nbsp&nbsp${reply.nickname }</label>&nbsp&nbsp<label style="color:#A6A6A6; font-size: 15px">|&nbsp&nbsp${reply.reply_date }</label></td></tr>
				<tr class="highlight"><td></td><td></td></tr>
				<tr class="highlight"><td></td><td></td></tr>
				<tr style="font-size: 18px;"><td><pre>${reply.content }</pre></td></tr>
				<tr class="highlight"><td></td><td></td></tr>
			</table>
		</div>
		<hr>
		</c:forEach>
		<div class="post-footer">
			<c:if test="${email != null }">
				<form action="writeReplyAB.do" method="post" id="replyForm">
					<input type="hidden" value="${post_num }"name="post_num">
					<table class="reply-table">
						<tr><td colspan="2">${nickname }님의 댓글을 남겨주세요!<i class="icon refresh-icon" onclick="refresh()"></i></td></tr>
						<tr class="highlight"><td></td><td></td></tr>
						<tr class="highlight"><td></td><td></td></tr>
						<tr><td><div class ="write-reply-image" style="background-image: url('${profile_url_my}')"></div></td><td><textarea rows="8" style="font-size: 20px; width: 100%;" name="content" placeholder="불량댓글 작성시 미소플랜 이용을 제한받을 수 있습니다."></textarea></td></tr>
						<tr><td colspan="2">
						<input type="submit" class="reply-submit" value="댓글전송" id="writeReply"></td></tr>
					</table>
				</form>
			</c:if>
			<c:if test="${email == null }">
					<input type="hidden" value="${post_num }"name="post_num">
					<table class="reply-table">
						<tr><td colspan="2">로그인 후에 이용해 주세요!<i class="icon refresh-icon" onclick="refresh()"></i></td></tr>
						<tr class="highlight"><td></td><td></td></tr>
						<tr class="highlight"><td></td><td></td></tr>
						<tr><td colspan="2"><textarea rows="8" style="font-size: 20px; width: 100%;" name="content" placeholder="로그인 후에 댓글을 작성하실 수 있습니다.!" disabled></textarea></td></tr>
					</table>
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
		
		function refresh() {
		    location.reload();
		}
	</script>
</body>
</html>