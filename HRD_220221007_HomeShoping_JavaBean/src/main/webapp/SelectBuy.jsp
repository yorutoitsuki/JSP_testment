<%@page import="member.SalesBeans"%>
<%@page import="java.util.List"%>
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
	<%
	ShoppingDAO dao = new ShoppingDAO();
	List<SalesBeans> list = dao.getMembersBuy();
	
	%>

	<section>
		<h2>회원 목록 조회/수정</h2>
		<table class="selectTable">
			<tr>
				<th>회원번호</th>
				<th>회원성명</th>
				<th>고객등급</th>
				<th>매출</th>
			</tr>
			<%
			for(int i = 0; i < list.size(); i ++) {
				SalesBeans temp = list.get(i);
			%>
			<tr>
				<td><%=temp.getCustno()%></td>
				<td><%=temp.getCustname()%></td>
				<td><%=temp.getGrade()%></td>
				<td><%=temp.getTotalPrice()%></td>
			</tr>
			<%
			}
			%>
		</table>
	</section>


	<%@include file="footer.jsp"%>
</body>
</html>