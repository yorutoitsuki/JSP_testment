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
sql  = " select custno, custname, decode(gender,'F','여자','M','남자'), phone, address,  ";
sql += " to_char(joindate,'yyyy-MM-dd'), decode(grade,'A','VIP','B','일반','C','직원'), city  ";
sql += " from member_tbl ";
rs = stmt.executeQuery(sql);
%>
<h2>회원목록 조회/수정</h2>
<table class="selectTable">
	<tr>
		<th>회원번호</th>
		<th>회원성명</th>
		<th>성별</th>
		<th>회원전화</th>
		<th>주소</th>
		<th>가입일자</th>
		<th>고객등급</th>
		<th>거주도시</th>
	</tr>
	<%

	while(rs.next()){
	%>
	<tr>
		<td><a href="updateMember.jsp?custno='<%=rs.getString(1)%>'"><%=rs.getString(1) %></a></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
		<td><%=rs.getString(4) %></td>
		<td><%=rs.getString(5) %></td>
		<td><%=rs.getString(6) %></td>
		<td><%=rs.getString(7) %></td>
		<td><%=rs.getString(8) %></td>
	</tr>
	<%
	}
	%>
</table>


<%@include file="footer.jsp" %>
</body>
</html>