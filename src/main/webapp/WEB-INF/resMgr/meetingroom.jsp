<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
/* @media ( max-width : 1080px) .front .content .location-wrap
	.location-select-title {
	margin-left:0;
	padding-left:45px;
	padding-top:100px;
	font-size:18px;
	line-height:27px;
}

@media ( max-width : 1080px) .front .content .room-banner-wrap {
	margin-bottom:10px;
	padding	:15px 32px	;
	border-radius:5px;
	}

.front .content .room-banner-wrap {
	position: relative;
	margin-bottom: 20px;
	padding: 25px 65px;
	background-color: #fff;
	border: 1px solid #dcdcdc;
	border-radius: 10px;
	transition: all 0.3s;
}

.content .location-wrap .location-select-title {
	margin-left: 8px;
	margin-right: 30px;
	padding: 0;
	font-size: 22px;
	font-weight: bold;
	line-height: 33px;
	color: #333;
} */
.bg-1 { 
    background-color: #1abc9c;
    color: #ffffff;
  }
  .bg-2 { 
    background-color: #474e5d;
    color: #ffffff;
  }
  .bg-3 { 
    background-color: #ffffff;
    color: #555555;
  }
  img{
  	margin: 30px
  }
</style>
</head>
<body>



	<div class="container-fluid text-center bg-grey">
	
		<div class="content">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<div class="location-wrap">
				<label class="location-select-title" for="locationSelectToggle">회의실예약</label>

			</div>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  <div class="row text-center">
	    <div class="col-sm-4">
	      <div class="thumbnail" >
	      	<strong>102호</strong>
	        <img src="/erp/images/multi1.jpg" alt="Paris">
	        <p><strong>재무부</strong></p>
	        <p>2023년 예산안</p>
	      </div>
	    </div>
	    <div class="col-sm-4">
	      <div class="thumbnail">
	      	<strong>103호</strong>
	        <img src="/erp/images/multi2.jpg" alt="New York">
	        <p><strong>빈회의실</strong></p>
	        <p>예약가능합니다.</p>
	      </div>
	    </div>
	    <div class="col-sm-4">
	      <div class="thumbnail">
	      	<strong>104호</strong>
	        <img src="/erp/images/multi3.jpg" alt="San Francisco">
	        <p><strong>영업부</strong></p>
	        <p>2023년 1분기 마케팅 전략</p>
	      </div>
	    </div>
		</div>
		</div>
	</div>
</body>
</html>