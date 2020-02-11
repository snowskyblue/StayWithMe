<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
<title>Insert title here</title>
<style>
footer {
    height:300px;
    width:100%;	
}
</style>
<body>
<footer class="bg-dark">
	<div class="text-center text-secondary">
		<div>방문자수 : <span id="visitN"></span></div>
		<div>방문자수 : <span id="visitMN"></span></div>
		<div>- 상호 : (주)스테이윗미 - 대표자 : 이상묵</div>
		<div>- 사업장소재지 : 서울특별시 종로구 자하문로9길 24, 2층(통인동) - TEL : 1670-4123</div>
		<div>- 사업자등록번호: 676-87-00055 - 통신판매업신고 : 제2015-서울종로-0499호 </div>
		<div>- 관광사업자등록 : 일반여행업 2018-000049호(종로구청)</div>
		<div>&nbsp;</div>
		<div>* 스테이윗미의 모든 거래에 대한 책임과 환불, 민원 등의 처리는 스테이윗미에서 진행합니다.</div>
		<div>* 자세한 문의는 웹사이트의 Contact 또는 유선(1670-4123)으로 가능합니다.</div>
	</div>
</footer>

<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--popper -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!--javascript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script>
$(document).ready(function(){
	//이벤트를 받기 위한 이벤트소스 객체 생성
	var eventSource = new EventSource("event"); //서버요청경로가 eventEx
	eventSource.addEventListener("up_visit",function(event){
        $("#visitN").text(event.data);
     },false);
     eventSource.addEventListener("up_visitM",function(event){
        $("#visitMN").text(event.data);
     },false);
});
</script>

</body>
</html>