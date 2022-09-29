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
		String employee_no = request.getParameter("employee_no");
		sql  = " select employee_nam, dept_no, to_char(hire_date,'yyyy-MM-dd'), employee_status ";
		sql += " from employee_tbl_13 where employee_no = " + employee_no;
		rs = stmt.executeQuery(sql);
		rs.next();
		String status = rs.getString(4);
		
	%>
	<h1>사원수정</h1>
	<form action="updateMemberPro.jsp" name="f" method="post">
		<table class="insertTable">
			<tr>
				<th>사원번호</th>
				<td><input type="text" size="20" name="employee_no" value="<%=employee_no%>" readonly="readonly"></td>
			</tr>
			<tr>
				<th>사원명</th>
				<td><input type="text" size="20" maxlength="20" value="<%=rs.getString(1) %>" name="employee_nam"></td>
			</tr>
			<tr>
				<th>부서번호</th>
				<td><input type="text" size="20" maxlength="2" name="dept_no" value="<%=rs.getString(2)%>"></td>
			</tr>
			<tr>
				<th>입사일자</th>
				<td><input type="text" size="20" name="hire_date" maxlength="10" value="<%=rs.getString(3)%>">예)201231</td>
			</tr>
			<tr>
				<th>사원상태</th>
				<td><select name="employee_status">
						<option value="1" <%if(status.equals("1")) {%>selected="selected"<%}%> >입사</option>
						<option value="2" <%if(status.equals("2")) {%>selected="selected"<%}%> >퇴사</option>
						<option value="3" <%if(status.equals("3")) {%>selected="selected"<%}%> >휴직</option>
				</select></td>
			</tr>
		</table>
		<div>
			<button type="button" onclick="check();">수정</button>
			<button type="button" onclick="location.href = 'selectMember.jsp'">조회</button>
		</div>
		
	</form>

	<%@include file="footer.jsp"%>
</body>
</html>