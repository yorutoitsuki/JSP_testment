<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="header.jsp"%>
	<%
		sql = "select max(USER_NO) + 1 from USER_TBLE_08";
		rs = stmt.executeQuery(sql);
		int user_no = 0;
		if(rs.next()){
			user_no = rs.getInt(1);
		}
	%>
	<section>
		<h1>수강생 등록</h1>
		<form action="insertMemberPro.jsp" method="post" name="f">
			<table>
				<tr>
					<th>사용자번호</th>
					<td><input type="text" name="userNum" readonly="readonly" value="<%=user_no%>"></td>
				</tr>
				<tr>
					<th>사용자명</th>
					<td><input type="text" name="userName"></td>
				</tr>
				<tr>
					<th>암호</th>
					<td><input type="password" name="userPw"></td>
				</tr>
				<tr>
					<th>암호확인</th>
					<td><input type="password" name="userPwCheck"></td>
				</tr>
				<tr>
					<th>소속부서번호</th>
					<td><input type="text" name="userPart"></td>
				</tr>
				<tr>
					<th>사용자구분</th>
					<td><input type="text" name="userSort"></td>
				</tr>
				<tr>
					<th>등록일자</th>
					<td><input type="date" name="userDate"></td>
				</tr>
			</table>
			<button type="button" onclick="inputCheck()">등록</button>&nbsp;<button type="button" onclick="goToView()">조회</button>
		</form>
	</section>
	<script type="text/javascript" src="inputCheck.js"></script>
	<%@include file="footer.jsp"%>
</body>
</html>