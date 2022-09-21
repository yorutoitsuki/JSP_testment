<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<%@include file="header.jsp" %>

<% 
	sql  = " select student_no, student_name, student_phone, birth, email, id, pw, nvl(LC, 0) ";
	sql += " from (select student_no, student_name, student_phone, to_char(student_birth, 'yyyy/mm/dd') as birth ,"; 
	sql += " nvl(student_email,'-1') as email , nvl(student_id,'-1') as id , nvl(student_pw,'-1') as pw from student_tbl_01)"; 
	sql += " left outer join (select student_no, count(student_no) as LC from student_tbl_01 join register_tbl_01"; 
	sql += " using (student_no) group by student_no) using (student_no)"; 
	rs = stmt.executeQuery(sql);

%>

	<section>
		<h2>수강생 조회/수정</h2>
		<table class="selectTable">
			<tr>
				<th>수강생번호</th>
				<th>이름</th>
				<th>연락처</th>
				<th>생년월일</th>
				<th>메일주소</th>
				<th>아디</th>
				<th>비밀번호</th>
				<th>수강과목수</th>
			</tr>
			<%
			while(rs.next()){
				%>
				<tr>
					<td><a href="updateStudent.jsp?student_no=<%=rs.getString(1) %>"><%=rs.getString(1) %></a></td>
					<td><%=rs.getString(2) %></td>
					<td><%=rs.getString(3) %></td>
					<td><%=rs.getString(4) %></td>
					<td><%=rs.getString(5).equals("-1")?"":rs.getString(5) %></td>
					<td><%=rs.getString(6).equals("-1")?"":rs.getString(6) %></td>
					<td><%=rs.getString(7).equals("-1")?"":rs.getString(7) %></td>
					<td><%=rs.getString(8) %></td>
				</tr>
				<%
			}
			%>
		</table>
	</section>
<%@include file="footer.jsp" %>
</body>
</html>