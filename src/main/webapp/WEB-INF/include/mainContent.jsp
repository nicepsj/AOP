<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="/erp/common/css/main.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
/* Remove the navbar's default margin-bottom and rounded borders */
.navbar {
	margin-bottom: 0;
	border-radius: 0;
}

</style>
<script type="text/javascript">
	$(document).ready(function() {
		//id가 boardCategory인 엘리먼트의 모든 li하위엘리먼트에 동일한 코드를 적용하겠다.
		$("#boardCategory>li").each(function() {
			//현재 작업 중인 객체가 선택되면 실행
			$(this).click(function() {
				category = $(this).text();//현재 작업 중인 li의 text를 추출
				$("#boardCategory>li").removeAttr("class");//기존의 모든  li에 정의되어 있는 class속성을 지우기
				$(this).attr("class","active");//현재 선택한 li가 활성화되도록 class속성 설정
				$.ajax({
					url:"/erp/board/ajax/list.do",
					type:"get",
					data:{
						"category":category
					},
					success:function(data){//data는 ajax통신으로 받은 데이터
						//ajax요청을 성공하면 처리할 작업
						//alert(data.length);
						//ajax요청을 성공하면 서버가 보내준 json객체를 파싱해서 결과를 만들기
						mydata = "";//조회한 json객체의 데이터를 꺼내서 뷰를 만드는 코드를 저장할 변수
						for(i=0;i<data.length;i++){
							//조회된 레코드 갯수만큼 출력할 뷰에 대한 코드
							mydata = mydata+
							"<tr><td class='boardContent' style=''><a href='/erp/board/read.do?board_no="+data[i].board_no+"&state=READ'>"
							+ data[i].title +"</a></td>"
							+ "<td class='boardDate' style=''>"+data[i].write_date+"</td>"
							+"</tr>"
						}
						//기존의 출력된 데이터노드를 삭제하고 
						$("#mydatalist").empty();
						$("#mydatalist").append(mydata);
					},
					error:function(a,b,c){//ajax실패시 원인(에러메시지)
						alert(c);
					}
				});//end ajax
			});//end click
		});//end each
	});//end ready

</script>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-sm-7">
				<div id="myCarousel" class="carousel slide" data-ride="carousel"
					style="width: 600px; height: 300px">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>
					
					</ol>

					<!-- Wrapper for slides -->
					<div class="carousel-inner" role="listbox">
						<div class="item active">
							<img src="/erp/images/multi1.jpg" alt="Image"
								style="width: 600px; height: 300px">

						</div>

						<div class="item">
							<img src="/erp/images/multi2.jpg" alt="Image"
								style="width: 800px; height: 300px">

						</div>
						<div class="item">
							<img src="/erp/images/multi3.jpg" alt="Image"
								style="width: 600px; height: 300px">

						</div>

						
					</div>

					<!-- Left and right controls -->
					<a class="left carousel-control" href="#myCarousel" role="button"
						data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#myCarousel" role="button"
						data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</div>
			<div class="col-sm-5">
				<div class="panel panel-primary"
					style="border-color: #edeef1; height: 300px; width: 450px">
					<div class="panel-footer">사내소식</div>
					<div class="panel-body">
						<ul class="nav nav-tabs" id="boardCategory">
							<li class="active"><a href="#">게시판</a></li>
							<li><a href="#">사내소식</a></li>
							<li><a href="#">경조사</a></li>
						</ul>
						<div id="boardMain" style="padding-top: 20px; padding-left: 10px">
							<table id="mydatalist">
								<c:forEach var="board" items="${boardlist}">
									<tr>
										<td class="boardContent" style=""><a href="/erp/board/read.do?board_no=${board.board_no}&state=READ">${board.title}</a></td>
										<td class="boardDate" style="">${board.write_date}</td>
									</tr>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<hr />
		<div class="row main-row">
			<div class="col-sm-3">
				<div class="panel panel-primary"
					style="border-color: #edeef1; height: 300px">
					<div class="panel-footer">News</div>
					<div class="panel-body"></div>
				</div>
			</div>
			<div class="col-sm-3">
				<div class="panel panel-primary"
					style="border-color: #edeef1; height: 300px">
					<div class="panel-footer">회사소식</div>
					<div class="panel-body"></div>
				</div>
			</div>
			<div class="col-sm-3">
				<div class="panel panel-primary"
					style="border-color: #edeef1; height: 300px">
					<div class="panel-footer">회사소식</div>
					<div class="panel-body"></div>
				</div>
			</div>
			<div class="col-sm-3">
				<div class="panel panel-primary"
					style="border-color: #edeef1; height: 300px">
					<div class="panel-footer">회사소식</div>
					<div class="panel-body"></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>