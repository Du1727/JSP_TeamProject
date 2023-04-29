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
	sMgr.addSale(bean);
	destination = "";
} 
%>

<script>
	alert("<%=msg%>");
	location.href ="<%=destination%>";
</script>