<%@page import="parser.SigunParserSearch"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="parser.AreaParserSearch"%>
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
<script src="jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	$("#searchBar").keypress(function(e){
		if(e.which == 13){
			searchMain();	
		}
	});
});
	var areaCode;
	var sigunCode;
	function seoulButton_click(code) {
		if (document.getElementById("selectSeoul").style.display == "") {
			document.getElementById("selectSeoul").style.display = "none";
		} else {
			document.getElementById("selectSeoul").style.display = "";
		}
		var codeParam = code;
		$.ajax({
			url : 'SigunCode',
			type : 'get',
			dataType : 'json',
			data : {
				sigun : codeParam
			},
			success : function(data) {
				var myItem = data.response.body.items.item;
					$("#seoulSlt").html("");
					$("#seoulSlt").append("<option>" + "선택" +"</option>");
				for (var i = 0; myItem.length; i++) {
					var code = myItem[i].code;
					var name = myItem[i].name;
					console.log(myItem.length);
					$("#seoulSlt")
							.append(
									"<option value = " + code +">" + name
											+ "</option>");
				}
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert("request : " + XMLHttpRequest);
				alert("Status: " + textStatus);
				alert("Error: " + errorThrown);
			}
		});
	}
				
		

	function incheonButton_click(code) {
		if (document.getElementById("selectIncheon").style.display == "") {
			document.getElementById("selectIncheon").style.display = "none";
		} else {
			document.getElementById("selectIncheon").style.display = "";
		}
		var codeParam = code;
		$.ajax({
			url : 'SigunCode',
			type : 'get',
			dataType : 'json',
			data : {
				sigun : codeParam
			},
			success : function(data) {
				var myItem = data.response.body.items.item;
				$("#incheonSlt").html("");
				$("#incheonSlt").append("<option>" + "선택" +"</option>");
				for (var i = 0; myItem.length; i++) {
					var code = myItem[i].code;
					var name = myItem[i].name;
					console.log(myItem.length);
					$("#incheonSlt")
							.append(
									"<option value = " + code +">" + name
											+ "</option>");
				}
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert("request : " + XMLHttpRequest);
				alert("Status: " + textStatus);
				alert("Error: " + errorThrown);
			}
		});
	}
	function daejeonButton_click(code) {
		if (document.getElementById("selectDaejeon").style.display == "") {
			document.getElementById("selectDaejeon").style.display = "none";
		} else {
			document.getElementById("selectDaejeon").style.display = "";
		}
		var codeParam = code;
		$.ajax({
			url : 'SigunCode',
			type : 'get',
			dataType : 'json',
			data : {
				sigun : codeParam
			},
			success : function(data) {
				var myItem = data.response.body.items.item;
				$("#daejeonSlt").html("");
				$("#daejeonSlt").append("<option>" + "선택" +"</option>");
				for (var i = 0; myItem.length; i++) {
					var code = myItem[i].code;
					var name = myItem[i].name;
					console.log(myItem.length);
					$("#daejeonSlt")
							.append(
									"<option value = " + code +">" + name
											+ "</option>");
				}
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert("request : " + XMLHttpRequest);
				alert("Status: " + textStatus);
				alert("Error: " + errorThrown);
			}
		});
	}
	function daeguButton_click(code) {
		if (document.getElementById("selectDaegu").style.display == "") {
			document.getElementById("selectDaegu").style.display = "none";
		} else {
			document.getElementById("selectDaegu").style.display = "";
		}
		var codeParam = code;
		$.ajax({
			url : 'SigunCode',
			type : 'get',
			dataType : 'json',
			data : {
				sigun : codeParam
			},
			success : function(data) {
				var myItem = data.response.body.items.item;
				$("#daeguSlt").html("");
				$("#daeguSlt").append("<option>" + "선택" +"</option>");
				for (var i = 0; myItem.length; i++) {
					var code = myItem[i].code;
					var name = myItem[i].name;
					console.log(myItem.length);
					$("#daeguSlt")
							.append(
									"<option value = " + code +">" + name
											+ "</option>");
				}
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert("request : " + XMLHttpRequest);
				alert("Status: " + textStatus);
				alert("Error: " + errorThrown);
			}
		});
	}
	function gwangjuButton_click(code) {
		if (document.getElementById("selectGwangju").style.display == "") {
			document.getElementById("selectGwangju").style.display = "none";
		} else {
			document.getElementById("selectGwangju").style.display = "";
		}
		var codeParam = code;
		$.ajax({
			url : 'SigunCode',
			type : 'get',
			dataType : 'json',
			data : {
				sigun : codeParam
			},
			success : function(data) {
				var myItem = data.response.body.items.item;
				$("#gwangjuSlt").html("");
				$("#gwangjuSlt").append("<option>" + "선택" +"</option>");
				for (var i = 0; myItem.length; i++) {
					var code = myItem[i].code;
					var name = myItem[i].name;
					console.log(myItem.length);
					$("#gwangjuSlt")
							.append(
									"<option value = " + code +">" + name
											+ "</option>");
				}
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert("request : " + XMLHttpRequest);
				alert("Status: " + textStatus);
				alert("Error: " + errorThrown);
			}
		});
	}
	function busanButton_click(code) {
		if (document.getElementById("selectBusan").style.display == "") {
			document.getElementById("selectBusan").style.display = "none";
		} else {
			document.getElementById("selectBusan").style.display = "";
		}
		var codeParam = code;
		$.ajax({
			url : 'SigunCode',
			type : 'get',
			dataType : 'json',
			data : {
				sigun : codeParam
			},
			success : function(data) {
				var myItem = data.response.body.items.item;
				$("#busanSlt").html("");
				$("#busanSlt").append("<option>" + "선택" +"</option>");
				for (var i = 0; myItem.length; i++) {
					var code = myItem[i].code;
					var name = myItem[i].name;
					console.log(myItem.length);
					$("#busanSlt")
							.append(
									"<option value = " + code +">" + name
											+ "</option>");
				}
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert("request : " + XMLHttpRequest);
				alert("Status: " + textStatus);
				alert("Error: " + errorThrown);
			}
		});
	}
	function ulsanButton_click(code) {
		if (document.getElementById("selectUlsan").style.display == "") {
			document.getElementById("selectUlsan").style.display = "none";
		} else {
			document.getElementById("selectUlsan").style.display = "";
		}
		var codeParam = code;
		$.ajax({
			url : 'SigunCode',
			type : 'get',
			dataType : 'json',
			data : {
				sigun : codeParam
			},
			success : function(data) {
				var myItem = data.response.body.items.item;
				$("#ulsanSlt").html("");
				$("#ulsanSlt").append("<option>" + "선택" +"</option>");
				for (var i = 0; myItem.length; i++) {
					var code = myItem[i].code;
					var name = myItem[i].name;
					console.log(myItem.length);
					$("#ulsanSlt")
							.append(
									"<option value = " + code +">" + name
											+ "</option>");
				}
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert("request : " + XMLHttpRequest);
				alert("Status: " + textStatus);
				alert("Error: " + errorThrown);
			}
		});
	}
	function sejongButton_click(code) {
		if (document.getElementById("selectSejong").style.display == "") {
			document.getElementById("selectSejong").style.display = "none";
		} else {
			document.getElementById("selectSejong").style.display = "";
		}
		var codeParam = code;
		$.ajax({
			url : 'SigunCode',
			type : 'get',
			dataType : 'json',
			data : {
				sigun : codeParam
			},
			success : function(data) {
				var myItem = data.response.body.items.item;
				var code = myItem.code;
				var name = myItem.name;
				$("#sejongSlt").html("");
				$("#sejongSlt").append("<option>" + "선택" +"</option>");
				$("#sejongSlt").append(
						"<option value = " + code +">" + name + "</option>");
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert("request : " + XMLHttpRequest);
				alert("Status: " + textStatus);
				alert("Error: " + errorThrown);
			}
		});
	}
	function gyeonggiButton_click(code) {
		if (document.getElementById("selectGyeonggi").style.display == "") {
			document.getElementById("selectGyeonggi").style.display = "none";
		} else {
			document.getElementById("selectGyeonggi").style.display = "";
		}
		var codeParam = code;
		$.ajax({
			url : 'SigunCode',
			type : 'get',
			dataType : 'json',
			data : {
				sigun : codeParam
			},
			success : function(data) {
				var myItem = data.response.body.items.item;
				$("#gyeonggiSlt").html("");
				$("#gyeonggiSlt").append("<option>" + "선택" +"</option>");
				for (var i = 0; myItem.length; i++) {
					var code = myItem[i].code;
					var name = myItem[i].name;
					console.log(myItem.length);
					$("#gyeonggiSlt")
							.append(
									"<option value = " + code +">" + name
											+ "</option>");
				}
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert("request : " + XMLHttpRequest);
				alert("Status: " + textStatus);
				alert("Error: " + errorThrown);
			}
		});
	}
	function gangwonButton_click(code) {
		if (document.getElementById("selectGangwon").style.display == "") {
			document.getElementById("selectGangwon").style.display = "none";
		} else {
			document.getElementById("selectGangwon").style.display = "";
		}
		var codeParam = code;
		$.ajax({
			url : 'SigunCode',
			type : 'get',
			dataType : 'json',
			data : {
				sigun : codeParam
			},
			success : function(data) {
				var myItem = data.response.body.items.item;
				$("#gangwonSlt").html("");
				$("#gangwonSlt").append("<option>" + "선택" +"</option>");
				for (var i = 0; myItem.length; i++) {
					var code = myItem[i].code;
					var name = myItem[i].name;
					console.log(myItem.length);
					$("#gangwonSlt")
							.append(
									"<option value = " + code +">" + name
											+ "</option>");
				}
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert("request : " + XMLHttpRequest);
				alert("Status: " + textStatus);
				alert("Error: " + errorThrown);
			}
		});
	}
	function chungbukButton_click(code) {
		if (document.getElementById("selectChungbuk").style.display == "") {
			document.getElementById("selectChungbuk").style.display = "none";
		} else {
			document.getElementById("selectChungbuk").style.display = "";
		}
		var codeParam = code;
		$.ajax({
			url : 'SigunCode',
			type : 'get',
			dataType : 'json',
			data : {
				sigun : codeParam
			},
			success : function(data) {
				var myItem = data.response.body.items.item;
				$("#chungbukSlt").html("");
				$("#chungbukSlt").append("<option>" + "선택" +"</option>");
				for (var i = 0; myItem.length; i++) {
					var code = myItem[i].code;
					var name = myItem[i].name;
					console.log(myItem.length);
					$("#chungbukSlt")
							.append(
									"<option value = " + code +">" + name
											+ "</option>");
				}
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert("request : " + XMLHttpRequest);
				alert("Status: " + textStatus);
				alert("Error: " + errorThrown);
			}
		});
	}
	function chungnamButton_click(code) {
		if (document.getElementById("selectChungnam").style.display == "") {
			document.getElementById("selectChungnam").style.display = "none";
		} else {
			document.getElementById("selectChungnam").style.display = "";
		}
		var codeParam = code;
		$.ajax({
			url : 'SigunCode',
			type : 'get',
			dataType : 'json',
			data : {
				sigun : codeParam
			},
			success : function(data) {
				var myItem = data.response.body.items.item;
				$("#chungnamSlt").html("");
				$("#chungnamSlt").append("<option>" + "선택" +"</option>");
				for (var i = 0; myItem.length; i++) {
					var code = myItem[i].code;
					var name = myItem[i].name;
					console.log(myItem.length);
					$("#chungnamSlt")
							.append(
									"<option value = " + code +">" + name
											+ "</option>");
				}
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert("request : " + XMLHttpRequest);
				alert("Status: " + textStatus);
				alert("Error: " + errorThrown);
			}
		});
	}
	function gyeongbukButton_click(code) {
		if (document.getElementById("selectGyeongbuk").style.display == "") {
			document.getElementById("selectGyeongbuk").style.display = "none";
		} else {
			document.getElementById("selectGyeongbuk").style.display = "";
		}
		var codeParam = code;
		$.ajax({
			url : 'SigunCode',
			type : 'get',
			dataType : 'json',
			data : {
				sigun : codeParam
			},
			success : function(data) {
				var myItem = data.response.body.items.item;
				$("#gyeongbukSlt").html("");
				$("#gyeongbukSlt").append("<option>" + "선택" +"</option>");
				for (var i = 0; myItem.length; i++) {
					var code = myItem[i].code;
					var name = myItem[i].name;
					console.log(myItem.length);
					$("#gyeongbukSlt")
							.append(
									"<option value = " + code +">" + name
											+ "</option>");
				}
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert("request : " + XMLHttpRequest);
				alert("Status: " + textStatus);
				alert("Error: " + errorThrown);
			}
		});
	}
	function gyeongnamButton_click(code) {
		if (document.getElementById("selectGyeongnam").style.display == "") {
			document.getElementById("selectGyeongnam").style.display = "none";
		} else {
			document.getElementById("selectGyeongnam").style.display = "";
		}
		var codeParam = code;
		$.ajax({
			url : 'SigunCode',
			type : 'get',
			dataType : 'json',
			data : {
				sigun : codeParam
			},
			success : function(data) {
				var myItem = data.response.body.items.item;
				$("#gyeongnamSlt").html("");
				$("#gyeongnamSlt").append("<option>" + "선택" +"</option>");
				for (var i = 0; myItem.length; i++) {
					var code = myItem[i].code;
					var name = myItem[i].name;
					console.log(myItem.length);
					$("#gyeongnamSlt")
							.append(
									"<option value = " + code +">" + name
											+ "</option>");
				}
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert("request : " + XMLHttpRequest);
				alert("Status: " + textStatus);
				alert("Error: " + errorThrown);
			}
		});
	}
	function jeonbukButton_click(code) {
		if (document.getElementById("selectJeonbuk").style.display == "") {
			document.getElementById("selectJeonbuk").style.display = "none";
		} else {
			document.getElementById("selectJeonbuk").style.display = "";
		}
		var codeParam = code;
		$.ajax({
			url : 'SigunCode',
			type : 'get',
			dataType : 'json',
			data : {
				sigun : codeParam
			},
			success : function(data) {
				var myItem = data.response.body.items.item;
				$("#jeonbukSlt").html("");
				$("#jeonbukSlt").append("<option>" + "선택" +"</option>");
				for (var i = 0; myItem.length; i++) {
					var code = myItem[i].code;
					var name = myItem[i].name;
					console.log(myItem.length);
					$("#jeonbukSlt")
							.append(
									"<option value = " + code +">" + name
											+ "</option>");
				}
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert("request : " + XMLHttpRequest);
				alert("Status: " + textStatus);
				alert("Error: " + errorThrown);
			}
		});
	}
	function jeonnamButton_click(code) {
		if (document.getElementById("selectJeonnam").style.display == "") {
			document.getElementById("selectJeonnam").style.display = "none";
		} else {
			document.getElementById("selectJeonnam").style.display = "";
		}
		var codeParam = code;
		$.ajax({
			url : 'SigunCode',
			type : 'get',
			dataType : 'json',
			data : {
				sigun : codeParam
			},
			success : function(data) {
				var myItem = data.response.body.items.item;
				$("#jeonnamSlt").html("");
				$("#jeonnamSlt").append("<option>" + "선택" +"</option>");
				for (var i = 0; myItem.length; i++) {
					var code = myItem[i].code;
					var name = myItem[i].name;
					console.log(myItem.length);
					$("#jeonnamSlt")
							.append(
									"<option value = " + code +">" + name
											+ "</option>");
				}
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert("request : " + XMLHttpRequest);
				alert("Status: " + textStatus);
				alert("Error: " + errorThrown);
			}
		});
	}
	function jejuButton_click(code) {
		if (document.getElementById("selectJeju").style.display == "") {
			document.getElementById("selectJeju").style.display = "none";
		} else {
			document.getElementById("selectJeju").style.display = "";
		}
		var codeParam = code;
		$.ajax({
			url : 'SigunCode',
			type : 'get',
			dataType : 'json',
			data : {
				sigun : codeParam
			},
			success : function(data) {
				var myItem = data.response.body.items.item;
				$("#jejuSlt").html("");
				$("#jejuSlt").append("<option>" + "선택" +"</option>");
				for (var i = 0; myItem.length; i++) {
					var code = myItem[i].code;
					var name = myItem[i].name;
					console.log(myItem.length);
					$("#jejuSlt")
							.append(
									"<option value = " + code +">" + name
											+ "</option>");
				}
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert("request : " + XMLHttpRequest);
				alert("Status: " + textStatus);
				alert("Error: " + errorThrown);
			}
		});
	}
	 
	 function listChk(sigun,area){
		 areaCode = area;
		 sigunCode = sigun;
		 /* alert("@@@@@@@area code = " + areaCode);
		 alert("@@@@@@@sigun code = " + sigunCode); */
	} 
	
	
	/*파싱 결과 리스트 출력  */
	function listParsing(area, sigun, pageNo){
		var email = $("#email").val();
		$.ajax({
			url : 'GalleryList',
			type : 'get',
			dataType : 'json',
			data : {
				area 		: area,
				sigungu 	: sigun,
				pageNum		: pageNo
			},
			success : function(data){
				$("#galleryList").html("");
				$("#pageNavi").html("");
				var myItem 			= data.response.body.items.item;
				var myNumOfRows 	= data.response.body.numOfRows; /* 페이지당 출력 개수 -> 12개  */
				var myPageNo 		= data.response.body.pageNo;    /*현재 페이지  */
				var myTotalCount 	= data.response.body.totalCount; /*총 검색 개수  */
				var myTotalPage		= Math.ceil(myTotalCount/myNumOfRows); /*총 페이지  */
				var myStartPage		= Math.floor((myPageNo-1)/10) * 10 +1;
				var myEndPage		= (myStartPage + 10) -1;
				var myFirstPage		= 1;
				if(myEndPage > myTotalPage)
					myEndPage = myTotalPage;
				

				/* 검색결과 출력 메시지 */
				
				if(myTotalCount == 0){
					$("#contentsTop").html('<p> 검색결과가 없습니다.</p>');
				}else if(myTotalCount > 1){
					$("#contentsTop").html('<p> 총 검색개수 : ' + myTotalCount + '</p>'											
											);
					$("#test").html('<p> 총 검색개수 : ' + myTotalCount 
										+   '	총 페이지 	: ' + myTotalPage 
										+	'	현재 페이지  : ' + myPageNo
										+	'  myStartPage :   ' + myStartPage
										+	'  myEndPage :  ' + myEndPage
										+ '</p>'											
											);
				}
				
				/* 검색 list 생성 */
				for (var i = 0; i < myItem.length; i++) {
					console.log(myItem.length);
					var title = myItem[i].title;
					var firstImage = myItem[i].firstimage;
					if(firstImage == undefined){
						firstImage = "images/no_image.jpg";
					}					
					$("#galleryList")
							.append(
									'<a href = "searchDetail.do?contentTypeId='
									+ myItem[i].contenttypeid +'&'
									+ 'contendtid='
									+ myItem[i].contentid +'&'
									+ 'email='
									+ email + '&'
									+ 'mapx='
									+ myItem[i].mapx + '&'
									+ 'mapy='
									+ myItem[i].mapy + '&'
									+ 'firstImage=' 
									+ firstImage
									+ '">'
									+'<li> <img src =' + firstImage + ' alt = ""> <p>' 
									+ title + '</p> </li>'
									+ '</a>'
									);
				}
			/* 페이징 */
				/* 처음으로 가기  */
				if(myStartPage > 1){
					$("#pageNavi").append(
						'<a href = "javascript:void(0);" onclick = "pagingBtnClick('+areaCode+','+sigunCode+','+myFirstPage+')">' + "[처음]" + ' </a>'
					);
				}
				/* 이전버튼 생성 */
				if(myPageNo>1){
					$("#pageNavi").append(
							'<a href = "javascript:void(0);" onclick = "pagingBtnClick('+areaCode+','+sigunCode+','+(myPageNo-1)+')">' + "  [이전]" + ' </a>'
					);
				}
				/*  페이징 넘버 뿌리기  */
				for (var i = myStartPage; i <= myEndPage; i++){
					if(i == myPageNo){
						$("#pageNavi").append(
								'<a href = "javascript:void(0);" onclick = "pagingBtnClick('+areaCode+','+sigunCode+','+i+')">' +'<strong>' +i +'</strong>' +' </a>'								
							);	
					}else{
						$("#pageNavi").append(
							'<a href = "javascript:void(0);" onclick = "pagingBtnClick('+areaCode+','+sigunCode+','+i+')">' + i + ' </a>'								
						);
					}
				}
				/* 다음버튼 생성 */
				if(myPageNo < myTotalPage){
					$("#pageNavi").append(
							'<a href = "javascript:void(0);" onclick = "pagingBtnClick('+areaCode+','+sigunCode+','+(myPageNo+1)+')">' + "  [다음]" + ' </a>'
					);
				}
				/* 맨끝으로 가기 */
				if(myEndPage < myTotalPage){
					$("#pageNavi").append(
							'<a href = "javascript:void(0);" onclick = "pagingBtnClick('+areaCode+','+sigunCode+','+myTotalPage+')">' + "  [끝]" + ' </a>'
					);
				}
			
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert("request : " + XMLHttpRequest);
				alert("Status: " + textStatus);
				alert("Error: " + errorThrown);
			}
		});
		
	}
	
	var search = "";
	/* 검색 결과 리스트 출력  */
		function searchList(search,num){
		var email = $("#email").val();
		$.ajax({
			url : 'SearchList',
			type : 'get',
			dataType : 'json',
			data : {
				keyword 		: search,
				pageNum			: num
			},
			success : function(data){
				$("#galleryList").html("");
				$("#pageNavi").html("");
				var myItem 			= data.response.body.items.item;
				var myNumOfRows 	= data.response.body.numOfRows; /* 페이지당 출력 개수 -> 12개  */
				var myPageNo 		= data.response.body.pageNo;    /*현재 페이지  */
				var myTotalCount 	= data.response.body.totalCount; /*총 검색 개수  */
				var myTotalPage		= Math.ceil(myTotalCount/myNumOfRows); /*총 페이지  */
				var myStartPage		= Math.floor((myPageNo-1)/10) * 10 +1;
				var myEndPage		= (myStartPage + 10) -1;
				var myFirstPage		= 1;
				
				if(myEndPage > myTotalPage)
					myEndPage = myTotalPage;
				
				/* 검색결과 출력 메시지 */
				
				if(myTotalCount == 0){
					$("#contentsTop").html('<p> 검색결과가 없습니다.</p>');
				}else if(myTotalCount > 1){
					$("#contentsTop").html('<p> 총 검색개수 : ' + myTotalCount + '</p>'											
											);
					$("#test").html('<p> 총 검색개수 : ' + myTotalCount 
										+   '	총 페이지 	: ' + myTotalPage 
										+	'	현재 페이지  : ' + myPageNo
										+	'  myStartPage :   ' + myStartPage
										+	'  myEndPage :  ' + myEndPage
										+	'	29/10 :	  '	+ (29/10)
										+	' 	29%10 :   '	+ (29%10)
										+ '</p>'											
											);
				}
				
				
				/* 검색 list 생성 */
				for (var i = 0; i < myItem.length; i++) {
					console.log(myItem.length);
					var title = myItem[i].title;
					var firstImage = myItem[i].firstimage;
					if(firstImage == undefined){
						firstImage = "images/no_image.jpg";
					}					
					
					$("#galleryList").append(
							'<a href = "searchDetail.do?contentTypeId='
							+ myItem[i].contenttypeid +'&'
							+ 'contendtid='
							+ myItem[i].contentid +'&'
							+ 'email='
							+ email + '&'
							+ 'mapx='
							+ myItem[i].mapx + '&'
							+ 'mapy='
							+ myItem[i].mapy + '&'
							+ 'firstImage='
							+ firstImage
							+ '">'
							+'<li> <img src =' + firstImage + ' alt = ""> <p>' 
							+ title + '</p> </li>'
							+ '</a>'
							);
				}
				
			/* 페이징 */
				/* 처음으로 가기  */
				if(myStartPage > 1){
					$("#pageNavi").append(
						'<a href = "javascript:void(0);" onclick = "searchPagingBtnClick('+ myFirstPage +')">' + "[처음]" + ' </a>'
					);
				}
				/* 이전버튼 생성 */
				if(myPageNo>1){
					$("#pageNavi").append(
							'<a href = "javascript:void(0);" onclick = "searchPagingBtnClick('+(myPageNo-1)+')">' + "  [이전]" + ' </a>'
					);
				}
				/*  페이징 넘버 뿌리기  */
				for (var i = myStartPage; i <= myEndPage; i++){
					if(i == myPageNo){
						$("#pageNavi").append(
								'<a href = "javascript:void(0);" onclick = "searchPagingBtnClick('+i+')">' +'<strong>' +i +'</strong>' +' </a>'								
							);	
					}else{
						$("#pageNavi").append(
							'<a href = "javascript:void(0);" onclick = "searchPagingBtnClick('+i+')">' + i + ' </a>'								
						);
					}
				}
				/* 다음버튼 생성 */
				if(myPageNo < myTotalPage){
					$("#pageNavi").append(
							'<a href = "javascript:void(0);" onclick = "searchPagingBtnClick('+(myPageNo+1)+')">' + "  [다음]" + ' </a>'
					);
				}
				/* 맨끝으로 가기 */
				if(myEndPage < myTotalPage){
					$("#pageNavi").append(
							'<a href = "javascript:void(0);" onclick = "searchPagingBtnClick('+myTotalPage+')">' + "  [끝]" + ' </a>'
					);
				}
			
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert("request : " + XMLHttpRequest);
				alert("Status: " + textStatus);
				alert("Error: " + errorThrown);
			}
		});
		
	}
	
	/* 페이징  */
	/* 작은 검색 버튼 눌렀을 때의 페이징 넘버 클릭 */
	function pagingBtnClick(area, sigun, pageNo){
		listParsing(area, sigun, pageNo);
		
	}
	/* 통합 검색 버튼 눌렀을 때의 페이징 넘버 클릭 */
	function searchPagingBtnClick(pageNo){
		/* alert("searchPagingBtnClick 진입 ->" + search); */
		searchList(search,pageNo);
	}
	
	/* 작은 검색 버튼 */
	function searchSub(){
		/* alert("searchSub 진입"); */
		listParsing(areaCode, sigunCode, 1);
	}
	
	/* 큰 검색 버튼 */
	function searchMain(){
		search = $("#searchBar").val();
		/* alert("검색 text value" + search); */
		searchList(search,1);
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
.section {
	width: 1080px;
	height: 351px;
	border: 1px solid red;
}
/* 검색 Area */
.searchSection {
	width: 1080px;
	height: 300px;
	margin-top: 50px;
	border: 1px solid green;
}

.searchArea {
	width: 600px;
	height: 40px;
	border: 1px solid #1b5ac2;
	background: #ffffff;
	margin-bottom: 20px;
}

.searchButton {
	width: 50px;
	height: 100%;
	border: 0px;
	background: #1b5ac2;
	outline: none;
	float: right;
	color: #ffffff
}

.searchBar {
	font-size: 16px;
	width: 500px;
	padding: 10px;
	border: 0px;
	outline: none;
	float: left;
}

.areaButton {
	width: 1000px;
	height: 100px;
	border: 1px solid blue;
	margin: 1px auto;
}

.select {
	width: 100px;
	height: 20px;
	border: 1px solid blue;
	margin: 0px auto;
}

.contents {
	width: 1080px;
	height: 767px;
	border: 1px solid black;
}

.sidoButton {
	width: 65px;
	height: 50px;
	outline: none;
	margin: 10px auto;
}

.contentsTop {
	width: 1000px;
	height: 50px;
	border: 1px solid pink;
	margin: 10px auto;
}

.listArea {
	width: 1000px;
	height: 680px;
	border: 1px solid blue;
	margin: 10px auto;
}

.list {
	margin-left: 31px;
	margin-top: 15px;
	float: left;
}

.list .listImage {
	width: 200px;
	height: 200px;
}

.list .listTitle {
	height: 30px;
}

.footer_wrap {
	padding-top: 20px;
	width: 100%;
	background-color: #0099ff;
	margin: 20px auto 0px auto;
	width: 100%;
}
/*list   */
.galleryList{
	margin : 15px 0 0 15px;
}


.galleryList li {
	overflow:hidden;
	float:left;
	width: 210px;
	margin-left : 30px;
	margin-bottom: 15px;
	
}

.galleryList li p{
	height : 40px;
	margin : 15px 0 15px 0;
	font-size : 14px;
	text-align: center;
	letter-spacing: -1px;
}

.galleryList li img {
	width : 211px;
	height : 128px;
}

.pageNavi{
	text-align: center;
}

</style>
</head>
<body>
	<!-- 울산=7, 서울=1, 전라남도=38, 부산=6, 제주도=39, 경기도=31, 경상남도=36, 전라북도=37, 
대전=3, 충청북도=33, 충청남도=34, 강원도=32, 
경상북도=35, 대구=4, 세종특별자치시=8, 인천=2, 광주=5} -->
	<c:set var="seoul" value="서울" />
	<c:set var="incheon" value="인천" />
	<c:set var="daejeon" value="대전" />
	<c:set var="daegu" value="대구" />
	<c:set var="gwangju" value="광주" />
	<c:set var="busan" value="부산" />
	<c:set var="ulsan" value="울산" />
	<c:set var="sejong" value="세종특별자치시" />
	<c:set var="gyeonggi" value="경기도" />
	<c:set var="gangwon" value="강원도" />
	<c:set var="chungbuk" value="충청북도" />
	<c:set var="chungnam" value="충청남도" />
	<c:set var="gyeongbuk" value="경상북도" />
	<c:set var="gyeongnam" value="경상남도" />
	<c:set var="jeonbuk" value="전라북도" />
	<c:set var="jeonnam" value="전라남도" />
	<c:set var="jeju" value="제주도" />
	<%
		String email		= (String)session.getAttribute("email");
		
		String seoulB 		= (String) pageContext.getAttribute("seoul");
		String incheonB 	= (String) pageContext.getAttribute("incheon");
		String daejeonB 	= (String) pageContext.getAttribute("daejeon");
		String daeguB 		= (String) pageContext.getAttribute("daegu");
		String gwangjuB 	= (String) pageContext.getAttribute("gwangju");
		String busanB 		= (String) pageContext.getAttribute("busan");
		String ulsanB 		= (String) pageContext.getAttribute("ulsan");
		String sejongB 		= (String) pageContext.getAttribute("sejong");
		String gyeonggiB 	= (String) pageContext.getAttribute("gyeonggi");
		String gangwonB 	= (String) pageContext.getAttribute("gangwon");
		String chungbukB 	= (String) pageContext.getAttribute("chungbuk");
		String chungnamB 	= (String) pageContext.getAttribute("chungnam");
		String gyeongbukB 	= (String) pageContext.getAttribute("gyeongbuk");
		String gyeongnamB 	= (String) pageContext.getAttribute("gyeongnam");
		String jeonbukB 	= (String) pageContext.getAttribute("jeonbuk");
		String jeonnamB 	= (String) pageContext.getAttribute("jeonnam");
		String jejuB 		= (String) pageContext.getAttribute("jeju");

