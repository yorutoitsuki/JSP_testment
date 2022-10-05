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
sql  = " select custno, custname, gender, phone, address,  ";
sql += " to_char(joindate,'yyyy-MM-dd'), grade, city  ";
sql += " from member_tbl where custno = " + request.getParameter("custno");

rs = stmt.executeQuery(sql);
rs.next();
%>
	<h1>회원 수정</h1>
	<form action="updateMemberPro.jsp" method="post" name="f">
		<table>
			<tr>
				<th>회원번호</th>
				<td><input type="text" name = "custno" value="<%=rs.getString(1)%>" readonly="readonly" size="20"></td>
			</tr>
			<tr>
				<th>회원성명</th>
				<td><input type="text" name="custname" size="20" maxlength="20" value="<%=rs.getString(2)%>"></td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<label><input type="radio" name="gender" value="F" <%if(rs.getString(3).equals("F")){%> checked="checked" <%} %>>여</label>
					<label><input type="radio" name="gender" value="M" <%if(rs.getString(3).equals("M")){%> checked="checked" <%} %>>남</label>
				</td>
			</tr>
			<tr>
				<th>회원전화</th>
				<td><input type="tel" name="phone" size="20" maxlength="13" value="<%=rs.getString(4)%>"></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" name="address" size="20" maxlength="60" value="<%=rs.getString(5)%>"></td>
			</tr>
			<tr>
				<th>가입일자</th>
				<td><input type="text" name="joindate" value="<%=rs.getString(6)%>" readonly="readonly"></td>
			</tr>
			<tr>
				<th>고객등급[A:VIP,B:일반,C:직원]</th>
				<td><input type="text" name="grade" size="20" maxlength="1" value="<%=rs.getString(7)%>"></td>
			</tr>
			<tr>
				<th>거주도시</th>
				<td><input type="number" name="city" size="20" maxlength="2" value="<%=rs.getString(8)%>"> 숫자 두자리 입력 ex)20</td>
			</tr>
		</table>
		<div>
			<button type="button" onclick="insertMemberCheck();">수정</button>
			<button type="button" onclick="location.href = 'selectMember.jsp'">조회</button>
		</div>
	</form>

<%@include file="footer.jsp" %>
</body>
</html>