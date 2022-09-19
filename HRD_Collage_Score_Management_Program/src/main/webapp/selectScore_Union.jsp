<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<%@include file="header.jsp" %>
	<%
		sql  = " select studno, sname, m_subject1, m_subject2, m_subject3, s_subject1, s_subject2, ";
		sql += "		(m_subject1 + m_subject2 + m_subject3 + s_subject1 + s_subject2),";
		sql += "		((m_subject1 + m_subject2 + m_subject3 + s_subject1 + s_subject2)/5)";
		sql += " from STUDENT_TBL join score_tbl using(studno) union all ";
		sql += " select -1, '과목총점', sum(m_subject1), sum(m_subject2), sum(m_subject3), sum(s_subject1), sum(s_subject2), null, null ";
		sql += " from score_tbl union all ";
		sql += " select -1, '과목평균', round(avg(m_subject1),1) , round(avg(m_subject2),1), round(avg(m_subject3),1), round(avg(s_subject1),1), round(avg(s_subject2), 1), null, null ";
		sql += " from score_tbl ";
		
		rs = stmt.executeQuery(sql);
		
		%>
		<h1>성적조회</h1>
		<section>
			<table class="selectTable">
			<tr>
				<th>학번</th>
				<th>이름</th>
				<th>전공1</th>
				<th>전공2</th>
				<th>전공3</th>
				<th>교양1</th>
				<th>굥야2</th>
				<th>학생총점</th>
				<th>학생평균</th>
			</tr>
			<%
			rs.next();
			while(rs.getInt(1) > 0){
			%>
			<tr>
				<td><%=rs.getString(1) %></td>
				<td><%=rs.getString(2) %></td>
				<td><%=rs.getString(3) %></td>
				<td><%=rs.getString(4) %></td>
				<td><%=rs.getString(5) %></td>
				<td><%=rs.getString(6) %></td>
				<td><%=rs.getString(7) %></td>
				<td><%=rs.getString(8) %></td>
				<td><%=rs.getString(9) %></td>
			</tr>
			<%
			rs.next();
			}
			%>
			<tr>
				<th colspan="2">과목 총점</th>
				<td><%=rs.getString(3) %></td>
				<td><%=rs.getString(4) %></td>
				<td><%=rs.getString(5) %></td>
				<td><%=rs.getString(6) %></td>
				<td><%=rs.getString(7) %></td>
				<td colspan="2"></td>
			</tr>
			<%rs.next(); %>
			<tr>
				<th colspan="2">과목 평균</th>
				<td><%=rs.getString(3) %></td>
				<td><%=rs.getString(4) %></td>
				<td><%=rs.getString(5) %></td>
				<td><%=rs.getString(6) %></td>
				<td><%=rs.getString(7) %></td>
				<td colspan="2"></td>
			</tr>
		</table>
		</section>
		
		
	
	<%@include file="footer.jsp" %>
</body>
</html>