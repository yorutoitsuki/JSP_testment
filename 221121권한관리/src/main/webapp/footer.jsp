<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<footer>
		HRDKOREA &copy;
	</footer>
</body>
<%
	try{
		if(con != null) {
			con.close();
		}
		if(rs != null) {
			rs.close();
		}
		if(ps != null) {
			ps.close();
		}
		if(stmt != null) {
			stmt.close();
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>
</html>
