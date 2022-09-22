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
		sql  = "insert into student_tbl_01 values(?,?,?,?,to_date(?,'yyyy/mm/dd'),?,?,?)";
		ps = con.prepareStatement(sql);
		ps.setInt(1, student_no);
		ps.setString(2, request.getParameter("student_name"));
		ps.setString(3, request.getParameter("student_addr"));
		ps.setString(4, request.getParameter("student_phone"));
		ps.setString(5, request.getParameter("student_birth"));
		if(request.getParameter("student_email").equals("")){
			ps.setString(6, request.getParameter("student_email"));
		}
		else {
			ps.setString(6, (request.getParameter("student_email") + request.getParameter("email_address")));
		}
		ps.setString(7, request.getParameter("student_id"));
		ps.setString(8, request.getParameter("student_pw"));
		
		ps.executeUpdate();
		
		%>
			<script>
				alert("학생등록 성공");
				history.back();
			</script>
		<%	
	}catch(Exception e) {
		%>
		<script type="text/javascript">
			alert("학생등록 실패");
			history.back();
		</script>
		<%
	}
	finally {
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
		}
		catch(Exception e){
			
		}

	}
	
%>


















