<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="db_connect.jsp" %>
<%
	try{
		sql  = "insert into examtbl_3";
		sql += " values(?,?,?,?,?,?)";
		
		ps = con.prepareStatement(sql);
		ps.setString(1, request.getParameter("syear"));
		ps.setString(2, request.getParameter("sclass"));
		ps.setString(3, request.getParameter("sno"));
		ps.setString(4, request.getParameter("kor"));
		ps.setString(5, request.getParameter("eng"));
		ps.setString(6, request.getParameter("math"));
		
		ps.executeUpdate();
		
		%>
			<script type="text/javascript">
				alert("성적등록이 완료되었습니다");
				location.href = "selectStudent.jsp";
			</script>
		<%
	}catch(Exception e){
		%>
		<script type="text/javascript">
			alert("성적등록이 실패하였습니다");
			location.back();
		</script>
	<%
	}finally{
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



























