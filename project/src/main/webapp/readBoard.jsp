<%@page import="board.BoardBean"%>
<%@page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="bMgr" class="board.BoardMgr" />
<%
// 내용 가져오기
System.out.println("@@@@@");
int idx = Integer.parseInt(String.valueOf(session.getAttribute("idx")));
BoardBean rBean = bMgr.getOneBoardContent(idx);
String id = String.valueOf(session.getAttribute("idKey"));
System.out.println("[readBoard.jsp]  @@@@@@@ idKey : " + id) ;

String writer_id = bMgr.getBoardWriterId(idx);

String authority = ""; 
authority = bMgr.checkAuthority(id);

boolean admin_value = false;

if ("admin".equals(authority)){
	admin_value = true;}


// 비밀글 값 설정
String secretValue;
if (rBean.getSecret().equals("1")) {
	secretValue = "1";

	if (id.equals(writer_id) || admin_value)
		secretValue = "0";

} else {
	secretValue = "0";
}
%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<title>문의하기</title>
<link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<style>

html{
     /* 드래그 방지 */
     -ms-user-select: none;
     -moz-user-select: -moz-none;
     -webkit-user-select: none;
     -khtml-user-select: none;
     user-select: none;
}
#userfile {
	text-decoration: none;
	color: inherit;
}
</style>
<!-- 

    <div class="section-title"
         style="color: white; background-color: rgb(255, 255, 255);">
         <div class="container" align="right">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
            <i class="bi bi-person-fill" style="font-size: 1.2rem; color: rgb(0, 0, 0);"></i>
            <a href=""
               style="color: rgb(50, 50, 50); text-decoration-line: none;">로그인</a>&nbsp;&nbsp;&nbsp;&nbsp;<a style="color: rgb(50, 50, 50);">|</a>&nbsp;&nbsp;&nbsp;         
            <i class="bi bi-person-plus-fill" style="font-size: 1.2rem; color: rgb(0, 0, 0);"></i>
            &nbsp;<a href=""
               style="color: rgb(50, 50, 50); text-decoration-line: none;">회원가입</a>
         </div>
      </div>  
        <nav class="navbar navbar-expand-lg navbar-dark" id="mainNav">
            <div class="container" align="right" >
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav navbar-nav justify-content-end flex-grow-1 pe-3">
                        <li class="nav-item"><a class="nav-link" href="#buy" style="color: rgb(30,30,30); font-size: 1.05em; font-family: 배달의민족 도현; padding-right: 25px">예매</a></li>
                        <li class="nav-item"><a class="nav-link" href="#move" style="color: rgb(30,30,30); font-size: 1.05em; font-family: 배달의민족 도현; padding-right: 25px">영화</a></li>
                        <li class="nav-item"><a class="nav-link" href="#move2" style="color: rgb(30,30,30); font-size: 1.05em; font-family: 배달의민족 도현; padding-right: 50px">영화관</a></li>
                        </ul>                        
                        </div>
                       <a class="navbar-brand" href="#page-top"><img src='https://ifh.cc/g/RWFm8K.png' border='0' width=100% height=100% alt="..." /></a>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav text-uppercase ms-1">
                        <li class="nav-item"><a class="nav-link" href="#store" style="color: rgb(30,30,30); font-size: 1.05em; font-family: 배달의민족 도현; padding-left: 45px;">스토어</a></li>
                        <li class="nav-item"><a class="nav-link" href="#event" style="color: rgb(30,30,30); font-size: 1.05em; font-family: 배달의민족 도현; padding-left: 25px">이벤트</a></li>
                        <li class="nav-item"><a class="nav-link" href="#call" style="color: rgb(30,30,30); font-size: 1.05em; font-family: 배달의민족 도현; padding-left: 25px">문의사항</a></li>
                    </ul>
                </div>
            </div>
        </nav> -->
<%@include file="/navbar-white.jsp"%>

<script type="text/javascript">
	function updateBoard(idx) {
		document.readForm.requestStatus.value = "update";
		document.readForm.idx.value = idx;
		document.readForm.action = "boardProc.jsp";
		document.readForm.submit();
	}

	function deleteBoard(idx) {

		var result = confirm("게시글을 삭제 하시겠습니까?");
		if (result == true) {
			document.readForm.requestStatus.value = "delete";
			document.readForm.idx.value = idx;
			document.readForm.action = "boardProc.jsp";
			document.readForm.submit();
		}

	}

	function deleteAttachFile(idx) {
		var result = confirm("첨부파일을 삭제 하시겠습니까?");
		if (result == true) {
			document.readForm.requestStatus.value = "deleteAttachFile";
			document.readForm.idx.value = idx;
			document.readForm.action = "boardProc.jsp";
			document.readForm.submit();
		}
	}

	function boardList() {
		document.readForm.action = "boardList.jsp";
		document.readForm.submit();
	}

	function boardList_B() {
		document.grantCheckForm.action = "boardList.jsp";
		document.grantCheckForm.submit();
	}

	function down(filename) {
		document.downFrm.filename.value = filename;
		document.downFrm.submit();
	}
</script>


</head>


