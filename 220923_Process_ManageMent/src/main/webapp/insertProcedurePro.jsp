<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbcon.jsp" %>
<%
	try {
		sql  = "insert into tbl_process values(?,?,?,?,?,?,?,?,?)";
		ps = con.prepareStatement(sql);
		ps.setString(1, request.getParameter("w_workno"));
		ps.setString(2, request.getParameter("p_p1"));
		ps.setString(3, request.getParameter("p_p2"));
		ps.setString(4, request.getParameter("p_p3"));
		ps.setString(5, request.getParameter("p_p4"));
		ps.setString(6, request.getParameter("p_p5"));
		ps.setString(7, request.getParameter("p_p6"));
		ps.setString(8, request.getParameter("w_lastdate"));
		ps.setString(9, request.getParameter("w_lasttime"));
		
		ps.executeUpdate();
		
		%>
		<script type="text/javascript">
			alert("공정상태가 정상적으로 등록 되었습니다!");
			history.back();
		</script>
		<%
	}catch(Exception e) {
		%>
		<script type="text/javascript">
			alert("작업공정 등록실패");
			history.back();
		</script>
		<%
	} finally {
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















