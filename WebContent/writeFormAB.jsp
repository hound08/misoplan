<%@page import="dao.ScheduleDao"%>
<%@page import="dao.myPlanABDto"%>
<%@page import="dao.AccompanyDao"%>
<%@page import="dao.mySchduleDto"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.mySchduleDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">

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

table {
	margin: 10px auto;
	width: 90%;
}

textarea {
	width: 100%;
}

td:FIRST-CHILD{
	vertical-align: middle;
	text-align: right;
	width: 80px;
}

.input {
	width: 100%;
	height : 30px;
	font-size: 15px;
}

.form-table{
	font-size: 15px;
}

hr {
	margin: 30px 0;
}

#hashtag{
	color: #2478FF;
}

#output {
	width: 150px;
	height: 150px;
	background-size: 100% 100%;
	display: inline-block;
}

tr.highlight td {
	padding-top: 2px; 
	padding-bottom: 2px;
}

.cancel-button{
	width: 70px;
	height: 30px;
	font-size: 15px;
	justify-content: center;
	margin-top: 20px;
}

.input{
	height: 35px;
}

input[type="submit"] {
	width: 70px;
	height: 30px;
}

input[type="button"] {
	width: 70px;
	height: 30px;
}

input[type="file"] {
    display: none;
}

.wrapper-file-upload {
	margin-top: 5px;
	border: 1px solid #ccc;
	border-radius: 4px;
	background-color: #489CFF;
	color: white;
    display: inline-block;
    padding: 8px 12px;
    cursor: pointer;
}

#footer_wrap{
	margin-top: 130px;
}

.submit-div{
	float: right;
	margin-right: 60px;
}

.plan-div{
	width: 100%; 
	height: 250px; 
	border-style: solid;
	border-width: 1px;
	border-color: silver;
	display: inline-block;
	overflow-y: scroll;
	overflow-x: hidden;
	padding-left: 10px;
}

.plan{
	width: 250px;
	height: 220px;
	border-style: solid;
	border-width: 1px;
	border-color: silver;
	display: inline-block;
	margin: 10px 10px;
}

.plan-table td{
	text-align:center; 
    vertical-align:middle;
}

.option-input {
  -webkit-appearance: none;
  -moz-appearance: none;
  -ms-appearance: none;
  -o-appearance: none;
  appearance: none;
  position: relative;
  top: 13.33333px;
  right: 0;
  bottom: 0;
  left: 0;
  height: 40px;
  width: 40px;
  transition: all 0.15s ease-out 0s;
  background: #cbd1d8;
  border: none;
  color: #fff;
  cursor: pointer;
  display: inline-block;
  margin-right: 0.5rem;
  outline: none;
  position: relative;
  z-index: 1000;
}
.option-input:hover {
  background: #9faab7;
}
.option-input:checked {
  background: #40e0d0;
}
.option-input:checked::before {
  height: 40px;
  width: 40px;
  position: absolute;
  content: '✔';
  display: inline-block;
  font-size: 26.66667px;
  text-align: center;
  line-height: 40px;
}
.option-input:checked::after {
  -webkit-animation: click-wave 0.65s;
  -moz-animation: click-wave 0.65s;
  animation: click-wave 0.65s;
  background: #40e0d0;
  content: '';
  display: block;
  position: relative;
  z-index: 100;
}
.option-input.radio {
  border-radius: 50%;
}
.option-input.radio::after {
  border-radius: 50%;
}
@keyframes click-wave {
  0% {
    height: 40px;
    width: 40px;
    opacity: 0.25;
    position: relative;
  }
  100% {
    height: 200px;
    width: 200px;
    margin-left: -80px;
    margin-top: -80px;
    opacity: 0;
  }
}

</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<%
	ScheduleDao sdao = ScheduleDao.getInstance();
	String email = (String)session.getAttribute("email");
	sdao.check(email);

%>
<script type="text/javascript">
	$(document).ready(function(){
		$(".plan").children().eq(0).attr("checked", "checked");
	});
