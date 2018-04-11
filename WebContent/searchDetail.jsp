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

<script type="text/javascript">
	window.onload = function(){
		alert("onload");
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
		$(function () {
			alert("확인");
		$("#con").each(function () {
	        alert("con");
	        // Run formatWord function and specify the length of words display to viewer
	        $(this).html(formatWords($(this).html(), 100));
	        
	        // Hide the extra words
	        $(this).children('span').hide();
	        
	        // Apply click event to read more link
	    }).click(function () {
	    	alert("click");
	        // Grab the hidden span and anchor
	        var more_text = $(this).children('span.more_text');
	        var more_link = $(this).children('a.more_link');
	        
	        // Toggle visibility using hasClass
	        // I know you can use is(':visible') but it doesn't work in IE8 somehow...
	        if (more_text.hasClass('hide')) {
	            more_text.show();
	            more_link.html(' &raquo; hide');        
	            more_text.removeClass('hide');
	        } else {
	            more_text.hide();
	            more_link.html(' &laquo; more');            
	            more_text.addClass('hide');
	        }
	        return false;
	        
	    });
		});
	};
	
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
	
/* 	function formatWords(sentence, show) {
		 alert("formatWords");
		    // split all the words and store it in an array
		    var words = sentence.split(' ');
		    var new_sentence = '';
		    // loop through each word
		    for (i = 0; i < words.length; i++) {
		        // process words that will visible to viewer
		        if (i <= show) {
		            new_sentence += words[i] + ' ';
		            
		            // process the rest of the words
		        } else {
		            
		            // add a span at start
		            if (i == (show + 1)) new_sentence += '... <span class="more_text hide">';        
		            new_sentence += words[i] + ' ';
		            
		            // close the span tag and add read more link in the very end
		            if (words[i+1] == null) new_sentence += '</span><a href="#" class="more_link"> &raquo; more</a>';
		        }         
		    }
		    return new_sentence;
		} */
	


	
	
	/* .overview(개요) 더보기 기능 구현 */
	/* $(function () { */
    // Grab all the excerpt class
   
   
/* }); */

	// Accept a paragraph and return a formatted paragraph with additional html tags
	 
	 
	
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
	width : 400px;
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
	height: 650px;
	border: 1px solid black;
}


.overview {
	width: 1000px;
	height: 300px;
	border: 1px solid pink;
	margin-top : 10px;
	margin-bottom: 10px;
	
}

.info {
	width: 1000px;
	height: 300px;
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
%>

	<div id="test">test
		<input type = "button" id = "wish" value = "즐겨찾기" onclick = "isAddWish('${contentTypeId}','${contendtid }','${email }')">
		<c:choose>
			<c:when test="${result=='0' }">
				즐겨 찾기 추가 안됨
			</c:when>
			<c:when test="${result=='1' }">
				즐겨 찾기 추가 됨
			</c:when>
		</c:choose>
	</div>
	
	<div class="section1">
		<!--이미지 & 간략 설명  -->
		<div class="search1Area">
			
			<div class="touristName" id = "touristName">
				 
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
		<div class="info" id = "info">
		소개정보
		</div> <!--listArea 끝  -->
	</div><!--content 끝  -->
	<!--section 끝  -->
	<!--hidden text  -->
	<div class = "hidden" id = "hidden">
		<%-- <input type = "text" value ="${contentTypeId}" id = "contentTypeId">
		<input type = "text" value ="${contendtid}" id = "contendtid">  --%>
	 	<input type = "text" value ="12" id = "contentTypeId">
		<input type = "text" value ="127213" id = "contendtid"> 
		<input type = "text" value ="${email }" id = "email">
		<input type = "text" value = "${result }" id = "result">
	</div>
		<%@ include file="footer.jsp"%>
	
</body>
</html>