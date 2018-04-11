<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
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
	height: 150px;
	border: solid;
	display: flex;
	left: 1em;
 	background-color: #EAEAEA;
}

.post-header-img {
	margin: auto 20px;
	height: 120px;
	width: 120px;
	background-image: url("${profile_url}");
	background-color: white;
	border-radius: 50%;
	background-size: 100% 100%;
	border: solid;
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
		
		<div class="post-header">
			<div class="post-header-img"></div>
			<table>
				<tr><td><h2>제목: </h2></td><td><h2>${board.title }</h2></td></tr>
				<tr class="highlight"><td></td><td></td></tr>
				<tr><td>작성자: </td><td>${board.nickname } | 등록일: ${board.reg_date }</td></tr>
			</table>
		</div>
		<div class="post-body">
			<pre>${board.content }</pre>
			<img src="${board.image_url }">
		</div>
		<div class="post-footer">
			<form>
				<textarea rows="12" style="width: 70%;"></textarea>
				<input type="submit" value="확인">
			</form>
		</div>
		<form>
			
		</form>
			
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
						   "images/korea5.jpg",
						   "images/korea1.jpg" ]
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