</script>
</head>
<body>
	<%
		String email = (String)session.getAttribute("email");
	    AccompanyDao dao = AccompanyDao.getInstance();
	    List<myPlanABDto> list = dao.getMyPlan(email);
	    request.setAttribute("list", list);
	%>
	<div class="section">
		<div class="main-image">
			<img id="center-image" alt="centerimage" src="images/korea1.jpg">
			<div class="center-label">
				<!-- 텍스트 ! -->
			</div>
		</div>
			<h3>새로운 글 등록</h3>
				동행을 찾기 위한 게시판입니다.
				음담패설,모욕,명예훼손,허위사실기재,성적수치심을 불러일으키는 글의 작성에 주의해주시기 바랍니다. 각종 민사,형사소송의 대상이 될 수 있으며, 모두 글 작성자의 책임입니다.
				본문이나 리플에 절대 개인정보를 노출하지 마시기 바랍니다.
			<hr>
		<div class="write-form">
			<form action="writeAB.do" class="form-table" method="post" enctype="multipart/form-data">	
				<table>
				<tr><td>제목&nbsp&nbsp</td><td><input type="text" class="input" name="title" required></td></tr>
				<tr class="highlight"><td></td><td></td></tr>
				<tr><td>최소 인원&nbsp&nbsp</td>
					<td><select name="minimum_num" class="input">
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
				<tr><td>마감날짜&nbsp&nbsp</td><td><input type="date" class="input" name="closing_date" required></td></tr>
				<tr class="highlight"><td></td><td></td></tr>
				<tr><td>태그&nbsp&nbsp</td><td><input type="text" class="input" name="tag" id="hashtag" placeholder="#" required></td></tr>
				<tr class="highlight"><td></td><td></td></tr>
				<tr>
					<td>나의 일정&nbsp&nbsp</td>
					<td>
						<div class="plan-div">
							<c:forEach var="myplan" items="${list }">
								<div class="plan">
								<input type="radio" class="option-input radio" name="plan-radio" value=${myplan.sl_code }>
									<table class="plan-table">
										<tr>
											<td>일정이름: ${myplan.s_name }</td> 
										</tr>
										<tr>
											<td><c:forEach var="area" items="${myplan.area_names }">[${area }] </c:forEach></td> 
										</tr>
										<tr>
											<td>${myplan.date_start }~${myplan.date_end }</td>
										</tr>
										<tr>
											<td>${myplan.regi_date }</td>
										</tr>
									</table>
								</div>
							</c:forEach>
						</div>
					</td>
				</tr>
				<tr class="highlight"><td></td><td></td></tr>
				<tr><td>내용&nbsp&nbsp</td><td><div><textarea rows="30" name="content" required></textarea></div></td></tr>
				<tr class="highlight"><td></td><td></td></tr>
				<tr class="highlight"><td></td><td></td></tr>
				<tr><td>이미지&nbsp&nbsp</td><td><img id="output"/></td></tr>
				<tr><td></td><td><label class="wrapper-file-upload"><input type="file" accept="image/*" onchange="loadFile(event)" name="image">사진 올리기</label></td>
				</table>
				<hr>
				<div class="submit-div">
					<input type="submit" value="완료" align="right">
					<input type="button" value="취소" onclick="history.back()">
				</div>
			</form>
		</div>
			
			
	</div>
	<div id="footer_wrap">
		<%@ include file="footer.jsp"%>
	</div>

	
	<script type="text/javascript">
		var image = document.getElementById("center-image");
		var current = 0;
		var images = ["images/korea2.jpg", "images/korea3.jpg","images/korea4.jpg","images/korea5.jpg","images/korea1.jpg"]

		function replacePhoto() {
			++current;
			if (current >= images.length)
				current = 0;
			image.src = images[current];
		}

		setInterval(replacePhoto, 3000);
		  
		 var loadFile = function(event) {
			    var output = document.getElementById('output');
			    output.src = URL.createObjectURL(event.target.files[0]);
			  };
	</script>
</body>
</html>