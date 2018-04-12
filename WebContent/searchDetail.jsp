<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="js/jquery.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBnkgSC0SDpUzIBHXo7NrQKEnt0T0CpQK8&callback=initMap">
</script>
<script type="text/javascript">
	window.onload = function(){
		var contentTypeId = $("#contentTypeId").val();
		var contendtid = $("#contendtid").val();
		/* alert("contentTypeId = " + contentTypeId);
		alert("contendtid = " + contendtid); */
		
		$.ajax({
			url : 'Detail1',
			type : 'get',
			dataType : 'json',
			data : {
				typeId 	: contentTypeId,
				id		: contendtid
			},
			success : function(data) {
				var myItem 		= data.response.body.items.item;
				var img 		= myItem.firstimage;
				var addr		= myItem.addr1;
				var tel			= myItem.tel;
				var zipcode		= myItem.zipcode;
				var title 		= myItem.title;		//touristName
				var overview	= myItem.overview;
				mapx		= myItem.mapx;
				mapy		= myItem.mapy;
				
				$("#touristName").append('<h2>' + title +'<h2>');
				$("#touristImg").append(
						'<img src = ' + img + '  alt="" >'
						);
				$("#summary").append(
						'<ul class="txtCon" >'
						+ '<li> <strong> 우편 번호 </strong>'
						+ '  :  '
						+ zipcode
						+ '</li>'
						+ '<li> <strong> 전화 번호 </strong>'
						+ '  :  '
						+ tel
						+ '</li>'
						+ '<li> <strong> 주 소 </strong>'
						+ '  :  '
						+ addr
						+ '</li>'
						+ '</ul>'
				);
				$("#overview").append(
						'<strong class = "tit">개요</strong>'
						+ '<p id = "con" class = "con" >'
						+ overview
						+ '</p>' 
				);
				$("#hidden").append(
						'<input type = "text" value = "'
						+title
						+'" id = "title">' 
						
				);
				
				
				
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert("request : " + XMLHttpRequest);
				alert("Status: " + textStatus);
				alert("Error: " + errorThrown);
			}
		});
	
	};
		function initMap(){
			var mapx = $("#mapx").val();
			var mapy = $("#mapy").val();
			var mapLocation = new google.maps.LatLng(mapy, mapx); // 지도에서 가운데로 위치할 위도와 경도
			//var mapLocation = new google.maps.LatLng('37.51', '127.03');
			var mapOptions = {
			          center: mapLocation, // 지도에서 가운데로 위치할 위도와 경도(변수)
			          zoom: 15, // 지도 zoom단계
			          mapTypeId: google.maps.MapTypeId.ROADMAP
			        };
			        var map = new google.maps.Map(document.getElementById("map"), // id: map-canvas, body에 있는 div태그의 id와 같아야 함
			            mapOptions);
			        var marker = new google.maps.Marker({
			            position: mapLocation,
			            map: map
			          });
		}
	
	
	function isAddWish(type, id, email){
		/* alert("type = " + type);
		alert("id = " + id);
		alert("email = " + email); */
		var email = $("#email").val();
		var title = $("#title").val();
		var result = $("#result").val();
		/* alert("title = " + title); */
		if(email == ""){
			alert("로그인을 먼저하세요!");
		}else if(result == 1){
			alert("이미 찜 하셨어요!");
		}else{
			location.href = "addWish.do?contentTypeId="
							+ type + '&'
							+ 'contendtid='
							+ id + '&'
							+ 'email='
							+ email + '&'
							+ 'title=' 
							+ title;
		}
	}
	

	 
	
</script>

<style type="text/css">
div {
	margin: 0px auto;
}

* {
	font-family: 'NanumSquareRound', sans-serif;
}

/*전체 div  */
.section1 {
	width: 1080px;
	height: 500px;
	border: 1px solid red;
}
.search1Area {
	width: 1080px;
	height: 480px;
	margin-top: 10px;
	border: 1px solid green;
}

.touristName {
	width: 500px;
	height: 40px;
	border: 1px solid #1b5ac2;
	background: #ffffff;
	margin-bottom: 20px;
}

.wishImg{
	width : 50px;
	height : 50px;
	border : 1px solid red;
	margin-left : 20px;
	float : left;
}

.touristImg{
	width: 500px;
	height: 400px;
	border: 1px solid blue;
	margin: 1px auto;
	float : left;
	margin-left: 20px;
	margin-right: 20px;
}

/* .txtCon{
	height : 270px;
	margin: 0 0 20px 10px;
	padding-right: 10px;
} */

/* .txtCon li{
	margin-bottom: 10px;
} */

