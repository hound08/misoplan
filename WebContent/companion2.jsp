<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<title>동행 구하기</title>
<style type="text/css">
#center {
	border: 1px solid red;
	margin: 0px auto;
	width: 1200px;
	height: 100%;
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


#mainsecond1{
	margin-bottom: 100px;
}
#mainsecond1 div {
	float: left;
}
.card {
	width: 400px;
	height: 100px;
	border: 1px solid;
	border-radius:0px;
	background-color: yellow;
	padding: 10px 0px 40px 0px;
	margin-bottom: 20px;
	margin-right: 20px;
}
.card table {
		font-size: 18px;
		margin: 0 auto;
		border-collapse:collapse;
		cellpadding: 5px;
}
.card table tr td{
	padding: 5px;
}
.m1 {
	width: 90px;
}
.m2 {
	width: 220px;
}
.mess {
	width: 320px;
	height: 100px;
	 overflow: hidden;
}
/* .card2 {
	width: 400px;
	height: 280px;
	border: 1px solid;
	border-radius:0px;
	background-color: yellow;
	padding: 10px 0px 40px 0px;
	margin-bottom: 20px;
	margin-right: 20px;
} */
.divpost {
	width: 400px;
	background-color: blue;
}
.divpost table {
}

.cardbox {
	width: 350px;
	height: 25px;
	overflow: hidden;
}
.cardbox:HOVER{
	widows: 350px;
	height: 240px;
	background-color: white;
}
#mainsecond2 {
	clear: both;
}

</style>
<script type="text/javascript">
var onoff = 0;
 $(document).on('click', '.postnums', function(){
	 alert("작동한다");
	var post_num = $(this).attr("id");
	var send_data = "post_num="+post_num;  
	console.log("send_data : " + send_data);
	console.log("postnum : " + post_num);
	var trpost = "#z"+post_num;
	var divpost = "#t"+post_num;
	   console.log("trpost : " + trpost);
		$.getJSON('companionajax.jsp', send_data, function(data,status) {
			if(onoff == 0){
				$.each(data,function(){
					var date = new Date();
					/*  var str = 
						('<tr class= "send_data"><td><pre class="message">'
								+this.message+'</pre></td><td>'+this.nickname+'</td><td>'+this.status+'</td><td>'+this.applicants_date+'</td></tr>'); */ 
						
				 		var str = 
							'<div class="cardbox"><table>'+
							'<tr><td>'+this.nickname+'</td><td>'+ this.kakao_id+'</td></tr>'+
							'<tr><td colspan="2"><pre class="mess">'+  this.message +'</pre></td></tr>'+
							'<tr><td>인원수 : </td><td>'+ this.num_people+'</td></tr>'+
							'<tr><td>신청날짜 : </td><td>'+this.applicants_date+'</td></tr>'
							+'</table></div>';
					/* $('#card2').after(str2);  */
					$(divpost).append(str); 
				});
				onoff = onoff + 1;
			}else{
				 $(divpost).remove(); 
				 onoff = onoff - 1; 
			}
			
		});
});
</script>
</head>
<body>
	<div id="center">
		<%@ include file="sidemenu.jsp"%>
		<a href="companionForm.do?email=${email }">내 게시물</a> | <a href="#"> 내가 신청한 동행</a>
		<div id="main">
				<div id="mainsecond2">
					<h1>내가 시청한 동행</h1>
					<table border="1" class="mytable">
						<tr>
							<th class="title">제목</th>
							<th class="serve">닉네임</th>
							<th class="serve">동행상태</th>
							<th class="serve">등록일자</th>
						</tr>
						<c:forEach var="myapplist" items="${myapplist }" >
							<tr> 
								<td><pre class="message">${myapplist.message}</pre></td>
								<td>${myapplist.nickname } </td>
								<td>${myapplist.status }</td>
								<td>${myapplist.applicants_date }</td>
							</tr>
						</c:forEach>
					</table>
					
					
				</div>
		</div>
	</div>
</body>