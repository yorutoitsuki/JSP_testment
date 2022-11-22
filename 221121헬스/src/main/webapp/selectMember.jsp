<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<%
sql = "select memno, mname, maddress, to_char(joindate,'YYYY.MM.DD') as joindate, ";
sql += " decode(gender,'M','남','F','여') as gender, tel from member_tbl";
sql += " order by memno";
rs = sm.executeQuery(sql);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section>
		<h1>회원목록</h1>
		<table>
			<tr>
				<th>회원번호</th>
				<th>회원이름</th>
				<th>회원주소</th>
				<th>등록일</th>
				<th>성별</th>
				<th>전화번호</th>
			</tr>
		<%
		while(rs.next()){
			%>
			<tr>
				<th><a href="selectTrainer.jsp?memno=<%=rs.getString("memno") %>&mname=<%=rs.getString("mname") %>"><%=rs.getString("memno") %></a></th>
				<th><%=rs.getString("mname") %></th>
				<th><%=rs.getString("maddress") %></th>
				<th><%=rs.getString("joindate") %></th>
				<th><%=rs.getString("gender") %></th>
				<th><%=rs.getString("tel") %></th>
			</tr>
			<%
		}
		%>
		</table>
	</section>
</body>
<%@include file="footer.jsp" %>
</html>