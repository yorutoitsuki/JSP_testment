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
sql  = " select a.*,null,null,null from coffe_tbl a union all";
sql += " select null,null,null, b.* from coffe_tbl_update b";
rs = stmt.executeQuery(sql);
rs.next();
%>
<h2>커피목록 조회</h2>
<table class="selectTable">
	<tr>
		<th>상품코드</th>
		<th>상품명</th>
		<th>상품단가</th>
	</tr>
	<%

	while(rs.next()){
		if(rs.getString(1) == null){
			rs.previous();
			break;
		}
	%>
	<tr>
		<td><a href="updateCoffe.jsp?pcode='<%=rs.getString(1)%>'"><%=rs.getString(1) %></a></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
	</tr>
	<%
	}
	%>
</table>
<h2>커피목록조회(수정된 커피 가격)</h2>
<table class="selectTable">
	<tr>
		<th>상품코드</th>
		<th>상품명</th>
		<th>상품단가</th>
	</tr>
	<%
	while(rs.next()){
	%>
	<tr>
		<td><a href="updateCoffe.jsp?pcode='<%=rs.getString(4)%>'"><%=rs.getString(4) %></a></td>
		<td><%=rs.getString(5) %></td>
		<td><%=rs.getString(6) %></td>
	</tr>
	<%
	}
	%>
</table>


<%@include file="footer.jsp" %>
</body>
</html>