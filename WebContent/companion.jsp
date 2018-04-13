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
 .title {
	width: 520px;
	height: 25px;
}
.serve {
	width: 110px;
	height: 25px;
}
.message {
	 overflow: hidden;
	width: 520px;
	height: 25px; 
	font-size: 15px;
} 

</style>
<script type="text/javascript">
var onoff = 0;
 $(document).on('click', '.postnums', function(){
	var post_num = $(this).attr("id");
	var send_data = "post_num="+post_num;  
	console.log("send_data : " + send_data);
	console.log("postnum : " + post_num);
	var trpost = "#z"+post_num;
	   console.log("trpost : " + trpost);
	   
		$.getJSON('companionajax.jsp', send_data, function(data,status) {
			if(onoff == 0){
				$.each(data,function(){
					var date = new Date();
					 var str = 
						('<tr class= "send_data"><td><pre class="message">'+this.message+'</pre></td><td>'+this.nickname+'</td><td>'+this.status+'</td><td>'+this.applicants_date+'</td></tr>'); 
					 $(trpost).after(str);
				});
				onoff = onoff + 1;
			}else{
				$(".send_data").remove();
				onoff = onoff - 1;
			}
			
		});
});
</script>
</head>
<body>
	<div id="center">
		<%@ include file="sidemenu.jsp"%>
		<div id="main">
			<h1>내가 쓴 동행 게시물</h1>
			<div id="mainsecond1">
					<table border="1" class="mytable">
						<tr>
							<th class="title">제목</th>
							<th class="serve">닉네임</th>
							<th class="serve">동행</th>
							<th class="serve">등록일자</th>
						</tr>
						<c:forEach var="list" items="${list }" >
							<tr id="z${list.post_num }"> 
								<td class="postnums" id='${list.post_num }'>${list.title}</td>
								<td>${list.nickname } </td>
								<td>${list.current_num } / ${list.minimum_num } </td>
								<td>${list.post_date }</td>
							</tr>
						</c:forEach>
					</table>
			</div>
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