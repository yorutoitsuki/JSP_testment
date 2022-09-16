<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<script type="text/javascript" src="javaScript.js"></script>
<body>
	<%@include file="header.jsp"%>
	<%
	sql = "select max(studno)+1 from student_tbl ";
	rs = stmt.executeQuery(sql);
	rs.next();
	%>

	<h1>학생등록</h1>
	<form action="insertStudentPro.jsp" name="f" method="post">
		<table>
			<tr>
				<th>학번</th>
				<td><input value="<%=rs.getString(1)%>" readonly="readonly"
					name="studno" size="10">(자동생성)</td>
			</tr>
			<tr>
				<th>학년</th>
				<td><input value="01" readonly="readonly" name="syear"
					size="10">(자동입력)</td>
			</tr>
			<tr>
				<th>학생이름</th>
				<td><input name="sname" maxlength="20" size="20"></td>
			</tr>
			<tr>
				<th>학생주소</th>
				<td><input name="address" maxlength="100" size="25"></td>
			</tr>
			<tr>
				<th>학생성별</th>
				<td><label><input name="gender" type="radio" value="M">남자</label>
					<label><input name="gender" type="radio" value="F">여자</label>
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input name="tel" maxlength="30" size="20"></td>
			</tr>
			<tr>
				<th>주민번호</th>
				<td><input name="idnum" maxlength="14" size="20">(예)000000-0000000</td>
			</tr>
			<tr>
				<th colspan="2">
					<button type="button" onclick="check();">학생등록</button> &nbsp;
					<button type="reset">다시쓰기</button>
				</th>
			</tr>
		</table>
	</form>



	<%@include file="footer.jsp"%>
</body>
</html>




