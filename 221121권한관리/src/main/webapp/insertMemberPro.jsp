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

	sql = "insert into USER_TBLE_08 values(?,?,?,?,?,to_date(?,'yyyy-mm-dd'))";
	ps = con.prepareStatement(sql);
	ps.setString(1, userNum);
	ps.setString(2, userName);
	ps.setString(3, userPw);
	ps.setString(4, userPart);
	ps.setString(5, userSort);
	ps.setString(6, userDate);
	int result = 0;
	result = ps.executeUpdate();
	if(result != 0) {
		%>
		<script type="text/javascript">
			alert("등록 성공");
			location.href = "viewUser.jsp";
		</script>
		<%
	}else {
		%>
		<script type="text/javascript">
			alert("등록 실패");
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