<%@page import="controller.Parsing"%>
<%@page contentType="text/html; charset=UTF-8"%>

<footer class="section-text-white footer footer-links bg-darken">
    <!-- <div class="footer-body container" style="background-color: rgb(51, 51, 51);"> -->
    <div class="footer-body container" >
        <div class="row">
            <div class="col-sm-6 col-lg-3">
                <a class="footer-logo" href="./" style="padding-left: 50px; width: 220px; height: 107px;">
                    <img src='https://ifh.cc/g/spGd0K.png' border='0' alt="..." />
                </a>
                <div class="footer-content">
                    <p class="footer-text">부산광역시 부산진구 엄광로 176 (가야동),
                        <br/>가야동 467 동의대학교 중앙도서관</p>
                    <p class="footer-text">Tel:&nbsp;&nbsp;(010) 1234-5678</p>
                </div>
            </div>
            <div class="col-sm-6 col-lg-3">
                <h5 class="footer-title text-uppercase">Movies</h5>
                <ul class="list-unstyled list-wide footer-content">
            		<%
            		Parsing parsing2 = new Parsing();
            		String[][] boxList2 = parsing2.getMovieData();
            		for(int i = 0; i < boxList2.length; i++) {
            		%>
                    <li>
                        <a class="content-link" href="#"><%=boxList2[i][0]%></a>
                    </li>
                    <% } %>
                </ul>
            </div>
            <div class="col-sm-6 col-lg-3">
                <h5 class="footer-title text-uppercase">Creator</h5>
                <ul class="list-unstyled list-wide footer-content">
                    <li>
                        <a class="content-link" style="text-decoration-line: none;" href="#">NAMJU KIM</a>
                    </li>
                    <li>
                        <a class="content-link" style="text-decoration-line: none;" href="#">MYUNGJUN SONG</a>
                    </li>
                    <li>
                        <a class="content-link" style="text-decoration-line: none;" href="#">TAEMIN JANG</a>
                    </li>
                    <li>
                        <a class="content-link" style="text-decoration-line: none;" href="#">HEEON KIM</a>
                    </li>
                    <li>
                        <a class="content-link" style="text-decoration-line: none;" href="#">HONGGYU KIM</a>
                    </li>
                    <li>
                        <a class="content-link" style="text-decoration-line: none;" href="#">SANGMEE LEE</a>
                    </li>
                </ul>
            </div>
            <div class="col-sm-6 col-lg-3">
                <h5 class="footer-title text-uppercase">GitHub</h5>
                <ul class="list-wide footer-content list-inline">
                    <li class="list-inline-item">
                        <a class="content-link" href="#"><i class="bi bi-github"></i></a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="footer-copy">
        <div class="container">Copyright 2023 &copy; C Team. All rights reserved.</div>
    </div>
</footer>

<!-- jQuery library -->
<script src="./js/jquery-3.3.1.js"></script>
<!-- Bootstrap -->
<script src="./bootstrap/js/bootstrap.js"></script>
<!-- Paralax.js -->
<script src="./parallax.js/parallax.js"></script>
<!-- Waypoints -->
<script src="./waypoints/jquery.waypoints.min.js"></script>
<!-- Slick carousel -->
<script src="./slick/slick.min.js"></script>
<!-- Magnific Popup -->
<script src="./magnific-popup/jquery.magnific-popup.min.js"></script>
<!-- Inits product scripts -->
<script src="./js/script.js"></script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAJ4Qy67ZAILavdLyYV2ZwlShd0VAqzRXA&callback=initMap"></script>
<script async defer src="https://ia.media-imdb.com/images/G/01/imdb/plugins/rating/js/rating.js"></script>