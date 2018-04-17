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
		
		/*공통 정보 조회  */
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
				$("#tab1").append(
						'<ul class="txtCon" >'
						+ '<li> <strong> ● 우편 번호 </strong>'
						+ '  :  '
						+ zipcode
						+ '</li>'
						+ '<li> <strong> ● 전화 번호 </strong>'
						+ '  :  '
						+ tel
						+ '</li>'
						+ '<li> <strong> ● 주 소 </strong>'
						+ '  :  '
						+ addr
						+ '</li>'
						+ '</ul>'
				);
				$("#overview").append(
						'<strong class = "tit"><h2>개요</h2></strong>'
						+ '<p id = "con" class = "con" >'
						+ overview
						+ '</p>' 
				);
				$("#hidden").append(
						'<input type = "hidden" value = "'
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
		
		/* 소개정보 조회  */
		$.ajax({
			url : 'DetailIntro',
			type : 'get',
			dataType : 'json',
			data : {
				typeId 	: contentTypeId,
				id		: contendtid
			},
			success : function(data) {
				var myItem 		= data.response.body.items.item;
				if(contentTypeId == 12){
					console.log("12(관광지)");
					/* 관광지 소개 필요 변수  */
					var infocenter		= myItem.infocenter;	//문의 및 안내
					var restdate		= myItem.restdate;		//쉬는날
					var parking			= myItem.parking;		//주차시설
					$("#tab2").append(
							'<ul class="txtCon" >'
							+ '<li> <strong> ● 문의 및 안내 </strong>'
							+ '  :  '
							+ infocenter
							+ '</li>'
							+ '<li> <strong> ● 쉬는날 </strong>'
							+ '  :  '
							+ restdate
							+ '</li>'
							+ '<li> <strong> ● 주차 시설 </strong>'
							+ '  :  '
							+ parking
							+ '</li>'
							+ '</ul>'
					);
				}else if(contentTypeId == 14){
					console.log("14(문화시설)")
					var infocenterculture 		= myItem.infocenterculture;		//문의 및 안내
					var scale					= myItem.scale;					//규모
					var usetimeculture			= myItem.usetimeculture;		//이용 시간
					var restdateculture			= myItem.restdateculture;		//쉬는날
					var usefee					= myItem.usefee;				//이용요금
					var parkingculture			= myItem.parkingculture;		//주차 시설
					$("#tab2").append(
							'<ul class="txtCon" >'
							+ '<li> <strong> ● 문의 및 안내 </strong>'
							+ '  :  '
							+ infocenterculture
							+ '</li>'
							+ '<li> <strong> ● 규모 </strong>'
							+ '  :  '
							+ scale
							+ '</li>'
							+ '<li> <strong> ● 이용 시간 </strong>'
							+ '  :  '
							+ usetimeculture
							+ '</li>'
							+ '<li> <strong> ● 쉬는날 </strong>'
							+ '  :  '
							+ restdateculture
							+ '</li>'
							+ '<li> <strong> ● 이용 요금 </strong>'
							+ '  :  '
							+ usefee
							+ '</li>'
							+ '<li> <strong> ● 주차 시설 </strong>'
							+ '  :  '
							+ parkingculture
							+ '</li>'
							+ '</ul>'
					);
					
				}else if(contentTypeId == 15){
					console.log("15(행사/공연/축제)")
					var sponsor1 			= myItem.sponsor1;			//주최자 정보
					var sponsor1tel			= myItem.sponsor1tel;		//주최자 연락처
					var playtime			= myItem.playtime;			//공연 시간
					var eventplace			= myItem.eventplace;		//행사 장소
					var usetimefestival		= myItem.usetimefestival; 	//이용 요금
					var bookingplace		= myItem.bookingplace;		//예매처
					var subevent			= myItem.subevent;			//부대 행사
					var program				= myItem.program;			//프로그램
					$("#tab2").append(
							'<ul class="txtCon" >'
							+ '<li> <strong> ● 주최자 정보 </strong>'
							+ '  :  '
							+ sponsor1
							+ '</li>'
							+ '<li> <strong> ● 주최자 연락처 </strong>'
							+ '  :  '
							+ sponsor1tel
							+ '</li>'
							+ '<li> <strong> ● 공연 시간 </strong>'
							+ '  :  '
							+ playtime
							+ '</li>'
							+ '<li> <strong> ● 행사 장소 </strong>'
							+ '  :  '
							+ eventplace
							+ '</li>'
							+ '<li> <strong> ● 이용 요금 </strong>'
							+ '  :  '
							+ usetimefestival
							+ '</li>'
							+ '<li> <strong> ● 예매처 </strong>'
							+ '  :  '
							+ bookingplace
							+ '</li>'
							+ '<li> <strong> ● 부대 행사 </strong>'
							+ '  :  '
							+ subevent
							+ '</li>'
							+ '<li> <strong> ● 프로그램 </strong>'
							+ '  :  '
							+ program
							+ '</li>'
							+ '</ul>'
					);
				}else if(contentTypeId == 25){
					console.log("25(여행코스)")
					var distance		= myItem.distance;	// 총 거리
					var taketime		= myItem.taketime;	// 소요 시간
					$("#tab2").append(
							'<ul class="txtCon" >'
							+ '<li> <strong> ● 총 거리 </strong>'
							+ '  :  '
							+ distance
							+ '</li>'
							+ '<li> <strong> ● 소요 시간 </strong>'
							+ '  :  '
							+ taketime
							+ '</li>'
							+ '</ul>'
					);
				}else if(contentTypeId == 28){
					console.log("28(레포츠)")
					var infocenterleports 		= myItem.infocenterleports;	//문의 및 안내
					var restdateleports			= myItem.restdateleports;	//쉬는 날
					var reservation				= myItem.reservation;		//예약 안내
					$("#tab2").append(
							'<ul class="txtCon" >'
							+ '<li> <strong> ● 문의 및 안내 </strong>'
							+ '  :  '
							+ infocenterleports
							+ '</li>'
							+ '<li> <strong> ● 쉬는 날 </strong>'
							+ '  :  '
							+ restdateleports
							+ '</li>'
							+ '<li> <strong> ● 예약 안내 </strong>'
							+ '  :  '
							+ reservation
							+ '</li>'
							+ '</ul>'
					);
				}else if(contentTypeId == 32){
					console.log("32(숙박)")
					var infocenterlodging		= myItem.infocenterlodging;	//문의 및 안내
					var roomtype				= myItem.roomtype;			//객실 유형
					var parkinglodging			= myItem.parkinglodging;	//주차 가능
					var chkcooking				= myItem.chkcooking;		//조리 가능
					var checkintime				= myItem.checkintime;		//체크인
					var checkouttime			= myItem.checkouttime;		//체크아웃
					var reservationlodging		= myItem.reservationlodging;//예약 안내
					var reservationurl			= myItem.reservationurl;	//예약안내 홈페이지
					$("#tab2").append(
							'<ul class="txtCon" >'
							+ '<li> <strong> ● 문의 및 안내 </strong>'
							+ '  :  '
							+ infocenterlodging
							+ '</li>'
							+ '<li> <strong> ● 객실 유형 </strong>'
							+ '  :  '
							+ roomtype
							+ '</li>'
							+ '<li> <strong> ● 주차 가능 </strong>'
							+ '  :  '
							+ parkinglodging
							+ '</li>'
							+ '<li> <strong> ● 조리 가능 </strong>'
							+ '  :  '
							+ chkcooking
							+ '</li>'
							+ '<li> <strong> ● 체크인 </strong>'
							+ '  :  '
							+ checkintime
							+ '</li>'
							+ '<li> <strong> ● 체크 아웃 </strong>'
							+ '  :  '
							+ checkouttime
							+ '</li>'
							+ '<li> <strong> ● 예약 안내 </strong>'
							+ '  :  '
							+ reservationlodging
							+ '</li>'
							+ '<li> <strong> ● 예약 안내 홈페이지 </strong>'
							+ '  :  '
							+ reservationurl
							+ '</li>'
							+ '</ul>'
					);
					
				}else if(contentTypeId == 38){
					console.log("38(쇼핑)")
					var infocentershopping		= myItem.infocentershopping;	//문의 및 안내
					var saleitem				= myItem.saleitem;				//판매 품목
					var opentime				= myItem.opentime;				//영업 시간
					var shopguide				= myItem.shopguide;				//매장 안내
					var restdateshopping		= myItem.restdateshopping;		//쉬는날
					var parkingshopping			= myItem.parkingshopping;		//주차 시설
					$("#tab2").append(
							'<ul class="txtCon" >'
							+ '<li> <strong> ● 문의 및 안내 </strong>'
							+ '  :  '
							+ infocentershopping
							+ '</li>'
							+ '<li> <strong> ● 판매 품목 </strong>'
							+ '  :  '
							+ saleitem
							+ '</li>'
							+ '<li> <strong> ● 영업 시간 </strong>'
							+ '  :  '
							+ opentime
							+ '</li>'
							+ '<li> <strong> ● 매장 안내 </strong>'
							+ '  :  '
							+ shopguide
							+ '</li>'
							+ '<li> <strong> ● 쉬는날 </strong>'
							+ '  :  '
							+ restdateshopping
							+ '</li>'
							+ '<li> <strong> ● 주차 시설 </strong>'
							+ '  :  '
							+ parkingshopping
							+ '</li>'
							+ '</ul>'
					);
				}else if(contentTypeId == 39){
					console.log("39(음식점)")
					var infocenterfood	= myItem.infocenterfood;//문의 및 안내
					var treatmenu		= myItem.treatmenu;		//대표 메뉴
					var opentimefood	= myItem.opentimefood;	//영업 시간
					var parkingfood		= myItem.parkingfood;	//주차 가능
					var restdatefood	= myItem.restdatefood;	//쉬는 날
					$("#tab2").append(
							'<ul class="txtCon" >'
							+ '<li> <strong> ● 문의 및 안내 </strong>'
							+ '  :  '
							+ infocenterfood
							+ '</li>'
							+ '<li> <strong> ● 대표 메뉴 </strong>'
							+ '  :  '
							+ treatmenu
							+ '</li>'
							+ '<li> <strong> ● 영업 시간 </strong>'
							+ '  :  '
							+ opentimefood
							+ '</li>'
							+ '<li> <strong> ● 주차 가능 </strong>'
							+ '  :  '
							+ parkingfood
							+ '</li>'
							+ '<li> <strong> ● 쉬는날 </strong>'
							+ '  :  '
							+ restdatefood
							+ '</li>'
							+ '</ul>'
					);
				}
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert("request : " + XMLHttpRequest);
				alert("Status: " + textStatus);
				alert("Error: " + errorThrown);
			}
		});
		
		/* 추가 이미지 조회 */
		$.ajax({
			url : 'DetailImage',
			type : 'get',
			dataType : 'json',
			data : {
				typeId 	: contentTypeId,
				id		: contendtid
			},
			success : function(data) {
				var myItem 				= data.response.body.items;
				var num					= data.response.body.numOfRows;
				$("#thumbs").html("");
				$("#mainImg").html("");
				for(var i = 0 ; i < num; i++){
					if(i==0){
						$("#mainImg").append(
								'<img src = "'
								+ myItem.item[i].originimgurl
								+ '" />'
								);
					}
					$("#thumbs").append(
						'<a href = "'
						+ myItem.item[i].originimgurl
						+ '" ><img src = "'
						+ myItem.item[i].smallimageurl
						+'"/></a>'
					);
					
				}
				$(".thumbs a").click(function(){            //클릭 시
					  var imgPath = $(this).attr("href");     //클릭한 a태그의 하이퍼링크를 변수저장
					  
					  $("#mainImg>img").attr({src:imgPath})   //메인 이미지의 주소 속성에 할당
					    .hide()                                 //fadein()효과를 보여주기 위해 숨김처리
					    .fadeIn();                              //fadeIn()
					 return false;                           //<a> 의 본래기능 (하이퍼링크) 작동방지
					});
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert("request : " + XMLHttpRequest);
				alert("Status: " + textStatus);
				alert("Error: " + errorThrown);
			}
		});
		
		
		
	};
	/* window onload 끝 */
		
	
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
		var mapx = $("#mapx").val();
		var mapy = $("#mapy").val();
		var firstImage = $("#firstImage").val();
		/* alert("fitstImage  -> " + firstImage); */
		/* alert("title = " + title); */
		if(email == ""){
			alert("로그인을 먼저하세요!");
		}else if(result == 1){
			alert("이미 찜 하셨어요!");
		}else{
			/* location.href = "addWish.do?contentTypeId="
							+ type + '&'
							+ 'contendtid='
							+ id + '&'
							+ 'email='
							+ email + '&'
							+ 'title=' 
							+ title + '&'
							+ 'mapx='
							+ mapx + '&'
							+ 'mapy='
							+ mapy + '&'
							+ 'firstImage='
							+ firstImage; */
			$.ajax({
				url : 'addWish.do',
				type : 'get',
				data : {
					contentTypeId	: type,
					contendtid		: id,
					email			: email,
					title			: title,
					mapx			: mapx,
					mapy			: mapy,
					firstImage		: firstImage					
				},
				success : function(data) {
					$("#wishImg").html("");
					$("#wishImg").append(
						'<button onclick = "isAddWish(' + '\''+ type + '\'' + ',' + '\'' + id + '\'' + ',' + '\'' + email +'\''+ ')" '
						+ 'style = "width:50px; height:50px;background-color: transparent; border:none;cursor:pointer;">'
						+ '<img src = "images/wish.png" style = "width:50px; height : 50px;">'
						+'</button>'
					);
					$("#result").val('1');
					
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert("request : " + XMLHttpRequest);
					alert("Status: " + textStatus);
					alert("Error: " + errorThrown);
				}
			});
							
		}
	}
	
	$(function() {
		$('ul.tab li').click(function() {
			var activeTab = $(this).attr('data-tab');
			$('ul.tab li').removeClass('current');
			$('.tabcontent').removeClass('current');
			$(this).addClass('current');
			$('#' + activeTab).addClass('current');
		})
	});
	 
	
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
	width: 1200px;
	height: 486px;
	/* border: 1px solid red; */
	margin-top: 20px;
}
.search1Area {
	width: 1200px;
	height: 480px;
	margin-top: 10px;
	/* border: 1px solid green; */
}

