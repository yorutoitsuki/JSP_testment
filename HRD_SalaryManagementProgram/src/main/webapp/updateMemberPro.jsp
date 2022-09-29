<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="db_connect.jsp" %>
<%
	try {
		sql  = " update employee_tbl_13 set employee_nam = ?, dept_no = ?, hire_date = ?, employee_status = ?";
		sql += " where employee_no = " + request.getParameter("employee_no");
		ps = con.prepareStatement(sql);
		ps.setString(1, request.getParameter("employee_nam"));
		ps.setString(2, request.getParameter("dept_no"));
		ps.setString(3, request.getParameter("hire_date"));
		ps.setString(4, request.getParameter("employee_status"));
		
		ps.executeUpdate();
		
		%>
		<script type="text/javascript">
			alert("직원수정 완료");
			location.href = 'selectMember.jsp';
		</script>
		<%
	}catch(Exception e) {
		%>
		<script type="text/javascript">
			alert("직원수정 실패");
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



















