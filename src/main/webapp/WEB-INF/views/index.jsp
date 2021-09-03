<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>추천 알고리즘 테스트 페이지</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<style type="text/css">
.card-img-div, .card-title-div, .card-body {
	text-align: center;
}

.rating_select {
	margin: auto;
	width: 80%;
}

.card-img-top {
	width: 80%;
	height: 350px;
}

.page_div {
	background-color: #cdddf5;
	padding: 30px;
}
</style>

</head>

<body>
	<div class="col-xs-12">
		<div class="page_div">
			<span class="page_main_title"
				style="font-size: 40px; font-weight: bold;"> 영화 평점 등록 사이트</span> <span
				class="page_sub_tile" style="font-size: 25px;"><p>관람한 영화의
					평점을 매겨주세요.</p></span> <label for="userId">회원 이름</label><input type="text"
				id="userId" class="form-control"
				style="display: inline-block; width: 100px; margin-right: 20px;"
				placeholder="회원 이름" value="">
			<button class="btn btn-defult" onclick="insert_movie_rating()">평점
				등록</button>
			<button class="btn btn-defult" onclick="user_movie_rating()">등록
				평점 확인</button>
			<button class="btn btn-defult" onclick="recommend_item()">영화
				추천받기</button>
		</div>
	</div>

	<div class="row movie_row col-xs-12"></div>
</body>

<%@ include file="/WEB-INF/views/movie/modal/recommend_movie_modal.jsp"%>

<!-- 동적 추천 영화 그리드 생성을 위한 템플릿 스크립트 -->
<script type="text/html" class="images_templet">
<div class="col-xs-3" style="margin-top: 50px;">
<div class="card">
   <div class="card-img-div">
  <img class="card-img-top" src="/resources/images/movie/%%IMG_NAME%%">
</div>
  <div class="card-body">
  <div class="card-title-div">
    <h4 class="card-title">%%MOVIE_NAME%%</h4>
  </div>
     <select class="form-control rating_select">
	  <option value=null>미관람</option>
      <option value="1">1</option>
      <option value="2">2</option>
      <option value="3">3</option>
      <option value="4">4</option>
      <option value="5">5</option>
      </select>
  </div>
</div>
</div>
</script>
<!-- 동적 추천 영화 그리드 생성을 위한 템플릿 스크립트 -->
<script type="text/html" class="recommend_movie_templet">
<div class="col-xs-3" style="margin-top: 50px;">
<div class="card">
   <div class="card-img-div">
  <img class="card-img-top" src="/resources/images/movie/%%IMG_NAME%%">
</div>
  <div class="card-body">
  <div class="card-title-div">
    <h4 class="card-title">%%MOVIE_NAME%%</h4>
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



</html>