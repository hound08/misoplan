<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>사이드 메뉴</title>
	<style type="text/css">
		*{ margin:0; padding:0; }
		
		.sidemenus{
			margin-top: 20px;
			width: 150px;
			height: 700px;
			background-color: #39A2D8; 
			float: left;
		}
		.sidemenu{
			width: 150px;
			height: 10%;
			clear: both;
			border-bottom: 1px solid white;
		}
		.a{
			text-decoration: none;
			text-align: center;
			color: white;
			font-size: 20px;
		}
		.side-menu-myinfo {
			width: 30px;
			height: 30px;
			background: url("images/mypage-cutout.png");
			background-size: 100% 100%;
			float: left;
		}
		.side-menu-myplan {
			width: 30px;
			height: 30px;
			background: url("images/planner-cutout.png");
			background-size: 100% 100%;
			float: left;
		}
		.side-menu-wishlist {
			width: 30px;
			height: 30px;
			background: url("images/star-cutout.png");
			background-size: 100% 100%;
			float: left;
		}
		.side-menu-accompany {
			width: 30px;
			height: 30px;
			background: url("images/shakehands-cutout.png");
			background-size: 100% 100%;
			float: left;
		}
		.side-menu-text{
			float: left;			
		}
	</style>
	
</head>
<body>
	<%
		MemberDao dao = MemberDao.getInstance();
		session.setAttribute("admin", dao.selectAdminChk((String)session.getAttribute("email")));
	%>
	<div class="sidemenus" id="sidemenus">
			<div class="sidemenu" id="side-menu-myinfo">
				<div class="side-menu-myinfo"></div>
				<div class="side-menu-text">
					<a href="myInfoConfirmForm.do?email=${email }" class="a">내 정보</a>
				</div>
				</div>
			<div class="sidemenu" id="side-menu-myplan">
				<div class="side-menu-myplan"></div>
				<div class="side-menu-text">
					<a href="scheduleForm.do?email=${email }" class="a">내 계획</a>
				</div>
			</div>
			<div class="sidemenu" id="side-menu-wishlist">
				<div class="side-menu-wishlist"></div>
				<div class="side-menu-text">
					<a href="myWishListForm.do?email=${email }" class="a">리스트</a>
				</div>
			</div>
			<div class="sidemenu" id="side-menu-accompany">
				<div class="side-menu-accompany"></div>
				<div class="side-menu-text">
					<a href="companionForm.do?email=${email }" class="a">동행</a>					
				</div>
			</div>
			<c:if test="${admin == 1}">
				<div class="list_admin" id="side-menu-admin"><a href="adminConfirmForm.do" id="b">관리자 메뉴</a></div>
				<div>
					<div class="list_admin_sub"><a href="adminMainForm.do" id="a">회원 관리</a></div>
					<div class="list_admin_sub"><a href="adminSubjectForm.do" id="a">글 관리</a></div>
				</div>
			</c:if>
		</div>
</body>
</html>