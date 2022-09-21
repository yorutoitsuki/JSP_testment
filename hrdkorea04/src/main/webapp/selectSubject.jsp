<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<%@include file="header.jsp" %>

<% 
	sql  = " select -1, count(to_char(register_date,'yyyy/mm')), ";
	sql += " to_char(register_date,'yyyy/mm'), null, null, null from register_tbl_01";
	sql += " group by to_char(register_date,'yyyy/mm') union all select * from (";
	sql += " select register_seq, student_no, student_name, subject_name, register_date,";
	sql += " (case when register_status = '0' then '신청' ";
	sql += " 	  when register_status = '1' then '완료'";
	sql += " 	  when register_status = '2' then '취소'";
	sql += " 	  else '-1' end) from student_tbl_01 join";
	sql += " 	(select register_seq, student_no, subject_name, register_date, register_status";
	sql += " from subject_tbl_01 sub join register_tbl_01 reg";
	sql += " using(subject_seq)) using(student_no) order by register_seq desc)";
	
	Statement stmt2 = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
	rs = stmt2.executeQuery(sql);
	
%>

	<section>
		<h2>■월별신청현황</h2>
		<table class="selectMonthTable">
			<tr>
				<th>신청년월</th>
				<th>수강인원</th>
			</tr>
			<%
			while(rs.next()){
				if(rs.getString(1).equals("-1")){
					%>
					<tr>
						<th><%=rs.getString(3) %></th>
						<td><%=rs.getString(2) %></td>
					</tr>
					<%
				}
				else{
					rs.previous();
					break;
				}
			}
			%>
		</table>
		<h2>■수강신청정보조회</h2>
		<table>
			<tr>
				<th>수강신청번호</th>
				<th>수강생</th>
				<th>과목명</th>
				<th>신청일자</th>
				<th>이수여부</th>
			</tr>
			<%
			while(rs.next()){
				%>
				<tr>
					<th><%=rs.getString(1) %></th>
					<th>(<%=rs.getString(2) %>)<%=rs.getString(3) %></th>
					<th><%=rs.getString(4) %></th>
					<th><%=rs.getString(5) %></th>
					<th><%=rs.getString(6) %></th>
				</tr>
				<%
			}
			%>
		</table>
	</section>
<%@include file="footer.jsp" %>
</body>
</html>