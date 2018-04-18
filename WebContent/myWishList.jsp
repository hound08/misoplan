<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="header.jsp" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
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
			 #myinfo {
				border: 1px solid green;
			}
			.card {
				float: left;
				width: 290px;
				height: 200px;
				border: 1px solid;
				margin: 8px;
			}
			.cardhead  img{
				border-radius: 15px;
				width: 100%;                /* 카드 이미지 사이즈 */
				height: 150px;
			}
			.cardcheckbox {
				float: right;        /* 체크 박스 정렬 */
			}
			.cardbody {
				border: 1px solid yellow;
				height: 45px;
			}
			#cardmenu {
				border: 1px solid;
				float: right;
			}
			#cardall{
				clear: both;
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
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
    	<script type="text/javascript">
    	  function CheckAll(checkBoxes, checked)

    	    {
    	        var i;
    	        if(checkBoxes.length)

    	        {
    	            for(i=0;i<checkBoxes.length;i++)

    	                checkBoxes[i].checked=checked
    	        }
    	        else
    	            checkBoxes.checked=checked
    	    }
    	  function cardclick(contendtid, contenttypeid, email ) {
    			var id = "id="+contendtid;
    			var typeId = "typeId="+contenttypeid;
    		
    			$.ajax({
    				type: "get",
    				url: "Detail1",
    				data: {
    					id: contendtid, typeId: contenttypeid
    				},
    			dataType: "json",
    			success:function(data){
    				var myItem 		= data.response.body.items.item;
    				var contentTypeId 		= myItem.contenttypeid;
    				var contendtid 		= myItem.contentid;
    				var mapx 		= myItem.mapx;
    				var mapy 		= myItem.mapy;
    				var firstimage 		= myItem.firstimage;
    				
    				goDetail(contentTypeId,contendtid,mapx,mapy,firstimage,email);
    			}
    				
    				
    			});	
    				
			}
    	  function goDetail(contentTypeId,contendtid,mapx,mapy,firstimage,email){
    		  console.log("goDetail");
    		  var url = "searchDetail.do?contentTypeId="+contentTypeId +"&"
    				  		+"contendtid=" + contendtid +"&"
    				  		+"email=" + email + "&"
    				  		+ "mapx=" + mapx + "&"
    				  		+ "mapy=" + mapy + "&"
    				  		+ "firstImage=" + firstimage;
    		  location.href=url;
    	  }
    	  
    	</script>
	</head>
	<body>
		<div id="center">
			<%@ include file="sidemenu.jsp" %>
			<div id="main">
				<h1>나의 찜 리스트</h1>
				<div id="myinfo">
				<form action="myWishListPro.do" name="wish">
					<div id="cardmenu">
						<input type="checkbox" name="wishlist_all" onclick="CheckAll(document.wish.wishlist, this.checked)"> 전체선택 | 
						<input type="submit" value="삭제"> | 
						<input type="reset" value="취소">
					</div>
					<div id="cardall">
						<c:forEach var="list" items="${list }">
							<input type="checkbox" name="wishlist" class="cardcheckbox" value="${list.contendtid }">
								<div class="card" onclick="cardclick('${list.contendtid}', '${list.contenttypeid }', '${list.email }')">
								<div class="cardhead">
									<img alt="tour_img" src="${list.img_src }">
								</div>
								<div class="cardbody">
									<a href="#">${list.tour_name }</a>
								</div>
								</div>
						</c:forEach>
					</div>
				</form>
				
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
	</body>
</html>