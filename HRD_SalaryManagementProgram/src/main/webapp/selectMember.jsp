<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>급여관리 프로그램</title>
</head>
<body>
<%@include file="header.jsp" %>
<%
	sql  = " select a.*, to_char(hire_date,'yyyy-MM-dd') ,decode(employee_status,'1','입사','2','퇴사','3','휴직') ";
	sql += " from employee_tbl_13 a order by employee_no";
	rs = stmt.executeQuery(sql);
%>
	<h1>사원 조회/수정</h1>
	<table>
		<tr>
			<th>사원번호</th>
			<th>사원명</th>
			<th>부서번호</th>
			<th>입사일자</th>
			<th>사원상태코드</th>
			<th>사원상태명</th>
		</tr>
		<%
		while(rs.next()){
		%>
		<tr>
			<td><a href="updateMember.jsp?employee_no=<%=rs.getString(1) %>"><%=rs.getString(1) %></a></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td>
			<td><%=rs.getString(6) %></td>
			<td><%=rs.getString(5) %></td>
			<td><%=rs.getString(7) %></td>
		</tr>
		<%
		}
		%>
	</table>
<%@include file="footer.jsp" %>
</body>
</html>