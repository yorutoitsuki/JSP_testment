<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<%@include file="header.jsp" %>
	
	
	<section>
		<h2>수강생 등록</h2>
		<form action="insertStudentPro.jsp" method="post" name="f">
			<table>
				<tr>
					<th>이름</th>
					<td><input name="student_name" size="20" maxlength="20"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input name="student_addr" size="40" maxlength="100"></td>
				</tr>
				<tr>
					<th>연락처</th>
					<td><input name="student_phone" size="20" maxlength="14"></td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td><input name="student_birth" size="20" ></td>
				</tr>
				<tr>
					<th>메일주소</th>
					<td>
						<input name="student_email" size="20" maxlength="50">@
						<select name="email_address">
							<option value="@naver.com">naver.com</option>
							<option value="@chol.net">chol.net</option>
							<option value="@gamil.com">gamil.com</option>
							<option value="@daum.com">daum.com</option>
							<option value="@kr.com">kr.com</option>
							<option value="@jp.com">jp.com</option>
							<option value="@usa.com">usa.com</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>아이디</th>
					<td><input name="student_id" size="20" maxlength="12"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input name="student_pw" size="20" maxlength=50></td>
				</tr>
			</table>
			<div>
				<button type="button" onclick="checkInsertStudent()">등록</button>
				<button type="button" onclick="location.href = 'selectStudent.jsp'">조회</button>
			</div>
			
		</form>
	</section>
	<%@include file="footer.jsp" %>
</body>
</html>