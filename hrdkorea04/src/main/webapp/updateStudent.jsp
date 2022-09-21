<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<%@include file="header.jsp" %>
	<%
		String student_no = request.getParameter("student_no");
	
		sql  = " select student_name, nvl(student_addr,'-1'), student_phone, to_char(student_birth,'yyyy/mm/dd'),  ";
		sql += " nvl(student_email,'-1'), nvl(student_id,'-1'), nvl(student_pw,'-1')";
		sql += " from student_tbl_01 where student_no = " + student_no;
		rs = stmt.executeQuery(sql);
		rs.next();
		
		String student_addr =rs.getString(2);
		if(rs.getString(2).equals("-1")){
			student_addr = "";
		}
		
		String student_email = "";
		String email_address = "";
		if(!(rs.getString(5).equals("-1"))){
			String[] temp = rs.getString(5).split("@");
			student_email = temp[0];
			email_address = temp[1];
		}
		String student_id = rs.getString(6);
		if(student_id.equals("-1")) student_id = "";
		String student_pw = rs.getString(7);
		if(student_pw.equals("-1")) student_pw = "";
	%>
	
	<section>
		<h2>수강생 수정</h2>
		<form action="updateStudentPro.jsp?student_no=<%=student_no %>" method="post" name="f">
			<table>
				<tr>
					<th>이름</th>
					<td><input name="student_name" size="20" maxlength="20" value="<%=rs.getString(1)%>"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input name="student_addr" size="40" maxlength="100" value="<%=student_addr%>"></td>
				</tr>
				<tr>
					<th>연락처</th>
					<td><input name="student_phone" size="20" maxlength="14" value="<%=rs.getString(3)%>"></td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td><input name="student_birth" size="20" value="<%=rs.getString(4)%>"></td>
				</tr>
				<tr>
					<th>메일주소</th>
					<td>
						<input name="student_email" size="20" maxlength="50" value="<%=student_email %>">@
						<select name="email_address">
							<option value="">이메일을 고르세요</option>
							<option value="@naver.com" <%if(email_address.equals("naver.com")){%>selected="selected" <%}%>>naver.com</option>
							<option value="@chol.net" <%if(email_address.equals("chol.net")){%>selected="selected" <%}%>>chol.net</option>
							<option value="@gmail.com" <%if(email_address.equals("gmail.com")){%>selected="selected" <%}%>>gmail.com</option>
							<option value="@daum.com" <%if(email_address.equals("daum.com")){%>selected="selected" <%}%>>daum.com</option>
							<option value="@kr.com" <%if(email_address.equals("kr.com")){%>selected="selected" <%}%>>kr.com</option>
							<option value="@jp.com" <%if(email_address.equals("jp.com")){%>selected="selected" <%}%>>jp.com</option>
							<option value="@usa.com" <%if(email_address.equals("usa.com")){%>selected="selected" <%}%>>usa.com</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>아이디</th>
					<td><input name="student_id" size="20" maxlength="12" value="<%=student_id%>"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input name="student_pw" size="20" maxlength=50 value="<%=student_pw%>"></td>
				</tr>
			</table>
			<div>
				<button type="button" onclick="checkInsertStudent()">수정</button>
				<button type="button" onclick="location.href = 'selectStudent.jsp'">조회</button>
			</div>
			
		</form>
	</section>
	<%@include file="footer.jsp" %>
</body>
</html>