.touristImg img{
	width : 500px;
	height: 400px;
	vertical-align: middle;
	border:1px;
	
} 

.summary{
	width: 500px;
	height: 400px;
	border: 1px solid blue;
	margin: 1px auto;
	/* padding : 25px 10px 0 10px; */
	border-top: 1px solid;
	float : left;
}

/* .summary strong .tit{
	margin-bottom: 15px;
	font-size: 16px;
} */

.section2 {
	width: 1080px;
	height: 850px;
	border: 1px solid black;
}


.overview {
	width: 1000px;
	height: 300px;
	border: 1px solid pink;
	margin-top : 10px;
	margin-bottom: 10px;
	
}

.map {
	width: 1000px;
	height: 500px;
	border: 1px solid blue;
	
}



/* footer */
.footer_wrap {
	padding-top: 20px;
	width: 100%;
	background-color: #0099ff;
	margin: 20px auto 0px auto;
	width: 100%;
}

.con { padding:10px; border:1px solid #ddd; }

</style>
</head>
<body>
<% 
	String contentTypeId 	= (String)request.getAttribute("contentTypeId"); 
	String contendtid 		= (String)request.getAttribute("contendtid");
	String result			= (String)request.getAttribute("result");
	String email			= (String)session.getAttribute("email");
	String mapx				= (String)request.getAttribute("mapx");
	String mapy				= (String)request.getAttribute("mapy");
%>

	<div id="test">test
		<input type = "button" id = "wish" value = "즐겨찾기" onclick = "isAddWish('${contentTypeId}','${contendtid }','${email }')">
		<c:choose>
			<c:when test="${result=='0' }">
				즐겨 찾기 추가 안됨
				<button onclick = "isAddWish('${contentTypeId}','${contendtid }','${email }')" 
					style = "width:50px; height:50px;background-color: transparent; border:none;">
					<img src = "images/notwish.png" style = "width:50px; height : 50px;">
				</button>
			</c:when>
			<c:when test="${result=='1' }">
				즐겨 찾기 추가 됨
				<button onclick = "isAddWish('${contentTypeId}','${contendtid }','${email }')" 
					style = "width:50px; height:50px;background-color: transparent; border:none;">
					<img src = "images/wish.png" style = "width:50px; height : 50px;">
				</button>
			</c:when>
		</c:choose>
	</div>
	<!--test div  -->
	
	<div class="section1">
		<!--이미지 & 간략 설명  -->
		<div class="search1Area">
		
			<div class = "wishImg">
				<c:choose>
			<c:when test="${result=='0' }">
				
				<button onclick = "isAddWish('${contentTypeId}','${contendtid }','${email }')" 
					style = "width:50px; height:50px;background-color: transparent; border:none;">
					<img src = "images/notwish.png" style = "width:50px; height : 50px;">
				</button>
			</c:when>
			<c:when test="${result=='1' }">
				
				<button onclick = "isAddWish('${contentTypeId}','${contendtid }','${email }')" 
					style = "width:50px; height:50px;background-color: transparent; border:none;">
					<img src = "images/wish.png" style = "width:50px; height : 50px;">
				</button>
			</c:when>
		</c:choose>
				
			</div>
			
			<div class="touristName" id = "touristName" style='text-align:center'>
				 
			</div>
			
			<div class="touristImg" id = "touristImg">
			
			</div>
			
			<div class = "summary" id = "summary">
			
			</div>

		</div>

	</div>
	<!--Section 끝  -->

<!-- 여기부턴 List																															 -->
	<div class="section2">
		<div class="overview" id = "overview" style = "overflow:scroll;" >
			
		</div>
		<div class="map" id = "map">
		
		</div> <!--listArea 끝  -->
	</div><!--content 끝  -->
	<!--section 끝  -->
	<!--hidden text  -->
	<div class = "hidden" id = "hidden">
		<input type = "text" value ="${contentTypeId}" id = "contentTypeId">
		<input type = "text" value ="${contendtid}" id = "contendtid">  
<!-- 	 	<input type = "text" value ="12" id = "contentTypeId">
		<input type = "text" value ="127213" id = "contendtid">  -->
		<input type = "text" value ="${email }" id = "email">
		<input type = "text" value = "${result }" id = "result">
		<input type = "text" value = "${mapx }" id = "mapx">
		<input type = "text" value = "${mapy }" id = "mapy">
		<!-- <input type = "text" value = "127.0336840818" id = "mapx">
		<input type = "text" value = "37.5163582893" id = "mapy"> -->
	</div>
		<%@ include file="footer.jsp"%>
	
</body>
</html>