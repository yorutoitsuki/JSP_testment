
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="header.jsp"%>
<%
String player_no = request.getParameter("player_no");
sql = "select player_no, player_name, team_no, player_phone, ";
sql += "to_char(player_birth,'YYYY-MM-DD') as player_birth, ";
sql += "nvl(player_email,' ') as player_email, back_no from player_tbl where player_no = ? ";
ps = con.prepareStatement(sql);
ps.setString(1, player_no);
rs = ps.executeQuery();
rs.next();
String email[] = rs.getString("player_email").split("@");
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section>
		<h1>선수 정보 조회/수정</h1>
		<form action="updateMemberPro.jsp" name="f" method="post">
			<table>
				<tr>
					<th>선수번호</th>
					<td><input type="number" name="player_no" value="<%=rs.getInt("player_no")%>" readonly="readonly"></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="player_name" value="<%=rs.getString("player_name")%>"></td>
				</tr>
				<tr>
					<th>소속팀 번호</th>
					<td><input type="number" name="team_no" value="<%=rs.getString("team_no")%>"></td>
				</tr>
				<tr>
					<th>연락처</th>
					<td><input type="tel" name="player_phone" value="<%=rs.getString("player_phone")%>"></td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td><input type="date" name="player_birth" value="<%=rs.getString("player_birth")%>"></td>
				</tr>
				<tr>
					<th>메일주소</th>
					<td>
						<input type="text" name="player_email" value="<%=email[0].trim()%>">@
						<select name="player_email2">
							<option value="naver.com" <%if(email.length == 2&&email[1].equals("naver.com")){%>selected="selected"<%} %>>naver.com</option>
							<option value="daum.net" <%if(email.length == 2&&email[1].equals("daum.net")){%>selected="selected"<%} %>>daum.net</option>
							<option value="gmail.com" <%=email.length == 2&&email[1].equals("gmail.com")?"selected":"" %>>gmail.com</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>등번호</th>
					<td><input type="number" name="back_no" value="<%=rs.getInt("back_no")%>"></td>
				</tr>
			</table>
			<button>수정</button>&nbsp;<button>조회</button>
		</form>
	</section>
</body>
<%@include file="footer.jsp"%>
<script type="text/javascript" src="inputCheck.js"></script>
</html>