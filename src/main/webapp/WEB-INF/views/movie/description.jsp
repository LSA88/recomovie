<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


      <%
          request.setCharacterEncoding("UTF-8");
          String movie_info = request.getParameter("movie_info");

          pageContext.setAttribute("movie_info",movie_info);
      %>




<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Reco Movie</title>

  <!-- Favicon-->
  <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/favicon.png" />

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

  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub.css" />

  <script defer src="js/youtube.js"></script>
  <script defer src="js/main.js"></script>


    <style>

    header > .cut_photo {
        height: 600px;
        background-image: url(/resources/images/cutphoto/cutphoto_${movie_info.movieid}.jpg);
        background-size: 100% 100%;
        background-repeat: no-repeat;
        opacity: .4;
    }


    </style>
</head>

<body>

  <!-- Header-->
  <header>
    <div class="cut_photo"></div>
    <div class="inner_head">
      <a href="/" class="logo">
        <img src="${pageContext.request.contextPath}/resources/images/reco_nb_logo.png" alt="Reco movie" width="250px" height="50px" />
      </a>

      <div class="menu">

        <div class="search">
          <input type="text" placeholder="영화제목을 검색해 보세요." />
          <div class="material-icons">search</div>
        </div>

        <div>
          <c:choose>
           <c:when test="${empty user_info.name}" > <a href="/login" class="btn"> 로그인 </a></c:when>
           <c:otherwise>  <a href="#" class="btn">${user_info.name}  님</a> </c:otherwise>
          </c:choose>
        </div>

      </div>
    </div>

  </header>

  <section class="dec_menu">
    <div class="inner">
      <div class="poster">
        <img src="${pageContext.request.contextPath}/resources/images/movie/movie_${movie_info.movieid}.jpg" alt="그린북" width="300px" height="400px">
      </div>

        <div class="movie_title"> ${movie_info.title}</div>
        <div class="movie_year_nation">${movie_info.date} ${movie_info.nation}</div>
        <p class="movie_plot">${movie_info.plot}</p>


    </div>




    </div>
  </section>

<!-- Footer-->
<footer>
  <div class="inner">
    <div class="info">
      <span>Email : lovervz@naver.com </span>
      <span>RECO MOVIE SITE</span>
      <span>TEL : 010-5699-7662 </span>
      <span>책임자 : 이상아, 김명지, 임진우</span>
    </div>

    <p class="copyright">
      &copy; <span class="this-year"> </span> RECO MOVIE HOMEPAGE. WELCOME!
    </p>
    <img src="${pageContext.request.contextPath}/resources/images/reco_nb_logo.png " alt="" class="logo" width="150px" height="30px"/>

  </div>


</footer>



</body>

</html>