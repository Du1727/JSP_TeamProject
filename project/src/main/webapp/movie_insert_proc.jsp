<%@page import="store.storeBean"%>
<%@page import="java.time.LocalDate"%>
<%@page import="sale.saleBean"%>
<%@page import="store.UtilMgr"%>
<%@page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="Mgr" class="store.storeMgr" />

<!doctype html>
<html lang="en" data-bs-theme="auto">
<head>
<script src="../assets/js/color-modes.js"></script>

<meta charset="UTF-8">
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.111.3">
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
<%
request.setCharacterEncoding("UTF-8");
String city = (String) session.getAttribute("selectCity");
String section = (String) session.getAttribute("selectSection");
String screen = (String) session.getAttribute("selectScreen");
String flag= request.getParameter("flag");

String selectCity = request.getParameter("cityChoice");
session.setAttribute("selectCity", selectCity);

//드롭다운으로 선택한 city

String selectSection = request.getParameter("theaterChoice");
String selectScreen = request.getParameter("screenChoice");
if(flag.equals("reset")){
	selectSection="";
	selectScreen="";
	
}
session.setAttribute("selectScreen", selectScreen);
session.setAttribute("selectSection", selectSection);
%>


</head>

<script>
	alert("<%=flag%>");
	location.href = "movie_insert.jsp";
</script>