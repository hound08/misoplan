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
}

#main h1 {
	margin: 10px 0px;
}


#mainsecond1{
	margin: 20px;
	border: 1px solid;
	width: 420px;
	float: left;
}
#mainsecond1 div {
	margin: 0 auto;
	margin-top: 10px;
	margin-bottom: 10px;
}
#mainsecond2 {
	margin: 20px;
	border: 1px solid;
	width: 420px;
	height: 600px;
	float: right;
}
#mainsecond2 div {
	margin: 0 auto;
}
.card {
	width: 390px;
	height: 150px;
	border: 1px solid;
	border-radius:10px;
	background-color: yellow;
	padding: 10px 0px 10px 0px;
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
	width: 380px;
	background-color: blue;
}
.divpost table {
}

.cardbox {
	width: 350px;
	height: 25px;
	overflow: hidden;
	background-color: yellow;
}
.cardbox:HOVER{
	widows: 350px;
	height: 240px;
	background-color: white;
}
#sidemenu{
	width: 200px;
	height: 400px;
	border: 1px solid;
	float: right;
}
#menu1 {
	height: 280px;
	border: 1px solid;
}
#menu2 {
	border: 1px solid;
}
.yn {
	width: 25px;
	height: 20px;
}
.btnimg{
	cursor: pointer;
	background-color: transparent;
	border: none;
}
.appimg {
	width: 20px;
	height: 20px;
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
	var tdpost = "#z"+post_num;
	var divpost = "#t"+post_num;
	   console.log("tdpost : " + tdpost);
	var senddata = {
			"status":status, 
		 	"post_num":postnum
		 };   
	   
	 	$.getJSON('companionajax2.jsp', data,function() {
			
		
	 		
	 	});
	   
	   
		$.getJSON('companionajax.jsp', send_data, function(data,status) {
	  		 $('#main').append('<div id="mainsecond2"><div id="menu1"></div><div id="menu2"></div></div>')
			if(onoff == 0){
				$.each(data,function(){
					var date = new Date();
						var kakao = this.kakao_id;
						var postnum = this.post_num;
				 		var str = 
							'<div class="cardbox"><table>'+
							'<tr><td id="nickname" postnum='+postnum+'>'+this.nickname+'</td><td id="'+kakao+'"><button class="btnimg" aaa="1"><img class="yn" src="images/yes.png"></button> <button class="btnimg" aaa="2"><img class="yn" src="images/no.png"></button></td></tr>'+
							'<tr><td colspan="2"><pre class="mess">'+  this.message +'</pre></td></tr>'+
							'<tr><td>인원수 : </td><td>'+ this.num_people+'</td></tr>'+
							'<tr><td>신청날짜 : </td><td>'+this.applicants_date+'</td></tr>'
							+'</table></div>';
					/* $('#card2').after(str2);  */
					$('#menu2').append(str); 
				});
				onoff = onoff+1;
			}else{
				 $('#mainsecond2').remove(); 
				 onoff = onoff-1; 
			}
		});
});
 
 $(document).on('click', '.btnimg', function(){
	 $this = $(this);
	 var classname = $(this).attr('class');
	 var status = $this.attr('aaa');
	 console.log("$this : " + classname);
	 var nickname = $this.parent().prevAll('#nickname').text();
	 var postnum = $this.parent().prevAll('#nickname').attr('postnum');
	 
	 var status_data = "status="+status;
	 var nickname_data = "nickname="+nickname;
	 var postnum_data = "postnum="+postnum;
	 
	 var senddata = {
		"status":status, 
		"nickname":nickname,
	 	"postnum":postnum
	 };
	  
	 console.log("status : " + status);
	 console.log("nickname : " + nickname);
	 console.log("postnum : " + postnum);
	 
	 $.getJSON('companionupdateajax.jsp', senddata, function(data,status){
		/*  var item = data[0];
		 console.log("item : " + item);
		 
		 var profile_url = item.profile_url;
		 console.log("url : " + profile_url);
		 var nickname = item.nickname;
		 console.log("nickname : " + nickname);
		 var kakao_id = item.kakao_id;
		 console.log("kakao_id : " + kakao_id);
		 var str = '<div></div>';
		   $('#menu1').append(str);  */
		 $.each(data,function(){
				var date = new Date();
				var str = '<div><table><tr><td><img class="appimg"src='+ this.profile_url+ '></td><td>'+this.nickname+'</td><td>'+this.kakao_id+'</td></tr></table></div>';
				   $('#menu1').append(str);
		 });
	 });
	 
	 
 });
	 
</script>
</head>
<body>
	<div id="center">
		<%@ include file="sidemenu.jsp"%>
		<a href="companionForm.do?email=${email }">내 게시물</a> | <a href="companionForm2.do?email=${email }"> 내가 신청한 동행</a>
		<div id="main">
			<h1>내가 쓴 동행 게시물</h1>
			<div id="mainsecond1">
						<c:forEach var="list" items="${list }" >
							<div class="card" id="z${list.post_num }">
								<table >
									<tr align="center">
										<td class="m1">제목 : </td><td class="m2"><pre class="title" width="300px">${list.title}</pre></td>
									</tr>
									<tr align="center">
										<td class="m1">닉네임 : </td><td class="m2">${list.nickname }</td>
									</tr>
									<tr align="center" class="postnums" id='${list.post_num }'>
										<td class="m1">동행상태 : </td><td>${list.current_num } / ${list.minimum_num }</td>
									</tr>
									<tr align="center"  >
										<td class="m1">등록일자 : </td><td class="m2">${list.post_date }</td>
									</tr>
								</table>
							</div>
						</c:forEach>
			</div>
			<!-- <div id="mainsecond2">
			
			
			</div> -->
		</div>
	</div>
</body>