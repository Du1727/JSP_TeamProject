<!-- -->
<%@page import="member.MemberBean"%>
<%@page import="store.UtilMgr"%>
<%@page import="javax.swing.text.Document"%>
<%@page import="store.storeBean"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mgr" class="store.storeMgr"></jsp:useBean>
<jsp:useBean id="mmgr" class="member.MemberMgr"></jsp:useBean>

<%
String id = (String) session.getAttribute("idKey");
//권한 확인
MemberBean mbean = new MemberBean();
mbean = mmgr.getMember(id);
String authority = mbean.getAuthority();
authority = "admin";
String[] category = mgr.getCategory();
System.out.print(authority);
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
<title>스토어</title>
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
<link href="css/store.css" rel="stylesheet" />
<link href="bootstrap/.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.min.js"></script>
<style type="text/css">
</style>
<script>
	
	function sendCart() {
		var product = document.getElementById('productIdx').value;
        document.getElementById('form-d').submit();	
    }
	
	function modal(name,detail,price,idx) {
		var result = price.toLocaleString();
		document.forms['form-detail'].reset();
		$(".modal-body #productName").text(name);
		$(".modal-body #productDetail").text(detail);
		$(".modal-body #productIdx").val(idx);
		$(".modal-body #ownprice").val(result);
		$(".modal-body #sell_price").val(result);
		$("#detail").modal("show");

	}
	function closeModal() {
		$("#detail").modal("hide");

	}

	function fnCalCount(type, ths) {
		var $input = $(ths).parents("td").find("input[name='amount']");
		var tCount = Number($input.val());
		var tEqCount = Number($(ths).parents("tr").find("td.bseq_ea").html());
		var price = document.getElementById('ownprice').value;
		
		if (type == 'p') {
			if (tCount < tEqCount){
				$input.val(Number(tCount) + 1);
				
				$(".modal-body #sell_price").val(price*((tCount) + 1));
			}
			
		} else {
			if (tCount > 1){
				$input.val(Number(tCount) - 1);
				$(".modal-body #sell_price").val(price*((tCount) - 1));
			}
		}
		
	}
	$(document).on("click", ".open-productDetail", function() {
		var myBookId = $(this).data('id');
		$(".modal-body #bookId").val(myBookId);
	});
	
	function productInsert(){
        window.open("store_insert.jsp", "상품 추가", "width=500, height=600");
    }
	function productUpdate(){
		var productNo = $("input[name='productNo']").val();
        window.open("store_update.jsp?${productNo}", "상품 정보 수정", "width=500, height=600");
    }
	
</script>
<%@include file="/navbar-white.jsp"%>
</head>

<body>


	<div class="container-lg">
		<img src="images/parts/store_banner.png"
			class="product-img img-fluid mx-auto d-block " alt="...">

		<div class="nav-scroller py-1 mb-2 border" id="list-example">
			<nav class="nav d-flex justify-content-around">
				<%
				for (int i = 0; i < category.length; i++) {
				%>
				<a class="nav-link p-2 link-secondary" href="#store<%=i%>>"><h4><%=category[i]%></h4></a>
				<%
				}
				%>
				<a class="nav-link p-2 link-secondary" href="cart.jsp"><h4>장바구니</h4></a>
			</nav>
		</div>
	</div>



	<main class="container-lg">
		<div data-bs-spy="scroll" data-bs-target="#list-example"
			data-bs-smooth-scroll="true" class="scrollspy-example" tabindex="0">
			<%
			for (int i = 0; i < category.length; i++) {
			%>
			<div>
				<h3 class="border-bottom border-2" id="store<%=i%>>">
					<%=category[i]%>

					<button type="button" class="btn customBtn"
						onclick="productInsert()">
						<i class="bi bi-plus-circle fs-2"></i>
					</button>


				</h3>
				<div class="row row-cols-1 row-cols-xs-3 g-4"
					style="padding-left: 30px; padding-top: 20px">
					<!-- 카드 생성 부분 -->

					<%
					Vector<storeBean> vlist = mgr.getProductCategory(category[i]);//
					for (int j = 0; j < vlist.size(); j++) {
						storeBean bean = vlist.get(j);
					%>

					<div class="card" style="width: 18rem;">
						<div class="product text-center" style="height: 200px">

							<%
							if (authority == "admin") {
							%>
							<form>
							<a class="open-productDetail nav-link mx-auto"
								style="width: 16rem; height: 16rem;" onclick="producUpdate()">
								<figure>
									<img class="embed-responsive-item"
										src="images/parts/store_combo_1.png"
										style="width: 200px; height: 200px;">

									<figcaption>
										<i class="bi bi-pencil-square fs-3"></i>
										<input type="hidden" name="productNo" id="productNo" value="<%=bean.getIdx()%>" />
									</figcaption>
								</figure>
							</a>
							</form>
							<%
							} else {
							%>
							<a class="open-productDetail nav-link mx-auto"
								style="width: 16rem; height: 16rem;"
								onclick="modal('<%=bean.getName()%>','<%=bean.getDetail()%>',<%=bean.getPrice()%>,<%=bean.getIdx()%>)">
								<figure>
									<img class="embed-responsive-item"
										src="images/parts/store_combo_1.png"
										style="width: 200px; height: 200px;">
									<figcaption>
										<i class="bi bi-cart-plus fs-3"></i>
									</figcaption>
								</figure>
							</a>
							<%
							}
							%>
						</div>
						<div class="col p-4 d-flex flex-column position-static">
							<div class="mb-1 text-body-secondary text-center"
								style="font-size: 20px;"><%=bean.getName()%></div>
							<p class="card-text mb-auto text-center" style="font-size: 20px;"><%=bean.getDetail()%></p>
							<p class="card-text mb-auto text-center" style="font-size: 20px;"><%=UtilMgr.monFormat(bean.getPrice())%></p>
						</div>
					</div>

					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<%
					}
					%>
				</div>
			</div>
			<%
			}
			%>
		</div>
	</main>
