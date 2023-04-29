
<%@page import="store.UtilMgr"%>
<%@page import="javax.swing.text.Document"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mgr" class="store.storeMgr"></jsp:useBean>

<%

%>
<!doctype html>
<html lang="en" data-bs-theme="auto">
<head>
<script src="../assets/js/color-modes.js"></script>

<meta charset="utf-8">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.111.3">
<title>Blog Template · Bootstrap v5.3</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="/js/bootstrap.js"></script>
<link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700"
	rel="stylesheet" type="text/css" />
<link href="css/styles.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.min.js"></script>
<script type="text/javascript">
function close(){
	alert("안녕");
}


</script>
</head>

<body>
	<div class="px-4">
		<div class="mb-3">
			<label for="exampleFormControlInput1" class="form-label">상품명</label>
			<input type="email" class="form-control"
				id="exampleFormControlInput1" placeholder="name@example.com"
				style="width: 300px; height: 40px;">
		</div>
		<div class="mb-3">
			<label for="exampleFormControlInput1" class="form-label">상품정보</label>
			<input type="email" class="form-control"
				id="exampleFormControlInput1" placeholder="ex)카라멜팝콘(M)"
				style="height: 40px;">
		</div>
		<div class="mb-3">
			<label for="exampleFormControlInput1" class="form-label">가격</label> <input
				type="email" class="form-control" id="exampleFormControlInput1"
				placeholder="10,000" style="width: 300px; height: 40px;">
		</div>
		<div class="row">
			<div class="col g-col-4">
				<div class="mb-3">
					<label for="exampleFormControlInput1" class="form-label">카테고리</label>
					<select class="form-select" aria-label="Default select example"
						id="exampleFormControlInput1" style="width: 100px; height: 40px;">
						<option selected>-선택-</option>
						<option value="1">One</option>
						<option value="2">Two</option>
						<option value="3">Three</option>
					</select>
				</div>
			</div>
			<div class="col g-col-4">
				<div class="mb-3">
					<label for="exampleFormControlInput1" class="form-label">판매
						여부</label>
					<div class="form-check form-switch">
						<input class="form-check-input" type="checkbox"
							id="flexSwitchCheckDefault">
					</div>
				</div>
			</div>
			<div class="col g-col-4">
				<div class="mb-3">
					<label for="exampleFormControlInput1" class="form-label">하이라이트</label>
					<input class="form-check-input" type="checkbox"
						id="flexSwitchCheckDefault">
				</div>
			</div>
		</div>
		<div class="mb-3">
			<label for="formFile" class="form-label">상품 이미지 추가</label> <input
				class="form-control" type="file" id="formFile">
		</div>
		<div>
			<button type="button" class="btn" onclick="close()">추가하기</button>
			<button type="button" class="btn btn-danger" onclick="close()">취소하기</button>
			<button type="button" class="btn customBtn" onclick="close()">
						<i class="bi bi-plus-circle fs-2"></i>
					</button>
		</div>
	</div>
</body>