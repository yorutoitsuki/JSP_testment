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

	<form action="insertCoffePro.jsp" method="post" name="f">
		<table>
			<tr>
				<th>상품코드</th>
				<td><input type="text" size="20" maxlength="4" name="pcode">4글자내로 입력하세요 ex)A101</td>
			</tr>
			<tr>
				<th>상품명</th>
				<td><input type="text" size="20" maxlength="60" name="pname"></td>
			</tr>
			<tr>
				<th>상품단가</th>
				<td><input type="number" size="20" name="pcost">가격만 입력하시오 ex)6500</td>
			</tr>
		</table>
		<div>
			<button type="button" onclick="insertCoffeCheck();">등록</button>
			<button type="reset" onclick="resetButton();">다시쓰기</button>
		</div>
	</form>

<%@include file="footer.jsp" %>
</body>
</html>