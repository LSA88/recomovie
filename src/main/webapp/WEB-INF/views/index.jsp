<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Reco Movie</title>

  <!-- Favicon-->
  <link rel="icon" type="image/x-icon" href="./favicon.ico" />

  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" />
  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap" rel="stylesheet" />
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />

  <script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js"
    integrity="sha512-WFN04846sdKMIP5LKNphMaWzU7YpMyCU245etK3g/2ARYbPK9Ub18eG+ljU96qKRCWh+quCY7yefSmlkQw1ANQ=="
    crossorigin="anonymous" referrerpolicy="no-referrer"></script>

  <!-- GSAP & ScrollToPlugin -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.7.1/gsap.min.js"
    integrity="sha512-UxP+UhJaGRWuMG2YC6LPWYpFQnsSgnor0VUF3BHdD83PS/pOpN+FYbZmrYN+ISX8jnvgVUciqP/fILOXDjZSwg=="
    crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.7.1/ScrollToPlugin.min.js"
    integrity="sha512-1OG9UO4krPizjtz/c9iDbjCqtXznBYdJeD4ccPaYfJHzC6F1qoQ3P1bgQ3J8lgCoK5qGVCqsY4+/RKjLDzITVQ=="
    crossorigin="anonymous" referrerpolicy="no-referrer"></script>

  <!-- SWIPER -->
  <link rel="stylesheet" href="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.css" />
  <script src="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.js"></script>

  <!-- ScrollMagic -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/ScrollMagic/2.0.8/ScrollMagic.min.js"
    integrity="sha512-8E3KZoPoZCD+1dgfqhPbejQBnQfBXe8FuwL4z/c8sTrgeDMFEnoyTlH3obB4/fV+6Sg0a0XF+L/6xS4Xx1fUEg=="
    crossorigin="anonymous" referrerpolicy="no-referrer"></script>

  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" />

  <script defer src="${pageContext.request.contextPath}/resources/js/youtube.js"></script>
  <script defer src="${pageContext.request.contextPath}/resources/js/main.js"></script>


</head>

<body>



  <!-- Header-->
  <header>
    <div class="inner">
      <a href="/" class="logo">
        <img src="${pageContext.request.contextPath}/resources/images/reco_logo.png" alt="Reco movie" width="250px" height="50px" />
      </a>

      <div class="menu">
        <div class="dropdown">
          <button class="dropbtn">장르</button>
          <div class="dropdown-content">
            <a href="#">드라마</a>
            <a href="#">액션</a>
            <a href="#">로맨스</a>
            <a href="#">SF</a>
            <a href="#">뮤지컬</a>
            <a href="#">애니메이션</a>
            <a href="#">스릴러</a>
            <a href="#">공포</a>
            <a href="#">판타지</a>
            <a href="#">코미디</a>
          </div>
        </div>

        <div class="search">
          <input type="text" placeholder="영화제목을 검색해 보세요." />
          <div class="material-icons">search</div>
        </div>

        <div>
          <a href="/login_registe_form.html" class="btn">로그인</a>
        </div>

      </div>
    </div>
  </header>

  <!-- YOUTUBE VIDEO -->
  <section class="youtube">
    <div class="youtube__area">
      <div id="player"></div>
    </div>
    <div class="youtube__cover"></div>
    <div class="inner"></div>
  </section>

  <!-- MAIN WINDOW -->
  <section class="mainwindow">
    <div class="inner">

      <div class="main_title">
        <p>드라마</p>
      </div>




      <ul class="img_box">
        <div class="swiper-container">
          <div class="swiper-wrapper">


            <c:forEach var="movie_info" items="${movie_list.result}" varStatus="status">
<c:if test = "${movie_info.genres eq '드라마'}">


                <div class="swiper-slide">
                          <li class="img_movie">
                            <a href="javascript:description('${movie_info.movieid}');">
                              <img src="${pageContext.request.contextPath}/resources/images/movie/movie_${movie_info['movieid']}.jpg" alt="그린북" width="258px" height="400px">
                            </a>
                            <div class="movie_infomation">
                              <div class="movie_title"> ${movie_info['title']}</div>
                              <div class="movie_year_nation">${movie_info['date']} ${movie_info['nation']}</div>
                            </div>
                          </li>
                        </div>

     </c:if>
            </c:forEach>


          </div>
        </div>
      </ul>







      <div class="swiper-pagination"></div>
      <div class="swiper-prev">
        <div class="material-icons">arrow_back_ios</div>
      </div>
      <div class="swiper-next">
        <div class="material-icons">arrow_forward_ios</div>
      </div>
    </div>




  </section>


<!-- Footer-->



</body>
<script>


function description(movieid){


location.href="/description?movieid="+movieid;

}



</script>


</html>