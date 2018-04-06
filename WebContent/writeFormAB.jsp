<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">

div {
margin: 0px auto;
}

* {
	padding:0px;
	margin: 0px;
	font-family: 'NanumSquareRound', sans-serif;
}

.section {
	width: 1200px;
	margin-bottom: 100px;
}

.main-image {
	border-radius: 5px;
	margin-left: auto;
	margin-right: auto;
	width: 100%;
	height: 400px;
	overflow: hidden;
	position: relative;
	margin-bottom: 20px;
}

.centerimage {
	min-height: 100%;
  	min-width: 100%;
	width: 100%;
	height: auto;
}

table {
	margin: 10px auto;
	width: 80%;
}

td:first-child{
	width: 10%;
	text-align: right;
}

.input {
	height : 30px;
	width : 100%;
	font-size: 15px;
}

.form-table{
	font-size: 15px;
}

hr {
	margin: 30px 0;
}

ul {
	display: block;
    list-style-type: disc;
    margin-top: 1em;
    margin-bottom: 1 em;
    margin-left: 0;
    margin-right: 0;
    padding-left: 40px;
}

#hashtag{
	color: #2478FF;
}

.cancel-button{
	width: 70px;
	height: 30px;
	display: flex;
	float: right;
	font-size: 15px;
	justify-content: center;
	margin-top: 20px;
}

</style>
</head>
<body>
	<div class="section">
		<div class="main-image">
			<img id="center-image" alt="centerimage" src="images/korea1.jpg">
			<div class="center-label"><!-- 텍스트 ! --></div>
		</div>
		<div class="write-form">
			<h3>새로운 글 등록</h3>
			<ul>
				<li>동행을 찾기 위한 게시판입니다.</li>
				<li>음담패설,모욕,명예훼손,허위사실기재,성적수치심을 불러일으키는 글의 작성에 주의해주시기 바랍니다. 각종 민사,형사소송의 대상이 될 수 있으며, 모두 글 작성자의 책임입니다.</li>
				<li>본문이나 리플에 절대 개인정보를 노출하지 마시기 바랍니다.</li>
			</ul>
			<hr>
			<form action="writeAB.do" class="form-table" method="post" enctype="multipart/form-data">	
				<table>
				<tr><td>제목</td><td><input type="text" class="input" name="title"></td></tr>
				<tr><td>최소 인원(본인포함)</td>
					<td><select name="minimum_num">
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
				<tr><td>마감날짜</td><td><input type="date" class="input" name="closing_date"></td></tr>
				<tr><td>태그</td><td><input type="text" class="input" name="tag" id="hashtag" placeholder="#"></td></tr>
				<tr><td>내용</td><td><div><textarea rows="20" cols="140" name="content"></textarea></div></td></tr>
				<tr><td>이미지</td><td><input type="file" class="input" name="image_url"></td></tr>
				</table>
				<input type="submit" value="완료" class="submit-button">
			</form>
			<div>
				<a href="accompanyBoard.jsp"><button class="cancel-button">취소</button></a>							
			</div>
		</div>
	</div>
	<div class="footer_wrap">
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
	</script>
</body>
</html>