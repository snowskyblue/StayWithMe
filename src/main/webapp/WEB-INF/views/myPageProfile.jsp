<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
<!-- datepicker -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/css/bootstrap-datepicker.min.css" rel="stylesheet" />
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">
<title>마이페이지/프로필</title>
<style>
#information-header {
	padding-top: 150px;
}
#border {
	border: 3px solid #000000;
	/*border-collapse: collapse;*/
}

.informationTabMenu {
	margin-top: 100px;
    width: 80%;
    margin-bottom: 150px;
}

.nav-tabs {
	border: 0px!important;
}

.informationTab {
	width: 50%;
	cursor: pointer;
	border-top: 1px solid #343a40;
	border-left: 1px solid #343a40;
	border-right: 1px solid #343a40;
    background-color: #343a40;
    color: white;
    font-weight: bold;
}

.informationTab a {
	display: block;
	padding-top: 5px;
    height: 35px;
    width: 100%;
}

.tab-content {
	padding-top: 30px;
}

.informationForm {
	width: 400px;
}

.informationTab_info {
	font-size:15px;
	font-weight: bold;
	padding: 20px;
	padding-bottom: 50px;
    margin-bottom: 50px;
    border-bottom: 1px solid lightgrey;
}

.informationTab_info i {
	font-size: 40px;
    margin-bottom: 10px;
}

#myPage_name {
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
	.informationTabMenu {
		width: 300px;
	}
	
	.informationTab {
		width: 150px;
		cursor: pointer;
	}
	
	.informationTab_info {
		font-size: 14px;
	}
	
	.informationTab a {
		width: 150px;
	}
	
	.informationForm {
		width: 300px;
	}
	
	.form_center {
		padding-left: 20px;
	}
}

</style>
</head>
<body>
<div class="main">
	<div class="container" id="information-header">
		<h3>마이페이지/프로필</h3>
		<div id="border"></div>
		
		<div class="informationTabMenu mx-auto">
			<!-- tab 메뉴 -->
			<ul class="nav nav-tabs text-center">
				<li class="informationTab active" id="defaultTab" onclick='informationTab(this, "white")'><a data-toggle="tab" data-target="#myPage">마이페이지</a>
				<li class="informationTab" onclick='informationTab(this, "white")'><a data-toggle="tab" data-target="#profile">프로필</a>
			</ul>
			<!-- tab 메뉴 -->
			<!-- tab 선택에 따른 내용 -->
			<div class="tab-content">
				<div id="myPage" class="tab-pane active mx-auto">
					
				</div>
				<div id="profile" class="tab-pane">
				
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
</body>
</html>