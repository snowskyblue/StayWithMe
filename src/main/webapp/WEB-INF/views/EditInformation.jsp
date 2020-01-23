<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
<!-- datepicker -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/css/bootstrap-datepicker.min.css" rel="stylesheet" />
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">
<title>회원정보 수정</title>
<style>
#edit-header {
	padding-top: 150px;
}
#border {
	border: 3px solid #000000;
	/*border-collapse: collapse;*/
}
.main1 {
	margin-top : 100px;
}
.d-flex #form .form-control {
	border: none;
	border-radius: 0;
	border-bottom: 2px solid grey;
	margin: 0px;
}
</style>
</head>
<body>
<jsp:include page="common/header.jsp" flush = "flase"></jsp:include>
	<div class="main">
		<div class="container" id="edit-header">
			<h3>회원정보 수정</h3>
			<div id="border"></div>
			<form action = "Information" class = "d-flex justify-content-center" method = "GET">
				<div id = "form" style = "margin : 0px; width : 50%;">
					<label>아이디</label>
					<input type = "text" class = "form-control" id = "id" disabled/><br/>
					<label>새 비밀번호</label>
					<input type = "password" class = "form-control" placeholder="변경할 비밀번호를 입력하세요."/><br/>
					<label>비밀번호 확인</label>
					<input type = "password" class = "form-control" placeholder="동일한 비밀번호를 입력하세요."/><br/>
					<label>이메일</label>
					<input type = "email" class = "form-control" placeholder="이메일을 입력해 주세요"/><br/>
					<label>전화번호</label>
					<input type = "tel" class = "form-control" placeholder="전화번호를 입력해 주세요"/><br/>
					<!-- 권한이 host일 경우 보이게 하고 guest일 경우 안보이게 하면됨 -->
					<label>주소</label>
					<input type = "text" class = "form-control" placeholder="주소를 입력해 주세요"/><br/>
				</div>
			</form>
		</div>
	</div>
<jsp:include page="common/footer.jsp" flush="false"/>
<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--popper -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!--javascript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- iCheck(라디오 버튼) -->
<script src="icheck-1.x/icheck.min.js"></script>
<script>
var emailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
var foundId = null;

function informationTab(elmnt, color) {
	var i;
	var informationTab;
	informationTab = document.getElementsByClassName("informationTab");
	for(i = 0 ; i < informationTab.length ; i++) {
		informationTab[i].style.backgroundColor = "";
		informationTab[i].style.color = "white";
	}
	
	elmnt.style.backgroundColor = color;
	elmnt.style.color = "black";
}
document.getElementById("defaultTab").click(); //active
</script>
<script>
$(document).ready(function() {
	$(".menu-toggle").click(function() {
		$("nav").toggleClass("active");
		$(".main").toggleClass("main1");
	});
});
</script>
<script>
$(document).ready(function() {
	$("#id").text("sessionStorage.getItem('user')");
});
</script>
</body>
</html>