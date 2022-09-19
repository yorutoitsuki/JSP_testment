<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="header.jsp" %>
<%
	try{
		sql  = "insert into score_tbl values(?,?,?,?,?,?,?)";
		ps = con.prepareStatement(sql);
		ps.setString(1, request.getParameter("studno"));
		ps.setString(2, request.getParameter("syear"));
		ps.setString(3, request.getParameter("m_subject1"));
		ps.setString(4, request.getParameter("m_subject2"));
		ps.setString(5, request.getParameter("m_subject3"));
		ps.setString(6, request.getParameter("s_subject1"));
		ps.setString(7, request.getParameter("s_subject2"));
		
		ps.executeUpdate();
		%>
			<script type="text/javascript">
				alert("성적등록 성공");
				location.href = 'selectScore.jsp';
			</script>
		<%
	}catch(Exception e) {
		%>
			<script type="text/javascript">
				alert("성적등록 실패");
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