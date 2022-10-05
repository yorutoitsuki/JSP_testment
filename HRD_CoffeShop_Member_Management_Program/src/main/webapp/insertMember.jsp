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
sql = "select max(custno) + 1, to_char(sysdate,'yyyy-MM-dd') from member_tbl";
rs = stmt.executeQuery(sql);
rs.next();
String custno = rs.getString(1);
String joindate = rs.getString(2);
%>

	<form action="insertMemberPro.jsp" method="post" name="f">
		<table>
			<tr>
				<th>회원번호</th>
				<td><input type="text" name = "custno" value="<%=custno%>" readonly="readonly" size="20"></td>
			</tr>
			<tr>
				<th>회원성명</th>
				<td><input type="text" name="custname" size="20" maxlength="20"></td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<label><input type="radio" name="gender" value="F">여</label>
					<label><input type="radio" name="gender" value="M">남</label>
				</td>
			</tr>
			<tr>
				<th>회원전화</th>
				<td><input type="tel" name="phone" size="20" maxlength="13"></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" name="address" size="20" maxlength="60"></td>
			</tr>
			<tr>
				<th>가입일자</th>
				<td><input type="text" name="joindate" value="<%=joindate%>" readonly="readonly"></td>
			</tr>
			<tr>
				<th>고객등급[A:VIP,B:일반,C:직원]</th>
				<td><input type="text" name="grade" size="20" maxlength="1"></td>
			</tr>
			<tr>
				<th>거주도시</th>
				<td><input type="number" name="city" size="20" maxlength="2"> 숫자 두자리 입력 ex)20</td>
			</tr>
		</table>
		<div>
			<button type="button" onclick="insertMemberCheck();">등록</button>
			<button type="reset" onclick="resetButton();">다시쓰기</button>
		</div>
	</form>

<%@include file="footer.jsp" %>
</body>
</html>