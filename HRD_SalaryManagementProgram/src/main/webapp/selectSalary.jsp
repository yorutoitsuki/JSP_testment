<%@page import="java.util.ArrayList"%>
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
	sql  = " select substr(work_date,1,6),  ";
	sql += " employee_no, sum((round(work_out_time/100)-round(work_in_time/100))), ";
	sql += " sum((substr(work_out_time,3)-substr(work_in_time,3)))";
	sql += " from work_tbl_13 group by (substr(work_date,1,6),employee_no) order by employee_no desc";
	rs = stmt.executeQuery(sql);
	
%>
	<h1>급여조회(아침출근-저녁퇴근)</h1>
	<table>
		<tr>
			<th>근무년월</th>
			<th>사원번호</th>
			<th>급여</th>
		</tr>
		<%
		while(rs.next()){
		%>
		<tr>
			<td><%=rs.getString(1) %></td>
			<td><%=rs.getString(2) %></td>
			<td><%=(rs.getInt(3)*9000 + rs.getInt(4)*(9000/60)) %></td>
		</tr>
		<%
		}
		%>
	</table>
	<h1>급여조회(저녁출근-아침퇴근)</h1>
	<table>
		<tr>
			<th>근무년월</th>
			<th>사원번호</th>
			<th>급여</th>
		</tr>
		<%
		//아침 출근과 저녁 출근이 혼재되어 있는 상태, 분류가 필요함
		//salaryDB.sql 파일의 103번 라인에 설명 있음
		sql  = " select substr(work_date,1,6), employee_no,   ";
		sql += " sum(case when work_in_time > work_out_time then ";
		sql += " ((24-round(work_in_time/100)+round(work_out_time/100)))";
		sql += " else ((round(work_out_time/100)-round(work_in_time/100))) end),";
		sql += " sum((substr(work_out_time,3)-substr(work_in_time,3)))";
		sql += " from work_tbl_13_2 group by (substr(work_date,1,6),employee_no) ";
		sql += " order by employee_no desc";
		rs = stmt.executeQuery(sql);
		while(rs.next()){
		%>
		<tr>
			<td><%=rs.getString(1) %></td>
			<td><%=rs.getString(2) %></td>
			<td><%=(rs.getInt(3)*9000 + rs.getInt(4)*(9000/60)) %></td>
		</tr>
		<%
		}
		%>
	</table>
		
<%@include file="footer.jsp" %>
</body>
</html>