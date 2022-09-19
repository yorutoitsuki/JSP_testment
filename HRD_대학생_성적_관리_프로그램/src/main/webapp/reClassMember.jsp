<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<%@include file="header.jsp" %>
	<%
		sql  = "select 	sum(case when m_subject1 between loscore and hiscore then 1 else 0 end), ";
		sql += "		sum(case when m_subject2 between loscore and hiscore then 1 else 0 end), ";
		sql += "		sum(case when m_subject3 between loscore and hiscore then 1 else 0 end), ";
		sql += "		sum(case when s_subject1 between loscore and hiscore then 1 else 0 end), ";
		sql += "		sum(case when m_subject2 between loscore and hiscore then 1 else 0 end) ";
		sql += "		from score_tbl, grade_tbl where grade = 'A' union all ";
		sql += "select	sum(case when m_subject1 between loscore and hiscore then 1 else 0 end), ";
		sql += "		sum(case when m_subject2 between loscore and hiscore then 1 else 0 end), ";
		sql += "		sum(case when m_subject3 between loscore and hiscore then 1 else 0 end), ";
		sql += "		sum(case when s_subject1 between loscore and hiscore then 1 else 0 end), ";
		sql += "		sum(case when m_subject2 between loscore and hiscore then 1 else 0 end) ";
		sql += " 		from score_tbl, grade_tbl where grade = 'F'";
		rs = stmt.executeQuery(sql);
		
		%>
		<h1>성적조회</h1>
		<section>
			<table class="selectTable">
			<tr>
				<th>과목</th>
				<th>전공1</th>
				<th>전공2</th>
				<th>전공3</th>
				<th>교양1</th>
				<th>교양2</th>
			</tr>
			<%
			rs.next();
			%>
			<tr>
				<th>성적 우수자</th>
				<td><%=rs.getString(1) %>명</td>
				<td><%=rs.getString(2) %>명</td>
				<td><%=rs.getString(3) %>명</td>
				<td><%=rs.getString(4) %>명</td>
				<td><%=rs.getString(5) %>명</td>
			</tr>
			<%rs.next(); %>
			<tr>
				<th>재수강 대상자</th>
				<td><%=rs.getString(1) %>명</td>
				<td><%=rs.getString(2) %>명</td>
				<td><%=rs.getString(3) %>명</td>
				<td><%=rs.getString(4) %>명</td>
				<td><%=rs.getString(5) %>명</td>
			</tr>
		</table>
		</section>
		
		
	
	<%@include file="footer.jsp" %>
</body>
</html>