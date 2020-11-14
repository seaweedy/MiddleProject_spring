<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/rightmouse.css">
<link rel="stylesheet" href="/css/public.css">	
<script src="/js/rightmouse.js"></script>

<script type="text/javascript">
	$(function() {
		
			memId = "${S_MEMBER.mem_id}"
		
		$('.panel-title').mousedown(function() {
			event.stopPropagation()
			//$('.contextmenu').show();
			roomSeq = $(this).attr('roomSeq');
		})
		
		$('#inviteMember').on('click', function() {
			$('.contextmenu').hide();
			
			// 우클릭시 해당 그룹의 room_seq들고 보내야함
			event.stopPropagation()
			window.open("/room/inviteView?room_seq="+roomSeq+"&memId="+memId, "회원초대", "width = 300, height = 350, top = 100, left = 200, location = no");

		})
		
		$('#deleteGroup').on('click', function() {
			
			$('.contextmenu').hide();

			event.stopPropagation()
			memId = "${S_MEMBER.mem_id}"
			location.href="/room/deleteRoom?room_seq=" + roomSeq + "&mem_id="+memId;
		})
	})
	
</script>

<style type="text/css">

	html, body {
		height: 100%;
		background: #E6E6E6;
	}
	
	 a:link, a:visited{
 		text-decoration: none;
 		color: black;
 	}
 	
 	img{
 		margin-right: 1px;
		vertical-align: middle;
 	}
 	
 	td{
 		height: 35px;
 	}

</style>



<title>Insert title here</title>
</head>
<body>
	<table>
		<c:choose>
			<c:when test="${roomList.size() > 0}">
				<c:forEach items="${roomList }" var="room">
					<tr>
						<td>
						<a class = "panel-title" roomSeq="${room.room_seq }" href="/ourbox/view/ourbox/group.jsp?roomSeq=${room.room_seq }&memId=${S_MEMBER.mem_id}" target="ifr">
						<img alt="그룹아이콘.png" src="/images/그룹아이콘.png">
						<span class="bold">${room.room_name }</span>
						</a></td>
					</tr>
				</c:forEach>	
			</c:when>
			<c:when test="${room.length == 0 }">
				<tr>
					<td>생성한 그룹이 없습니다.</td>
				</tr>
			</c:when>
		</c:choose> 
	</table>
	
	
	<ul class="contextmenu">
	  <li><a href="#" id="inviteMember">초대하기</a></li>
	  <li><a href="#" id="deleteGroup">그룹탈퇴</a></li>
	</ul>
	
	
</body>
</html>