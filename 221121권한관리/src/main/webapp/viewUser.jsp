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
	sql  = " select user_no, user_name,";
	sql += " case when DEPT_NO ='A01' then '인사'";
	sql += " 	  when DEPT_NO ='A02' then '개발'";
	sql += "  	  when DEPT_NO ='B01' then '총무'";
	sql += " 	  when DEPT_NO ='B02' then '회계'";
	sql += " 	  else ' ' end as DEPT_NO, ";
	sql += " USER_GBN, to_char(REG_DATE,'YYYY/MM/DD') as REG_DATE";
	sql += " from USER_TBLE_08";
	sql += " order by user_no asc";
	rs = stmt.executeQuery(sql);
	%>
	<section>
		<h1>사용자 조회/수정</h1>
		<table class="viewTable">
			<tr>
				<th>사용자번호</th>
				<th>사용자명</th>
				<th>소속부서번호</th>
				<th>사용자구분</th>
				<th>등록일자</th>
			</tr>
		<%
		while(rs.next()) {
			%>
			<tr>
				<td class="alcenter"><a href="updateMember.jsp?user_no=<%=rs.getString("user_no") %>"><%=rs.getString("user_no") %></a></td>
				<td><%=rs.getString("user_name") %></td>
				<td class="alcenter"><%=rs.getString("DEPT_NO") %> </td>
				<td class="alcenter"><%=rs.getString("USER_GBN") %></td>
				<td class="alcenter"><%=rs.getString("REG_DATE") %></td>
			</tr>
			<%
		}
		%>
		</table>
		
	</section>
	<%@include file="footer.jsp" %>
</body>
</html>