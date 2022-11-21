<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbcon.jsp" %>
<%
try{
	String userNum = request.getParameter("userNum");
	String userName = request.getParameter("userName");
	String userPw = request.getParameter("userPw");
	String userPart = request.getParameter("userPart");
	String userSort = request.getParameter("userSort");
	String userDate = request.getParameter("userDate");

	sql = "update USER_TBLE_08 set USER_NAME = ?, USER_PW = ?, DEPT_NO = ?, ";
	sql += "USER_GBN = ?, REG_DATE = ? where USER_NO = ?";
	ps = con.prepareStatement(sql);
	
	ps.setString(1, userName);
	ps.setString(2, userPw);
	ps.setString(3, userPart);
	ps.setString(4, userSort);
	ps.setString(5, userDate);
	ps.setString(6, userNum);
	
	int result = 0;
	result = ps.executeUpdate();
	if(result != 0) {
		%>
		<script type="text/javascript">
			alert("수정 성공");
			location.href = "viewUser.jsp";
		</script>
		<%
	}else {
		%>
		<script type="text/javascript">
			alert("수정 실패");
			history.back();
		</script>
		<%
	}
}catch(Exception e) {
	e.printStackTrace();
}finally{
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
	}catch(Exception e2){
		e2.printStackTrace();
	}
}
%>