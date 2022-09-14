<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<%@include file="header.jsp"%>
	<%
	sql  = " select syear, sclass, tname, ";
	sql += "		k1, e1,  m1,  k2 , e2 , m2 ";
	sql += " from EXAMTBL_2";
	sql += " join ( 	select sclass, sum(kor) as k1, sum(eng) as e1, sum(math) as m1, ";
	sql += " 		round(avg(kor),1) as k2 ,round(avg(eng),1) as e2 ,round(avg(math),1) as m2";
	sql += " 		from examtbl_3 group by sclass)";
	sql += " using (sclass)";
	rs = stmt.executeQuery(sql);
	%>

	<section>
		<h2>성적조회</h2>
		<table class="selectTable">
			<tr>
				<th>학년</th>
				<th>반</th>
				<th>교사명</th>
				<th>국어총점</th>
				<th>영어총점</th>
				<th>수학총점</th>
				<th>국어평균</th>
				<th>영어평균</th>
				<th>수학평균</th>
			</tr>
			<%
			while (rs.next()) {
				
			%>
			<tr>
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
				<td><%=rs.getString(5)%></td>
				<td><%=rs.getString(6)%></td>
				<td><%=rs.getString(7)%></td>
				<td><%=rs.getString(8)%></td>
				<td><%=rs.getString(9)%></td>
			</tr>
			<%
			}
			%>
		</table>
	</section>


	<%@include file="footer.jsp"%>
</body>
</html>