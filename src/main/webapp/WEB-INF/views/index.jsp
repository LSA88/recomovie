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

  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" />
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script defer src="${pageContext.request.contextPath}/resources/js/youtube.js"></script>
  <script defer src="${pageContext.request.contextPath}/resources/js/main.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

    <style>
    body {
    background-color: #141414;
    }
  </style>

</head>
<body>

  <!-- Header-->
  <header>
    <div class="inner">
      <a href="/" class="logo">
        <img src="${pageContext.request.contextPath}/resources/images/reco_logo.png" alt="Reco movie" width="250px"
          height="50px" />
      </a>
      <div class="dropdown">
        <button class="dropbtn">장르</button>
        <div class="dropdown-content">
          <a href="#drama_title">드라마</a>
          <a href="#action_title">액션</a>
          <a href="#romance_title">로맨스</a>
          <a href="#sf_title">SF</a>
          <a href="#musical_title">뮤지컬</a>
          <a href="#animation_title">애니메이션</a>
          <a href="#thriller_title">스릴러</a>
          <a href="#horror_title">공포</a>
          <a href="#fantasy_title">판타지</a>
          <a href="#comedy_title">코미디</a>
        </div>
      </div>

      <div class="menu">
        <div>
          <c:choose>
           <c:when test="${empty user_info.name}" >
            <input type="hidden" id="recommendbtn" value="${user_info.name}"/>
           </c:when>
           <c:otherwise> <button class="btn_re btn-defult" onclick="insert_movie_rating()">평점 등록</button>
           <button class="btn_re btn-defult" id= "recommendbtn" onclick="recommend_item()"> 추천 받기 </button> </c:otherwise>
          </c:choose>
        </div>


        <!-- 동적 추천 영화 그리드 생성을 위한 템플릿 스크립트 -->
        <script type="text/html" class="recommend_movie_templet">
        <div class="col-xs-3" style="margin-top: 50px;">
        <div class="card">
           <div class="card-img-div">
          <img class="card-img-top" src="/resources/images/movie/%%IMG_NAME%%" width="250px" height="400px">
        </div>
          <div class="card-body">
          <div class="card-title-div">
            <h4 class="card-title" style="font-size: 24px; font-weight: 500; " >%%MOVIE_NAME%%</h4>
          </div>
          </div>
        </div>
        </div>
        </script>

        <script
        	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script
        	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


        <script
        	src="${pageContext.request.contextPath}/resources/js/recommend_movie.js"
        	charset="UTF-8"></script>


        <div class="search">
          <input type="text"  placeholder="영화제목을 검색해 보세요." />
          <div class="material-icons">search</div>
        </div>

        <div>
          <c:choose>
           <c:when test="${empty user_info.name}" > <a href="/login" class="btn_lo"> LOGIN </a></c:when>
           <c:otherwise>  <a href="#" class="btn_lo ">${user_info.name}  님</a>
            <input type="hidden" id="userId" value="${user_info.name}"/>
            </c:otherwise>
          </c:choose>
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

      <div class="main_title" id="drama_title">
        <a name="drama"> <p> # 드라마</p></a>
      </div>

      <ul class="img_box">
        <div class="swiper-container">
          <div class="swiper-wrapper">


            <c:forEach var="movie_info" items="${movie_list.result}" varStatus="status">
              <c:if test="${movie_info.genres eq '드라마'}">


                <div class="swiper-slide">
                  <li class="img_movie">
                    <a href="javascript:description('${movie_info.movieid}');">
                      <img
                        src="${pageContext.request.contextPath}/resources/images/movie/movie_${movie_info['movieid']}.jpg"
                        alt="그린북" width="258px" height="400px">
                    </a>
                    <div class="movie_infomation">
                      <div class="movie_title"> ${movie_info['title']}</div>
                      <div class="movie_year_nation">${movie_info['date']} ${movie_info['nation']}</div>

                      <select class="rating_select">
                        <option value=null>미관람</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                      </select>
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


  <section class="mainwindow2">
    <div class="inner">

      <div class="main_title" id="action_title">
        <p> # 액션</p>
      </div>

      <ul class="img_box2">
        <div class="swiper-container">
          <div class="swiper-wrapper">


            <c:forEach var="movie_info" items="${movie_list.result}" varStatus="status">
              <c:if test="${movie_info.genres eq '액션'}">


                <div class="swiper-slide">
                  <li class="img_movie">
                    <a href="javascript:description('${movie_info.movieid}');">
                      <img
                        src="${pageContext.request.contextPath}/resources/images/movie/movie_${movie_info['movieid']}.jpg"
                        alt="그린북" width="258px" height="400px">
                    </a>
                    <div class="movie_infomation">
                      <div class="movie_title"> ${movie_info['title']}</div>
                      <div class="movie_year_nation">${movie_info['date']} ${movie_info['nation']}</div>

                      <select class="rating_select">
                        <option value=null>미관람</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                      </select>
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


  <!-- MAIN WINDOW3 -->
  <section class="mainwindow3">
    <div class="inner">

      <div class="main_title" id="romance_title">
        <p> # 로맨스</p>
      </div>

      <ul class="img_box3">
        <div class="swiper-container">
          <div class="swiper-wrapper">


            <c:forEach var="movie_info" items="${movie_list.result}" varStatus="status">
              <c:if test="${movie_info.genres eq '로맨스'}">


                <div class="swiper-slide">
                  <li class="img_movie">
                    <a href="javascript:description('${movie_info.movieid}');">
                      <img
                        src="${pageContext.request.contextPath}/resources/images/movie/movie_${movie_info['movieid']}.jpg"
                        alt="그린북" width="258px" height="400px">
                    </a>
                    <div class="movie_infomation">
                      <div class="movie_title"> ${movie_info['title']}</div>
                      <div class="movie_year_nation">${movie_info['date']} ${movie_info['nation']}</div>

                      <select class="rating_select">
                        <option value=null>미관람</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                      </select>
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


  <!-- MAIN WINDOW4 -->
  <section class="mainwindow4">
    <div class="inner">

      <div class="main_title" id="sf_title">
        <p> # SF </p>
      </div>

      <ul class="img_box4">
        <div class="swiper-container">
          <div class="swiper-wrapper">


            <c:forEach var="movie_info" items="${movie_list.result}" varStatus="status">
              <c:if test="${movie_info.genres eq 'SF'}">


                <div class="swiper-slide">
                  <li class="img_movie">
                    <a href="javascript:description('${movie_info.movieid}');">
                      <img
                        src="${pageContext.request.contextPath}/resources/images/movie/movie_${movie_info['movieid']}.jpg"
                        alt="그린북" width="258px" height="400px">
                    </a>
                    <div class="movie_infomation">
                      <div class="movie_title"> ${movie_info['title']}</div>
                      <div class="movie_year_nation">${movie_info['date']} ${movie_info['nation']}</div>

                      <select class="rating_select">
                        <option value=null>미관람</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                      </select>
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


  <!-- MAIN WINDOW5 -->
  <section class="mainwindow5">
    <div class="inner">

      <div class="main_title" id="musical_title">
        <p> # 뮤지컬</p>
      </div>

      <ul class="img_box5">
        <div class="swiper-container">
          <div class="swiper-wrapper">


            <c:forEach var="movie_info" items="${movie_list.result}" varStatus="status">
              <c:if test="${movie_info.genres eq '뮤지컬'}">


                <div class="swiper-slide">
                  <li class="img_movie">
                    <a href="javascript:description('${movie_info.movieid}');">
                      <img
                        src="${pageContext.request.contextPath}/resources/images/movie/movie_${movie_info['movieid']}.jpg"
                        alt="그린북" width="258px" height="400px">
                    </a>
                    <div class="movie_infomation">
                      <div class="movie_title"> ${movie_info['title']}</div>
                      <div class="movie_year_nation">${movie_info['date']} ${movie_info['nation']}</div>

                      <select class="rating_select">
                        <option value=null>미관람</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                      </select>
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


  <!-- MAIN WINDOW6 -->
  <section class="mainwindow6">
    <div class="inner">

      <div class="main_title" id="animation_title">
        <p> # 애니메이션 </p>
      </div>

      <ul class="img_box6">
        <div class="swiper-container">
          <div class="swiper-wrapper">


            <c:forEach var="movie_info" items="${movie_list.result}" varStatus="status">
              <c:if test="${movie_info.genres eq '애니메이션'}">


                <div class="swiper-slide">
                  <li class="img_movie">
                    <a href="javascript:description('${movie_info.movieid}');">
                      <img
                        src="${pageContext.request.contextPath}/resources/images/movie/movie_${movie_info['movieid']}.jpg"
                        alt="그린북" width="258px" height="400px">
                    </a>
                    <div class="movie_infomation">
                      <div class="movie_title"> ${movie_info['title']}</div>
                      <div class="movie_year_nation">${movie_info['date']} ${movie_info['nation']}</div>

                      <select class="rating_select">
                        <option value=null>미관람</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                      </select>
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


  <!-- MAIN WINDOW7 -->
  <section class="mainwindow7">
    <div class="inner">

      <div class="main_title" id="thriller_title">
        <p> # 스릴러</p>
      </div>

      <ul class="img_box7">
        <div class="swiper-container">
          <div class="swiper-wrapper">


            <c:forEach var="movie_info" items="${movie_list.result}" varStatus="status">
              <c:if test="${movie_info.genres eq '스릴러'}">


                <div class="swiper-slide">
                  <li class="img_movie">
                    <a href="javascript:description('${movie_info.movieid}');">
                      <img
                        src="${pageContext.request.contextPath}/resources/images/movie/movie_${movie_info['movieid']}.jpg"
                        alt="그린북" width="258px" height="400px">
                    </a>
                    <div class="movie_infomation">
                      <div class="movie_title"> ${movie_info['title']}</div>
                      <div class="movie_year_nation">${movie_info['date']} ${movie_info['nation']}</div>

                      <select class="rating_select">
                        <option value=null>미관람</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                      </select>
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

  <!-- MAIN WINDOW8 -->
  <section class="mainwindow8">
    <div class="inner">

      <div class="main_title" id="horror_title">
        <p># 공포</p>
      </div>

      <ul class="img_box8">
        <div class="swiper-container">
          <div class="swiper-wrapper">


            <c:forEach var="movie_info" items="${movie_list.result}" varStatus="status">
              <c:if test="${movie_info.genres eq '공포'}">


                <div class="swiper-slide">
                  <li class="img_movie">
                    <a href="javascript:description('${movie_info.movieid}');">
                      <img
                        src="${pageContext.request.contextPath}/resources/images/movie/movie_${movie_info['movieid']}.jpg"
                        alt="그린북" width="258px" height="400px">
                    </a>
                    <div class="movie_infomation">
                      <div class="movie_title"> ${movie_info['title']}</div>
                      <div class="movie_year_nation">${movie_info['date']} ${movie_info['nation']}</div>

                      <select class="rating_select">
                        <option value=null>미관람</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                      </select>
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


  <!-- MAIN WINDOW9 -->
  <section class="mainwindow9">
    <div class="inner">

      <div class="main_title" id="fantasy_title">
        <p># 판타지 </p>
      </div>

      <ul class="img_box9">
        <div class="swiper-container">
          <div class="swiper-wrapper">


            <c:forEach var="movie_info" items="${movie_list.result}" varStatus="status">
              <c:if test="${movie_info.genres eq '판타지'}">


                <div class="swiper-slide">
                  <li class="img_movie">
                    <a href="javascript:description('${movie_info.movieid}');">
                      <img
                        src="${pageContext.request.contextPath}/resources/images/movie/movie_${movie_info['movieid']}.jpg"
                        alt="그린북" width="258px" height="400px">
                    </a>
                    <div class="movie_infomation">
                      <div class="movie_title"> ${movie_info['title']}</div>
                      <div class="movie_year_nation">${movie_info['date']} ${movie_info['nation']}</div>

                      <select class="rating_select">
                        <option value=null>미관람</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                      </select>
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


  <!-- MAIN WINDOW10 -->
  <section class="mainwindow10">
    <div class="inner">

      <div class="main_title" id="comedy_title">
        <p># 코미디 </p>
      </div>

      <ul class="img_box10">
        <div class="swiper-container">
          <div class="swiper-wrapper">


            <c:forEach var="movie_info" items="${movie_list.result}" varStatus="status">
              <c:if test="${movie_info.genres eq '코미디'}">


                <div class="swiper-slide">
                  <li class="img_movie">
                    <a href="javascript:description('${movie_info.movieid}');">
                      <img
                        src="${pageContext.request.contextPath}/resources/images/movie/movie_${movie_info['movieid']}.jpg"
                        alt="그린북" width="258px" height="400px">
                    </a>
                    <div class="movie_infomation">
                      <div class="movie_title"> ${movie_info['title']}</div>
                      <div class="movie_year_nation">${movie_info['date']} ${movie_info['nation']}</div>

                      <select class="rating_select">
                        <option value=null>미관람</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                      </select>
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
<%@ include file="/WEB-INF/views/movie/modal/recommend_movie_modal.jsp"%>
</body>

<script>
  function description(movieid) {

    location.href = "/description?movieid=" + movieid;

  }
</script>

</html>