<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<footer>HRDKOREA Copyright&copy;2019 All reserved</footer>
</body>
<%
	try{
		if(con != null) {
			con.close();
		}
		if(ps != null) {
			ps.close();
		}
		if(sm != null) {
			sm.close();
		}
		if(rs != null) {
			rs.close();
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>
</html>