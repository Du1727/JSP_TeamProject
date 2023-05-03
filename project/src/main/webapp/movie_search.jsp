<%@page import="store.storeBean"%>
<%@page import="java.time.LocalDate"%>
<%@page import="sale.saleBean"%>
<%@page import="store.UtilMgr"%>
<%@page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="Mgr" class="store.storeMgr" />

<!doctype html>
<%
request.setCharacterEncoding("UTF-8");
String name = request.getParameter("movieName");
%>

</head>

<script>
	function submitForm() {
		document.getElementById("back").submit();
	}
</script>

<body onload="submitForm()">
	<form action="movie_insert.jsp" method="post" id="back">
		<input id="name" name="name" type="hidden" value="<%=name%>">
	</form>
</body>