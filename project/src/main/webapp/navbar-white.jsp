<%@page contentType="text/html; charset=UTF-8"%>
<%
	boolean logged = false;
	if(session.getAttribute("idKey") != null){
		logged = true;
	}
	
%>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="initial-scale=1, shrink-to-fit=no" />
	<title>Dongeui Cinema</title>
	<!-- Bootstrap -->
	<link href="./bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
	<!-- Animate.css -->
	<link href="./animate.css/animate.css" rel="stylesheet" type="text/css" />
	<!-- Font Awesome iconic font -->
	<link href="./fontawesome/css/fontawesome-all.css" rel="stylesheet" type="text/css" />
	<!-- Magnific Popup -->
	<link href="./magnific-popup/magnific-popup.css" rel="stylesheet" type="text/css" />
	<!-- Slick carousel -->
	<link href="./slick/slick.css" rel="stylesheet" type="text/css" />
	<!-- Fonts -->
	<link href='https://fonts.googleapis.com/css?family=Oswald:300,400,500,700' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700' rel='stylesheet' type='text/css'>
	<!-- Theme styles -->
	<link href="./css/dot-icons.css" rel="stylesheet" type="text/css">
	<link href="./css/theme.css" rel="stylesheet" type="text/css">
	
	<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
	<!-- Font Awesome icons (free version)-->
	<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
	<!-- Google fonts-->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
	<link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
	<!-- BootStrap Icons-->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
	<!-- Core theme CSS (includes Bootstrap)-->
	<link href="css/styles.css" rel="stylesheet" />  
	
    <div class="section-title"
         style="color: white; background-color: rgb(255, 255, 255); padding-left: 58px;">
         <div class="container" align="right">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br> 
			<%if(logged) {%>			
	            <i class="bi bi-person-fill" style="font-size: 1.2rem; color: rgb(0, 0, 0);"></i>        
				<a href="logout.jsp" style="color: rgb(20, 20, 20); text-decoration-line: none;">로그아웃</a>
			<%} else { %>
	            <i class="bi bi-person-fill" style="font-size: 1.2rem; color: rgb(0, 0, 0);"></i>          
				<a href="login.jsp" style="color: rgb(20, 20, 20); text-decoration-line: none;">로그인</a>				
	            &nbsp;&nbsp;&nbsp;&nbsp;<a style="color: rgb(50, 50, 50);">|</a>&nbsp;&nbsp;&nbsp;         
	            <i class="bi bi-person-plus-fill" style="font-size: 1.2rem; color: rgb(0, 0, 0);"></i>
	            &nbsp;<a href="register.jsp" style="color: rgb(50, 50, 50); text-decoration-line: none;">회원가입</a>
            <% } %>
         </div>         
    </div>  
	<nav class="navbar navbar-expand-lg navbar-dark" id="mainNav" style="padding-left: 50px;">
	    <div class="container" align="right" >
	        <div class="collapse navbar-collapse" id="navbarResponsive">
	            <ul class="navbar-nav navbar-nav justify-content-end flex-grow-1 pe-3">
	                <li class="nav-item"><a class="nav-link" href="TicketingSite.jsp" style="color: rgb(30,30,30); font-size: 1.05em; font-family: 배달의민족 도현; padding-right: 25px">예매</a></li>
	                <li class="nav-item"><a class="nav-link" href="movielist.jsp" style="color: rgb(30,30,30); font-size: 1.05em; font-family: 배달의민족 도현; padding-right: 25px">영화</a></li>
	                <li class="nav-item"><a class="nav-link" href="ranklist.jsp" style="color: rgb(30,30,30); font-size: 1.05em; font-family: 배달의민족 도현; padding-right: 50px">랭킹</a></li>
	                </ul>                        
	                </div>
	               <a class="navbar-brand" href="index.jsp"><img src='https://ifh.cc/g/cH4QTn.png' border='0' width=100% height=100% alt="..." /></a>
	        <div class="collapse navbar-collapse" id="navbarResponsive">
	            <ul class="navbar-nav text-uppercase ms-1">
	                <li class="nav-item"><a class="nav-link" href="store_main.jsp" style="color: rgb(30,30,30); font-size: 1.05em; font-family: 배달의민족 도현; padding-left: 45px;">스토어</a></li>
	                <li class="nav-item"><a class="nav-link" href="../WEB-INFevent/event_main.jsp" style="color: rgb(30,30,30); font-size: 1.05em; font-family: 배달의민족 도현; padding-left: 25px">이벤트</a></li>
	                <li class="nav-item"><a class="nav-link" href="boardList.jsp" style="color: rgb(30,30,30); font-size: 1.05em; font-family: 배달의민족 도현; padding-left: 25px">문의사항</a></li>
                 </ul>
             </div>
         </div>
     </nav>
     <hr width="60%" style="text-align: center; margin: 0px auto;">