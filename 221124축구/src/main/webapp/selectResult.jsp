<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="header.jsp" %>
<%
sql = "select match_no, sum(player_score) as player_score,  ";
sql += "sum(yellow_card) as yellow_card, sum(red_card) as red_card ";
sql += "from record_tbl group by match_no order by match_no asc ";
rs = sm.executeQuery(sql);

sql = "select player_no, player_name, player_score from(select player_no, dense_rank()  ";
sql += "over(order by player_score desc, red_card asc, yellow_card asc) as rank, ";
sql += "player_score from (select player_no, sum(player_score) as player_score, ";
sql += "sum(yellow_card) as yellow_card, sum(red_card) as red_card ";
sql += "from record_tbl group by player_no)) join player_tbl ";
sql += "using(player_no) where rank = 1 order by player_no ";
ps = con.prepareStatement(sql);
ResultSet rs2 = ps.executeQuery();
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section>
		<h1>경기 결과 조회</h1>
		<table>
			<tr>
				<th>경기변호</th>
				<th>득점</th>
				<th>경고수</th>
				<th>퇴장수</th>
			</tr>
		<%
		while(rs.next()){
			%>
			<tr>
				<th><%=rs.getInt("match_no") %></th>
				<th><%=rs.getInt("player_score") %></th>
				<th><%=rs.getInt("yellow_card") %></th>
				<th><%=rs.getInt("red_card") %></th>
			</tr>
			<%
		}
		%>
		</table>
		<%
		while(rs2.next()){
			%>
			<p class="toCenter">
				최우수 선수 : <%=rs2.getInt("player_no") %>&nbsp;
				<%=rs2.getString("player_name") %>&nbsp;
				<%=rs2.getInt("player_score") %>골
			</p>
			<%
		}
		%>
	</section>
</body>
<%@include file="footer.jsp" %>
</html>