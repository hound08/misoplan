<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<style type="text/css">
		html{
			height: 100%;
			width: 100%;
		}
		#test {
		padding-top: 100px;
		margin: 0 auto;
		border: 1px solid;
		width: 1200px;
		height: 600px;
	}
	#main {
		width: 1200px;
		height: 600px;
		border: 1px solid;
	}
	#btnlist {
	 	/* position: absolute; */
	 	position:relative;
		top: -200px;
		right: -260px; 
	}
	#btnlist li {
		float: left;
		border: 1px solid;
		width: 100px;
		height: 100px;
		margin-right: 50px;
		text-align: center;
	}
	#btnlist li a{
		color: white;
	}
	</style>
</head>
<body>
	<div id="test">
		<video id="main" src="images/aurora.mp4" loop="loop" autoplay="autoplay" ></video>
			<ul id="btnlist">
				<li><a class="btn" href="myInfoConfirmForm.do?email=${email }">개인 정보 수정</a></li>
				<li><a class="btn" href="scheduleForm.do?email=${email }">내 계획</a></li>
				<li><a class="btn" href="myWishListForm.do?email=${email }">찜 List</a></li>
				<li><a class="btn" href="companionForm.do?email=${email }">동행</a></li>
				<c:if test="${admin == 1}">
					<li><a class="btn" href="adminConfirmForm.do">관리자</a></li>
				</c:if>
			</ul>
	</div>
</body>
</html>