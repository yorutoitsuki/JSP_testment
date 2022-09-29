<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="db_connect.jsp" %>
<%
	try {
		sql  = "insert into employee_tbl_13 values(?,?,?,to_date(?,'yy/MM/dd'),?)";
		ps = con.prepareStatement(sql);
		ps.setString(1, request.getParameter("employee_no"));
		ps.setString(2, request.getParameter("employee_nam"));
		ps.setString(3, request.getParameter("dept_no"));
		ps.setString(4, request.getParameter("hire_date"));
		ps.setString(5, request.getParameter("employee_status"));
		
		ps.executeUpdate();
		
		%>
		<script type="text/javascript">
			alert("직원등록 완료");
			location.href = 'selectMember.jsp';
		</script>
		<%
	}catch(Exception e) {
		%>
		<script type="text/javascript">
			alert("직원등록 실패");
			history.back();
		</script>
		<%
	}finally {
		if (con != null) {
			con.close();
		}
		if (stmt != null) {
			stmt.close();
		}
		if (ps != null) {
			ps.close();
		}
		if (rs != null) {
			rs.close();
		}
	}
%>



















