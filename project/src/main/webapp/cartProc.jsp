<%@page import="java.time.LocalDate"%>
<%@page import="sale.saleBean"%>
<%@page import="store.UtilMgr"%>
<%@page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="cMgr" class="store.cartMgr" />
<jsp:useBean id="sMgr" class="sale.saleMgr" />

<%
String id = (String) session.getAttribute("idKey");
if (id == null) {
	response.sendRedirect("login.jsp");
	return; // 이후에 코드를 무력화
}
String destination = "";
LocalDate date = LocalDate.now();
saleBean bean = new saleBean();
bean.setId(id);
bean.setProductNo(UtilMgr.parseInt(request, "productNo"));
bean.setType(0);
bean.setPrice(UtilMgr.parseInt(request, "productPrice"));
bean.setQuantity(UtilMgr.parseInt(request, "productQuantity"));
bean.setPaystate(0);//결제 안된상태 = 0, 결제된 상태 = 1
int cartNo = UtilMgr.parseInt(request, "cartNo");

// insert, update, delete
String flag = request.getParameter("flag");
String msg = "";
if (flag.equals("delete")) {
	msg = "장바구니를 삭제 하였습니다.";
	cMgr.deleteCart(cartNo);
	destination = "cart.jsp";
} else if (flag.equals("buy")) {
	msg = "결제창으로 넘어갑니다";
	destination = "";
} else if (flag.equals("complete")) {
	//결제 완료시 cart proc으로 귀환해서 sale 테이블에 결제정보 추가
	sMgr.addSale(bean);
}
%>
<!doctype html>
<html lang="en" data-bs-theme="auto">
<head>
<script src="../assets/js/color-modes.js"></script>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
<script>
const form = document.getElementById("cartData");
	function deleteCart(form) {
		form.flag.value = "delete";
		form.submit();
	}
	function buyCart(form) {
		form.flag.value = "buy";
		form.submit();
	}
	function toStore() {
		location.href ="store_main.jsp";
	}
	alert("<%=msg%>");
	location.href ="<%=destination%>";
</script>
</head>

<body>
<form>
	<input type="hidden" name="productNo" id="productNo" value="" />
</form>
</body>