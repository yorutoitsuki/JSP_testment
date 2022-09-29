<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>급여관리 프로그램</title>
</head>
<body>
	<%@include file="header.jsp"%>
	<%
		sql  = "select max(employee_no)+1 from employee_tbl_13";
		rs = stmt.executeQuery(sql);
		rs.next();
		String employee_no = rs.getString(1);
	%>
	<h1>사원등록</h1>
	<form action="insertMemberPro.jsp" name="f" method="post">
		<table class="insertTable">
			<tr>
				<th>사원번호</th>
				<td><input type="text" size="20" name="employee_no" value="<%=employee_no%>" readonly="readonly"></td>
			</tr>
			<tr>
				<th>사원명</th>
				<td><input type="text" size="20" maxlength="20" name="employee_nam"></td>
			</tr>
			<tr>
				<th>부서번호</th>
				<td><input type="text" size="20" maxlength="2" name="dept_no"></td>
			</tr>
			<tr>
				<th>입사일자</th>
				<td><input type="text" size="20" name="hire_date" maxlength="6">예)201231</td>
			</tr>
			<tr>
				<th>사원상태</th>
				<td><select name="employee_status">
						<option value="1">입사</option>
						<option value="2">퇴사</option>
						<option value="3">휴직</option>
				</select></td>
			</tr>
		</table>
		<div>
			<button type="button" onclick="check();">등록</button>
			<button type="button" onclick="location.href = 'selectMember.jsp'">조회</button>
		</div>
		
	</form>

	<%@include file="footer.jsp"%>
</body>
</html>