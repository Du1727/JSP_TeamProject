<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE unspecified PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<title>예매 페이지</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<style>
.header {
	background: rgb(255, 255, 255);
	height: 215px;
}

.main {
	background: white;
}

.footer {
	background: darkgray;
	height: 215px;
}

.noneUnderLine {
	text-decoration: none; /* 밑줄 제거 */
	color: inherit; /* 색상 상속 */
}

.tg-0lax {
	align-content: center;
}

.rccl {
	display: flex;
	flex-direction: row;
	justify-content: flex-start; /* 왼쪽 정렬 */
	align-items: center; /* 세로 가운데 정렬 */
}

.items {
	display: inline-table;
	white-space: nowrap;
}
</style>
<link href="./bootstrap/css/bootstrap.css" rel="stylesheet"
	type="text/css" />
<!-- Animate.css -->
<link href="./animate.css/animate.css" rel="stylesheet" type="text/css" />
<!-- Font Awesome iconic font -->
<link href="./fontawesome/css/fontawesome-all.css" rel="stylesheet"
	type="text/css" />
<!-- Magnific Popup -->
<link href="./magnific-popup/magnific-popup.css" rel="stylesheet"
	type="text/css" />
<!-- Slick carousel -->
<link href="./slick/slick.css" rel="stylesheet" type="text/css" />
<!-- Fonts -->
<link
	href='https://fonts.googleapis.com/css?family=Oswald:300,400,500,700'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700'
	rel='stylesheet' type='text/css'>
<!-- Theme styles -->
<link href="./css/dot-icons.css" rel="stylesheet" type="text/css">
<link href="./css/theme.css" rel="stylesheet" type="text/css">

<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700"
	rel="stylesheet" type="text/css" />
<!-- BootStrap Icons-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
</head>
<body>
	<div class="header">
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
                       <a class="navbar-brand" href="#page-top"><img src='https://ifh.cc/g/cH4QTn.png' border='0' width=100% height=100% alt="..." /></a>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav text-uppercase ms-1">
                        <li class="nav-item"><a class="nav-link" href="#store" style="color: rgb(30,30,30); font-size: 1.05em; font-family: 배달의민족 도현; padding-left: 45px;">스토어</a></li>
                        <li class="nav-item"><a class="nav-link" href="#event" style="color: rgb(30,30,30); font-size: 1.05em; font-family: 배달의민족 도현; padding-left: 25px">이벤트</a></li>
                        <li class="nav-item"><a class="nav-link" href="#call" style="color: rgb(30,30,30); font-size: 1.05em; font-family: 배달의민족 도현; padding-left: 25px">문의사항</a></li>
                    </ul>
                </div>
            </div>
        </nav>
	</div>
	<div class="main" align="center">
		
		<!-- ###경로수정_20230501_통합V1 -->
		<iframe width="90%" height="100%" src="TicketingSection.jsp"></iframe>
		<!-- <iframe width="90%" height="100%" src="/DEC/ticketing/TicketingSection.jsp"></iframe> -->
	</div>
	<div class="footer">Footer</div>
</body>