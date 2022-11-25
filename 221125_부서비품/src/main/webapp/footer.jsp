<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<footer>HRDKOREA Copyright&copy; 2021 All rights reserved. HUMAN resources Development Service of korea</footer>
</body>
<%
try {
	if(con != null) {
		con.close();
	}
	if(sm != null) {
		sm.close();
	}
	if(ps != null) {
		ps.close();
	}
	if(rs != null) {
		rs.close();
	}
}catch(Exception e2) {
	e2.printStackTrace();
}

%>
</html>