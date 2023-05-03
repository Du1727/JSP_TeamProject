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

storeBean bean = new storeBean();
String msg = request.getParameter("productHighLgiht");
bean.setName(request.getParameter("productName"));
bean.setDetail(request.getParameter("productDetail"));
bean.setPrice(UtilMgr.parseInt(request,"productPrice"));
bean.setCategory(request.getParameter("productCategory"));
bean.setHighlight(UtilMgr.parseInt(request, "productHighLight"));
bean.setStatus(UtilMgr.parseInt(request, "productStatus"));
int idx = UtilMgr.parseInt(request, "productNo");
if(request.getParameter("productStatus")==null){
	bean.setStatus(0);	
}else{
	bean.setStatus(1);
}
if(request.getParameter("productHighLgiht")==null){
	bean.setHighlight(0);	
}else{
	bean.setHighlight(1);
}
String flag = request.getParameter("flag");
String message = "실패했습니다.";
if (flag.equals("delete")) {
	msg = "상품 정보를 삭제했습니다.";
	Mgr.deleteProduct(idx);

} else if (flag.equals("update")) {
	msg = "상품 정보를 업데이트 했습니다";

} 
%>

<script>
	alert("<%=msg%>");
</script>