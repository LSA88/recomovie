<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="kr">

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

  <link rel="stylesheet" href="css/sub.css" />

  <script defer src="js/youtube.js"></script>
  <script defer src="js/main.js"></script>



</head>

<body>

  <!-- Header-->
  <header>
    <div class="cut_photo"></div>
    <div class="inner_head">
      <a href="/" class="logo">
        <img src="./image/reco_nb_logo.png" alt="Reco movie" width="250px" height="50px" />
      </a>

      <div class="menu">

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

  <section class="dec_menu">
    <div class="inner">
      <div class="poster">
        <img src="/image/movie_01.jpg" alt="그린북" width="300" height="400" />
      </div>
      <div class="movie_title">그린북</div>
      <div class="movie_year_nation">2018 미국</div>
      <p class="movie_plot">
        줄거리설명입니다줄거리설명입니다줄거리설명입줄거리설명입니다줄거리설명입니다줄거리설명입니다줄거리설명입니다니다줄줄거리설명입니다줄거리설명입니다줄거리설명입줄거리설명입니다줄거리설명입니다줄거리설명입니다줄거리설명입니다니다줄거리설명입니다줄거리설명입니다줄거리설명입니다줄거리설명입니다줄거리설명입니다줄거리설명입니다줄거리설명입니다줄거리설명입니다줄거리설명입줄거리설명입니다줄거리설명입니다줄거리설명입니다줄거리설명입니다니다줄거리설명입니다줄거리설명입니다줄거리설명입니다줄거리설명입니다줄거리설명입니다줄거리설명입니다거리설명입니다줄거리설명입니다줄거리설명입니다줄거리설명입니다줄거리설명입니다줄거리설명입니다.
      </p>

    </div>



    </div>
  </section>

</body>

</html>