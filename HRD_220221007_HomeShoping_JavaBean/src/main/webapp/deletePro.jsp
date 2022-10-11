<%@page import="member.ShoppingDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%-- <%@include file="db_conn.jsp" %> --%>
<%
request.setCharacterEncoding("UTF-8");
ShoppingDAO dao = new ShoppingDAO();
if(dao.deleteMember(request.getParameter("custno"))){
	%>
	<script type="text/javascript">
		alert("회원삭제가 완료되었습니다");
		location.href = 'select.jsp';
	</script>
	<%
}else {
	%>
	<script type="text/javascript">
		alert("회원삭제가 실패하였습니다");
		history.back();
	</script>
	<%
}
%>



































