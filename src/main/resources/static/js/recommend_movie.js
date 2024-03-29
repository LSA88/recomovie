   //영화 평점저장을 위한 배열
   var movie_list = [];


   //데이터베이스에 업로드 한뒤 ajax 나 jsp 를 이용하여 호출하는등으로도 사용해보자.
   function load_movie_rating() {

        var temp_list = select_movie_list()

        for(var i = 0; i<temp_list.result.length;i++){
            var movie_obj={
                             이름 : null,
                             영화이름 : temp_list.result[i].title,
                             평점 : null,
                             이미지 : "movie_"+temp_list.result[i].movieid+".jpg"
                          }
            movie_list.push(movie_obj);


        }

      $('.movie_row').html("");
      // 해당 반복문은 템플릿스크립트를 이용하여  영화정보 를  편집하여 뿌려주기위한 반복문이다.
      for (var i = 0; i < movie_list.length; i++) {
         var template = $('.images_templet').text();
         template = template
               .replace('%%MOVIE_NAME%%', movie_list[i]["영화이름"]);
         template = template.replace('%%IMG_NAME%%', movie_list[i]["이미지"]);

         template = $(template);
         $('.movie_row').append(template);
      }

   }
   load_movie_rating();

   //해당 회원이 등록한 movie 평점을 가져오는 함수이다. 만약 로그인기능이  도입되어진다면  ,
   //맨처음 영화리스트 로딩때  해당 회원이 등록한 평점데이터를 jsp 등으로 뿌려주는 형식으로 만들어볼수있다.
   function user_movie_rating() {

      //request_data.user_id = "c_12347";
      var userId = $("#userId").val();

      if (userId == "" || userId == null) {

         alert("평점 확인을 위한 회원 이름을 입력해주세요.")

         return false;

      }

      var request_data = {};

      request_data["이름"] = userId;

      $.ajax({
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
       //전체 무비 목록을 가져오는 함수
       function select_movie_list() {

            var movie_list = [];
          var request_data = "";
        //컨트롤단에서 영화목록을 가져오는  ajax 함수
          $.ajax({
                   type : "GET",
                   url : "/select_movie_list",
                   dataType : 'json',
                   async : false,
                   global : false,
                   data : request_data,
                   success : function(response) {
                      console.log("결과=")
                      console.log(response)

                            movie_list =response;

                   },
                   error : function(request, status, error) {
                      return null;
                   }
                });
            return movie_list;
       }
   //평점데이터 등록함수   평점을 등록하지않은 사용자라면  평점이 insert처리 되고 ,  등록한 회원이라면 update 처리된다.
   function insert_movie_rating() {

      var request_data = {};
      request_data.movie_list =[]

      var userId = $("#userId").val();

      if (userId == "" || userId == null) {

         alert("평점을 등록할 회원 이름을 입력해주세요.")

         return false;

      }

      //select 박스 를 반복접근 하여 선택한 평점데이터를 가져온다.
      //requst_data.movie_list 에 따로 담아서 전송을함
      //파트별로 전부 쪼개서 반복문을 돌리게 해놓았지만  하나로도 만들수가 있다. 응용 필요
      $(".rating_select").each(function(index, item) {
         if(index >= 100){
          return false
          }
         movie_list[index]["평점"] = $(item).val()
         if (movie_list[index]["평점"] == "null") {
            movie_list[index]["평점"] = null
         }
         movie_list[index]["이름"] = userId;

      })

      var rating_count = 0;
      $.each(movie_list, function(index, item) {


         if (movie_list[index]["평점"] != null) {

            rating_count++;
         }
         var rating_item = {
               "평점": movie_list[index]["평점"],
               "영화이름": movie_list[index]["영화이름"],
               "이름": movie_list[index]["이름"],
         }
         request_data.movie_list.push(rating_item);

      })
      if (rating_count < 5) {
         alert("평점을 최소 5개 이상 등록해주세요.")
         return false;

      }

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
            alert("평점 등록에 실패하였습니다.")
            return null;
         }
      });

   }

   //평점을 등록한 회원에게 추천 영화를  팝업화면으로 띄워서 보여주는 함수이다.

   function recommend_item() {

      var userId = $("#userId").val();

      if (userId == "" || userId == null) {

         alert("영화를 추천받은 회원 이름을 입력해주세요.")

         return false;

      }

      var request_data = {};

      request_data.userId = userId;

      $.ajax({
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
                  alert("추천받기에 실패하였습니다.")
                  return null;
               }
            });

   }