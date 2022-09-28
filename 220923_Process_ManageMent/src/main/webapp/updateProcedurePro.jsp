<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbcon.jsp" %>
<%
		
		try {
			sql = "select w_workno from tbl_process where w_workno = " + request.getParameter("w_workno");
			rs = stmt.executeQuery(sql);
			if(rs.next()){
				sql  ="";
				sql  = " update tbl_process set p_p1 = ?, p_p2 = ?, p_p3 = ?, p_p4 = ?, ";
				sql += " p_p5 = ?, p_p6 = ?, w_lastdate = ?, w_lasttime = ? ";
				sql += " where w_workno = ?";
				ps = con.prepareStatement(sql);
				
				ps.setString(1, request.getParameter("p_p1"));
				ps.setString(2, request.getParameter("p_p2"));
				ps.setString(3, request.getParameter("p_p3"));
				ps.setString(4, request.getParameter("p_p4"));
				ps.setString(5, request.getParameter("p_p5"));
				ps.setString(6, request.getParameter("p_p6"));
				ps.setString(7, request.getParameter("w_lastdate"));
				ps.setString(8, request.getParameter("w_lasttime"));
				ps.setString(8, request.getParameter("w_workno"));
				
				
				
				ps.executeUpdate();
				
				%>
				<script type="text/javascript">
					alert("공정상태가 정상적으로 수정 되었습니다!");
					history.back();
				</script>
				<%
			}else {
				%>
				<script type="text/javascript">
					alert("등록되어 있지 않는 작업공정!");
					history.back();
				</script>
				<%
			}
			
		}catch(Exception e) {
			%>
			<script type="text/javascript">
				alert("작업공정 수정실패");
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
		
		try{
			if(con != null) {
				con.close();
			}
			if(stmt != null) {
				stmt.close();
			}
			if(ps != null){
				ps.close();
			}
			if(rs != null) {
				rs.close();
			}
		}catch(Exception e) {
			
		}

	
%>
			














