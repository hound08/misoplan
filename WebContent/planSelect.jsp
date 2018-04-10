<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ include file="pageLoginCheck.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
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
 	/* border: 1px solid black; */
}

.main-top {
	width: 1200px;
	height: 330px;
	background-color: #F6F6F6;
	padding: 15px 0 0 0;
	border: 1px solid gray;
	
}
.main-imagebt{
	width: 80px;
	height: 30px;
	margin: 0 5px 0 50px;
}
.main-top-second1 {
	width: 380px;
	height: 250px;
 	margin: 25px 0 0 35px; 
	border: 1px solid gray;
	display: inline-block;
}
.main-top-second2 {
	padding: 40px 0 0 70px;
	vertical-align: top;
	width: 630px;
	height: 212px;
 	margin: 25px 0 0 40px; 
	border: 1px solid gray;
	display: inline-block;
}
#title {
	width: 300px;
	height: 30px;
}
#tag {
	width: 300px;
	height: 30px;
}
#tour_date {
	width: 136px;
	height: 30px;
}
#nickname {
	width: 290px;
	height: 30px;
}
.main-center {
	width: 1200px;
	height: 650px;
	background-color: #F6F6F6;
	padding: 15px 0 0 0;
	border: 1px solid gray;
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
	width: 1200px;
	height: 300px;
	overflow: auto;
	border: 1px solid gray;
}
.center-card-box{
	/* overflow: scroll; */
	width: 250px;
	height: 250px;
	margin: 25px 0 10px 35px;
	display: inline-block; /* 가로형 정렬 */
}
.card-box-title {
	vertical-align: top; /* 텍스트 라인 높이 맞춤 */
	width: 240px;
	height: 70px;
	overflow: hidden;
	overflow: auto;
	margin: 0 0 5px 2px;
	border: 1px solid gray;
	font-size: 10pt;
}
.card-box-title2 {
	width: 240px;
	height: 30px;
	margin: 3px 0 0 0;
	vertical-align: middle;
}
.card-box-bottom {
	width: 240px;
	height: 170px;
	overflow: auto;
	border: 1px solid gray;
}
.center-bottom-image {
	width: 1160px;
	height: 200px;
	margin: 20px 20px;
	font-size: 10pt;
	vertical-align: top;
}
.button-bottom {
	width: 1100px;
	height: 30px;
	magin : 0 30px;
}
#radio {
	: center;
}

</style>
<script type="text/javascript">
	function previewFile(input){
   		 var reader=new FileReader();
    
   		 reader.onload=function(event){
    	   $('.main-top-second1').attr('src', event.target.result);
    	}
  		  reader.readAsDataURL(input.files[0]);
 	}
	function change() {
		var plan = document.getElementById("")
		
	}
	function select_radio() {
		alert("들어왓!")
	}
</script>
</head>
<body>
<form action="boardinsert.do" name="planSelect" method="post" enctype="multipart/form-data">
	<div class="main-top">
		<!-- <div class="main-top-second1" align="left"> -->
			<img class="main-top-second1" alt="IMG" src="">
		<!-- </div> -->
		<div class="main-top-second2">
		<p>제   목 : <input type="text" id="title" name="title" required="required" placeholder="제 목"></p><br>
		<p>태   그 : <input type="text" id="tag" name="tag" required="required"></p><br>
		<p>지   역 : </p><span id="sapn_local"></span><br>
		<p>기   간 : </p>
		<!-- <p>작성자 : <input type="text" id="nickname" name="nickname" required="required"></p><br> -->
		</div>
		<div class="main-imagebt">
			<input class="" type="file" name="image_url" value="" onchange="image(this)">
		</div>
	</div>
	<div class="main-center">
		<div class="center-text">
			세부 일정
		</div>
			<div class="center-main-card">
			<c:forEach var="dto" items="${showList }">
				<div class="center-card-box" align="center">
					<div class="card-box-title">
						${dto.sl_code }
						<div>
							${dto.local_name }
						</div>
						<div class ="card-box-title2">
							${dto.tour_date_start } ~ ${dto.tour_date_end }
						</div>
					</div>
					<div class="card-box-bottom">
						${dto.s_name }
					</div>
					<input type="radio" id="radio" name="radio" value="일정선택" onclick="select_radio()">
				</div>
			</c:forEach>
			</div>
		<div class="center-bottom-image">
			<textarea rows="13" cols="163" name="content"></textarea>
		</div>
		<div class="button-bottom" align="right">
			<input type="submit" value="확인" style="width: 40pt; height: 20pt">
			<!-- submit --><!-- onclick="location.href='boardinsetAction.do'" -->
			<input type="button" value="취소" style="width: 40pt; height: 20pt" onclick="location.href='boardschedule.do'">
		</div>
	</div>
	</form>
	
	<%@ include file="footer.jsp"%>

</body>
</html>