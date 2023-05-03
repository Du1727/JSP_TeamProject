<%@page import="java.util.Vector"%>
<%@page import="store.storeBean"%>
<%@page import="controller.Parsing"%>
<%@page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mgr" class="store.storeMgr"></jsp:useBean>

<%	

	String id = (String)session.getAttribute("idKey");	
	Vector<storeBean> vlist = mgr.productAll();
	Parsing parsing = new Parsing();
	String[][] boxList = parsing.getMovieData();
	String[][] boxDetail = parsing.getMovieDetail();
	String[] boxPost = parsing.getMovieImage();
    String[] boxContent = new String[boxDetail.length]; 
    
	for(int i = 0; i < boxDetail.length; i++) {
		boxContent[i] = parsing.textLimit(boxDetail[i][3]);		
	}
	
%>

<!DOCTYPE html>
<html>
	<head>
		<%@include file ="navbar-black.jsp" %>	
	</head>
    <body class="body" > 
        <section class="section-solid-long section-text-white position-relative">
            <div class="d-background" data-image-src="assets/img/body_background.png" data-parallax="scroll"></div>
            <div class="d-background bg-gradient-black"></div>
            <div class="container position-relative" style="height: 800px;">
                <div class="slick-spaced slick-carousel" data-slick-view="navigation single">
                    <div class="slick-slides">
                    <%for(int i = 0; i < boxList.length; i++) { %>
                        <div class="slick-slide" >
                            <article class="movie-line-entity">
                                <div class="entity-preview">
                                    <div class="embed-responsive embed-responsive-16by9" style="width: 750px; height: 750px;">
                                        <img class="embed-responsive-item" style=" padding-left: 250px; padding-top: 50px;" src=<%=boxPost[i]%> alt="" />
                                    </div>
                                </div>
                                <div class="entity-content" style=" padding-left: 220px;">
                                    <h4 class="entity-title">
                                        <a class="content-link" href="movie-info-sidebar-right.html"><%=boxList[i][0]%></a>
                                    </h4>
                                    <div class="entity-category">
                                        <a class="content-link"><%=boxDetail[i][2]%></a>
                                    </div>
                                    <div class="entity-info">
                                        <div class="info-lines">
                                            <div class="info info-short">
                                                <span class="text-theme info-icon"><i class="fas fa-trophy"></i></span>
                                                <span class="info-text"><%=boxList[i][2]%></span>
                                                <span class="info-rest">&nbsp;위</span>
                                            </div>         
                                            <div class="info info-short">
                                                <span class="text-theme info-icon"><i class="fas fa-calendar-alt"></i></span>
                                                <span class="info-text"><%=boxList[i][1]%></span>
                                            </div>
                                            <div class="info info-short">
                                                <span class="text-theme info-icon"><i class="fas fa-clock"></i></span>
                                                <span class="info-text"><%=boxDetail[i][0]%></span>
                                                <span class="info-rest">&nbsp;분</span>
                                            </div>                                   
                                        </div>
                                    </div>
                                    <p class="text-long entity-text"><%=boxContent[i]%></p>
                                </div>
                            </article>
                        </div>
                     <% } %>
                    </div>
                    <div class="slick-arrows">
                        <div class="slick-arrow-prev">
                            <span class="th-dots th-arrow-left th-dots-animated">
                                <span></span>
                                <span></span>
                                <span></span>
                            </span>
                        </div>
                        <div class="slick-arrow-next">
                            <span class="th-dots th-arrow-right th-dots-animated">
                                <span></span>
                                <span></span>
                                <span></span>
                            </span>
                        </div>
                    </div>
                </div>
                <div class="section-head"></div><div class="section-head"></div><div class="section-head"></div>
            </div>
        </section>       
        <section class="section-text-white position-relative">
            <div class="d-background" data-image-src="assets/img/body_background.png" data-parallax="scroll"></div>
            <div class="d-background bg-theme-blacked"></div>
            <div class="mt-auto container position-relative">
                <div class="top-block-head text-uppercase">
                    <h2 class="display-4">무비
                        <span class="text-theme">차트</span>
                    </h2>
                </div>
                <div class="top-block-footer">
                    <div class="slick-spaced slick-carousel" data-slick-view="navigation responsive-4">
                        <div class="slick-slides">
                    	<%for(int i = 0; i < boxList.length; i++) { %>
                            <div class="slick-slide">
                                <article class="poster-entity" data-role="hover-wrap">
                                    <div class="embed-responsive embed-responsive-poster">
                                        <img class="embed-responsive-item" src=<%=boxPost[i]%> alt="" />
                                    </div>
                                    <div class="d-background bg-theme-lighted collapse animated faster" data-show-class="fadeIn show" data-hide-class="fadeOut show"></div>
                                    <div class="d-over bg-highlight-bottom">
                                        <div class="collapse animated faster entity-play" data-show-class="fadeIn show" data-hide-class="fadeOut show">
                                            <a class="action-icon-theme action-icon-bordered rounded-circle" href="https://www.youtube.com/watch?v=d96cjJhvlMA" data-magnific-popup="iframe">
                                                <span class="icon-content"><i class="bi bi-search"></i></span>
                                            </a>
                                        </div>
                                        <h4 class="entity-title">
                                            <a class="content-link" href="movie-info-sidebar-right.html"><%=boxList[i][0]%></a>
                                        </h4>
                                        <div class="entity-category">
                                            <a class="content-link" href="movies-blocks.html"><%=boxDetail[i][2]%></a>
                                        </div>
                                        <div class="entity-info">
                                            <div class="info-lines">
                                                <div class="info info-short">
                                                    <span class="text-theme info-icon"><i class="fas fa-star"></i></span>
                                                    <span class="info-text">8.1</span>
                                                    <span class="info-rest">/10</span>
                                                </div>
                                                <div class="info info-short">
                                                    <span class="text-theme info-icon"><i class="fas fa-clock"></i></span>
                                                    <span class="info-text"><%=boxDetail[i][0]%></span>
                                                    <span class="info-rest">&nbsp;분</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </article>
                            </div>
                        <% } %>
                        </div>
                        <div class="slick-arrows">
                            <div class="slick-arrow-prev">
                                <span class="th-dots th-arrow-left th-dots-animated">
                                    <span></span>
                                    <span></span>
                                    <span></span>
                                </span>
                            </div>
                            <div class="slick-arrow-next">
                                <span class="th-dots th-arrow-right th-dots-animated">
                                    <span></span>
                                    <span></span>
                                    <span></span>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="section-long">
            <div class="container">                
                <h2 class="display-4">스토어</h2>
				<div class="row row-cols-1 row-cols-md-2" style="padding-left: 30px; padding-top: 20px" >
					<div class="row row-cols-1 row-cols-md-1 g-4">
						<% storeBean bean = mgr.getProduct(0); %>
						<div class="card" style="width: 30rem; height: 30rem;">
							<div class="product text-center">
								<a class="open-productDetail nav-link mx-auto" style="cursor: hand">
									<figure>
										<img class="mx-auto d-block" src="./assets/img/store_combo_1.png"
											width="100%" height="100%">
										<figcaption>
											<i class="bi bi-search fs-3"></i>
										</figcaption>
									</figure>
								</a>							
							</div>
						</div>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</div>
					<div class="row row-cols-1 row-cols-md-2 g-4">
					<%
					for (int i = 1; i < (vlist.size()>5?5:vlist.size()); i++) {
						storeBean bean2 = vlist.get(i);						
					%>	
						<div class="col">
							<div class="card" style="width: 15rem; height: 15rem;">
								<div class="product text-center">
									<a class="open-productDetail nav-link mx-auto" style="cursor: hand">
										<figure>
											<img class="mx-auto d-block" src="./assets/img/store_combo_1.png"
												width="100%" height="100%">
											<figcaption>
												<i class="bi bi-search fs-3" ></i>
											</figcaption>
										</figure>
									</a>							
								</div>
							</div>							
						</div>
						<% } %>
					</div>
				</div>
            </div>
        </section>
    </body>
    <%@include file ="footer.jsp" %>
</html>