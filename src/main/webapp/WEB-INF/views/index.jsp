<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>추천 알고리즘 테스트 페이지</title>



</head>

<body>


테스트

</body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script>




function recommend_item(){
	


var request_data  ={};

request_data.user_id = "c_12347";


$.ajax({ 
    type: "POST",  
 	url : "/recommend_item_by_user",
		dataType : 'json',
		async	: false,
		global	: false,
		contentType: "application/json", 
 	data:JSON.stringify(request_data),
    	success: function(response){
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
    		console.log(response)
    	},
        error:function(request,status,error) {
 	       //  console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error+"\n"+"view_graph");
  		return null;
     }
});

}
</script>


</html>