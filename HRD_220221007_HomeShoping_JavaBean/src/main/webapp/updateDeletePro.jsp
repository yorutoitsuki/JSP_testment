<%@page import="member.ShoppingDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%-- <%@include file="db_conn.jsp" %> --%>
<%
	request.setCharacterEncoding("UTF-8");
	String button = request.getParameter("selecter");
	ShoppingDAO dao = new ShoppingDAO();
	if(request.getParameter("selecter") == null){
		//input hidden 이 제대로 동작하는지 확인하러 만든것, 무시하면 됩니다.
		%>
			<script>
				alert("에러!");
				history.back();
			</script>
		<%
	}
	else if (button.equals("delete")){
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
	}
	else if(button.equals("update")){
		%>
		<jsp:useBean id="beans" class="member.MemberBeans"></jsp:useBean>
		<jsp:setProperty property="*" name="beans"/>
		<%
		if(dao.updateMember(beans)){
			%>
			<script type="text/javascript">
				alert("회원수정이 완료되었습니다");
				location.href = 'select.jsp';
			</script>
			<%
		}else {
			%>
			<script type="text/javascript">
				alert("회원수정이 실패하였습니다");
				history.back();
			</script>
			<%
		}
	}


%>



































