<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!--bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!--font-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- iCheck(라디오버튼) -->
<link rel="stylesheet" href="icheck-1.x/skins/flat/flat.css">
<title>아이디/비밀번호 찾기</title>
<style>
#find-header {
	padding-top: 150px;
}

.findTabMenu {
	margin-top: 100px;
    width: 500px;
    margin-bottom: 150px;
}

.nav-tabs {
	border: 0px!important;
}

.findTab {
	width: 250px;
	cursor: pointer;
	border-top: 1px solid #343a40;
	border-left: 1px solid #343a40;
	border-right: 1px solid #343a40;
	padding-top: 5px;
    padding-bottom: 5px;
    background-color: #343a40;
    color: white;
    font-weight: bold;
}

.findTab a {
	display: block;
}

.tab-content {
	padding-top: 50px;
}

.form-group .form-control, .form-group .form-control-inline {
	border: none;
	border-radius: 0;
	border-bottom: 2px solid grey;
	margin: 0px;
	margin-right: 20px;
}

.form-group .btn {
	font-weight: bold;
}

@media screen and (max-width: 576px) {
	.findTabMenu {
		width: 300px;
	}
	.findTab {
		width: 150px;
		cursor: pointer;
	}
	
}

</style>
</head>
<body>
<div class="main">
	<div class="container" id="find-header">
		<h3>아이디/비밀번호 찾기</h3>
		<div id="border"></div>
		
		<div class="findTabMenu mx-auto">
			<!-- tab 메뉴 -->
			<ul class="nav nav-tabs text-center">
				<li class="findTab active" id="defaultTab" onclick='findTab(this, "white")'><a data-toggle="tab" data-target="#findId">ID 찾기</a>
				<li class="findTab" onclick='findTab(this, "white")'><a data-toggle="tab" data-target="#findPwd">비밀번호 찾기</a>
			</ul>
			<!-- tab 메뉴 -->
			<!-- tab 선택에 따른 내용 -->
			<div class="tab-content">
				<div id="findId" class="tab-pane active">
					<form method="POST" action="findId" id="findIdForm">
						<div class="form-group">
							<label for="findId_name">이름</label>
							<input type="text" class="form-control" id="findId_name" name="mb_name" maxlength="20" placeholder="이름"> 
						</div>
						<div class="form-group">
							<label for="findId_phone">휴대폰 번호</label><br/>
								<input type="tel" class="form-control-inline col-8 col-sm-10" id="findId_phone" name="mb_phone" placeholder='"-"없이 번호만 입력'>
								<button type="button" id="certificate" class="btn btn-dark">인증</button>
							<div class="check_font" id="phone_check"></div>
						</div>
						<div class="form-group">
							<input type="text" class="form-control-inline col-8 col-sm-10" id="findId_sms" name="mb_sms" maxlength="6" placeholder="인증 번호 입력">
							<button type="button" id="checkCertificate" class="btn btn-dark">확인</button>
							<div class="check_font" id="phone_check2"></div>
						</div><br/><br/>
						<div class="form-group text-center">
							<button type="submit" id="submitBtn" class="btn btn-dark form-control" style="border: none;">회원가입</button>
						</div>
					</form>
				</div>
				
				<div id="findPwd" class="tab-pane">
					<form method="POST" action="findPwd" id="findPwdForm">
						<div class="form-group">
							<label for="findPwd_name">아이디</label>
							<input type="text" class="form-control" id="findPwd_name" name="mb_name" maxlength="20"> 
						</div>
					</form>
				</div>
			</div>
			<!-- tab 선택에 따른 내용 -->
		</div>
	</div>
</div>

<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--popper -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!--javascript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- iCheck(라디오 버튼) -->
<script src="icheck-1.x/icheck.min.js"></script>
<script>
function findTab(elmnt, color) {
	var i;
	var findTab;
	findTab = document.getElementsByClassName("findTab");
	for(i = 0 ; i < findTab.length ; i++) {
		findTab[i].style.backgroundColor = "";
		findTab[i].style.color = "white";
	}
	
	elmnt.style.backgroundColor = color;
	elmnt.style.color = "black";
}

document.getElementById("defaultTab").click();
</script>
</body>
</html>