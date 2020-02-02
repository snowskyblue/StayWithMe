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
#border {
	border: 3px solid #000000;
	/*border-collapse: collapse;*/
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
    background-color: #343a40;
    color: white;
    font-weight: bold;
}

.findTab a {
	display: block;
	padding-top: 5px;
    height: 35px;
    width: 250px;
}

.tab-content {
	padding-top: 30px;
}

.findForm {
	width: 400px;
}

.findTab_info {
	font-size:15px;
	font-weight: bold;
	padding: 20px;
	padding-bottom: 50px;
    margin-bottom: 50px;
    border-bottom: 1px solid lightgrey;
}

.findTab_info i {
	font-size: 40px;
    margin-bottom: 10px;
}

#findId_name {
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
	.findTabMenu {
		width: 300px;
	}
	
	.findTab {
		width: 150px;
		cursor: pointer;
	}
	
	.findTab_info {
		font-size: 14px;
	}
	
	.findTab a {
		width: 150px;
	}
	
	.findForm {
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
	<div class="container" id="find-header">
		<h3>휴대폰 인증 받기</h3>
		<div id="border"></div>
		
		<div class="findTabMenu mx-auto">
			<!-- tab 선택에 따른 내용 -->
			<div class="tab-content">

				<div id="findId" class="tab-pane active mx-auto">
					<div class="findTab_info text-center">
						<i class="fas fa-exclamation-circle"></i><br/>
						<p>소셜 로그인을 하려면 휴대폰 인증이 필요합니다.</p>
					</div>
					<form action="#" class="mx-auto findForm">
						<div class="form-group">
							<label for="findId_phone">휴대폰 번호</label><br/>
							<div class="form_center">
								<input type="tel" class="form-control-inline col-8 col-sm-8" id="phoneNumber" name="mb_phone" maxlength="11" placeholder='"-"없이 번호만 입력'>
								<button type="button" onclick="namePhoneCheck(); phoneCertify();" id="phone_certify" class="btn btn-dark">인증</button>
								<div class="check_font" id="phone_check"></div>
							</div>
						</div>
						<div class="form-group">
							<div class="form_center">
								<input type="text" class="form-control-inline col-8 col-sm-8" id="findId_sms" name="mb_sms" maxlength="6" placeholder="인증 번호 입력">
								<button type="button" id="sms_confirm" class="btn btn-dark">확인</button>
								<div class="check_font" id="phone_check2"></div>
							</div>
						</div><br/><br/>
						<div class="form-group text-center">
							<button type="button" id="findIdBtn" class="btn btn-dark form-control" style="border: none;">아이디 찾기</button>
						</div>
					</form>
				</div>
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




</script>
</body>
</html>