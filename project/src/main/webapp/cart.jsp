<!-- -->
<%@page import="member.MemberBean"%>
<%@page import="store.cartBean"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="store.UtilMgr"%>
<%@page import="javax.swing.text.Document"%>
<%@page import="store.storeBean"%>
<%@page import="java.util.Vector"%>
<jsp:useBean id="mgr" class="store.storeMgr" />
<jsp:useBean id="cmgr" class="store.cartMgr" />
<jsp:useBean id="mmgr" class="member.MemberMgr" />
<%
//세션을 통해 아이디 확인 후 로그인 안되어있으면 로그인 페이지로 사출
String id = (String) session.getAttribute("idKey");
if (id == null) {
	response.sendRedirect("login.jsp");
	return; // 이후에 코드를 무력화
}
Vector<cartBean> vlist = cmgr.getCart(id);
MemberBean mBean = mmgr.getMember(id);
int lastprice = 0;
double discount = 0;
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
</script>
<%@include file="/navbar-white.jsp"%>
</head>
<body>
	<main>
		<div class="container-lg">
			<h3 class="pb-4 mb-4 fst-italic border-bottom border-3">장바구니</h3>
			<div class="container-lg gap-10">
				<table class="table">
					<thead class="table-dark">
						<tr>
							<th width="60%" scope="col" class="text-center">상품명</th>
							<th width="8%" scope="col" class="text-center">판매금액</th>
							<th width="8%" scope="col" class="text-center">수량</th>
							<th width="8%" scope="col" class="text-center">구매금액</th>
							<th width="16%" scope="col" class="text-center">선택상품 삭제</th>
						</tr>
					</thead>
					<tbody>
						<%
						for (int i = 0; i < vlist.size(); i++) {
							cartBean bean = vlist.get(i);
							storeBean pbean = mgr.getProduct(bean.getProductNo());
							int totalprice = bean.getQuantity() * pbean.getPrice();
							lastprice += totalprice;
						%>
						
						<tr>
						
							<th class="text-center align-middle"><%=pbean.getName()%></th>
							<td class="text-center align-middle" name="productPrice"><%=pbean.getPrice()%></td>
							<td class="text-center align-middle" name="productQuantity"><%=bean.getQuantity()%></td>
							<td class="text-center align-middle"><%=totalprice%></td>
							<td class="text-center align-middle">
							<form method="post" id="cartData"action="cartProc.jsp">
								<button type="button"
									class="btn align-middle" onclick="deleteCart(this.form)">
									<i class="bi bi-trash fs-2"></i>
								</button>
							<input type="hidden" name="flag"/>
							<input type="hidden" name="productPrice"value="<%=pbean.getPrice()%>"/>
							<input type="hidden" name="productQuantity" value="<%=bean.getQuantity()%>"/>
							<input type="hidden" name="cartNo"value="<%=bean.getNo() %>"/>
							<input type="hidden" name="productNo"
								value="<%=pbean.getIdx()%>"/>
								</form></td>
								
						</tr>
				
						<%
						}
						%>

					</tbody>
				</table>
			</div>


			<div class="container-lg gap-5">
				<table class="table">
					<thead class="table-active">
						<tr>
							<th width="25%" scope="col" class="text-center">총 상품 금액</th>
							<th width="10%" scope="col" class="text-center"></th>
							<th width="25%" scope="col" class="text-center">할인금액</th>
							<th width="40%" scope="col" class="text-center">총결제 예정금액</th>
						</tr>
					</thead>
					<tbody>
						<%
						if (mBean.getGrade().equals("bronze")) {
							discount = 0.1;
						} else if (mBean.getGrade().equals("silver")) {
							discount = 0.15;
						} else if (mBean.getGrade().equals("gold")) {
							discount = 0.18;
						} else if (mBean.getGrade().equals("vip")) {
							discount = 0.2;
						}
						%>
						<tr>
							<td class="text-center align-middle"><%=lastprice%></td>
							<td class="text-center align-middle"><i
								class="bi bi-dash fs-3"></i></td>
							<td class="text-center align-middle"><%=lastprice * discount%></td>
							<td class="text-center align-middle"><%=lastprice * (1 - discount)%></td>
						</tr>

					</tbody>
				</table>
			</div>
			<div align="center">
				<button class="btn" onclick="buyCart()">구매하기</button>
				<button class="btn" onclick="toStore()">쇼핑계속하기</button>
			</div>
		</div>

	</main>
</body>

</body>
</html>
