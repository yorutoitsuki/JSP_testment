<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="db_connect.jsp" %>

<%
	sql  = "select max(register_seq) + 1 from register_tbl_01";
	rs = stmt.executeQuery(sql);
	rs.next();
	String register_seq = rs.getString(1);
%>
<%
	try{
		sql  = "insert into register_tbl_01 values(?,?,?,?,?)";
		ps = con.prepareStatement(sql);
		ps.setString(1, register_seq);
		ps.setString(2, request.getParameter("student_no"));
		ps.setString(3, request.getParameter("subject_seq"));
		ps.setString(4, request.getParameter("register_date"));
		ps.setString(5, request.getParameter("register_status"));
		ps.executeUpdate();
		
		%>
			<script>
				alert("수강신청 성공");
				history.back();
			</script>
		<%	
	}catch(Exception e) {
		%>
		<script type="text/javascript">
			alert("수강신청 실패");
			history.back();
		</script>
		<%
	}
	finally {
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
	}
	
%>


















