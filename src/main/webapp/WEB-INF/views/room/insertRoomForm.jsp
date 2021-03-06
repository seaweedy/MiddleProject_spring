<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="/ourbox/css/public.css">
<title>Insert title here</title>
<script type="text/javascript">

$(function(){
	$("#subtn").on("click",function(event){
		room_name = $('#room_name').val();
		room_content = $("#room_content").val();
		mem_id = $("#mem_id").val();

// 		event.preventDefault();
		$.ajax({
			url:'/room/insertRoom',
			type:'get',
			data:{
				"mem_id":mem_id,
				"room_name" : room_name,
				"room_content": room_content
				},
				success : function(res){
					opener.document.location.reload();
					self.close();
				},
				error : function(xhr){
					alert("그룹생성에 실패했습니다." + xhr.stats)
				}

		})
			

	})

})
// function insert() {
//     var frm = document.form1;

//     //     spring에 매핑되는 modelAndView             
<%--     frm.action="<%=request.getContextPath()%>/room/insertRoom";  --%>
//     frm.submit();
// 	opener.parent.location.reload();
// 	self.close();
// }
$(function(){
   $('#quit').on('click',function(){
	   self.close();
   })
})
</script>
<style>
   
   body{
      background: #E6E6E6;
      font-family:'문제부 돋움체';
   }
   
   .la{
      width: 100px;
   }
   
   #room_name{
      width: 72%;
      height: 30px;
      border: 1px solid #8C8C8C;
      vertical-align: middle;
      border-radius: 10px;
      margin-bottom: 5px;
      margin-left: 4px;
   }
   
   #room_content{
      width: 72%;
      height: 30px;
      border: 1px solid #8C8C8C;
      vertical-align: middle;
      border-radius: 10px;
      margin-bottom: 5px;
   }
   
   #box{
      text-align: center;
      margin-top: 3%;
   }

   .ibut{
      width:47%;
      font-weight: bold;
      margin-top: 5px;
   }
   
   h4{   
      margin-left: 10px;
      font-weight: bold;
      text-align: left;
      display:inline-block; 
      float:left;
   }
   img{
      display: inline-block;
      width: 25px;
      height: 25px;
      float:left;
      position: relative;
      top : 5px;
      left: 5px;
   }


</style>
</head>
<body onresize="parent.resizeTo(450,250)" onload="parent.resizeTo(450,250)">

<div id='box'>

   <img src="/images/door.png">
   <h4>GRUOP 생성</h4>
   <br><br>
   <form action="<%=request.getContextPath()%>/room/insertRoom" method="post" id = "form1" name="form1">
      <div>
         <label class='la'>GROUP 이름 :</label><input type="text" id="room_name" name ="room_name"><br>
         <label class='la'>GROUP 설명 :</label>
         
         <input type = "text" id="room_content" name = "room_content"><br>
         <input type="hidden" id="mem_id" name = "mem_id" value = "${S_MEMBER.mem_id }">
         
         <input class='ibut' type="button" id ="subtn" value = "생성"> &nbsp;&nbsp;
         <input class='ibut' type="button" id ="quit" value="취소">
      </div>
   </form>
</div>   
   
</body>
</html>