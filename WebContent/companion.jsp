<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ include file="header.jsp" %>
<!DOCTYPE html >
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>동행 구하기</title>
		<style type="text/css">
			#center {
				border: 1px solid red;
				margin: 0px auto;
				width: 1000px;
				height: 100%;
			}
			
			#main {
					width: 730px;
					border: 3px solid green;
					text-align: center;
					float: left;
					margin-top: 20px;
				}
			#main h1 {
					margin: 20px 0px;
			}
			.companions table {
				margin: 0 auto;
			}
			
			.companions table td { 
				text-align: left; 
				padding: 10px;
			}
			#aa {
				width: 500px;
			}
			.bb {
				width: 120px;
			}
						
			.pagination {
			    display: flex;
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
			.companions h1 {
				margin-bottom: 40px;
			}
		</style>
	</head>
	<body>
		
		<div id="center">
			<%@ include file="sidemenu.jsp" %>
			<div id="main">
				<h1>동행 구하기</h1>
				<div id="myinfo">
					<div id="info">
						<table border="1">
								<tr>
									<th id="aa">제목 </th> <th class="bb">닉네임</th><th class="bb">동행</th><th class="bb">등록일자</th>
								 </tr>
								<tr>
									<td>동해에서 4월21일 저녘식사 하실분 찾습니다</td><td>장철우</td><td>1 / 10</td><td>2018.04.10</td>
								</tr>
								<tr>
									<td>  ㄴ 같이 저녘 먹어요</td><td>강형묵</td><td>수락 | 거절</td><td>2018.04.10</td>
								</tr>
								<tr>
									<td>  ㄴ 같이 술 한잔 해요</td><td>수연</td><td>수락 | 거절</td><td>2018.04.11</td>
								</tr>
								<tr>
									<td>메스에서 4월12일 클럽가실분</td><td>남상훈</td><td>3 / 10</td><td>2018.04.10</td>
								</tr>
								<tr>
									<td>  ㄴ 가즈아!</td><td>강형묵</td><td>카톡 : aaa</td><td>2018.04.10</td>
								</tr>
								<tr>
									<td>  ㄴ 뿌루루</td><td>장철우</td><td>카톡 : bbb</td><td>2018.04.11</td>
								</tr>
							</table>
							<div class="pagination">
								<a href="#">&laquo;</a> 
								<a href="#" class="active">1</a> 
								<a href="#">2</a> 
								<a href="#">3</a> 
								<a href="#" >4</a> 
								<a href="#">5</a> 
								<a href="#">&raquo;</a>
							</div>
							<h1>내가 신청한 동행</h1>
							<table border="1">
								<tr>
									<th id="aa">제목 </th> <th class="bb">닉네임</th><th class="bb">상태</th><th class="bb">등록일자</th>
								 </tr>
								<tr>
									<td>동해에서 4월21일 저녘식사 하실분 찾습니다</td><td>장철우</td><td>대기</td><td>2018.04.10</td>
								</tr>
								<tr>
									<td>메스에서 4월12일 클럽가실분</td><td>장철우</td><td>수락</td><td>2018.04.10</td>
								</tr>
							</table>
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