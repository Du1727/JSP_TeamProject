
<%@page import="ticketing.TheaterBean"%>
<%@page import="ticketing.MovieInfoBean"%>
<%@page import="ticketing.CityBean"%>
<%@page import="store.storeBean"%>
<%@page import="store.UtilMgr"%>
<%@page import="javax.swing.text.Document"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mgr" class="ticketing.TicketingMgr"></jsp:useBean>

<%
Vector<CityBean> cityList = mgr.getCityList();

String city = (String) session.getAttribute("selectCity");
String section = (String) session.getAttribute("selectSection");
String screen = (String) session.getAttribute("selectScreen");
String str = request.getParameter("name");
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
	function endPage() {
		window.close();
	}

	function chageCitySelect() {
		$('input[name=flag]').val("reset");
		document.getElementById("screenForm").submit();

	}

	function chageScreenSelect() {
		$('input[name=flag]').val("default");
		document.getElementById("screenForm").submit();

	}
	function searchBtn(){
		document.getElementById("search").submit();

	}
	function check(idx){
		alert(idx);
	}
</script>
</head>

<body>


	<div class="px-4 container-sm">
		<div class="my-3 ">
			<label for="productName" class="form-label">영화 제목</label>
			<div>
				<form action="movie_search.jsp" method="post" id="search">

					<input type="text" class="form-control" id="movieName"
						name="movieName" style="width: 300px; height: 40px;">



					<button type="button" class="btn btn-success" onclick="searchBtn()">
						<i class="bi bi-search"></i>
					</button>

				</form>
			</div>
		</div>
		<div class="table-responsive">
			<form>
				<table class="table"style="height: 400px;max-height: 400px;">
					<thead>
						<tr>
							<th width="10%" scope="col" >No.</th>
							<th width="50%" scope="col" >영화 제목</th>
							<th width="20%" scope="col" >감독</th>
						</tr>
					</thead>

					<tbody>
						<%
						if (str != null) {
							Vector<MovieInfoBean> searchList = mgr.getMovieSearch(str);
							for (int i = 0; i < searchList.size(); i++) {
								MovieInfoBean mBean = searchList.get(i);
						%>
						<tr>

							<th width="10%" scope="row"><%=i%></th>
							<td width="40%" onclick="check(<%=mBean.getIdx()%>)"><%=mBean.getMovieNm()%></td>
							<td width="20%"><%=mBean.getDirector()%></td>
						</tr>
						<%
						}
						}
						%>
					</tbody>

				</table>
			</form>
		</div>
		<form action="movie_insert_proc.jsp" method="post" id="screenForm">
			<input id="flag" name="flag" type="hidden" value="default">
			<div class="row mx-auto">
				<div class="col g-col-4">
					<div class="mb-3">
						<label for="cityChoice" class="form-label">지역 선택</label> <select
							class="form-select" aria-label="Default select example"
							id="cityChoice" name="cityChoice" onchange="chageCitySelect()"
							style="width: 150px; height: 40px;">
							<%
							if ((String) session.getAttribute("selectCity") != null) {
							%>
							<option style="text-align: center;" value="<%=city%>"><%=city%></option>
							<%
							} else {
							%>
							<option selected style="text-align: center;" value="no">-선택-</option>
							<%
							}
							%>
							<%
							for (int i = 0; i < cityList.size(); i++) {
								CityBean cBean = cityList.get(i);
							%>
							<option style="text-align: center;"
								value="<%=cBean.getAddress()%>"><%=cBean.getAddress()%></option>
							<%
							}
							%>
						</select>

					</div>

				</div>
				<div class="col g-col-4">
					<div class="mb-3">
						<label for="theaterChoice" class="form-label">영화관 선택</label> <select
							class="form-select" aria-label="Default select example"
							id="theaterChoice" name="theaterChoice"
							onchange="chageScreenSelect()"
							style="width: 100px; height: 40px;">
							<%
							if ((String) session.getAttribute("selectSection") != null) {
							%>
							<option style="text-align: center;" value="<%=section%>"><%=section%></option>
							<%
							} else if (section == null || section.equals("")) {
							%>
							<option selected style="text-align: center;" value="no">-선택-</option>
							<%
							}
							%>
							<%
							//지역에 맞는 영화관 불러오기

							if ((String) session.getAttribute("selectCity") != null) {
								Vector<String> theaterList = mgr.getTheaterNmList(city);
								for (int i = 0; i < theaterList.size(); i++) {
									String theater = theaterList.get(i);
							%>
							<option style="text-align: center;" value="<%=theater%>"><%=theater%></option>
							<%
							}
							}
							%>
						</select>

					</div>
				</div>
				<div class="col g-col-4">
					<div class="mb-3">
						<label for="screenChoice" class="form-label">상영관 선택</label> <select
							class="form-select" aria-label="Default select example"
							id="screenChoice" name="screenChoice"
							onchange="chageScreenSelect()"
							style="width: 100px; height: 40px;">
							<%
							if ((String) session.getAttribute("selectScreen") != null) {
							%>
							<option style="text-align: center;" value="<%=screen%>"><%=screen%></option>
							<%
							} else if (screen == null || screen.equals("")) {
							%>
							<option selected style="text-align: center;" value="no">-선택-</option>
							<%
							}
							%>
							<%
							Vector<TheaterBean> theaterList = mgr.getTheaterList(city, section);
							for (int i = 0; i < theaterList.size(); i++) {
								TheaterBean tBean = theaterList.get(i);
							%>
							<option style="text-align: center;" value="<%=tBean.getNum()%>"><%=tBean.getNum()%></option>
							<%
							}
							%>
						</select>

					</div>

				</div>

			</div>
		</form>
		<div>
			<button type="button" class="btn" onclick="insert()">추가하기</button>
			<button type="button" class="btn btn-danger" onClick="endPage()">취소하기</button>
		</div>
	</div>

</body>