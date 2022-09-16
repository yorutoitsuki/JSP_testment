<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대학교성적관리 프로그램</title>
</head>

<link rel="stylesheet" href="style.css">

<body>
	<%@include file="db_connect.jsp" %>
	<header>
		<h1>대학교성적관리 프로그램</h1>
	</header>
	<nav>
		<a href="insertStudent.jsp">학생등록</a>
		<a href="insertScore.jsp">성적등록</a>
		<a href="selectScore.jsp">성적조회</a>
		<a href="reClassMember.jsp">재수강대상자</a>
		<a href="index.jsp">홈으로</a>
	</nav>
</body>
</html>