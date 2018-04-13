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

</style>
</head>
<body>
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
				<tr><td>제목&nbsp&nbsp</td><td><input type="text" class="input" name="title"></td></tr>
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
				<tr><td>마감날짜&nbsp&nbsp</td><td><input type="date" class="input" name="closing_date"></td></tr>
				<tr class="highlight"><td></td><td></td></tr>
				<tr><td>태그&nbsp&nbsp</td><td><input type="text" class="input" name="tag" id="hashtag" placeholder="#"></td></tr>
				<tr class="highlight"><td></td><td></td></tr>
				<tr><td>내용&nbsp&nbsp</td><td><div><textarea rows="20" name="content"></textarea></div></td></tr>
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