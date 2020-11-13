<%@page import="kr.or.ddit.common.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	$(function(){
		$('.someOne').on('click',function(event){
			otherId = $(this).attr('other');
			room_seq = $('#roomSeq').val();
			event.preventDefault(); //
			$.ajax({
				url:'/room/invite',
				type:'get',
				data:{
					"other" : otherId,
					"room_seq" : room_seq
				},
				success : function(res){
					opener.document.location.reload();
					self.close();
				},
				error : function(xhr){
					alert("초대에 실패했습니다." + xhr.status);
				}
			})
			
		})
	})    
</script>
<style>
	span{
		display: inline-block;
		width : 150px;
	}
	#btn{
		text-align: right;
	}
</style>
	<input type="hidden" id ="roomSeq" name ="roomSeq" value="${room_seq }" >
	<c:choose>
		<c:when test="${otherList.size()>0 }">
			<c:forEach items="${otherList }" var="other">
				<c:choose>
					<c:when test="${other != mem_id }">
						<div class='di2'>
						<input id="someOneId" class="others" type="hidden" value ="${other.mem_id}" name = "otherId" >&nbsp;"${other.mem_id}"
						<input class ="someOne" type="button" other ="${other.mem_id}" value="초대"></div>
					</c:when>
				</c:choose>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<div>
				일치하는 회원이 존재하지 않습니다.
			</div>
		</c:otherwise>
	</c:choose>
