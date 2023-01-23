<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/springmvc/common/css/font-awesome.css" rel="stylesheet" />
<!-- Custom styles for this template -->

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<h4>
		<i class="fa fa-angle-right"></i> 게시글 작성하기
	</h4>
	<hr>
	<div class="row mt">
		<div class="col-lg-12">
			<div class="form-panel">

				<form class="form-horizontal style-form"
					action="/erp/board/write.do" method="post"
					enctype="multipart/form-data" >
					<div class="form-group" style="border: 1px solid #eff2f7;">

						<label class="col-sm-2 col-sm-2 control-label">작성자</label>
						<div class="col-sm-10">
							<input type="hidden" name="id" value="${user.id}">
							<p class="form-control-static">${user.name }</p>
						</div>
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">게시글 유형</label>

							<div class="col-sm-5">
								<select name="category" class="form-control">
									<option value="경조사">경조사</option>
									<option value="사내소식">사내소식</option>
									<option value="게시판">게시판</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">제목</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="title"> <span
									class="help-block">게시글 유형에 맞는 내용으로 작성 부탁드립니다. </span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">내용</label>
							<div class="col-sm-8">
								<textarea id="content"
									style="width: 100%; border: 1; overflow: visible; text-overflow: ellipsis;"
									rows=15 name="content">글작성</textarea>

							</div>
						</div>

						<div class="form-group">
							<div class="col-md-2 text-right">
								<label for="files" class="control-label">파일1</label>
							</div>
							<div class="col-md-8">
								<input type="file" class="form-control input-lg" name="files"
									id="files" placeholder="파일선택" multiple="multiple">
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-2 text-right">
								<label for="title" class="control-label">파일2</label>
							</div>
							<div class="col-md-8">
								<input type="file" class="form-control input-lg" name="files"
									id="title" placeholder="파일선택">
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-2 text-right">
								<label for="files" class="control-label">파일3</label>
							</div>
							<div class="col-md-8">
								<input type="file" class="form-control input-lg" name="files"
									id="files" placeholder="파일선택">
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-2 text-right">
								<label for="files" class="control-label">파일4</label>
							</div>
							<div class="col-md-8">
								<input type="file" class="form-control input-lg" name="files"
									id="files" placeholder="파일선택">
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-2 text-right">
								<label for="title" class="control-label">파일5</label>
							</div>
							<div class="col-md-8">
								<input type="file" class="form-control input-lg" name="files"
									id="title" placeholder="파일선택">
							</div>
						</div>



						<div class="form-group">
							<div class="col-lg-4 text-center"></div>
							<div class="col-lg-2 text-center">
								<button type="submit" class="btn btn-success"
									style="width: 100px; background-color: #0ea006">등록</button>
							</div>
							<div class="col-lg-2 text-center">
								<button type="reset" class="btn btn-default"
									style="width: 100px; background-color: #9a9a9a">취소</button>
							</div>

						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>