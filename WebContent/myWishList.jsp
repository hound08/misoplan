<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="header.jsp" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<title>찜 리스트</title>
		<style type="text/css">
			#center {
				border: 1px solid red;
				margin: 0px auto;
				width: 1200px;
			}
			#main {
					width: 930px;
					border: 3px solid green;
					text-align: center;
					float: left;
					margin-top: 20px;
				}
			#main h1 {
					margin: 20px 0px;
			}
			 #myinfo {
				border: 1px solid green;
			}
			
			.card {
				float: left;
				width: 290px;
				height: 200px;
				border: 1px solid;
				margin-right:10px;
			}
			.cardhead  img{
				border-radius: 15px;
				width: 100%;
				height: 150px;
			}
			.cardbody {
				border: 1px solid yellow;
				height: 45px;
			}
			
			.pagination {
				clear: both;
			    justify-content: center;
			    margin: 50px 0 35px 0;
			}
						
			.pagination a {
				color:black;
			    padding: 8px 16px;
			    font-size:20px;
			    text-decoration: none;
			}
			
			.pagination a.active {
			    background-color: #4CAF50;
			    color: white;
			}
			
			.pagination a:hover:not(.active) {
			    background-color: #ddd;
			    border-radius: 5px;
			}
		</style>
	</head>
	<body>
		<div id="center">
			<%@ include file="sidemenu.jsp" %>
			<div id="main">
				<h1>나의 찜 리스트</h1>
				<div id="myinfo">
				<form action="myWishListPro.do">
					<c:forEach var="list" items="${list }">
						<div class="card">
							<div class="cardhead">
								<img alt="tour_img" src="${list.img_src }">
								<input type="checkbox" name="wishlist" value="${list.contendtid }">
							</div>
							<div class="cardbody">
								<a href="#">${list.tour_name } </a>
							</div>
						</div>
					</c:forEach>
					<input type="submit" value="삭제">
					<input type="reset" value="취소">
				</form>
							<div class="pagination">
										<a href="#">&laquo;</a> 
										<a href="#" class="active">1</a> 
										<a href="#">2</a> 
										<a href="#">3</a> 
										<a href="#" >4</a> 
										<a href="#">5</a> 
										<a href="#">&raquo;</a>
							</div>
				</div>
			</div>
		</div>
	</body>
</html>