<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<script type="text/javascript" src="checkScript.js" ></script>
<body>
	<%@include file="header.jsp" %>
	<section>
		<h2>성적등록</h2>
		<form action="insertScorePro.jsp" method="post" name="f">
			<table>
			<tr>
				<th>학년</th>
				<td><input type="text" maxlength="1" size="1" name="syear">(예)1</td>
			</tr>
			<tr>
				<th>반</th>
				<td><input type="text" maxlength="2" size="2" name="sclass">(예)01</td>
			</tr>
			<tr>
				<th>번호</th>
				<td><input type="text" maxlength="2" size="2" name="sno">(예)01</td>
			</tr>
			<tr>
				<th>국어</th>
				<td><input type="text" maxlength="20" size="20" name="sname"></td>
			</tr>
			<tr>
				<th>영어</th>
				<td><input type="text" maxlength="8" size="8" name="birth">(예)20191011</td>
			</tr>
			<tr>
				<th>수학</th>
				<td>
					<input type="text" maxlength="3" size="3" name="math">
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<button type="button" onclick="check();">학생등록</button>
					<button type="reset">다시쓰기</button>
				</th>
			</tr>
		</table>
		</form>
		
	</section>
	<%@include file="footer.jsp" %>
</body>
</html>