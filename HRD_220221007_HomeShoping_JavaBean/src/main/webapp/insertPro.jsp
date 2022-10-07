<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="member.*" %>

<!-- 순서 중요 (1.UTF-8로 인코딩 후, 2.속성에 값 저장) -->
<%
request.setCharacterEncoding("UTF-8");

%>
<jsp:useBean id="beans" class="member.MemberBeans" scope="page"></jsp:useBean>
<jsp:setProperty name="beans" property="*"/>
<!-- parameter로 넘어오는 값과 beans의 멤버변수와 같으면 알아서
멤버변수를 찾아가서 값을 저장함,(set 매서드 호출함) 변수명을 같게 하라고 한 이유 -->

<%
ShoppingDAO dao = new ShoppingDAO();
if(dao.insertMember(beans)) {
	
}
%>


































