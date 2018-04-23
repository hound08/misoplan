<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<meta charset='utf-8'>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/styles.css">
<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
<script src="js/script.js"></script>
<title>사이드 메뉴</title>
	<style type="text/css">
		*{ margin:0; padding:0; }
		li{ list-style:none; }
		img {vertical-align:bottom;}
		#sidemenu  {
				margin-top: 60px;
				background-color: #f0f0f0;
				border-radius: 25px;
				width: 200px;
				height: 400px;
				float: left;
				margin: 20px;
				padding-bottom: 35px;
			}
		#sidemenu .sidemenus{
				text-align: center;
				margin : 40px;
				font-size: 23px;
				
			}
		.sidemenus .a {
				color: black;
		}
		
	::-webkit-scrollbar-thumb {
        background: #39A2D8; 
 	    border-radius: 10px;
	}
	</style>

</head>
<body>
	<%
		MemberDao dao = MemberDao.getInstance();
		session.setAttribute("admin", dao.selectAdminChk((String)session.getAttribute("email")));
	%>
	<div id='cssmenu'>
		<ul>
		   
		   <li class='last'><a href='myInfoConfirmForm.do?email=${email }'><span>내 정보</span></a></li>
		   <li class='last'><a href='scheduleForm.do?email=${email }'><span>내 일정</span></a></li>
		   <li class='last'><a href='myWishListForm.do?email=${email }'><span>찜 리스트</span></a></li>
		   <li class='last'><a href='companionForm.do?email=${email }'><span>동행</span></a></li>
		   <c:if test="${admin == 1}">
		   <li class='has-sub'><a href='adminConfirmForm.do'><span>관리자</span></a>
		      <ul>
		         <li><a href='adminMainForm.do'><span>회원 관리</span></a></li>
		         <li class='last'><a href='adminSubjectForm.do'><span>게시물 관리</span></a></li>
		      </ul>
		   </li>
		   </c:if>
		   <li class='margin' style="height: 500px;"><a style="height: 463.2px;"><span style="height: 443.2px;"></span></a></li>
		</ul>
	</div>
	
	
	<%-- <div class="sidemenus" id="sidemenus">
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
		</div> --%>
</body>
</html>