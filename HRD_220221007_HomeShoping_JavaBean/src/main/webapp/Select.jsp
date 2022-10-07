<%@page import="java.util.ArrayList"%>
<%@page import="member.ShoppingDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<%@include file="header.jsp"%>
	<section>
		<h2>회원 목록 조회/수정</h2>
		<table class="selectTable">
			<tr>
				<th>회원번호</th>
				<th>회원성명</th>
				<th>전화번호</th>
				<th>주소</th>
				<th>가입일자</th>
				<th>고객등급</th>
				<th>거주지역</th>
			</tr>
			<%
			ShoppingDAO dao = new ShoppingDAO();
			ArrayList<MemberBeans> members =  dao.getMembers();
			%>
		</table>
	</section>


	<%@include file="footer.jsp"%>
</body>
</html>