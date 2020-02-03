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
<title>소셜 로그인 핸드폰 인증</title>
<style>
#login-header {
	padding-top: 150px;
}
#border {
	border: 3px solid #000000;
	/*border-collapse: collapse;*/
}

.loginTabMenu {
	margin-top: 100px;
    width: 500px;
    margin-bottom: 150px;
}

.nav-tabs {
	border: 0px!important;
}

.loginTab {
	width: 250px;
	cursor: pointer;
	border-top: 1px solid #343a40;
	border-left: 1px solid #343a40;
	border-right: 1px solid #343a40;
    background-color: #343a40;
    color: white;
    font-weight: bold;
}

.loginTab a {
	display: block;
	padding-top: 5px;
    height: 35px;
    width: 250px;
}

.tab-content {
	padding-top: 30px;
}

.loginForm {
	width: 400px;
}

.loginTab_info {
	font-size:15px;
	font-weight: bold;
	padding: 20px;
	padding-bottom: 50px;
    margin-bottom: 50px;
    border-bottom: 1px solid lightgrey;
}

.loginTab_info i {
	font-size: 40px;
    margin-bottom: 10px;
}

#loginId_name {
	margin-bottom: 50px;
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

.form_center {
	padding-left: 35px;
}

@media screen and (max-width: 576px) {
	.loginTabMenu {
		width: 300px;
	}
	
	.loginTab {
		width: 150px;
		cursor: pointer;
	}
	
	.loginTab_info {
		font-size: 14px;
	}
	
	.loginTab a {
		width: 150px;
	}
	
	.loginForm {
		width: 300px;
	}
	
	.form_center {
		padding-left: 20px;
	}
}

</style>
</head>
<body>
<jsp:include page="common/header.jsp" flush="false"/>
<div class="main">
	<div class="container" id="login-header">
		<h3>휴대폰 인증 받기</h3>
		<div id="border"></div>
		
		<div class="loginTabMenu mx-auto">
			<div class="tab-content">
				<div id="loginId" class="tab-pane active mx-auto">
					<div class="loginTab_info text-center">
						<i class="fas fa-exclamation-circle"></i><br/>
						<p>소셜 로그인을 하려면 휴대폰 인증이 필요합니다.</p>
					</div>
					<form action="#" class="mx-auto loginForm">
						<div class="form-group">
							<label for="loginId_phone">휴대폰 번호</label><br/>
							<div class="form_center">
								<input type="tel" class="form-control-inline col-8 col-sm-8" id="mb_phone" name="mb_phone" maxlength="11" placeholder='"-"없이 번호만 입력'>
								<button type="button" onclick="namePhoneCheck(); phoneCertify();" id="phone_certify" class="btn btn-dark">인증</button>
								<div class="check_font" id="phone_check"></div>
							</div>
						</div>
						<div class="form-group">
							<div class="form_center">
								<input type="text" class="form-control-inline col-8 col-sm-8" id="loginId_sms" name="mb_sms" maxlength="6" placeholder="인증 번호 입력">
								<button type="button" id="sms_confirm" class="btn btn-dark">확인</button>
								<div class="check_font" id="phone_check2"></div>
							</div>
						</div><br/><br/>
						<div class="form-group text-center">
							<button type="button" id="loginBtn" class="btn btn-dark form-control" style="border: none;">아이디 찾기</button>
						</div>
					</form>
				</div>
			</div>	
		</div>
	</div>
</div>

<!-- Modal -->
<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<img src="img/logo.jpg">
				<button type="button" id="modalClose1" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div id="loginModal_body"class="modal-body text-center" style="font-weight:bold;">
				 
			</div>
			<div class="modal-footer">
				<button type="button" id="modalClose2" class="btn btn-dark" data-dismiss="modal">Close</button>
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
<!-- iCheck(라디오 버튼) -->
<script src="icheck-1.x/icheck.min.js"></script>
<script>
var phoneJ = /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;

function namePhoneCheck() {
	var loginId_phone = document.getElementById("mb_phone");
	
	if(loginId_phone.value == "") {
		$("#loginModal").modal("show");
		loginModal_body.innerHTML = "전화번호를 입력하세요.";
	}
	
	else if(phoneJ.test(loginId_phone.value) != true) {
		$("#loginModal").modal("show");
		loginModal_body.innerHTML = "전화번호 형식이 올바르지 않습니다.";
	}
	
	else {
		$.ajax({
			url : "phoneCheck",
			data : {mb_phone : $("#mb_phone").val()},
			type : "post",
			success : function(data) {
				if(data == "0") {
					$("#loginModal").modal("show");
					loginModal_body.innerHTML = "입력 가능한 전화번호 입니다.";
				}
				else {
					$("#loginModal").modal("show");
					loginModal_body.innerHTML = "회원가입이 되어있는 전화번호 입니다.";
				}
			},
			error : function() {
				alert("server error");
			}
		});
	}
}

//인증문자 발송
function phoneCertify() {
	if(findId_name.value != "" && phoneJ.test(findId_phone.value) == true){
		var mb_name = findId_name.value;
		var mb_phone = findId_phone.value;
		
		$.ajax({
			url: "findIdCheck",
			data: {mb_name : mb_name, mb_phone : mb_phone},
			type:"POST",
			success: function(data) {
				console.log(data);
				if(data != "notFoundId") {
					$("#findModal").modal("show");
					findModal_body.innerHTML = "인증번호가 발송되었습니다.";
					sendSms();
					foundId = data;
				}
				else {
					$("#findModal").modal("show");
					findModal_body.innerHTML = "입력하신 정보가 회원정보와<br/>일치하지 않습니다.<br/> 다시 확인해주세요.";	
					foundId = data;
				}
				return foundId;
			}
		});

	}
}

//문자 인증 일치확인
function sendSms() {
	$.ajax({
		url: "sendSms",
		data : {
	    	   mb_phone : $("#findId_phone").val()
	       },
	       success : function(result){
	    	   console.log(result);
	    	   if(result != null) {
	    		   $("#sms_confirm").on("click", function() {
	    			 if(JSON.parse(result) == ($("#findId_sms").val())) {
	    				 $("#phone_check2").text("인증되었습니다.");
	    				 $("#phone_check2").css("color", "blue");
	    			 }
	    			 else {
	    				 $("#phone_check2").text("인증실패. 다시 입력하세요.");
	    				 $("#phone_check2").css("color", "red");
	    			 }
	    		  })
	    	   }   
	       }
	});
}



</script>
</body>
</html>