<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>추천 알고리즘 테스트 페이지</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<style type="text/css">
.card-img-div,.card-title-div,.card-body{
text-align: center;
}
.rating_select{
 margin: auto;
 width: 80%;
}
.card-img-top{
width: 80%;
height: 350px;
}
.page_div{
background-color: #cdddf5;
padding: 30px;
}
</style>

</head>

<body>
<div class="col-xs-12" >
<div class="page_div">
<span class="page_main_title" style="font-size: 40px;font-weight: bold;"> 영화 평점 등록 사이트</span>
<span class="page_sub_tile" style="font-size: 25px;"><p>관람한 영화의 평점을 매겨주세요.</p></span>
<label for="userId" >회원 이름</label><input type="text" id="userId" class="form-control" style="display: inline-block; width: 100px; margin-right: 20px;" 
placeholder="회원 이름" value="">
<button class="btn btn-defult" onclick="insert_movie_rating()">평점 등록</button>
<button class="btn btn-defult" onclick="recommend_item()">영화 추천받기</button>
</div>
</div>

<div class="row movie_row col-xs-12" >


</div>
</body>



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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script>

var movie_list = [];

function load_movie_rating(){
	
	 movie_list = [
		{이름:null,영화이름:"기생충",평점:null,이미지:"movie_01.jpg"},
		{이름:null,영화이름:"조커",평점:null,이미지:"movie_02.jpg"},
		{이름:null,영화이름:"트루먼쇼",평점:null,이미지:"movie_03.jpg"},
		{이름:null,영화이름:"브이포벤데타",평점:null,이미지:"movie_04.jpg"},
		{이름:null,영화이름:"엄복동",평점:null,이미지:"movie_05.jpg"},
		{이름:null,영화이름:"리얼",평점:null,이미지:"movie_06.jpg"},
		{이름:null,영화이름:"클라멘타인",평점:null,이미지:"movie_07.jpg"},
		{이름:null,영화이름:"디워",평점:null,이미지:"movie_08.jpg"},
		{이름:null,영화이름:"인생은아름다워",평점:null,이미지:"movie_09.jpg"},
		{이름:null,영화이름:"이프온리",평점:null,이미지:"movie_10.jpg"},
		{이름:null,영화이름:"내머리속의지우개",평점:null,이미지:"movie_11.jpg"},
		{이름:null,영화이름:"이터널선샤인",평점:null,이미지:"movie_12.jpg"},
		{이름:null,영화이름:"이웃집토토로",평점:null,이미지:"movie_13.jpg"},
		{이름:null,영화이름:"하울의움직이는성",평점:null,이미지:"movie_14.jpg"},
		{이름:null,영화이름:"원령공주",평점:null,이미지:"movie_15.jpg"},
		{이름:null,영화이름:"센과치히로의행방불명",평점:null,이미지:"movie_16.jpg"},
		{이름:null,영화이름:"윈터솔져",평점:null,이미지:"movie_17.jpg"},
		{이름:null,영화이름:"어벤저스-엔드게임",평점:null,이미지:"movie_18.jpg"},
		{이름:null,영화이름:"가이언즈오브갤럭시",평점:null,이미지:"movie_19.jpg"},
		{이름:null,영화이름:"다크나이트",평점:null,이미지:"movie_20.jpg"}
	]
	
	for(var i = 0; i<movie_list.length;i++){
		  var template = $('.images_templet').text();
		  template = template.replace('%%MOVIE_NAME%%',movie_list[i]["영화이름"]);
		  template = template.replace('%%IMG_NAME%%',movie_list[i]["이미지"]);
		  
		  template = $(template);
		  $('.movie_row').append(template);
		
	}
	

}

function insert_movie_rating(){
	

	//request_data.user_id = "c_12347";
	var userId = $("#userId").val();
	
	if(userId ==""||userId==null){
		
		alert("평점을 등록할 회원 이름을 입력해주세요.")
		
		return false;
		
	}
	$(".rating_select").each(function(index,item){
		
		movie_list[index]["평점"]=$(item).val()
		if(movie_list[index]["평점"]=="null"){
			movie_list[index]["평점"]=null
		}
		movie_list[index]["이름"]=userId;
		delete(movie_list[index]["이미지"])
	})
	var request_data = {};
	request_data.movie_list = movie_list;
	
	$.ajax({ 
	    type: "POST",  
	 	url : "/insert_movie_rating",
			dataType : 'json',
			async	: false,
			global	: false,
			contentType: "application/json", 
	 	data:JSON.stringify(request_data),
	    	success: function(response){
	    		console.log(response)
	    	},
	        error:function(request,status,error) {
	  		return null;
	     }
	});

}

load_movie_rating();



function recommend_item(){
	
	var userId = $("#userId").val();
	
	if(userId ==""||userId==null){
		
		alert("영화를 추천받은 회원 이름을 입력해주세요.")
		
		return false;
		
	}

var request_data  ={};

request_data.userId = userId;


$.ajax({ 
    type: "POST",  
 	url : "/recommend_item_by_user",
		dataType : 'json',
		async	: false,
		global	: false,
		contentType: "application/json", 
 	data:JSON.stringify(request_data),
    	success: function(response){
    		console.log("결과=")
    		console.log(response)
/*     		console.log("결과=")
    		console.log(response)
    		var recommend_item =response.result[0].recommend_item;
    		var recommend_item_div =$(document).find("#recommend_item_div")
    		var img_names = ['clean','food','mouse','timer'];
    		
    		for(var i= 0; i<recommend_item.length;i++){
    			if(i>=4)
    				break;
    			var div_0 = $("<div class='col-xs-3'>");
    			var recommend_a = $("<a class='recommend_item_a'>");
    			
    			var image = $("<img src='/resources/images/recommend/"+img_names[i]+".jpg'>")
    			recommend_a.css({"display":"inline-block","cursor":"pointer"})
    			recommend_a.attr('onclick', "recommend_Manager.select_recommend_item('"+recommend_item[i]+"')");
    			
    			recommend_a.html(image)
    			//recommend_a.text(recommend_item[i])
    			div_0.html(recommend_a)
    			
    			recommend_item_div.append(div_0);
    			
    			
    		} */
    	},
        error:function(request,status,error) {
 	       //  console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error+"\n"+"view_graph");
  		return null;
     }
});

}
</script>


</html>