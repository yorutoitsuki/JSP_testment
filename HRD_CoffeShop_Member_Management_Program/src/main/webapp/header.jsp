<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="db_conn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커피숍 회원관리</title>
</head>


<link rel="stylesheet" href="style.css">



<body>
	<header>
		<h1>커피숍 회원관리</h1>
		<nav>
			<a href="insertMember.jsp">회원등록</a>
			<a href="insertCoffe.jsp">커피등록</a>
			<a href="selectMember.jsp">회원목록조회/수정</a>
			<a href="selectCoffe.jsp">커피목록조회</a>
			<a href="selectIncome.jsp">매출현황조회</a>
			<a href="index.jsp">홈으로</a>
		</nav>
	</header>
</body>
</html>