<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="header.jsp"%>
<%
sql = "select max(player_no) + 1 from player_tbl";
rs = sm.executeQuery(sql);
rs.next();
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section>
		<h1>선수 등록</h1>
		<form action="insertMemberPro.jsp" name="f" method="post">
			<table>
				<tr>
					<th>선수번호</th>
					<td><input type="number" name="player_no" value="<%=rs.getInt(1)%>" readonly="readonly"></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="player_name"></td>
				</tr>
				<tr>
					<th>소속팀 번호</th>
					<td><input type="number" name="team_no"></td>
				</tr>
				<tr>
					<th>연락처</th>
					<td><input type="tel" name="player_phone"></td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td><input type="date" name="player_birth"></td>
				</tr>
				<tr>
					<th>메일주소</th>
					<td>
						<input type="text" name="player_email">@
						<select name="player_email2">
							<option value="naver.com" selected="selected">naver.com</option>
							<option value="daum.net">daum.net</option>
							<option value="gmail.com">gmail.com</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>등번호</th>
					<td><input type="number" name="back_no"></td>
				</tr>
			</table>
			<button>등록</button>&nbsp;<button>조회</button>
		</form>
	</section>
</body>
<%@include file="footer.jsp"%>
<script type="text/javascript" src="inputCheck.js"></script>
</html>