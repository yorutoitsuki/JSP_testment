<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="header.jsp" %>
<%
sql  = " select pname, pcost, pcode, nvl(amount,0), nvl(price,0), to_char(nvl(price,0),'L999,999,999') as total";
sql += " from coffe_tbl left outer join (select pcode, sum(amount) as amount , sum(price) as price";
sql += " from sale_tbl group by pcode) using (pcode) order by total desc";
rs = stmt.executeQuery(sql);
%>
<h2>커피목록 조회</h2>
<table class="selectTable">
	<tr>
		<th>상품명</th>
		<th>판매단가</th>
		<th>총판매수량</th>
		<th>총 판매금액</th>
	</tr>
	<%

	while(rs.next()){
	%>
	<tr>
		<td><%=rs.getString(1) %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(4) %></td>
		<td><%=rs.getString(5).equals("0")?"":rs.getString(6) %></td>
	</tr>
	<%
	}
	%>
</table>


<%@include file="footer.jsp" %>
</body>
</html>