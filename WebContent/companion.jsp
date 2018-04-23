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
	margin: 0px auto;
	width: 1200px;
	height: 100%;
}

#main {
	width: 930px;
	text-align: center;
	float: left;
}

#main h1 {
	margin: 10px 0px;
}


#mainsecond1{
	width: 420px;
	float: left;
}
#mainsecond1 div {
	margin: 0 auto;
	margin-bottom: 10px;
}
#mainsecond2 {
	width: 420px;
	height: 600px;
	float: right;
	margin-right: 60px;
}
#mainsecond2 div {
}
.card {
	width: 390px;
	height: 150px;
	border-radius:10px;
	background-color: #f5f6f8;
	padding: 10px 0px 10px 0px;
	margin-bottom: 20px;
	margin-right: 20px;
	box-shadow: 3px 3px 8px 1px #000;
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
.m1title {
	width: 150px;
	text-align: left;
}
.m1 {
	width: 150px;
	text-align: left;
}
.m2title {
	width: 220px;
	overflow: hidden;
	display: inline-block;
}
.m2 {
	width: 220px;
	overflow: hidden;
}
.mess {
	width: 320px;
	height: 100px;
	 overflow: hidden;
	 background-color: white;
	 border-right: 20px;
}
.cardbox {
	width: 350px;
	height: 25px;
	overflow: hidden;
	background-color: #c8ccd0;
	margin: 0 auto;
	border-right: 20px;
	margin-bottom: 5px;
}
.cardbox:HOVER{
	widows: 350px;
	height: 180px;
	background-color: #c8ccd0;
	border-radius:20px;
}
.cardbox table {
	margin: 0 auto;
}
#sidemenu{
	width: 200px;
	height: 400px;
	float: right;
}
#menu1 {
	height: 280px;
	background-color: #f5f6f8;
	border-radius:20px;
	margin-bottom: 20px;
	box-shadow: 3px 3px 8px 1px #000;
}
#menu2 {
	height: 280px;
	background-color: #f5f6f8;
	border-radius:20px;
	box-shadow: 3px 3px 8px 1px #000;
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
	width: 40px;
	height: 40px;
	border-radius:20px;
}
.isclosed{
	width : 40px;
	height : 30px;
}
.ok_second_box{
	width: 380px;
	margin: 0 auto;
}
.ok_second_m1{
	width: 80px;
}
.ok_second_m1 img {
	float: right;
}
.ok_second_m2{
	width: 130px;
	text-align: center;
}
.postnums:HOVER {
	-webkit-opacity: 0.5;
}
.post_title:HOVER {
	-webkit-opacity: 0.5;
}
.title {
	overflow: hidden;
}

