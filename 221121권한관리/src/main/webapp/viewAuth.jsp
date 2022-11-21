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
	sql =  " select user_no, user_name, menu_no, case menu_no  ";
	sql += " when 10 then '부서관리' when 11 then '사원관리' ";
	sql += " when 12 then '기초정보관리' when 13 then '급여계산' ";
	sql += " end as menu_name from (";
	sql += " 	select USER_NO, USER_NAME, menu_no";
	sql += " 	from USER_TBLE_08 a cross join dept_auth_tbl_08 b";
	sql += " 	where a.DEPT_NO = b.DEPT_NO";
	sql += " 	union all";
	sql += " 	select c.USER_NO, USER_NAME,menu_no";
	sql += " 	from USER_TBLE_08 c cross join usert_auth_tbl_08 d";
	sql += " 	where c.USER_NO = d.USER_NO";
	sql += " 	order by user_no, menu_no )";
	rs = stmt.executeQuery(sql);
	String userNum = "";
	%>
	<section>
		<h1>권한조회</h1>
		<table>
			<tr>
				<th>사용자번호</th>
				<th>사용자명</th>
				<th>메뉴번호</th>
				<th>메뉴명</th>
			</tr>
		<%
		while(rs.next()) {
			%>
			<tr>
				<td><%if(!userNum.equals(rs.getString("user_no"))){userNum = rs.getString("user_no"); out.print(rs.getString("user_no"));} %></td>
				<td><%=rs.getString("user_name") %></td>
				<td><%=rs.getString("menu_no") %></td>
				<td><%=rs.getString("menu_name") %></td>
			</tr>				
			<%
		}
		%>
		</table>
	</section>
	<%@include file="footer.jsp" %>
</body>
</html>