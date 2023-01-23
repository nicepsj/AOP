<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/erp/common/css/main.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			$("#upload").click(function() {
				//파일업로드를 ajax로 처리
				//Ajax를 이용해서 파일업로드를 하는 경우 FormData객체를 이용해서 작업
				//FormData객체는 <form></form>의 모든key와 value가 저장된 객체
				//<form>태그 처럼 데이터가 처리되도록 지원
				//이 FormData객체를 ajax로 전송하면 <form>객체 내부에서 데이터가 전송된 것과 동일한 효과
				//ajax통신을 통해 데이터를 전송하는 경우 기본값이 key=value의 형식으로 전송
				//파라미터와 함께 파일업로드 처리도 해야
				//processData의 기본값은 true  = >false로 변경해야 Query String(key=value)로 전송하지 않는다.
				//------------
				//ajax로 파일업로드 하는 경우
				//multipart/form-data와 동일
				var myfile = $("#myfile")[0];
				//자바에서 발생한 값을 자바스크립트에서 사용하는 방법
				//=> 아이디와 부서명을 전달
				//=> 아이디와 부서명은 로그인이 완료된 후에 세션에 저장되어 있는 것을 꺼내와야 한다.
				var id = "${user.id}";
				var deptname = "${user.deptname}";
				var myformdata = new FormData();//컨트롤러에 dto로 데이터를 전송하기 위해서 작업
				//name은 dto의 멤버변수명 ,value는 값
				myformdata.append("id", id);
				myformdata.append("dept", deptname);
				myformdata.append("state", "false");
				myformdata.append("file", myfile.files[0]);
				
				/* FormData에 값이 제대로 저장이 되었는지 체크 */
				//필드 =>  key, value
				//FormData객체의 모든 키(필드)들을 추출해서 출력하기 위한 코드
				for(key of myformdata.keys()){
					console.log(key);
				}
				//FormData객체의 모든 value(필드에 저장된 값)들을 추출해서 출력하기 위한 코드
				for(val of myformdata.values()){
					console.log(val);
				}
				$.ajax({
					url:"/erp/naverclova/ocr",
					type:"post",
					processData:false,
					contentType:false,
					cache:false,
					data:myformdata,
					success:function(data){
						//문자열로 구성된 json문자열을 파싱
						var jsonObj = JSON.parse(data);
						console.log(jsonObj.images[0].fields[0]);
						$("#storename").text(jsonObj.images[0].fields[0].inferText);
						$("#storeaddr").text(jsonObj.images[0].fields[2].inferText);
						$("#storetel").text(jsonObj.images[0].fields[1].inferText);
						$("#totalprice").text(jsonObj.images[0].fields[3].inferText);
						
					}
				})
			});
		});
	
	
	</script>
</head>

<body>
	<div class="container">
		<h3>경비처리하기</h3>
		<form  method="post" enctype="multipart/form-data" action="/erp/naverclova/ocr">
			<div class="row">

				<input type="file" name="file" id="myfile" 
					onchange="document.getElementById('userImage').src = window.URL.createObjectURL(this.files[0])"
					accept="image/*">

			</div>
			<div class="row">
				<div class="col-sm-4">
					<div class="thumbnail">
						<img src="/erp/images/myphoto.jpg" id="userImage" width="400"
							height="300">
						<p>
							<strong>영수증을 첨부하세요</strong>
						</p>
					</div>
				</div>
				<div class="col-sm-8">

					<div class="form-group">
						<label for="email">매장이름:</label> <span id="storename"></span>
					</div>
					<div class="form-group">
						<label for="pwd">매장주소:</label> <span id="storeaddr"></span>
					</div>
					<div class="form-group">
						<label for="pwd">매장전화번호:</label> <span id="storetel"></span>
					</div>
					<div class="form-group">
						<label for="pwd">총결제금액:</label> <span id="totalprice"></span>
					</div>
					<button type="button" class="btn btn-default" id="upload">파일업로드</button>


				</div>
			</div>
		</form>
	</div>

</body>
</html>