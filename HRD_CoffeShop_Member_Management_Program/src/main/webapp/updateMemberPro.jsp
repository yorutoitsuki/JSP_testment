<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="db_conn.jsp" %>
<%
	try {
		sql  = " update member_tbl set custname = ?, gender = ?, phone = ?, address = ?, ";
		sql += "joindate = to_date(?,'yyyy-MM-dd'), grade = ?, city = ? where custno = ?";
		ps = con.prepareStatement(sql);
		ps.setString(1, request.getParameter("custname"));
		ps.setString(2, request.getParameter("gender"));
		ps.setString(3, request.getParameter("phone"));
		ps.setString(4, request.getParameter("address"));
		ps.setString(5, request.getParameter("joindate"));
		ps.setString(6, request.getParameter("grade").toUpperCase());
		ps.setString(7, request.getParameter("city"));
		ps.setString(8, request.getParameter("custno"));
		ps.executeUpdate();
		%>
		<script type="text/javascript">
			alert("멤버 수정 성공");
			location.href='selectMember.jsp';
		</script>
		<%
	}catch(Exception e) {
		%>
		<script type="text/javascript">
			alert("멤버 수정 실패");
			history.back();
		</script>
		<%
	}finally {
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