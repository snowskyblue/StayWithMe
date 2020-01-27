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
#information {
	margin-top: 100px;
    margin-bottom: 150px;
}
.Validation {
	margin : 0px;
}
</style>
</head>
<body ng-app = "myApp">
<jsp:include page="common/header.jsp" flush = "flase"></jsp:include>
	<div class="main">
		<div class="container" id="edit-header">
			<h3>회원정보 수정</h3>
			<div id="border"></div>
			<form action = "Information" id="information" class = "d-flex justify-content-center" method = "POST" ng-controller = "myCtrl">
				<div id = "form" style = "margin : 0px; width : 50%;">
					<label>아이디</label>
					<input type = "text" class = "form-control" id = "id" disabled ng-model = "myModel"/>
					<br/>
					<label>새 비밀번호</label>
					<input type = "password" class = "form-control" placeholder="변경할 비밀번호를 입력하세요." id ="mb_pwd1"/>
					<div class = "password Validation" id ="mb_pwd1_check"></div>
					<br/>
					<label>비밀번호 확인</label>
					<input type = "password" class = "form-control" placeholder="동일한 비밀번호를 입력하세요." id ="mb_pwd2"/>
					<div class = "password1 Validation" id ="mb_pwd2_check"></div>
					<br/>
					<label>이메일</label>
					<input type = "email" class = "form-control" placeholder="이메일을 입력해 주세요"/>
					<div class = "email Validation"></div>
					<br/>
					<label>전화번호</label>
					<input type = "tel" class = "form-control" placeholder="전화번호를 입력해 주세요"/>
					<div class = "tel Validation"></div>
					<br/>
					<!-- 권한이 host일 경우 보이게 하고 guest일 경우 안보이게 하면됨 -->
					<label>주소</label>
					<input type = "text" class = "form-control" placeholder="주소를 입력해 주세요"/>
					<div class = "address Validation"></div>
					<br/>
				</div>
			</form>
		</div>
	</div>
<jsp:include page="common/footer.jsp" flush="false"/>
<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- angularjs -->
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
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
var user = sessionStorage.getItem("user")
var app = angular.module("myApp",[])
app.controller("myCtrl",function($scope){
	$scope.myModel = user;
});
</script>
<script>
$(document).ready(function() {
	$("#mb_pwd1").blur(function() {
		pwd();
	});
	$("#mb_pwd2").blur(function() {
		pwd1();
	});
	
});
</script>
<script>
//모든 공백 체크 정규식
var empJ = /\s/g;
var idJ = /^[a-z0-9][a-z0-9_-]{3,20}$/;
var pwdJ = /^[A-Za-z0-9]{4,20}$/; 
var nameJ = /^[가-힣]{2,20}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
var emailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
var phoneJ = /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;
var birthJ = /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/;
var result = null;

function pwd() {
	if($("#mb_pwd1").val() == "") {
		//mb_pwd에 아무것도 적지 않았을때
		$("#mb_pwd1_check").text("비밀번호를 입력하세요");
		$("#mb_pwd1_check").css("color" , "red");
		pwdA = false;
	}
	else if (pwdJ.test($("#mb_pwd1").val()) != true) {
		$("#mb_pwd1_check").text("4~20자의 영문 대 소문자, 숫자만 사용 가능합니다.");
		$("#mb_pwd1_check").css("color", "red");
		pwdA = false;
	}
	else {
		$("#mb_pwd1_check").text("사용 가능한 비밀번호 입니다.");
		$("#mb_pwd1_check").css("color", "blue");
		pwdA = true;
	}
}

function pwd1() {
	if($("#mb_pwd2").val() == "" || $("#mb_pwd1").val() != $("#mb_pwd2").val()) {
		$("#mb_pwd2_check").text("비밀번호가 일치하지 않습니다.");
		$("#mb_pwd2_check").css("color", "red");
		pwdB = false;
	}
	else {
		$("#mb_pwd2_check").text("비밀번호가 일치합니다.");
		$("#mb_pwd2_check").css("color", "blue");
		pwdB = true;
	}
}


</script>
</body>
</html>