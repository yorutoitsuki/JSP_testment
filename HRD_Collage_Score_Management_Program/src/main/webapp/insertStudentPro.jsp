
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="header.jsp" %>
<%
	try{
		sql  = "insert into student_tbl values(?,?,?,?,?,?,?)";
		ps = con.prepareStatement(sql);
		ps.setString(1, request.getParameter("studno"));
		ps.setString(2, request.getParameter("syear"));
		ps.setString(3, request.getParameter("sname"));
		ps.setString(4, request.getParameter("address"));
		ps.setString(5, request.getParameter("gender"));
		ps.setString(6, request.getParameter("tel"));
		ps.setString(7, request.getParameter("idnum"));
		
		ps.executeUpdate();
		%>
			<script type="text/javascript">
				alert("학생등록 성공");
				location.href = 'insertStudent.jsp';
			</script>
		<%
	}catch(Exception e) {
		%>
			<script type="text/javascript">
				alert("학생등록 실패");
				loaction.back();
			</script>
		<%
	}finally{
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
	}
	
	
	
	
%>