.touristName {
	width: 500px;
	height: 40px;
	/* border: 1px solid #1b5ac2; */
	background: #ffffff;
	margin-bottom: 20px;
}

.wishImg{
	width : 50px;
	height : 50px;
	/* border : 1px solid red; */
	margin-left : 20px;
	float : left;
}

.touristImg{
	width: 500px;
	height: 400px;
	/* border: 1px solid black; */
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



/* .summary strong .tit{
	margin-bottom: 15px;
	font-size: 16px;
} */

.section2 {
	width: 1080px;
	height: 850px;
	/* border: 1px solid black; */
}


.overview {
	width: 1000px;
	height: 300px;
	/* border: 1px solid pink; */
	margin-top : 10px;
	margin-bottom: 10px;
	overflow:auto;
	overflow-x:hidden;
}

.map {
	width: 1000px;
	height: 500px;
	/* border: 1px solid black; */
	
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

/* 멀티탭 css */

#container {
	width: 500px;
	height: 400px;
	/* text-align: center; */
}

.summary{
	width: 650px;
	height: 400px;
	border: 1px solid black;
	margin: 1px auto;
	/* padding : 25px 10px 0 10px; */
	border-top: 1px solid;
	float : left;
}

.tab {
	list-style: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	/* border: 1px solid black; */
	
}
/* Float the list items side by side */
.tab li {
	float: left;
	margin-left: 80px;
	
}
/* Style the links inside the list items */
.tab li a {
	display: inline-block;
	color: #000;
	text-align: center;
	text-decoration: none;
	padding: 14px 16px;
	font-size: 17px;
	transition: 0.3s;
}
/* Style the tab content */
.tabcontent {
	height : 350px;
	display: none;
	/* background-color: rgb(0, 154, 200); */
	padding: 6px 12px;
	/* color: #fff; */
	overflow:auto;
	overflow-x:hidden;
	/* border: 1px solid black; */
}

ul.tab li.current {
	/* background-color: rgb(0, 154, 200); */
	/* color: #222; */
}

.tabcontent.current {
	display: block;
}

/* 멀티탭 css 끝*/

/* 썸네일 이미지 css 시작  */
.thumbs {
   width:50px; 
   float:left;
}
.thumbs img {
	width : 50px;
	height: 50px;
    border:1px solid #ccc;
    padding:5px;
    margin-bottom:3px;
}
.thumbs img:hover {
    border-color:tomato;
}
#mainImg {
    border:solid 1px #ccc;
    width:530px;
    height:300px;
    padding:5px;
    margin-left:60px;
}

