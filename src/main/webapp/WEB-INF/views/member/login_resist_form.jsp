<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>RECO MOVIE</title>

  <!-- Favicon-->
  <link rel="icon" type="image/x-icon" href="./favicon.png" />
  
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" />
  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap" rel="stylesheet" />
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
  
  <script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js" integrity="sha512-WFN04846sdKMIP5LKNphMaWzU7YpMyCU245etK3g/2ARYbPK9Ub18eG+ljU96qKRCWh+quCY7yefSmlkQw1ANQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  

  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" />

</head>
<body>
  <div class="wrap">
    <div class="main_logo">
      <a href="/">
        <img src="${pageContext.request.contextPath}/resources/images/reco_nb_logo.png" alt="reco_logo" width="250px" height="50px">
      </a>
    </div>

    <div class="form-wrap">
      <div class="social-icons">
        <img src="${pageContext.request.contextPath}/resources/images/reco_logo.png" alt="reco_logo" />
      </div>

      <div class="button-wrap">
        <div id="btn"></div>
        <button type="button" class="togglebtn" onclick="login()">로그인</button>
        <button type="button" class="togglebtn" onclick="register()">회원가입</button>
      </div>

      <form id="login" action="" class="input-group">
        <input type="text" class="input-field" placeholder="User name or Email" required>
        <input type="password" class="input-field" placeholder="Enter Password" required>
        <input type="checkbox" class="checkbox"><span>Remember Password</span>
        <button class="submit">Login</button>
      </form>

      <form id="register" action="/insert_member" class="input-group" method="GET">
        <input type="text" name="name" class="input-field" placeholder="User name or Email" required>
        <input type="email" name="email" class="input-field" placeholder="Your Email" required>
        <input type="password" name="passwd" class="input-field" placeholder="Enter Password" required>
        <input type="checkbox" class="checkbox"><span>Terms and conditions</span>
        <button class="submit">REGISTER</button>
      </form>
    </div>
  </div>
  <script>
    var x = document.getElementById("login");
    var y = document.getElementById("register");
    var z = document.getElementById("btn");


    function login() {
      x.style.left = "50px";
      y.style.left = "450px";
      z.style.left = "0";
    }

    function register() {
      x.style.left = "-400px";
      y.style.left = "50px";
      z.style.left = "110px";
    }
  </script>

</body>
</html>