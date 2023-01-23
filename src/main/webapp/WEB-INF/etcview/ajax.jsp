<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#noajaxbtn").on("click",function(){
			location.href="/erp/ajax/noajax?id="+$("#id1").val()
		})
		$("#ajaxbtn").on("click",function(){
			var querydata = {"id":$("#id1").val()}
			$.ajax({
				url:"/erp/ajax/ajaxtest01",
				type:"get",
				data:querydata,
				success:success_run1,
				error:error_run
			})//end ajax
		})//end click
	})//end ready
	//ajax요청이 성공하면 .ajax메소드 내부에서 success속성에 설정한 함수를 호출하면서
	//ajax의 처리 결과를 함수의 매개변수로 전달 - 자동
	function success_run1(txt){
		//alert(txt)
		$("#result").html("<h2>jquery:"+txt+"</h2>")
	}
	//obj - ajax통신을 하는 XMLHttpRequest객체,msg-응답메시지,statusMsg - 에러메시지
	function error_run(obj,msg,statusMsg) {
		alert("오류발생=>"+obj+","+msg+","+statusMsg);
	}
</script>
<title>Insert title here</title>
</head>
<body>
	<h3>Ajax테스트하기</h3>
	<form name="myform">
		<input type="text" name="id" id="id1"/>
		<input type="text" name="name" id="name"/>
		<input type="button" id="noajaxbtn" value="no ajax테스트">
		<input type="button" id="ajaxbtn" value="ajax테스트">
	</form>
	<div id="result">${msg }</div>
	
	<h3>Ajax테스트하기(JQuery...get)</h3>
	<form name="myform">
		<input type="text" name="id" id="id2"/>
		<input type="button" id="ajaxbtn2" value="ajax테스트">
	</form>
	<div id="result2"></div>


	<h3>Ajax테스트하기(JQuery...post)</h3>
	<form name="myform">
		<input type="text" name="id" id="id3"/>
		<input type="button" id="ajaxbtn3" value="ajax테스트">
	</form>
	<div id="result3"></div>
</body>
</html>