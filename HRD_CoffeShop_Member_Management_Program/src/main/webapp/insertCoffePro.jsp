<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="db_conn.jsp" %>
<%
	try {
		sql = "insert into coffe_tbl values(?,?,?)";
		ps = con.prepareStatement(sql);
		ps.setString(1, request.getParameter("pcode"));
		ps.setString(2, request.getParameter("pname"));
		ps.setString(3, request.getParameter("pcost"));
		ps.executeUpdate();
		%>
		<script type="text/javascript">
			alert("커피 등록 성공");
			location.href='selectCoffe.jsp';
		</script>
		<%
	}catch(Exception e) {
		%>
		<script type="text/javascript">
			alert("커피 등록에 실패");
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