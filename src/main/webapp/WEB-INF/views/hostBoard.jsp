<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!--bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!--font-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.main1 {
	margin-top: 100px;
}
#top-container {
	padding-top: 150px;
}

.form-group label, .container h3, .container div{
	font-family: 'S-CoreDream-2ExtraLight';
	font-weight: bold;
}

#border {
	border: 3px solid #000000;
	/*border-collapse: collapse;*/
}

form {
	/*margin-top: 50px;*/
	margin-bottom: 100px;
}
.tabMenu {
	margin-top: 100px;
    width: 80%;
    margin-bottom: 150px;
}

.nav-tabs {
	border: 0px!important;
}

.tab {
	width: 50%;
	cursor: pointer;
	border-top: 1px solid #343a40;
	border-left: 1px solid #343a40;
	border-right: 1px solid #343a40;
    background-color: #343a40;
    color: white;
    font-weight: bold;
}

.tab a {
	display: block;
	padding-top: 5px;
    height: 35px;
    width: 100%;
}

.tab-content {
	padding-top: 30px;
}

.form-control {
	border: none;
	border-radius: 0;
	border-bottom: 2px solid grey;
}

.form-group .btn {
	font-weight: bold;
}

@media screen and (max-width: 576px) {
	.tabMenu {
		width: 300px;
	}
	
	.tab {
		width: 150px;
		cursor: pointer;
	}
	
}

</style>
<title>호스트 알림판</title>
</head>
<body>

<jsp:include page="common/header.jsp" flush = "flase"></jsp:include>
<div class="main">
	<div class="container" id="top-container">
		<h3>호스트 안내판</h3>
		<div id="border"></div>
		
		<div class="tabMenu mx-auto">
			<!-- tab 메뉴 -->
			<ul class="nav nav-tabs text-center">
				<li class="tab active" id="defaultTab" onclick='tab(this, "white")'><a data-toggle="tab" data-target="#list">숙소 관리</a>
				<li class="tab" onclick='tab(this, "white")'><a data-toggle="tab" data-target="#statistics">통계</a>
			</ul>
			<!-- tab 메뉴 -->
			<!-- tab 선택에 따른 내용 -->
			<div class="tab-content">
				<a href="addAcm" class="form-control btn btn-dark" style="border: none;">숙소등록</a>
			</div>
			<!-- **********삭제************************** -->
			<table width="500" cellpadding="0" cellspacing="0" border="1">
		<tr>
			<td>번호</td>
			<td>이름</td>
			<td>제목</td>
			<td>날짜</td>
			<td>히트</td>
		</tr>
		<c:forEach items="${list1}" var="dto">
		<tr>
			<td>${dto.MB_ID}</td>
			<td>${dto.ACM_CODE}</td>
			<td>
				<c:forEach begin="1" end="${dto.ACM_INFO}">-</c:forEach>
				<a href="content_view?bId=${dto.ACM_ADDRESS}">${dto.ACM_ADD_DETAIL}</a></td>
			<td>${dto.ACM_ROOM_NUM}</td>
			<td>${dto.ACM_CHARGE}</td>
		</tr>
		</c:forEach>
		<tr>
			<td colspan="5"> <a href="write_view">글작성</a> </td>
		</tr>
	</table>
			
		<!-- **********삭제************************** -->
			<!-- tab 선택에 따른 내용 -->
		</div>
	</div>
</div>
<!-- Modal -->
<div class="modal fade" id="hostJoinModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<img src="img/logo.jpg">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body text-center" style="font-weight:bold;">
				 숙소등록이 완료되었습니다.
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-dark" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<jsp:include page="common/footer.jsp" flush="false"/>

<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--popper -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!--javascript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script>
$(document).ready(function() {
	<c:choose>
		<c:when test="${not empty hostJoin}">
			$("#hostJoinModal").modal("show");
		</c:when>
	</c:choose>
	$(".menu-toggle").click(function() {
		$("nav").toggleClass("active")
		$(".main").toggleClass("main1")
	});
});

function tab(elmnt, color) {
	var i;
	var tab;
	tab = document.getElementsByClassName("tab");
	for(i = 0 ; i < tab.length ; i++) {
		tab[i].style.backgroundColor = "";
		tab[i].style.color = "white";
	}
	
	elmnt.style.backgroundColor = color;
	elmnt.style.color = "black";
}
document.getElementById("defaultTab").click(); //active
</script>

</body>
</html>