<body>

	<main>
		<div align="center">
			<br />
			<h4>
				<B>Question</B>
			</h4>
			<hr>
		</div>

		<%
		if (secretValue == "1") {
		%>


		<form name="grantCheckForm" method="post">
			<br>
			<br> <br>
			<div class="px-4 py-5 my-5 text-center">
				<img class="d-block mx-auto mb-4" src="img/secret_icon.jpg" alt=""
					width="20" height="25">
				<h1 class="display-5 fw-bold">비공개 게시글</h1>
				<div class="col-lg-6 mx-auto">
					<p class="lead mb-4">작성자만 확인이 가능합니다.</p>
					<div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
						<!-- <button type="button" class="btn btn-primary btn-lg px-4 gap-3">돌아가기</button> -->
						<button onclick="boardList_B()" type="button"
							class="btn btn-outline-secondary btn-lg px-4">돌아가기</button>
					</div>
				</div>
			</div>
			<br>
			<br>
		</form>




		<%
		} else {
		%>

		<div align="center">

			<form name="readForm" method="post" style="width: 1200px;">

				<div class="col-12" style="text-align: left;">
					<label for="title" class="form-label" style="text-align: left;"><B>제목</B></label>
					<input value="<%=rBean.getSubject()%>" name="subject" type="text"
						class="form-control" id="title">

				</div>
				<br />
				<div class="col-12" style="text-align: left;">
					<label for="content" class="form-label"><B>내용</B></span></label>
					<textarea name="content" rows="15" cols="50" class="form-control"
						aria-label="With textarea"><%=rBean.getContent()%></textarea>

				</div>
				<br />

				<div class="form-check" style="text-align: left;">
					<%
					if (secretValue == "1") {
					%>
					<input checked value="1" name="secret" class="form-check-input"
						type="checkbox" id="secretcheck"> <label
						class="form-check-label" for="flexCheckDefault"> <B>비밀글</B>
					</label>
					<%
					} else {
					%>
					<input value="1" name="secret" class="form-check-input"
						type="checkbox" id="secretcheck"> <label
						class="form-check-label" for="flexCheckDefault"> <B>비밀글</B>
					</label>
					<%
					}
					%>
				</div>
				<br /> <br />


				<div style="text-align: left;">
					<label for="title" class="form-label"><B>첨부파일</B></label> <br />
					<%
					if (rBean.getFilename() != null && !rBean.getFilename().equals("")) {
					%>
					<%=rBean.getFilename()%>
					&nbsp; <a id="userfile"
						href="javascript:down('<%=rBean.getFilename()%>')"> <img
						src="img/download_icon.jpg">
					</a> <a href="javascript:deleteAttachFile('<%=idx%>')"> <img
						src="img/delete_icon.jpg">
					</a>


					<%
					} else {
					%>
					<input type="file" name="filename" class="form-control"
						id="inputGroupFile02"> <br />
					<%
					}
					%>
				</div>
				<br /> <br />

				<hr>
				<h4>
					<b>Answer</b>
				</h4>

				<br />
				<div class="col-12" style="text-align: left; width: 1200px;">
					<!-- <label for="content" class="form-label"><B>Answer</B></span></label> -->

					<%
					   if (admin_value) {
						   
						   if(rBean.getAnswer() == null) { %>
						   
							<textarea name="answer" rows="10" cols="50" class="form-control" aria-label="With textarea" 
							placeholder="답변을 입력해 주세요"></textarea>
							
					   	 <%}else{ %>
					   
							<textarea name="answer" rows="10" cols="50" class="form-control" aria-label="With textarea" 
							placeholder="답변을 입력해 주세요" style="font-weight: bold;"><%=rBean.getAnswer()%></textarea>
							
					   <%} %>
					

					<% } else {
							   if(rBean.getAnswer() == null) { %>
									<textarea name="answer" rows="10" cols="50" class="form-control" aria-label="With textarea" 
									disabled  style="caret-color: transparent; color:gray;">답변이 등록되지 않았습니다.</textarea>
							   <%}else{ %>
									<textarea name="answer" rows="10" cols="50" class="form-control" aria-label="With textarea" 
									disabled  style="caret-color: transparent ;font-weight: bold;" ><%=rBean.getAnswer() %></textarea>
							   <%} %>
					
					<% } %>


				</div>

				<br />

				<div align="center">
					<button onclick="deleteBoard('<%=idx%>')" type="button"
						class="btn btn-outline-dark">삭제</button>
					<button onclick="updateBoard('<%=idx%>')"
						class="btn btn-outline-dark">저장</button>
					<button onclick="boardList()" type="button" class="btn btn-dark">목록</button>
				</div>
				<input type="hidden" name="idKey" value="<%=id%>">
				<input type="hidden" name="idx"> 
				<input type="hidden" name="requestStatus">




			</form>


		</div>

		<form method="post" name="downFrm" action="download.jsp">
			<input type="hidden" name="filename">
		</form>
		<%
		}
		%>




		<br />
		<br />
		<br />
	</main>

	<br />
	<br />
	<br />
</body>

<footer>
	<%-- <%@include file ="../outer_form/footer.jsp" %> --%>
	<%@include file="/footer.jsp"%>
</footer>
</html>
