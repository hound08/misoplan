<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- <script type="text/javascript">
	function chk() {
		if (frm.email.value != frm.emai1.value) {
			alert("회원이 아닙니다.");
			return false;
		}
		return true;
	}
</script> -->
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
	height: 300px;
	background-color: #F6F6F6;
	padding: 15px 0 0 0;
	border: 1px solid gray;
	
}
.main-top-second1 {
	width: 400px;
	height: 250px;
 	margin: 25px 0 0 35px; 
	border: 1px solid gray;
	display: inline-block;
}
.main-top-second2 {
	vertical-align: top;
	width: 630px;
	height: 250px;
 	margin: 25px 0 0 40px; 
	border: 1px solid gray;
	display: inline-block;
}
.main-second-box1{
	width: 610px;
	height: 35px;
	margin: 20px 0 0 5px;
	font-size: 15pt;
}
.main-second-box2{
	width: 610px;
	height: 35px;
	margin: 15px 0 0 5px;
	font-size: 15pt;
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
	margin: 0 0 5px 4px;
	border: 1px solid gray;
	font-size: 10pt;
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
	height: 30px;gin : 0 30px;
}

</style>
</head>
<body>
<form action="boardselect.do" name="planSelect" method="post" enctype="multipart/form-data">
	<div class="main-top">
		<div class="main-top-second1" align="left">
			<!-- <img alt="IMG" src="images/k1.jpg"> -->
			<input type="file" name="plan_image">
		</div>
		<div class="main-top-second2">
		
		<div class="main-second-box2">
			제 목 : <input type="text" name="title" required="required">
		</div>
		<div class="main-second-box1">
			태 그 : <input type="text" name="tag" required="required">
		</div>
		<div class="main-second-box1">
			기 간 : <input type="${dto. }"> ~ <input type="date">
		</div>
		<div class="main-second-box1">
			작성자: <input type="text" name="nickname" required="required">
		</div>
		
		</div>
	</div>
	<div class="main-center">
		<div class="center-text">
			세부 일정
		</div>
			<div class="center-main-card">
			<c:forEach var="dto" items="${list }">
				<div class="center-card-box">
					<div class="card-box-title">
						${dto.tour_date }
					</div>
					<div class="card-box-bottom">
						${dto.tour_text }
					</div>
				</div>
			</c:forEach>
			</div>
		<div class="center-bottom-image">
			<textarea rows="13" cols="163"></textarea>
		</div>
		<div class="button-bottom" align="right">
			<input type="button" value="확인" style="width: 40pt; height: 20pt" onclick="location.href='boardschedule.do'">
			<input type="button" value="취소" style="width: 40pt; height: 20pt" onclick="location.href='boardschedule.do'">
		</div>
	</div>
	</form>
	
	<%@ include file="footer.jsp"%>

</body>
</html>