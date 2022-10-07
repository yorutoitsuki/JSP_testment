<%@page import="java.util.List"%>
<%@page import="member.MemberBeans"%>
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
			List<MemberBeans> members =  dao.getMembers();
			for(int i = 0; i < members.size(); i++){
				MemberBeans beans = members.get(i);
				%>
				<tr>
					<td><a href="updateDelete.jsp?custno='<%=members.get(i).getCustno()%>'"><%=members.get(i).getCustno() %></a></td>
					<td><%=beans.getCustname() %></td>
					<td><%=beans.getPhone() %></td>
					<td><%=beans.getAddress() %></td>
					<td><%=beans.getJoindate() %></td>
					<td><%=beans.getGrade() %></td>
					<td><%=beans.getCity() %></td>
				</tr>
				<%
			}
			%>
		</table>
	</section>


	<%@include file="footer.jsp"%>
</body>
</html>