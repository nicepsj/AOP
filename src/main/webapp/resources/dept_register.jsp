<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 </head>
<body>
	<div class="container-fluid">
			<form role="form" class="form-horizontal"
				action="/erp/dept/insert.do" method="POST" 
				name="myform">
				<fieldset>
					<div id="legend">
						<legend>아래 양식을 작성해주세요.</legend>
					</div>
				
					<div class="form-group">
						<!-- 부서코드 -->
						<label class="control-label col-sm-2" for="orgcode">부서코드</label>
						<div class="col-sm-3">
							<input type="text" id="orgname" name="deptname"
								placeholder="부서코드" class="form-control" minlength="4" required>
							
						</div>
					</div>
		
					
					
					<div class="form-group">
						<!-- 부서명-->
						<label class="control-label col-sm-2" for="deptname">부서명</label>
						<div class="col-sm-3">
							<input type="text" id="deptname" name="deptname"
								placeholder="부서명" class="form-control" minlength="4" required>

						</div>
					</div>
			
					<div class="form-group">
						<!-- 부서시작일-->
						<label class="control-label col-sm-2" for="deptStartDay">부서시작일</label>
						<div class="col-sm-3">
							<input type="text" id="deptStartDay" name="deptStartDay"
								placeholder="부서시작일" class="form-control" 
								minlength="15" >

						</div>
					</div>
					<div class="form-group">
						<!-- 부서종료일-->
						<label class="control-label col-sm-2" for="deptEndDay">부서종료일</label>
						<div class="col-sm-3">
							<input type="text" id="deptEndDay" name="deptEndDay"
								placeholder="부서종료일" class="form-control" 
								minlength="15" >

						</div>
					</div>
					<div class="form-group">
						<!-- 부서레벨-->
						<label class="control-label col-sm-2" for="deptlevel">부서레벨</label>
						<div class="col-sm-3">
							<input type="text" id="deptlevel" name="deptlevel"
								placeholder="부서레벨" class="form-control" 
								minlength="15" >

						</div>
					</div>
					<div class="form-group">
						<!-- 순서-->
						<label class="control-label col-sm-2" for="deptstep">순서</label>
						<div class="col-sm-3">
							<input type="text" id="deptstep" name="deptstep"
								placeholder="순서" class="form-control" 
								minlength="15" >

						</div>
					</div>
					<div class="form-group">
						<!-- 상위조직코드-->
						<label class="control-label col-sm-2" for="deptuppercode">상위조직코드</label>
						<div class="col-sm-3">
							<select name="deptuppercode" class="form-control" >
								<option value="d001">인사팀
								<option value="d002">재무팀
								<option value="d003">개발팀
								<option value="d0031">디자인팀
								<option value="d0032">Ajax팀
								<option value="d004">개발지원
								<option value="d005">시스템지원팀
								<option value="d006">총무과
								<option value="dg001">경영지원본부
								<option value="dg002">영업본부
								<option value="dg003">IT지원센터
								<option value="d007">교육부
								<option value="d008">기획실
								<option value="d009">영업1팀
								<option value="d010">기업영업본부
								<option value="d011">영업2팀
								<option value="d012">마케팅실
								
							</select>
						</div>
					</div>
					<div class="form-group">
						<!-- job코드-->
						<label class="control-label col-sm-2" for="job_category">업무분류</label>
						<div class="col-sm-3">
							<select name="job_category" class="form-control" >
								<option value="j001">영업관리
								<option value="j002">인사관리
								<option value="j003">전산관리
								<option value="j004">경영관리
								<option value="j005">재무관리
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 col-sm-2 control-label">관리자</label>
						<div class="col-sm-3">
							<select name="mgr_id" class="form-control" >
								<option value="9401023jang">장동건
								<option value="0111022kim">김범룡
								<option value="92115kim">김서연
							
							</select>
								
						</div>
						
					</div>
					<div class="form-group">
						<!-- 부서주소-->
						<label class="control-label col-sm-2" for="deptaddr">부서주소</label>
						<div class="col-sm-6">
							<input type="text" id="deptaddr" name="deptaddr" 
							placeholder="부서주소"
								class="form-control" minlength="4" required>
							
						</div>
					</div>
				
					<div class="form-group">
						<!-- 대표전화번호-->
						<label class="control-label col-sm-2" for="depttel">대표전화번호</label>
						<div class="col-sm-5">
							<input type="text" id="depttel" name="depttel" 
							placeholder="대표전화번호"
								class="form-control" minlength="15" required>

						</div>
					</div>
				
					<div class="form-group">
						<!-- Button -->
						<div class="col-sm-3 col-sm-offset-2">
							<input type="submit" value="등록하기" class="btn btn-success"/>
						</div>
					</div>
				</fieldset>
			</form>
	</div>
	<div><a href="/kimsaemERP/emp/list.do">회원목록보기</a></div>
</body>
</html>