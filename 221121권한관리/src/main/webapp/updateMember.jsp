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
		String userNum = request.getParameter("user_no");
		sql = "select USER_NO, USER_NAME, USER_PW, DEPT_NO, USER_GBN, ";
		sql += " to_char(REG_DATE, 'YYYY-MM-DD') as REG_DATE from USER_TBLE_08";
		sql += " where USER_NO = ?";
		ps = con.prepareStatement(sql);
		ps.setString(1, userNum);
		rs = ps.executeQuery();
		rs.next();
	%>
	<section>
		<h1>수강생 등록</h1>
		<form action="updateMemberPro.jsp" method="post" name="f">
			<table>
				<tr>
					<th>사용자번호</th>
					<td><input type="text" name="userNum" readonly="readonly" value="<%=userNum%>"></td>
				</tr>
				<tr>
					<th>사용자명</th>
					<td><input type="text" name="userName" value="<%=rs.getString("USER_NAME")%>"></td>
				</tr>
				<tr>
					<th>암호</th>
					<td><input type="password" name="userPw" value="<%=rs.getString("USER_PW")%>"></td>
				</tr>
				<tr>
					<th>암호확인</th>
					<td><input type="password" name="userPwCheck" value="<%=rs.getString("USER_PW")%>"></td>
				</tr>
				<tr>
					<th>소속부서번호</th>
					<td><input type="text" name="userPart" <%if(rs.getString("DEPT_NO") != null){%>value="<%=rs.getString("DEPT_NO")%>"<%} %> ></td>
				</tr>
				<tr>
					<th>사용자구분</th>
					<td><input type="text" name="userSort" value="<%=rs.getString("USER_GBN")%>"></td>
				</tr>
				<tr>
					<th>등록일자</th>
					<td><input type="date" name="userDate" value="<%=rs.getString("REG_DATE")%>"></td>
				</tr>
			</table>
			<button type="button" onclick="inputCheck()">등록</button>&nbsp;<button type="button" onclick="goToView()">조회</button>
		</form>
	</section>
	<script type="text/javascript" src="inputCheck.js"></script>
	<%@include file="footer.jsp"%>
</body>
</html>