/* 		AreaParserSearch aps = new AreaParserSearch();
		ArrayList<HashMap<String, Object>> areaList = aps.areaParser();
		HashMap<String, Object> tempMap = new HashMap<String, Object>();
		HashMap<String, Object> areaMap = new HashMap<String, Object>();
		for (int i = 0; i < areaList.size(); i++) {
			tempMap = areaList.get(i);
			areaMap.put((String) tempMap.get("name"), tempMap.get("code"));
		}
		SigunParserSearch sps = new SigunParserSearch();
		HashMap<String, Object> sigun = new HashMap<String, Object>();
		// 셀렉트 박스에 쳐넣을 list 선언
		ArrayList<String> seoulSelList = new ArrayList<>();
		ArrayList<String> incheonSelList = new ArrayList<>();
		ArrayList<String> daejeonSelList = new ArrayList<>();
		ArrayList<String> daeguSelList = new ArrayList<>();
		ArrayList<String> gwangjuSelList = new ArrayList<>();
		ArrayList<String> busanSelList = new ArrayList<>();
		ArrayList<String> ulsanSelList = new ArrayList<>();
		ArrayList<String> sejongSelList = new ArrayList<>();
		ArrayList<String> gyeonggiSelList = new ArrayList<>();
		ArrayList<String> gangwonSelList = new ArrayList<>();
		ArrayList<String> chungbukSelList = new ArrayList<>();
		ArrayList<String> chungnamSelList = new ArrayList<>();
		ArrayList<String> gyeongbukSelList = new ArrayList<>();
		ArrayList<String> gyeongnamSelList = new ArrayList<>();
		ArrayList<String> jeonbukSelList = new ArrayList<>();
		ArrayList<String> jeonnamSelList = new ArrayList<>();
		ArrayList<String> jejuSelList = new ArrayList<>();
		ArrayList<HashMap<String, Object>> guArrList = new ArrayList<>(); */
	%>
	<!-- <div id="test">test</div> -->
	<div class="section">
		<!--검색창 & 검색 버튼  -->
		<div class="searchSection">
			<!--검색창  -->
			<div class="searchArea">
				<input type="text" placeholder="관광지, 문화시설, 행사, 여행코스, 숙박 정보를 검색하세요!" class="searchBar" id = "searchBar">
				<button class="searchButton" onclick="searchMain()">검색</button>
			</div>
			<!--검색창  끝-->
			<div class="areaButton" id="area">
				<!-- 서울, 인천, 대전, 대구, 광주, 부산, 울산, 세종특별자치시, 경기도,
					강원도, 충청북도, 충청남도, 경상북도, 경상남도, 전라북도
				 -->
				<!--서울 버튼  -->
				<table class="areaTable" border="0" width="106" style="float: left;">
					<tr>
						<th><input type="button" value="${seoul }" class="sidoButton"
							id="seoulButton" name="seoulButton"
							onclick="seoulButton_click(1)"></th>

					</tr>
					<tr>
						<td>
							<div class="select" id="selectSeoul" style="display: none">
								<select id="seoulSlt" onchange="listChk(this.value,1);">
									<%-- <%
										int seoulCode = Integer.parseInt(areaMap.get(seoulB).toString());
										guArrList = sps.sigunParser(seoulCode); //시군 파싱
										for (int i = 0; i < guArrList.size(); i++) {
											sigun = guArrList.get(i);
											seoulSelList.add(sigun.get("name").toString()); //시,군 정보만 빼와서 list에 쳐넣는다
											//System.out.println("@@서울selList : " + seoulSelList.get(i));
										}
										for (int i = 0; i < seoulSelList.size(); i++) {
											out.println("<option>" + seoulSelList.get(i) + "</option>");
										}
									%> --%>
								</select>
							</div>
						</td>
					</tr>
				</table>
				<!--서울 버튼 끝  -->
				<!--인천 버튼  -->
				<table class="areaTable" border="0" width="106" style="float: left;">
					<tr>
						<th><input type="button" value="${incheon}"
							class="sidoButton" onclick="incheonButton_click(2)"></th>
					</tr>
					<tr>
						<td>
							<div class="select" id="selectIncheon" style="display: none">
								<select id="incheonSlt" onchange="listChk(this.value,2);">
									
								</select>
							</div>
						</td>
					</tr>
				</table>
				<!--인천 버튼 끝  -->
				<!--대전 버튼  -->
				<table class="areaTable" border="0" width="106" style="float: left;">
					<tr>
						<th><input type="button" value="${daejeon}"
							class="sidoButton" onclick="daejeonButton_click(3)"></th>
					</tr>
					<tr>
						<td>
							<div class="select" id="selectDaejeon" style="display: none">
								<select id="daejeonSlt" onchange="listChk(this.value,3);">
									
								</select>
							</div>
						</td>
					</tr>
				</table>
				<!--대전 버튼 끝  -->
				<!--대구 버튼  -->
				<table class="areaTable" border="0" width="106" style="float: left;">
					<tr>
						<th><input type="button" value="${daegu}" class="sidoButton"
							onclick="daeguButton_click(4)"></th>
					</tr>
					<tr>
						<td>
							<div class="select" id="selectDaegu" style="display: none">
								<select id="daeguSlt" onchange="listChk(this.value,4);">
									
								</select>
							</div>
						</td>
					</tr>
				</table>
				<!--대구 버튼 끝  -->
				<!--광주 버튼  -->
				<table class="areaTable" border="0" width="106" style="float: left;">
					<tr>
						<th><input type="button" value="${gwangju}"
							class="sidoButton" onclick="gwangjuButton_click(5)"></th>
					</tr>
					<tr>
						<td>
							<div class="select" id="selectGwangju" style="display: none">
								<select id="gwangjuSlt" onchange="listChk(this.value,5);">
								
								</select>
							</div>
						</td>
					</tr>
				</table>
				<!--광주 버튼 끝  -->
				<!--부산 버튼  -->
				<table class="areaTable" border="0" width="106" style="float: left;">
					<tr>
						<th><input type="button" value="${busan}" class="sidoButton"
							onclick="busanButton_click(6)"></th>
					</tr>
					<tr>
						<td>
							<div class="select" id="selectBusan" style="display: none">
								<select id="busanSlt" onchange="listChk(this.value,6);">
									
								</select>
							</div>
						</td>
					</tr>
				</table>
				<!--부산 버튼 끝  -->
				<!--울산 버튼  -->
				<table class="areaTable" border="0" width="106" style="float: left;">
					<tr>
						<th><input type="button" value="${ulsan}" class="sidoButton"
							onclick="ulsanButton_click(7)"></th>
					</tr>
					<tr>
						<td>
							<div class="select" id="selectUlsan" style="display: none">
								<select id="ulsanSlt" onchange="listChk(this.value,7);">
									
								</select>
							</div>
						</td>
					</tr>
				</table>
				<!--울산 버튼 끝  -->
				<!--세종특별자치시 버튼  -->
				<table class="areaTable" border="0" width="106" style="float: left;">
					<tr>
						<th><input type="button" value="${sejong}" class="sidoButton"
							onclick="sejongButton_click(8)"></th>
					</tr>
					<tr>
						<td>
							<div class="select" id="selectSejong" style="display: none">
								<select id="sejongSlt" onchange="listChk(this.value,8);">
								</select>
							</div>
						</td>
					</tr>
				</table>
				<!--세종특별자치시 버튼 끝  -->
				<!--경기도 버튼  -->
				<table class="areaTable" border="0" width="106" style="float: left;">
					<tr>
						<th><input type="button" value="${gyeonggi}"
							class="sidoButton" onclick="gyeonggiButton_click(31)"></th>
					</tr>
					<tr>
						<td>
							<div class="select" id="selectGyeonggi" style="display: none">
								<select id="gyeonggiSlt" onchange="listChk(this.value,31);">
								</select>
							</div>
						</td>
					</tr>
				</table>
				<!--경기도 버튼 끝  -->
			</div>
			<div class="areaButton" id="area">
				<!--강원도 버튼  -->
				<table class="areaTable" border="0" width="106" style="float: left;">
					<tr>
						<th><input type="button" value="${gangwon}"
							class="sidoButton" onclick="gangwonButton_click(32)"></th>
					</tr>
					<tr>
						<td>
							<div class="select" id="selectGangwon" style="display: none">
								<select id="gangwonSlt" onchange="listChk(this.value,32);">
									
								</select>
							</div>
						</td>
					</tr>
				</table>
				<!--강원도 버튼 끝  -->
				<!--충청북도 버튼  -->
				<table class="areaTable" border="0" width="106" style="float: left;">
					<tr>
						<th><input type="button" value="${chungbuk}"
							class="sidoButton" onclick="chungbukButton_click(33)"></th>
					</tr>
					<tr>
						<td>
							<div class="select" id="selectChungbuk" style="display: none">
								<select id="chungbukSlt" onchange="listChk(this.value,33);">
								</select>
							</div>
						</td>
					</tr>
				</table>
				<!--충청북도 버튼 끝  -->
				<!--충청남도 버튼  -->
				<table class="areaTable" border="0" width="106" style="float: left;">
					<tr>
						<th><input type="button" value="${chungnam}"
							class="sidoButton" onclick="chungnamButton_click(34)"></th>
					</tr>
					<tr>
						<td>
							<div class="select" id="selectChungnam" style="display: none">
								<select id="chungnamSlt" onchange="listChk(this.value,34);">
								</select>
							</div>
						</td>
					</tr>
				</table>
				<!--충청남도 버튼 끝  -->
				<!--경상북도 버튼  -->
				<table class="areaTable" border="0" width="106" style="float: left;">
					<tr>
						<th><input type="button" value="${gyeongbuk}"
							class="sidoButton" onclick="gyeongbukButton_click(35)"></th>
					</tr>
					<tr>
						<td>
							<div class="select" id="selectGyeongbuk" style="display: none">
								<select id="gyeongbukSlt" onchange="listChk(this.value,35);">
								</select>
							</div>
						</td>
					</tr>
				</table>
				<!--경상북도 버튼 끝  -->
				<!--경상남도 버튼  -->
				<table class="areaTable" border="0" width="106" style="float: left;">
					<tr>
						<th><input type="button" value="${gyeongnam}"
							class="sidoButton" onclick="gyeongnamButton_click(36)"></th>
					</tr>
					<tr>
						<td>
							<div class="select" id="selectGyeongnam" style="display: none">
								<select id="gyeongnamSlt" onchange="listChk(this.value,36);">
								</select>
							</div>
						</td>
					</tr>
				</table>
				<!--경상남도 버튼 끝  -->
				<!--전라북도 버튼  -->
				<table class="areaTable" border="0" width="106" style="float: left;">
					<tr>
						<th><input type="button" value="${jeonbuk}"
							class="sidoButton" onclick="jeonbukButton_click(37)"></th>
					</tr>
					<tr>
						<td>
							<div class="select" id="selectJeonbuk" style="display: none">
								<select id="jeonbukSlt" onchange="listChk(this.value,37);">
								</select>
							</div>
						</td>
					</tr>
				</table>
				<!--전라북도 버튼 끝  -->
				<!--전라남도 버튼  -->
				<table class="areaTable" border="0" width="106" style="float: left;">
					<tr>
						<th><input type="button" value="${jeonnam}"
							class="sidoButton" onclick="jeonnamButton_click(38)"></th>
					</tr>
					<tr>
						<td>
							<div class="select" id="selectJeonnam" style="display: none">
								<select id="jeonnamSlt" onchange="listChk(this.value,38);">
								</select>
							</div>
						</td>
					</tr>
				</table>
				<!--전라남도 버튼 끝  -->
				<!--제주도 버튼  -->
				<table class="areaTable" border="0" width="106" style="float: left;">
					<tr>
						<th><input type="button" value="${jeju}" class="sidoButton"
							onclick="jejuButton_click(39)"></th>
					</tr>
					<tr>
						<td>
							<div class="select" id="selectJeju" style="display: none">
								<select id="jejuSlt" onchange="listChk(this.value,39);">
								</select>
							</div>
						</td>
					</tr>
				</table>
				<!--전라남도 버튼 끝  -->
				
				<table class="areaTable" border="0" width="106" style="float: left;" >
					<tr>
						<th>
							<input type = "button" value = "검색" onclick="searchSub()">
						</th>
					</tr>
				</table>
			</div>
			<!--areaButton 끝  -->

		</div>

	</div>
	<!--Section 끝  -->

<!-- 여기부턴 List																															 -->
	<div class="contents">
		<div class="contentsTop" id = "contentsTop"></div>
		<div class="listArea"><!--tour3.0에서는 listWrap으로 설정 해놨넹?  -->
			<ul class = "galleryList" id = "galleryList">
				
			</ul>
		</div> <!--listArea 끝  -->
		<div class = "pageNavi" id = "pageNavi">
		<!-- <a href="?langtype=KOR&amp;arrange=A&amp;areacode=1&amp;sigungucode=1&amp;mode=listOk&amp;pageNo=1">1</a> -->
			<!-- <a href="?areacode=1&siguncode=1&pageNo=2">2</a> -->		
		</div>
	</div><!--content 끝  -->
	<!--section 끝  -->
	<input type = "text" value = "${email }" id = "email">
	<div class="footer_wrap">
		<%@ include file="footer.jsp"%>
	</div>
	
</body>
</html>