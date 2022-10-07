<%@page import="member.MemberBeans"%>
<%@page import="member.ShoppingDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<script type="text/javascript" src = "javaScript.js"></script>
<body>
	<%@include file="header.jsp"%>
	<%
	ShoppingDAO dao = new ShoppingDAO();
	MemberBeans beans = dao.getMember(request.getParameter("custno"));
	%>

	<section>
		<div>
			<h2>홈쇼핑 회원 수정</h2>
		</div>
		<form action="updateDeletePro.jsp" name="f" method="post">
			<table>
				<tr>
					<th>회원번호</th>
					<td><input type="text" value="<%=beans.getCustno() %>" name="custno" size="6" readonly="readonly"></td>
				</tr>
				<tr>
					<th>회원성명</th>
					<td><input type="text" value="<%=beans.getCustname() %>" name="custname" size="20"></td>
				</tr>
				<tr>
					<th>회원전화</th>
					<td><input type="text" value="<%=beans.getPhone() %>" name="phone" size="13"></td>
				</tr>
				<tr>
					<th>회원주소</th>
					<td><input type="text" value="<%=beans.getAddress() %>" name="address" size="60"></td>
				</tr>
				<tr>
					<th>가입일자</th>
					<td><input type="text" value="<%=beans.getJoindate() %>" name="joindate" size="10" readonly="readonly"></td>
				</tr>
				<tr>
					<th>고객등급[A:LVIP,B:일반,C:직원]</th>
					<td><input type="text" value="<%=beans.getGrade() %>" name="grade" size="1"></td>
				</tr>
				<tr>
					<th>도시코드</th>
					<td><input type="text" value="<%=beans.getCity() %>" name="city" size="2"></td>
				</tr>
				<tr>
					<td colspan="2" class="buttonTd">
						<button type="button" onclick="checkUpdate();">수정</button>
						&nbsp;
						<button type="button" onclick="location.href='select.jsp'">조회</button>
						&nbsp;
						<button type="button" onclick="goDelete(this.form);" >삭제</button>
						&nbsp;
						<button type="button" name="btn" id="update" onclick="checkSelecter(this.id);">수정2</button>
						&nbsp;
						<button type="button" name="btn" id="delete" onclick="checkSelecter(this.id);">삭제2</button>
						<input type="hidden" name = "selecter" value="">
					</td>
				</tr>
				
			</table>
		</form>
	</section>
	<%@include file="footer.jsp"%>
</body>
</html>