#mainImg img {
	width : 530px;
	height: 300px;
}
/* 썸네일 이미지 css 끝  */
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
	String firstImage		= (String)request.getAttribute("firstImg");
	
	session.setAttribute("test", request.getAttribute("result"));
%>

	<%-- <div id="test">test
		<input type = "button" id = "wish" value = "즐겨찾기" onclick = "isAddWish('${contentTypeId}','${contendtid }','${email }')">
		<c:choose>
			<c:when test="${result=='0' }">
				즐겨 찾기 추가 안됨
				<button onclick = "isAddWish('${contentTypeId}','${contendtid }','${email }')" 
					style = "width:50px; height:50px;background-color: transparent; border:none;cursor:pointer;">
					<img src = "images/notwish.png" style = "width:50px; height : 50px;">
				</button>
			</c:when>
			<c:when test="${result=='1' }">
				즐겨 찾기 추가 됨
				<button onclick = "isAddWish('${contentTypeId}','${contendtid }','${email }')" 
					style = "width:50px; height:50px;background-color: transparent; border:none;cursor:pointer;">
					<img src = "images/wish.png" style = "width:50px; height : 50px; ">
				</button>
			</c:when>
		</c:choose> 
	</div> --%> 
	<!--test div  -->
	
	<div class="section1">
		<!--이미지 & 간략 설명  -->
		<div class="search1Area">
		
			<div class = "wishImg" id = "wishImg">
				<c:choose>
			<c:when test="${result=='0' }">
				<button onclick = "isAddWish('${contentTypeId}','${contendtid }','${email }')" 
					style = "width:50px; height:50px;background-color: transparent; border:none;cursor:pointer;">
					<img src = "images/notwish.png" style = "width:50px; height : 50px;">
				</button>
			</c:when>
			<c:when test="${result=='1' }">
				<button onclick = "isAddWish('${contentTypeId}','${contendtid }','${email }')" 
					style = "width:50px; height:50px;background-color: transparent; border:none;cursor:pointer;">
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
				
				<ul class="tab">
					<li class="current" data-tab="tab1"><a href="#">공통 정보</a></li>
					<li data-tab="tab2"><a href="#">소개 정보</a></li>
					<li data-tab="tab3"><a href="#">추가 이미지</a></li>
				</ul>
		
				<div id="tab1" class="tabcontent current">
				</div>
		
				<div id="tab2" class="tabcontent">
				</div>
		
				<div id="tab3" class="tabcontent">
					<div class = "thumbs" id = "thumbs">
						<a href="http://sevensprings.dothome.co.kr/img/a_500x280.jpg" title="image1"><img src="http://sevensprings.dothome.co.kr/img/a_90x80.jpg" /></a>
				        <a href="http://sevensprings.dothome.co.kr/img/b_500x280.jpg" title="image1"><img src="http://sevensprings.dothome.co.kr/img/b_90x80.jpg" /></a>
				        <a href="http://sevensprings.dothome.co.kr/img/c_500x280.jpg" title="image1"><img src="http://sevensprings.dothome.co.kr/img/c_90x80.jpg" /></a>
					</div>
					<div id = "mainImg">
						<img src="http://sevensprings.dothome.co.kr/img/a_500x280.jpg" alt="image" />
					</div>
					
			
			</div>

		</div>

	</div>
	<!--Section 끝  -->

<!-- 여기부턴 List																															 -->
	<div class="section2">
		<div class="overview" id = "overview">
			
		</div>
		<div class="map" id = "map">
		
		</div> <!--listArea 끝  -->
	</div><!--content 끝  -->
	<!--section 끝  -->
	<!--hidden text  -->
	<div class = "hidden" id = "hidden">
		<input type = "hidden" value ="${contentTypeId}" id = "contentTypeId">
		<input type = "hidden" value ="${contendtid}" id = "contendtid">
		<!-- <input type = "text" value ="12" id = "contentTypeId">
		<input type = "text" value ="127213" id = "contendtid"> --> 
		<input type = "hidden" value ="${email }" id = "email">
		<input type = "hidden" value = "${result }" id = "result">
		<input type = "hidden" value = "${mapx }" id = "mapx">
		<input type = "hidden" value = "${mapy }" id = "mapy">
		<input type = "hidden" value = "${firstImage }" id = firstImage>
		<!-- <input type = "text" value = "127.0336840818" id = "mapx">
		<input type = "text" value = "37.5163582893" id = "mapy"> -->
	</div>
		<%@ include file="footer.jsp"%>
	
</body>
</html>