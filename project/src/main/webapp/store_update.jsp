
<%@page import="store.storeBean"%>
<%@page import="store.UtilMgr"%>
<%@page import="javax.swing.text.Document"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mgr" class="store.storeMgr"></jsp:useBean>

<%
int productNo = UtilMgr.parseInt(request, "productNo");
storeBean bean = new storeBean();
bean = mgr.getProduct(productNo);
String[] category = mgr.getCategory(); 
String saleStatus = "";
String highLightStatus = "";

if(bean.getStatus()==1){
	saleStatus = "checked";
}
if(bean.getHighlight()==1){
	highLightStatus = "checked";
}


%>
<!doctype html>
<html lang="en" data-bs-theme="auto">
<head>
<script src="../assets/js/color-modes.js"></script>

<meta charset="UTF-8">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.111.3">
<title>제품 정보 수정</title>
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
<script type="text/javascript">
const form = document.getElementById("productData");
	function endPage() {
		window.close();
	}
	function insert() {
		var category  = document.getElementById("productCategory");
		var value = (category.options[category.selectedIndex].value);
		var price = document.getElementById("productPrice").value;
		var name = document.getElementById("productName").value;
		if(name==""){
			alert("상품 이름을 입력해 주세요");
			return;
		}else if(price==""){
			alert("상품 가격을 입력해 주세요");
			return;
		}else if(value=="stay"){
			alert("카테고리를 선택해주세요");
			return;
		}else  {
			form.flag.value = "update";
			form.getElementById("productUpdate").submit();
			window.close();
		}
	}
	function delete(){
		form.flag.value = "delete";
		window.close();
	}
</script>
</head>

<body>
	<form method="post" action="UpdateProductServlet" name="productUpdate"id="productUpdate">
	<input name="productIdx"value="<%=productNo%>" type="hidden">
		<div class="px-4">
			<div class="mb-3">
				<label for="productName" class="form-label" style="padding-top: 35px;">상품명</label>
				<input type="text" class="form-control"
					id="productName" name="productName" placeholder="name@example.com"
					style="width: 300px; height: 40px;"value="<%=bean.getName()%>">
			</div>
			<div class="mb-3">
				<label for="productDetail" class="form-label">상품정보</label>
				<input type="text" class="form-control"
					id="productDetail" name="productDetail"placeholder="ex)카라멜팝콘(M)"
					style="height: 40px;"value="<%=bean.getDetail()%>">
			</div>
			<div class="mb-3">
				<label for="productPrice" class="form-label">가격</label>
				<input type="text" class="form-control"
					id="productPrice" name="productPrice"placeholder="10,000"
					style="width: 300px; height: 40px;"value="<%=bean.getPrice() %>">
			</div>
			<div class="row">
				<div class="col g-col-4">
					<div class="mb-3">
						<label for="productCategory" class="form-label">카테고리</label>
						<select class="form-select" aria-label="Default select example"
							id="productCategory" name="productCategory"style="width: 100px; height: 40px;">
							<option selected style="text-align: center;" value="stay"><%=bean.getCategory() %>></option>
							<%for(int i=0;i<category.length;i++){ %>
							<option style="text-align: center;" value="<%=category[i]%>"><%=category[i]%></option>
							
							<%} %>
						</select>
					</div>
				</div>
				<div class="col g-col-4">
					<div class="mb-3">
						<label for="productStatus" class="form-label">판매
							여부</label>
						<div class="form-check form-switch">
							<input class="form-check-input" type="checkbox"
								id="productStatus" name="productStatus" <%=saleStatus %>>
						</div>
					</div>
				</div>
				<div class="col g-col-4">
					<div class="mb-3">
						<label for="productHighLgiht" class="form-label">하이라이트</label>
						<input class="form-check-input" type="checkbox"
							id="productHighLgiht" name="productHighLgiht" <%=highLightStatus %>>
					</div>
				</div>
			</div>
			<div class="mb-3">
					<label for="title" class="form-label"><B>첨부파일</B></label> <br /> <input
						type="file" name="filename" class="form-control"
						id="filename">
				</div>
			<div>
				<button type="button" class="btn" style="background-color: #47C83E; color: white;" onclick="update()">추가하기</button>
				<button type="button" class="btn  btn-danger" onclick="delete()">삭제하기</button>
				<input type="hidden" name="flag"/>
				<input type="hidden" name="productNo" value="<%=productNo%>"/>
			</div>
		</div>
	</form>
</body>