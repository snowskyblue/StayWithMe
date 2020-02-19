<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
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
<title>Insert title here</title>
<style>
@font-face { font-family: 'Eoe_Zno_L'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_eight@1.0/Eoe_Zno_L.woff') format('woff'); font-weight: normal; font-style: normal; }
@font-face { font-family: 'S-CoreDream-2ExtraLight'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-2ExtraLight.woff') format('woff'); font-weight: normal; font-style: normal; }
@font-face { font-family: 'KBIZHanmaumGothic'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/KBIZHanmaumGothic.woff') format('woff'); font-weight: normal; font-style: normal; }

.sidenav {
	height: 100%;
	width: 300px;
	position: fixed;
	z-index: 1;
	top: 0;
	left: 0;
	background-color: #111;
	overflow-x: hidden;
	padding-top: 20px;
	font-weight: bold;
}

.sidenav img {
	width: 250px;
}

.sidenav a {
	padding: 6px 6px 6px 20px;
	text-decoration: none;
	font-size: 25px;
	color: #818181;
	display: block;
	font-style: italic;
}

.sidenav p {
	color:white;
	font-size:20px;
	text-align: center;
	font-weight: normal;
    padding-bottom: 40px;
    border-bottom: 1px solid white;
}

.sidenav a:hover {
	color: #f1f1f1;
}

@media screen and (max-height: 450px) {
	.sidenav {padding-top: 15px;}
	.sidenav a {font-size: 18px;}
}
* {
	font-family: 'S-CoreDream-2ExtraLight';
}
</style>
</head>
<body>

<div class="sidenav">
	<a href="index" id="home"> <img src="img/logo2.jpg" id="logoimg" alt="stay with me" style="margin-top: 15px;"></a>
	<sec:authentication property="principal.username" var="mb_id"/>
	<p align="right">${mb_id}님 접속중</p>
	<a href="adminMain">관리자 메인페이지</a>
	<a href="csAdmin">1:1 문의 관리</a>
	<a href="#">회원관리</a>
	<a href="#">Contact</a>
</div>


<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--popper -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!--javascript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script>
</script>
</body>
</html>