<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<%@include file="header.jsp" %>
	
	
	<%
		sql  = " select null ,to_char(sysdate,'yyyy/mm/dd') from dual";
		sql += " union all select student_no, null from student_tbl_01";
		rs = stmt.executeQuery(sql);
		rs.next();
		String DD = rs.getString(2);
		%>
		<script type="text/javascript">
			let studentNumber = [];
			<%
				while(rs.next()){
					%>
					studentNumber.push(<%=rs.getInt(1)%>);
					<%
				}
			%>
			function checkStudent_no(numvalue) {
				for(let i = 0; i < studentNumber.length; i++){
					if(studentNumber[i] == numvalue){
						checker.innerHTML = "확인되었습니다";
						return;
					}
				}
				checker.innerHTML = "존재하지 않는 번호입니다";
			}
		</script>
		<%
	%>
	
	
	<section>
		<h2>수강 신청</h2>
		<form action="insertStudentPro.jsp" method="post" name="f">
			<table class="insertStudentTable">
				<tr>
					<th>수강생번호</th>
					<td><input type="text" name="student_no" size="20" maxlength="20" onchange="checkStudent_no(this.value);"><span id="checker" ></span></td>
				</tr>
				<tr>
					<th>신청과목</th>
					<td>
						<select name="subject_seq">
							<option value="">수강과목</option>
							<option value="C001">자바프로그래밍</option>
							<option value="C002">안드로이드프로그래밍</option>
							<option value="D001">HTML/CSS</option>
							<option value="D002">운영체제</option>
						</select>
					</td>
					
				</tr>
				<tr>
					<th>신청일자</th>
					<td><input name="register_date" size="20" readonly="readonly" value="<%=DD%>"></td>
				</tr>
				<tr>
					<th>수강상태</th>
					<td>
						<select name="register_status">
							<option value="0">신청</option>
							<option value="1">완료</option>
							<option value="2">취소</option>
						</select>
					</td>
				</tr>
			</table>
			<div>
				<button type="button" onclick="checkInsertSubject()">등록</button>
				<button type="button" onclick="location.href = 'insertSubjectPro.jsp'">조회</button>
			</div>
			
		</form>
	</section>
	<%@include file="footer.jsp" %>
</body>
</html>