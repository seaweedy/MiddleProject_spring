<%@page import="kr.or.ddit.common.vo.MemoVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%

	List<MemoVO> memoList = (List<MemoVO>) request.getAttribute("memoList");
	String mem_id = (String) request.getAttribute("mem_id");
	
%>    
    
    
<!DOCTYPE html>
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="/ourbox/css/rightmouse.css">
<script src="/ourbox/js/rightmouse.js"></script>
<script src="/ourbox/js/memo.js"></script>

<title>ourbox : QUICK 메모</title>

<script type="text/javascript">

	$(function() {
		
		$('.panel-title').mousedown(function() {
			event.stopPropagation()
			
			memo_seq = $(this).attr('seq');
			mem_id = $(this).attr('memId');
			memo_title = $(this).parents('.panel').find('.memoTitle').html();
			memo_content = $(this).parents('.panel').find('.memoContent').html();
			
		})
		
		$('#deleteMemo').on('click', function() {
			
			byeMemo = {
							"memoSeq" : memo_seq,
							"memId" : mem_id
						}
			
			deleteMemo(byeMemo);
			
		})
		
		$('#updateMemo').on('click', function() {
			
			window.open('/ourbox/view/memo/updateMemoForm.jsp?memoSeq='+memo_seq+'&memId='+mem_id+'&memoTitle='+memo_title+'&memoContent='+memo_content+'', '_blank','width=300px,height=500px');
			
		})
		
		$('#searchMemo').on('click', function(){
			
			mem_id = $('#memId').val();
			searchKeyWord = $('#searchKeyWord').val();
			
			location.href="/ourbox/SearchMemoController?mem_id="+mem_id+"&searchKeyWord="+searchKeyWord+"";
			
			
		})
		
		
		
	})
	
</script>




<style type="text/css">

	body{
		background: #E6E6E6;
		font-family:'문제부 돋움체';
	}

	img{
 		width: 30px;
 		height: 30px;
 		margin-left: 10px;
 		margin-right: 10px;
		vertical-align: middle;
 	}

 	a:link, a:visited{
 		text-decoration: none;
 		color: black;
 	}
	
	h3 span{
		vertical-align: bottom;
	}
	
	#searchKeyWord{
		width: 78%;
		height: 30px;
		border: none;
		margin-left: 5%;
		vertical-align: middle;
		border-radius: 10px 0px 0px 10px;
	}
	
	#searchMemo{
		border: none;
		height: 30px;
		width : 40px;
		background: white;
		padding: 0px;
		vertical-align: middle;
		border-radius: 0px 10px 10px 0px;
		position: absolute;
	}
	
	button img {
		margin : 0px;
		width: 15px;
		height: 15px;
	}
	
	h3{	
		margin: 5%;
		margin-bottom: 0px;
		display: inline-block;
	}
	
	#insertButton{
		border: none;
		background: none;
		margin: 5%;
		float: right;
	}

	#insertButton span{
		font-size: 1.5em;
		font-weight: bold;
	}
	
	#backList{
		display: none;
	}
	
</style>


</head>
<body onresize="parent.resizeTo(330,550)" onload="parent.resizeTo(330,550)">

	<h3><a href='#'><img alt="퀵메모아이콘.png" src="/ourbox/images/퀵메모아이콘.png"><span>QUICK 메모</span></a></h3>
	<button id="insertButton" onclick="window.open('/ourbox/view/memo/insertMemoForm.jsp?memId=<%=mem_id%>', '_blank','width=300px,height=500px');">
	<span>+</span>
	</button>
	<button id="backList" memId="<%=mem_id%>">목록으로</button>
	
	<br><br>
	<div>
	<input id="searchKeyWord" type="text">
	<button id="searchMemo" type="button"><img alt="돋보기.png" src="/ourbox/images/돋보기.png"></button>
	</div>
	<br>
	<input type="hidden" id="memId" value="<%=mem_id%>">
	
	
	<div class="container">
	  <div class="panel-group" id="accordion">
	  
	  <%
	  		for(int i=0 ; i <memoList.size(); i++){
	  			MemoVO memo = memoList.get(i);			
	  			if(memoList.size() == 0 ){
	  %>	
	  				<p>등록된 메모가 없습니다.</p>
	  <%	
	  			}else{
	  %>
	  				
	  			 <div class="panel panel-default">
			      <div class="panel-heading" >
			        <h4 class="panel-title" memId="<%=mem_id%>" seq="<%= memo.getMemo_seq() %>">
			          <a data-toggle="collapse" data-parent="#accordion" href="#collapse<%=memo.getMemo_seq() %>" class="memoTitle"><%= memo.getMemo_title() %></a>
			        </h4>
			      </div>
			      <div id="collapse<%=memo.getMemo_seq() %>" class="panel-collapse collapse">
			        <div class="panel-body memoContent"><%=memo.getMemo_content().replaceAll("\\n", "<br>")%></div>
			      </div>
			    </div>	
	  <%	
	  			}
	  		}
	  %>
	  
	  
	    
	    
	    
	    
	    
	    
	  </div> 
	</div>
	
	
	<ul class="contextmenu">
	  <li><a href="#" id="updateMemo">퀵메모 수정</a></li>
	  <li><a href="#" id="deleteMemo">퀵메모 제거</a></li>
	</ul>	
	


</body>
</html>