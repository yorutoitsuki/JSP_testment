<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="header.jsp" %>
<%
sql = "select player_no, player_name, team_no, player_phone,back_no, ";
sql += "to_char(player_birth,'MM/DD') as player_birth, ";
sql += "nvl(player_email,' ') as player_email ";
sql += "from player_tbl order by back_no asc";
rs = sm.executeQuery(sql);
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section>
		<h1>선수 정보 조회/수정</h1>
		<table>
			<tr>
				<th>선수번호</th>
				<th>이름</th>
				<th>소속팀번호</th>
				<th>연락처</th>
				<th>등번호</th>
				<th>생일</th>
				<th>메일주소</th>
			</tr>
		<%
		while(rs.next()){
			%>
			<tr>
				<th><%=rs.getString("player_no") %></th>
				<th><a href="updateMember.jsp?player_no=<%=rs.getString("player_no") %>"><%=rs.getString("player_name") %></a></th>
				<th><%=rs.getString("team_no") %></th>
				<th><%=rs.getString("player_phone") %></th>
				<th><%=rs.getString("back_no") %></th>
				<th><%=rs.getString("player_birth") %></th>
				<th><%=rs.getString("player_email") %></th>
			</tr>
			<%
		}
		%>
		</table>
	</section>
</body>
<%@include file="footer.jsp" %>
</html>