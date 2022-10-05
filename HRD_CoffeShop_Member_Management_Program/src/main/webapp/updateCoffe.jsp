<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="header.jsp" %>
<%
sql  = " select * from  coffe_tbl";
sql += " where pcode = " + request.getParameter("pcode");

rs = stmt.executeQuery(sql);
rs.next();
%>
	<h1>커피목록 수정</h1>
	<form action="updateCoffePro.jsp" method="post" name="f">
		<table>
			<tr>
				<th>상품코드</th>
				<td><input type="text" size="20" maxlength="4" name="pcode" value="<%=rs.getString(1)%>">4글자내로 입력하세요 ex)A101</td>
			</tr>
			<tr>
				<th>상품명</th>
				<td><input type="text" size="20" maxlength="60" name="pname" value="<%=rs.getString(2)%>"></td>
			</tr>
			<tr>
				<th>상품단가</th>
				<td><input type="number" size="20" name="pcost" value="<%=rs.getString(3) %>">가격만 입력하시오 ex)6500</td>
			</tr>
		</table>
		<div>
			<button type="button" onclick="insertCoffeCheck();">수정</button>
			<button type="button" onclick="deleteCoffe();">삭제</button>
			<input id="indicator" type="hidden" value="" name="indicator">
		</div>
	</form>

<%@include file="footer.jsp" %>
</body>
</html>