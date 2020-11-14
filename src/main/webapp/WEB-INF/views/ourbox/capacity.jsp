<%@page import="kr.or.ddit.common.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<meta charset="utf-8">
	<title>HTML</title>
</head>
<style>

	progress{
		width: 100%;
		height: 25px;
	}

	#buy{
		float: right;
		display: inline-block;
	}
	
	span, a{
		font-size: 0.8em;
	}

</style>
<body>

	<div>
		<span>저장공간 ${percent }%사용</span>
		<progress value="${useSize }" max="${planSize }"></progress><br>
		<a target="ifr" href="<%=request.getContextPath()%>/PlanListServlet?mem_id=${S_MEMBER.mem_id}" id="buy">저장공간 구매</a>
	</div>

</body>
</html>