</style>
<script type="text/javascript">
var onoff = 0;
var is_close = 0;
 $(document).on('click', '.postnums', function(){
	var post_num = $(this).attr("id");
	var send_data = "post_num="+post_num;  
	console.log("send_data : " + send_data);
	console.log("postnum : " + post_num);
	var tdpost = "#z"+post_num;
	var divpost = "#t"+post_num;
	   console.log("tdpost : " + tdpost);
			if(onoff == 0){
	  		 $('#main').append('<div id="mainsecond2"><div id="menu1"> 수락 목록 </div><div id="menu2"> 동행 신청자 목록</div></div>')
	 	$.getJSON('companionajax2.jsp', send_data,function(data,status) {
	 		$.each(data,function(){
				var kakao_id = this.kakao_id;
				var str = '<div class="ok_second_box"><table class="oktable"><tr><td class="ok_second_m1"><img class="appimg"src='+ this.profile_url+ '></td><td class="ok_second_m2">'+this.nickname+'</td><td class="ok_second_m1">'+this.kakao_id+'</td><td class="ok_second_m1">'+this.num_people+' 인</td></tr></table></div>';
				   $('#menu1').append(str);
	 		});
	 		
	 	});
		$.getJSON('companionajax.jsp', send_data, function(data,status) {
				$.each(data,function(){
					var date = new Date();
						var kakao = this.kakao_id;
						var postnum = this.post_num;
						var status = this.status;
						var is_closed = this.is_closed;
						var kakao_id = "#"+ kakao ;
						console.log("status :::::::: " + status);
						console.log("is_closed :::::::: " + is_closed);
				 		var str = 
							'<div class="cardbox"><table>'+
							'<tr><td id="nickname" class="second_m1" postnum='+postnum+'>'+this.nickname+'</td><td class="second_m2" id="'+kakao+'">'+
							
							'</td></tr>'+
							'<tr><td colspan="2" class="second_m1"><pre class="mess">'+  this.message +'</pre></td></tr>'+
							'<tr><td class="second_m1">인원수 : </td><td class="second_m2" data='+this.num_people+'>'+ this.num_people+'</td></tr>'+
							'<tr><td class="second_m1">신청날짜 : </td><td class="second_m2">'+this.applicants_date+'</td></tr>'
							+'</table></div>';
							
						var str1 = '<button id="accept'+postnum+'" class="yesbtnimg" aaa="1"><img class="yn" src="images/yes.png"></button> <button id="accept'+postnum+'" class="nobtnimg" aaa="2"><img class="yn" src="images/no.png"></button>';
					/* $('#card2').after(str2);  */
					$('#menu2').append(str);
					if(is_closed ==0){
						
						if(status == 0){
							$(kakao_id).append(str1);
						}
					} 
					
					/* '<button id="accept'+postnum+'" class="yesbtnimg" aaa="1"><img class="yn" src="images/yes.png"></button> <button id="accept'+postnum+'" class="nobtnimg" aaa="2"><img class="yn" src="images/no.png"></button>'+ */
					
					
				});
				onoff = onoff+1;
		});
			}else{
				  $('#mainsecond2').remove(); 
				 onoff = onoff-1;  
			}
});
 
 $(document).on('click', '.yesbtnimg', function(){
	 $this = $(this);
	 var classname = $(this).attr('class');
	 var status = $this.attr('aaa');
	 console.log("$this : " + classname);
	 var nickname = $this.parent().prevAll('#nickname').text();
	 var postnum = $this.parent().prevAll('#nickname').attr('postnum');
	 var num_people = $this.parent().parent().next().next().children().next().attr('data');
	 var current_num = $()
	 console.log("num_people = " + num_people);
	 
	 var status_data = "status="+status;
	 var nickname_data = "nickname="+nickname;
	 
	 var postnum_data = "postnum="+postnum;
	 
	 var xpost_num = "#x"+postnum;
	 console.log("xpost_num = " + xpost_num);
	 var senddata = {
		"status":status, 
		"nickname":nickname,
	 	"postnum":postnum,
	 	"num_people":num_people
	 };
	 var acceptId = $this.attr('id');
	 	//console.log(acceptId);
	 acceptId = acceptId.substr(6, acceptId.length);
	 	//console.log(acceptId);
	 searchId = "#accomStatus"+acceptId;
	 console.log("searchId : " + searchId);
	 var text = $(searchId).text();
	 console.log("text : " + text);
	 text = text.replace(/ /gi,"");
	 console.log("parsed text : " + text);
	 
	 var textArr = text.split("/");  
	 var curr = textArr[0];
	 var max = textArr[1];
	 console.log("curr : " + curr );
	 console.log("max :" + max);
	 curr *= 1;
	 max *= 1;
			 if(status == 1){
		/*  if(curr < max){ */
				 
		 	$.getJSON('companionupdateajax.jsp', senddata, function(data,status){
				 $.each(data,function(){
						/* var date = new Date(); */
						var kakao = this.kakao_id;
						var kakao_to = "#"+ kakao;
						var str = '<div class="ok_second_box"><table class="oktable"><tr><td class="ok_second_m1"><img class="appimg"src='+ this.profile_url+ '></td><td class="ok_second_m2">'+this.nickname+'</td><td class="ok_second_m1">'+this.kakao_id+'</td><td class="ok_second_m1">'+this.num_people+' 인</td></tr></table></div>';
						   $('#menu1').append(str);
						   $(xpost_num).html("");
						   $(xpost_num).append('<td class="m1"> 현재인원 : '+this.current_num+'</td>');
						   $(kakao_to).remove();
				 });
			 });
		 /* } else {
			 alert("모집 인원이 초과햇습니다.");
			 }
		  */
			 }
			 /* $(post_num).html($(post_num).html()); */
 });
 $(document).on('click', '.nobtnimg', function(){
	 $this = $(this);
	 var classname = $(this).attr('class');
	 var status = $this.attr('aaa');
	 console.log("$this : " + classname);
	 var nickname = $this.parent().prevAll('#nickname').text();
	 var postnum = $this.parent().prevAll('#nickname').attr('postnum');
	 var num_people = $this.parent().parent().next().next().children().next().attr('data');
	 console.log("num_people = " + num_people);
	 var xpost_num = "#x"+postnum;
	 console.log("xpost_num = " + xpost_num);
	 
	 var status_data = "status="+status;
	 var nickname_data = "nickname="+nickname;
	 var postnum_data = "postnum="+postnum;
	 
	 var senddata = {
		"status":status, 
		"nickname":nickname,
	 	"postnum":postnum,
	 	"num_people":num_people
	 };
	 $.getJSON('companionupdateajax2.jsp', senddata, function(data,status){
		 $.each(data,function(){
		    var kakao = this.kakao_id;
		    var kakao_to = "#"+kakao;
				    $(kakao_to).remove();  
				console.log("kakao = " + kakao);
				console.log("current_num = " + this.current_num);
				   /* $(xpost_num).html("");
				   $(xpost_num).append('<td class="m1"> 현재인원 : '+this.current_num+'</td>'); */ 
		 });
	 });
 });
 
 
