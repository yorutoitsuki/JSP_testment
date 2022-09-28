<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<%@include file="header.jsp" %>
	<%
		sql  = "select p_code, p_name, p_size, p_type, to_char(p_price,'L9,999,999') from tbl_product";
		rs = stmt.executeQuery(sql);
	%>
	<section>
		<h1>제품조회</h1>
		<table>
			<tr>
				<th>제품코드</th>
				<th>제품명</th>
				<th>제품규격</th>
				<th>제품구분</th>
				<th>제품단가</th>
			</tr>
			<%
			while(rs.next()){
				%>
				<tr>
					<td><%=rs.getString(1) %></td>
					<td><%=rs.getString(2) %></td>
					<td><%=rs.getString(3) %></td>
					<td><%=rs.getString(4) %></td>
					<td class="textRight"><%=rs.getString(5) %></td>
				</tr>
				<%
			}
			%>
		</table>
	</section>
	<%@include file="footer.jsp" %>
</body>
</html>