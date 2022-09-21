<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="db_connect.jsp" %>

<%
	sql  = "select max(student_no) + 1 from student_tbl_01";
	rs = stmt.executeQuery(sql);
	rs.next();
	int student_no = rs.getInt(1);
%>
<%
	try{
		sql  = " update student_tbl_01 set student_name = ?, student_addr = ?, student_phone = ?,";
		sql += " student_birth = to_date(?,'yyyy/mm/dd'), student_email = ?, student_id = ?, student_pw = ?";
		sql += " where student_no = " + request.getParameter("student_no");
		ps = con.prepareStatement(sql);
		ps.setString(1, request.getParameter("student_name"));
		ps.setString(2, request.getParameter("student_addr"));
		ps.setString(3, request.getParameter("student_phone"));
		ps.setString(4, request.getParameter("student_birth"));
		if(request.getParameter("student_email").equals("")){
			ps.setString(5, "");
		}
		else{
			ps.setString(5, (request.getParameter("student_email")+request.getParameter("email_address")));
		}
		ps.setString(6, request.getParameter("student_id"));
		ps.setString(7, request.getParameter("student_pw"));
		
		ps.executeUpdate();
		
		%>
			<script>
				alert("학생수정 성공");
				location.href = 'selectStudent.jsp';
			</script>
		<%	
	}catch(Exception e) {
		%>
		<script type="text/javascript">
			alert("학생수정 실패");
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


















