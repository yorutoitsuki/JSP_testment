<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<%@include file="header.jsp" %>
	<%
		sql  = " select studno, sname, m_subject1, m_subject2, m_subject3, s_subject1, s_subject2,";
		sql += " 		(m_subject1 + m_subject2 + m_subject3 + s_subject1 + s_subject2),";
		sql += " 		((m_subject1 + m_subject2 + m_subject3 + s_subject1 + s_subject2)/5),";
		sql += "		sum(m_subject1) over(), sum(m_subject2) over(), sum(m_subject3) over(), sum(s_subject1) over(), sum(s_subject2) over(),";
		sql += "		round(avg(m_subject1) over() ,1) , round(avg(m_subject2) over(),1), round(avg(m_subject3) over(),1), round(avg(s_subject1) over(),1), round(avg(s_subject2) over(), 1)";
		sql += " from STUDENT_TBL join score_tbl using(studno)";
		
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
			String mHap1 = "";
			String mHap2 = "";
			String mHap3 = "";
			String sHap1 = "";
			String sHap2 = "";
			
			String mAvg1 = "";
			String mAvg2 = "";
			String mAvg3 = "";
			String sAvg1 = "";
			String sAvg2 = "";
			if(rs.next()){
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
				mHap1 = rs.getString(10);
				mHap2 = rs.getString(11);
				mHap3 = rs.getString(12);
				sHap1 = rs.getString(13);
				sHap2 = rs.getString(14);
				
				mAvg1 = rs.getString(15);
				mAvg2 = rs.getString(16);
				mAvg3 = rs.getString(17);
				sAvg1 = rs.getString(18);
				sAvg2 = rs.getString(19);
			}
			
			
			while(rs.next()){
				
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
			}
			%>
			<tr>
				<th colspan="2">과목 총점</th>
				<td><%=mHap1 %></td>
				<td><%=mHap2 %></td>
				<td><%=mHap3 %></td>
				<td><%=sHap1 %></td>
				<td><%=sHap2 %></td>
				<td colspan="2"></td>
			</tr>
			<tr>
				<th colspan="2">과목 평균</th>
				<td><%=mAvg1 %></td>
				<td><%=mAvg2 %></td>
				<td><%=mAvg3 %></td>
				<td><%=sAvg1 %></td>
				<td><%=sAvg2 %></td>
				<td colspan="2"></td>
			</tr>
		</table>
		</section>
		
		
	
	<%@include file="footer.jsp" %>
</body>
</html>