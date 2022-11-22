<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<%
sql = "select to_char(max(memno) + 1) from member_tbl union ";
sql += "select to_char(sysdate,'yy-mm-dd') from dual";
rs = sm.executeQuery(sql);
rs.next();
String number = rs.getString(1);
rs.next();
String date = rs.getString(1);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section>
		<h1>회원등록</h1>
		<form action="insertMemberPro.jsp" method="post" name="f">
			<table>
				<tr>
					<th>회원번호</th>
					<td><input value="<%=number%>" readonly="readonly" name="memno">(자동 생성)</td>
				</tr>
				<tr>
					<th>회원이름</th>
					<td><input type="text" name="mname"></td>
				</tr>
				<tr>
					<th>회원주소</th>
					<td><input type="text" name="maddress"></td>
				</tr>
				<tr>
					<th>등록일</th>
					<td><input value="<%=date%>" name="joindate" readonly="readonly">(자동 생성)</td>
				</tr>
				<tr>
					<th>회원성별</th>
					<td>
						<label><input type="radio" name="gender" value="M">남자</label>
						<label><input type="radio" name="gender" value="F">여자</label>
					</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="tel" value="010-" name="tel">(010-0000-0000)</td>
				</tr>
				<tr>
					<th colspan="2">
						<button type="button" onclick="inputCheck()">회원등록</button>
						<button type="reset">다시쓰기</button>
					</th>
				</tr>
			</table>
		</form>
	</section>
</body>
<script type="text/javascript" src="inputCheck.js"></script>
<%@include file="footer.jsp" %>
</html>