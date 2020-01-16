<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<style>
.findResult {
	font-size:15px;
	font-weight: bold;
	padding: 20px;
	padding-bottom: 50px;
    margin-bottom: 50px;
}

.findResult i {
	font-size: 40px;
    margin-bottom: 10px;
}

#goLoginBtn {
	width: 123px;
}
</style>
<body>
<div class="findResult text-center">
	<i class="fas fa-search"></i><br/>
	조회 결과
</div>
<div class="findTab_info text-center">
	<i class="fas fa-search"></i><br/>
	입력하신 회원정보와 일치하는 아이디는<br/>
	${foundId}<br/>
	입니다. 로그인 하시겠습니까?
</div>
<div id="btnCenter" class="text-center">
	<button type="button" id="goLoginBtn" class="btn btn-dark">로그인</button>&nbsp;&nbsp;
	<button type="button" id="goFindPwdBtn" class="btn btn-dark">비밀번호 찾기</button>
</div>

<script>
${foundId}
$(document).ready(function() {
	$("#goLoginBtn").click(function() {
		location.href="login";
	});
});
</script>
</body>
</html>