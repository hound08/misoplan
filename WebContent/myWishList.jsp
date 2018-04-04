<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="header.jsp" %>
<!DOCTYPE html >
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
			 #info {
				border: 1px solid green;
			}
			 #info .wishlist{
				float: left;
				margin: 15px;
				border: 1px solid red;
				border-radius: 15px;
				width: 200px;               /*  이미지 사이즈 */
				height: 150px;
			}
			.mainimage {
				width: 150px;
				height: 120px;
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
					<div id="info">
						<div class="wishlist">
							<img class="mainimage" alt="accompanyimage" src="images/accompany.jpg" style="width: 100%">
							<p class="menutitle" >동해</p>
							
						</div>
						<div class="wishlist">
							<img class="mainimage" alt="accompanyimage" src="images/accompany.jpg" style="width: 100%">
							<p class="menutitle" >동해</p>
						</div>
						 <div class="wishlist">
							<img class="mainimage" alt="accompanyimage" src="images/accompany.jpg" style="width: 100%">
							<p class="menutitle" >동해</p>
						</div>
						<div class="wishlist">
							<img class="mainimage" alt="accompanyimage" src="images/accompany.jpg" style="width: 100%">
							<p class="menutitle" >동해</p>
						</div>
						<div class="wishlist">
							<img class="mainimage" alt="accompanyimage" src="images/accompany.jpg" style="width: 100%">
							<p class="menutitle" >동해</p>
						</div>
						<div class="wishlist">
							<img class="mainimage" alt="accompanyimage" src="images/accompany.jpg" style="width: 100%">
							<p class="menutitle" >동해</p>
						</div>
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
		</div>
	</body>
</html>