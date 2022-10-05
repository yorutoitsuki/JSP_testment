<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<footer>
		<h1>HRD KOREA</h1>
	</footer>
</body>
<script type="text/javascript" src="javaScript.js">

</script>
</html>


<%
	try{
		if(con != null) {
			con.close();
		}
		if(stmt != null) {
			stmt.close();
		}
		if(ps != null) {
			ps.close();
		}
		if(rs != null) {
			rs.close();
		}
	}catch(Exception e) {
		
	}
%>