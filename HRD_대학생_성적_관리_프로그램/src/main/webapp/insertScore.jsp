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

	<h1>학생등록</h1>
	<form action="insertScorePro.jsp" name="f" method="post">
		<table>
			<tr>
				<th>학번</th>
				<td><input name="studno" size="10"></td>
			</tr>
			<tr>
				<th>학년</th>
				<td><input value="01" name="syear"size="10"></td>
			</tr>
			<tr>
				<th>전공1</th>
				<td><input name="m_subject1" maxlength="3" size="15"></td>
			</tr>
			<tr>
				<th>전공2</th>
				<td><input name="m_subject2" maxlength="3" size="15"></td>
			</tr>
			<tr>
				<th>전공3</th>
				<td><input name="m_subject3" maxlength="3" size="15"></td>
			</tr>
			<tr>
				<th>교양1</th>
				<td><input name="s_subject1" maxlength="3" size="15"></td>
			</tr>
			<tr>
				<th>교양2</th>
				<td><input name="s_subject2" maxlength="3" size="15"></td>
			</tr>
			<tr>
				<th colspan="2">
					<button type="button" onclick="checkScore();">성적등록</button> &nbsp;
					<button type="button" onclick="location.href = 'selectScore.jsp'">조회</button>
				</th>
			</tr>
		</table>
	</form>



	<%@include file="footer.jsp"%>
</body>
</html>




