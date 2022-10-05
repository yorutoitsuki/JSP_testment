<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="db_conn.jsp" %>
<%
	try {
		if(request.getParameter("indicator").equals("delete")){
			sql  = "delete from coffe_tbl_update where pcode = ";
			sql += "'"+request.getParameter("pcode")+"'";
			stmt.executeQuery(sql);
			%>
			<script type="text/javascript">
				alert("커피 목록 삭제 성공");
				location.href='selectCoffe.jsp';
			</script>
			<%
		}else{
			sql  = "select pcode from coffe_tbl_update where pcode = '"+request.getParameter("pcode")+"'";
			rs = stmt.executeQuery(sql);
			if(rs.next()){
				sql  = " update coffe_tbl_update set pname = ?, pcost = ? where pcode = '?'";
				ps = con.prepareStatement(sql);
				ps.setString(1, request.getParameter("pname"));
				ps.setString(2, request.getParameter("pcost"));
				ps.setString(3, request.getParameter("pcode"));
				ps.executeUpdate();
				%>
				<script type="text/javascript">
					alert("커피 목록 수정 성공");
					location.href='selectCoffe.jsp';
				</script>
				<%
			}
			else {
				sql  = "insert into coffe_tbl_update values(?,?,?)";
				ps = con.prepareStatement(sql);
				ps.setString(1, request.getParameter("pcode"));
				ps.setString(2, request.getParameter("pname"));
				ps.setString(3, request.getParameter("pcost"));
				ps.executeUpdate();
				%>
				<script type="text/javascript">
					alert("커피 수정 목록에 추가 성공");
					location.href='selectCoffe.jsp';
				</script>
				<%
			}
		}
	}catch(Exception e) {
		%>
		<script type="text/javascript">
			alert("커피 목록 수정 실패");
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