</body>
<!-- Modal -->
<form name="form-detail" id="form-d" method="post"
	action="store_main_proc.jsp">
	<div class="modal fade" id="detail" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="productname"></h5>
					<button type="button" class="btn-close customBtn"
						data-bs-dismiss="modal" aria-label="Close" onclick="closeModal()"></button>
				</div>
				<div class="modal-body">
					<div class="container d-flex flex-column-reverse">
						<div class="card mb-3 border-0 justify-content-center "
							style="max-width: 540px;">
							<div class="row g-0">
								<div class="col-xs-5">
									<img src="images/parts/store_combo_1.png"
										class="mx-auto d-block" width="200px" height="200px" alt="">
								</div>
								<div class="col-xs-7">
									<div class="card-body">
										<table class="mx-auto">
											<tr>
												<td height="60px" class="d-none"><input type="text"
													id="productIdx" name="product"></td>
											</tr>
											<tr>
												<td height="60px" class="text-center border-bottom"><h5
														id="productName"></h5></td>
											</tr>
											<tr>
												<td height="60px" class="text-center"><h5
														id="productDetail"></h5></td>
											</tr>
											<tr>
												<td height="60px" class="text-center">상품가격 <input
													id="ownprice" name="ownprice" value="" readonly="readonly"
													style="text-align: center; width: 100px; height: 50px; border: 0 solid black; font-size: 25px;"></td>
											</tr>


										</table>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-mx-5"></div>
								<div class="col-mx-7">
									<table class="mx-auto">
										<tr style="text-align: center;">
											<td class="bseq_ea d-none">5</td>
											<td class="updown col">
												<button type="button" class="btn customBtn"
													onclick="fnCalCount('m', this);">
													<i class="bi bi-dash fs-2"></i>
												</button> <input type="text" class="amount mx-auto" name="amount"
												value="1" readonly="readonly"
												style="text-align: center; width: 50px; height: 50px; border: 0 solid black; font-size: 25px;" />
												<button type="button" class="btn customBtn"
													onclick="fnCalCount('p',this);">
													<i class="bi bi-plus fs-2"></i>
												</button>
											</td>
										</tr>
										<tr>
											<td height="60px" class="text-center">총 상품 금액 <input
												id="sell_price" name="sell_price" value=""
												readonly="readonly"
												style="text-align: center; width: 100px; height: 50px; border: 0 solid black; font-size: 25px;"></td>
										</tr>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary customBtn"
						onclick="closeModal()">바로 구매</button>
					<button type="button" class="btn btn-primary customBtn"
						onclick="sendCart()">장바구니 담기</button>
				</div>
			</div>
		</div>
	</div>
</form>
</html>