function isclosed(post_num){
	console.log("마감 버튼 클릭 ");
	var ispost_num = "#is"+ post_num;
	console.log("ispost_num = " + ispost_num);
	//postnum이 필요하고,
	$.ajax({
		url : 'companionisclose.jsp',
		type : 'get',
		data : {
			post_num : post_num
		},
		success : function() {
			console.log("나 돌아 왓다!!! ");
			$(ispost_num).remove();
			$('.yesbtnimg').remove();
			$('.nobtnimg').remove();
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			alert("request : " + XMLHttpRequest);
			alert("Status: " + textStatus);
			alert("Error: " + errorThrown);
		}
	});
}
/* function companionview(post_num) {
	console.log("view ");
	$.ajax({
		url : 'viewActionAB.do',
		type : 'get',
		data : {
			post_num : post_num
		}
	});
} */

</script>
</head>
<body>
	<div id="center">
		<%@ include file="sidemenu.jsp"%>
		<a href="companionForm.do?email=${email }">내 게시물</a> | <a href="companionForm2.do?email=${email }"> 내가 신청한 동행</a>
		<div id="main">
			<h1>내 동행 List</h1>
			<div id="mainsecond1">
						<c:forEach var="list" items="${list }" >
							<div class="card" id="z${list.post_num }">
								<table >
									<tr align="center" class="post_title" <%-- onclick="companionview(${list.post_num})" --%>>
										<td class="m1title">제목 : </td><td class="m2title"><a class="title" href="viewActionAB.do?post_num=${list.post_num }"><pre class="title" width="300px">${list.title}</pre></a></td>
									</tr>
									<tr align="center">
										<td class="m1">닉네임 : </td><td class="m2">${list.nickname }</td>
									</tr>
									<tr align="center" class="postnums" id='${list.post_num }'>
										<td class="m1" id="x${list.post_num }">현재인원 : ${list.current_num } 명</td><td id="accomStatus${list.post_num}">최소 인원 : ${list.minimum_num } 명</td>
									</tr>
									<tr align="center"  >
										<td class="m1">등록일자 : </td><td class="m2">${list.post_date }
												<c:if test="${list.is_closed  == 0}">
													<button class = "isclosed" id = "is${list.post_num }" onclick = "isclosed(${list.post_num})"> 마감 </button>
												</c:if>
										</td>
									</tr>
								</table>
							</div>
						</c:forEach>
			</div>
		</div>
	</div>
</body>