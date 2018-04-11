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
	width: 100%;
	height: 150px;
	border: solid;
	display: flex;
	left: 1em;
 	align-items: center; 
 	background-color: #EAEAEA;
}
.post-header-img {
	height: 120px;
	width: 120px;
	background-image: url("${profile_url}");
	border-radius: 50%;
	background-size: 100% 100%;
	border: solid;
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
			제목: ${board.title }<br/>
			작성자: ${board.nickname } 등록일: ${board.reg_date }<br/>
			
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