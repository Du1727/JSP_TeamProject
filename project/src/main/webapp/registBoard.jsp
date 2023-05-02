<%@page contentType="text/html; charset=UTF-8"%>
<%

%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<title>문의하기</title>
<link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
	<style>
	
html{
     /* 드래그 방지 */
     -ms-user-select: none;
     -moz-user-select: -moz-none;
     -webkit-user-select: none;
     -khtml-user-select: none;
     user-select: none;
}
	</style>
<!-- 
    <div class="section-title"
         style="color: white; background-color: rgb(255, 255, 255);">
         <div class="container" align="right">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
            <i class="bi bi-person-fill" style="font-size: 1.2rem; color: rgb(0, 0, 0);"></i>
            <a href=""
               style="color: rgb(50, 50, 50); text-decoration-line: none;">로그인</a>&nbsp;&nbsp;&nbsp;&nbsp;<a style="color: rgb(50, 50, 50);">|</a>&nbsp;&nbsp;&nbsp;         
            <i class="bi bi-person-plus-fill" style="font-size: 1.2rem; color: rgb(0, 0, 0);"></i>
            &nbsp;<a href=""
               style="color: rgb(50, 50, 50); text-decoration-line: none;">회원가입</a>
         </div>
      </div>  
        <nav class="navbar navbar-expand-lg navbar-dark" id="mainNav">
            <div class="container" align="right" >
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav navbar-nav justify-content-end flex-grow-1 pe-3">
                        <li class="nav-item"><a class="nav-link" href="#buy" style="color: rgb(30,30,30); font-size: 1.05em; font-family: 배달의민족 도현; padding-right: 25px">예매</a></li>
                        <li class="nav-item"><a class="nav-link" href="#move" style="color: rgb(30,30,30); font-size: 1.05em; font-family: 배달의민족 도현; padding-right: 25px">영화</a></li>
                        <li class="nav-item"><a class="nav-link" href="#move2" style="color: rgb(30,30,30); font-size: 1.05em; font-family: 배달의민족 도현; padding-right: 50px">영화관</a></li>
                        </ul>                        
                        </div>
                       <a class="navbar-brand" href="#page-top"><img src='https://ifh.cc/g/RWFm8K.png' border='0' width=100% height=100% alt="..." /></a>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav text-uppercase ms-1">
                        <li class="nav-item"><a class="nav-link" href="#store" style="color: rgb(30,30,30); font-size: 1.05em; font-family: 배달의민족 도현; padding-left: 45px;">스토어</a></li>
                        <li class="nav-item"><a class="nav-link" href="#event" style="color: rgb(30,30,30); font-size: 1.05em; font-family: 배달의민족 도현; padding-left: 25px">이벤트</a></li>
                        <li class="nav-item"><a class="nav-link" href="#call" style="color: rgb(30,30,30); font-size: 1.05em; font-family: 배달의민족 도현; padding-left: 25px">문의사항</a></li>
                    </ul>
                </div>
            </div>
        </nav> -->
<%@include file="/navbar-white.jsp"%>



<script type="text/javascript">
	function cancleButton() {
		document.regForm.action = "boardList.jsp";
		document.regForm.submit();
	}
</script>


</head>



<body>
	<main>
		<div align="center">
			<br />
			<h4>문의 등록하기</h4>
			<hr>
		</div>

		<div align="center">
			<form name="regForm" method="post" action="regBoardServlet"
				enctype="multipart/form-data">

				<div class="col-12" style="text-align: left; width: 1200px;">
					<label for="title" class="form-label"><B>제목*</B></label> <input
						name="subject" type="text" class="form-control" id="title"
						placeholder="제목을 입력해 주세요" required>

				</div>
				<br />
				<div class="col-12" style="text-align: left; width: 1200px;">
					<label for="content" class="form-label"><B>내용*</B></span></label>
					<textarea name="content" rows="15" cols="50" class="form-control"
						aria-label="With textarea" placeholder="내용을 입력해 주세요" required></textarea>

				</div>
				<br />

				<div class="form-check" style="text-align: left; width: 1200px;">
					<input name="secret" class="form-check-input" type="checkbox"
						value="1" id="secretCheck"> <label
						class="form-check-label" for="flexCheckDefault"> <B>비밀글</B>
					</label>
				</div>
				<br /> <br />
				<div style="text-align: left; width: 1200px;">
					<label for="title" class="form-label"><B>첨부파일</B></label> <br /> <input
						type="file" name="filename" class="form-control"
						id="inputGroupFile02">

				</div>
				<br />



				<div align="center">
<!-- <input type="hidden" name="id" value="admin"> -->
					 <input
						type="hidden" name="requestStatus" value="insert">

					<button type="button" onClick="cancleButton()"
						class="btn btn-outline-dark">취소</button>
					<button type="submit" class="btn btn-dark">등록</button>

				</div>
				
				
				
			</form>
		</div>

		<br>
		<br>
		<br>




	</main>
</body>

<footer>
	<%-- <%@include file ="../outer_form/footer.jsp" %> --%>
	<%@include file="/footer.jsp"%>
</footer>
</html>
