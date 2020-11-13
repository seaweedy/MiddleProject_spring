<%@page import="kr.or.ddit.common.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	request.setCharacterEncoding("UTF-8");
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/public.css">	


<script src="/js/jquery-3.5.1.min.js"></script>


<script>
	$(function(){
		$('#findbtn').on('click',function(event){ // 검색
			room_seq = $('#roomSeq').val();
			other = $('#other').val();
			mem_id = $('#memId').val();
			
			event.preventDefault();
			$.ajax({
				url:'/room/otherList',
				type:'get',
				data:{
					"room_seq": room_seq,
					"other" : other,
					"mem_id" : mem_id
				},
				success: function(res){
					console.log(res);
					$('#ohterList').empty();
					$('#ohterList').html(res);
				},
				error: function(xhr){
					alert("상태" + xhr.status)
				}
			})
			
		})
		
		$('#ohterList').on('click', '#invite',function(){"WebContent"
			opener.document.location.reload();
			window.close();
		})
		
	})
	
</script>

<style type="text/css">
	
	body{
		background: #EAEAEA;
		font-family:'문제부 돋움체';
	}
	
	#ohterList{
		width: 100%;
	}
	
	td{
		border-bottom: 1px solid #B8B8B8;
		padding: 5px;
	}
	
	#other{
		width: 82%;
		height: 20px;
		border: none;
		vertical-align: middle;
		border-radius: 10px;
	}

	#menu{
		margin-top: 10px;
	}
	
	img{
		width: 28px;
		height: 25px;
		vertical-align: top;
		margin-right: 5px;
	}
	
	.someOne{
		float: right;
	}
	
	.di2{
		margin: 4px;
		border-bottom: 1px solid #FFFFFF;
		padding: 3px;
		height: 30px;
	}
	.bold{
		 width:280px;
	}

</style>



</head>
<body onresize="parent.resizeTo(345,390)" onload="parent.resizeTo(345,390)">
		
		<img alt="그룹초대 아이콘.png" src="/images/그룹초대 아이콘.png"><span class="bold">초대할 회원의 ID를 입력해주세요</span>
		
		<div id="menu">
		<input type ="text" id="other" name="other">
		<input id="findbtn" type="button" value="검색" />
		</div>
		<hr>
		
	<form name = "invite" method="get" action="/room/RoomInviteController">
		<input type="hidden" id="roomSeq" name="roomSeq" value="${room_seq }"> 
		<input type="hidden" id="memId" name="memId" value="${memId} }">
		<table id="ohterList">
		
		</table>
	</form>

</body>
</html>