<!-- -->
<%@page import="store.cartBean"%>
<%@page import="store.UtilMgr"%>
<%@page import="javax.swing.text.Document"%>
<%@page import="store.storeBean"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mgr" class="store.storeMgr"></jsp:useBean>
<jsp:useBean id="cmgr" class="store.cartMgr"></jsp:useBean>

<%
int idx = UtilMgr.parseInt(request, "product");
int quantity = UtilMgr.parseInt(request, "amount");
String id = (String)session.getAttribute("idKey");
cartBean bean = new cartBean();
bean.setId(id);
bean.setQuantity(quantity);
bean.setProductNo(idx);
boolean result = false;
String destination = "";
String msg = "장바구니에 담기 실패했습니다";
if (id == null) {
	msg="로그인 해주세요!";
	destination="login.jsp";
}else{
	result = cmgr.addCart(bean);
	if(result){
	  msg = "장바구니에 담았습니다!";
	}
}

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
<style type="text/css">
</style>
</head>
<script type="text/javascript">
$(document).ready(function() {
	$("#modal").modal("show");
});
function toCart(){
	location.href = "cart.jsp";
}
function toLogin(){
	location.href = "login.jsp";
}
function toHome(){
	location.href = "index.jsp";
}
function toStore(){
	location.href = "store_main.jsp";
}


</script>

<body>
<div class="modal" id="modal"tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title"><%=msg %></h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      <%if(id == null){ %>
      <button type="button" class="btn btn-secondary"onclick="toLogin()">로그인하기</button>
        <button type="button" class="btn btn-primary" onclick="toHome()">홈페이지로</button>
      <%}else{ %>
        <button type="button" class="btn btn-secondary"onclick="toCart()">장바구니로</button>
        <button type="button" class="btn btn-primary" onclick="toStore()">쇼핑 계속하기</button>
       <%} %>
      </div>

    </div>
  </div>
</div>

</body>

</html>