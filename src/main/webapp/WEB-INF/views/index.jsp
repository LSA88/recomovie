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
<script>
	var movie_list = [];

	function load_movie_rating() {

		movie_list = [ {
			이름 : null,
			영화이름 : "기생충",
			평점 : null,
			이미지 : "movie_01.jpg"
		}, {
			이름 : null,
			영화이름 : "조커",
			평점 : null,
			이미지 : "movie_02.jpg"
		}, {
			이름 : null,
			영화이름 : "트루먼쇼",
			평점 : null,
			이미지 : "movie_03.jpg"
		}, {
			이름 : null,
			영화이름 : "브이포벤데타",
			평점 : null,
			이미지 : "movie_04.jpg"
		}, {
			이름 : null,
			영화이름 : "엄복동",
			평점 : null,
			이미지 : "movie_05.jpg"
		}, {
			이름 : null,
			영화이름 : "리얼",
			평점 : null,
			이미지 : "movie_06.jpg"
		}, {
			이름 : null,
			영화이름 : "클라멘타인",
			평점 : null,
			이미지 : "movie_07.jpg"
		}, {
			이름 : null,
			영화이름 : "디워",
			평점 : null,
			이미지 : "movie_08.jpg"
		}, {
			이름 : null,
			영화이름 : "인생은아름다워",
			평점 : null,
			이미지 : "movie_09.jpg"
		}, {
			이름 : null,
			영화이름 : "이프온리",
			평점 : null,
			이미지 : "movie_10.jpg"
		}, {
			이름 : null,
			영화이름 : "내머리속의지우개",
			평점 : null,
			이미지 : "movie_11.jpg"
		}, {
			이름 : null,
			영화이름 : "이터널선샤인",
			평점 : null,
			이미지 : "movie_12.jpg"
		}, {
			이름 : null,
			영화이름 : "이웃집토토로",
			평점 : null,
			이미지 : "movie_13.jpg"
		}, {
			이름 : null,
			영화이름 : "하울의움직이는성",
			평점 : null,
			이미지 : "movie_14.jpg"
		}, {
			이름 : null,
			영화이름 : "원령공주",
			평점 : null,
			이미지 : "movie_15.jpg"
		}, {
			이름 : null,
			영화이름 : "센과치히로의행방불명",
			평점 : null,
			이미지 : "movie_16.jpg"
		}, {
			이름 : null,
			영화이름 : "윈터솔져",
			평점 : null,
			이미지 : "movie_17.jpg"
		}, {
			이름 : null,
			영화이름 : "어벤저스-엔드게임",
			평점 : null,
			이미지 : "movie_18.jpg"
		}, {
			이름 : null,
			영화이름 : "가이언즈오브갤럭시",
			평점 : null,
			이미지 : "movie_19.jpg"
		}, {
			이름 : null,
			영화이름 : "다크나이트",
			평점 : null,
			이미지 : "movie_20.jpg"
		} ]
		$('.movie_row').html("");
		for (var i = 0; i < movie_list.length; i++) {
			var template = $('.images_templet').text();
			template = template
					.replace('%%MOVIE_NAME%%', movie_list[i]["영화이름"]);
			template = template.replace('%%IMG_NAME%%', movie_list[i]["이미지"]);

			template = $(template);
			$('.movie_row').append(template);
		}

	}

	function user_movie_rating() {

		//request_data.user_id = "c_12347";
		var userId = $("#userId").val();

		if (userId == "" || userId == null) {

			alert("평점 확인을 위한 회원 이름을 입력해주세요.")

			return false;

		}

		var request_data = {};

		request_data["이름"] = userId;

		$
				.ajax({
					type : "POST",
					url : "/user_movie_rating",
					dataType : 'json',
					async : true,
					global : false,
					contentType : "application/json",
					data : JSON.stringify(request_data),
					success : function(response) {
						console.log("결과=")
						console.log(response)

						if (response.state === 200) {
							for (var i = 0; i < movie_list.length; i++) {

								for (var j = 0; j < response.result.length; j++) {

									if (movie_list[i]["영화이름"] === response.result[j]["영화이름"]) {

										movie_list[i]["평점"] = response.result[j]["평점"]

										$(".rating_select").eq(i).val(
												"" + movie_list[i]["평점"])

									}

								}

							}
						} else {

							alert("평점을 등록한 회원이 아닙니다. 평점을 등록해주세요.")

						}

					},
					error : function(request, status, error) {
						return null;
					}
				});

	}
	function insert_movie_rating() {

		//request_data.user_id = "c_12347";
		var userId = $("#userId").val();

		if (userId == "" || userId == null) {

			alert("평점을 등록할 회원 이름을 입력해주세요.")

			return false;

		}
		$(".rating_select").each(function(index, item) {

			movie_list[index]["평점"] = $(item).val()
			if (movie_list[index]["평점"] == "null") {
				movie_list[index]["평점"] = null
			}
			movie_list[index]["이름"] = userId;
			delete (movie_list[index]["이미지"])
		})
		var rating_count = 0;
		$.each(movie_list, function(index, item) {

			if (movie_list[index]["평점"] != null) {

				rating_count++;
			}

		})
		if (rating_count < 5) {
			alert("평점을 최소 5개 이상 등록해주세요.")
			return false;

		}

		var request_data = {};
		request_data.movie_list = movie_list;

		$.ajax({
			type : "POST",
			url : "/insert_movie_rating",
			dataType : 'json',
			async : false,
			global : false,
			contentType : "application/json",
			data : JSON.stringify(request_data),
			success : function(response) {
				console.log(response)

				if (response.state === 201) {

					alert("평점이 등록되었습니다.")

				} else if (response.state === 205) {
					alert("평점이 업데이트 되었습니다.")
				} else {
					alert("평점 등록에 실패하였습니다.")

				}

			},
			error : function(request, status, error) {
				return null;
			}
		});

	}

	load_movie_rating();

	function recommend_item() {

		var userId = $("#userId").val();

		if (userId == "" || userId == null) {

			alert("영화를 추천받은 회원 이름을 입력해주세요.")

			return false;

		}

		var request_data = {};

		request_data.userId = userId;

		$
				.ajax({
					type : "POST",
					url : "/recommend_item_by_user",
					dataType : 'json',
					async : true,
					global : false,
					contentType : "application/json",
					data : JSON.stringify(request_data),
					success : function(response) {
						console.log("결과=")
						console.log(response)

						$('.recommend_movie_row').html("");
						for (var i = 0; i < movie_list.length; i++) {

							for (var j = 0; j < response.result.length; j++) {

								if (movie_list[i]["영화이름"] === response.result[j]) {

									var template = $('.recommend_movie_templet')
											.text();

									template = template.replace(
											'%%MOVIE_NAME%%',
											movie_list[i]["영화이름"]);
									template = template.replace('%%IMG_NAME%%',
											movie_list[i]["이미지"]);
									template = $(template);
									$('.recommend_movie_row').append(template);
								}

							}

							$(document).find("#recommend_movie_modal").modal(
									"show");

						}

					},
					error : function(request, status, error) {
						return null;
					}
				});

	}
</script>


</html>