<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<%@include file="header.jsp" %>
	<%
		sql  = " select w_workno, P_code, p_name, p_p1, p_p2, p_p3, p_p4, p_p5, p_p6, ";
		sql += " to_char(to_date(w_lastdate,'yyyy-mm-dd'),'yyyy-mm-dd'), w_lasttime  ";
		sql += " from tbl_worklist join tbl_process using(w_workno) ";
		sql += " join tbl_product using(p_code) order by w_workno";
		rs = stmt.executeQuery(sql);
		
	%>
	<section>
		<h1>작업공정조회</h1>
		<table>
			<tr>
				<th>작업지시번호</th>
				<th>제품코드</th>
				<th>제품명</th>
				<th>준비</th>
				<th>인쇄</th>
				<th>코팅</th>
				<th>합지</th>
				<th>접합</th>
				<th>포장</th>
				<th>최종공정일자</th>
				<th>최종공정시간</th>
			</tr>
			<%
			while(rs.next()){
				String w_workno = "";
				w_workno += rs.getString(1).substring(0, 4);
				w_workno += "-";
				w_workno += rs.getString(1).substring(4);
				
				String w_lasttime = "";
				w_lasttime += rs.getString(11).substring(0,2);
				w_lasttime += ":";
				w_lasttime += rs.getString(11).substring(2);
				%>
				<tr>
					<td><%=w_workno %></td>
					<td><%=rs.getString(2) %></td>
					<td><%=rs.getString(3) %></td>
					<td><%=rs.getString(4).equals("Y")?rs.getString(4):"~"%></td>
					<td><%=rs.getString(5).equals("Y")?rs.getString(5):"~"%></td>
					<td><%=rs.getString(6).equals("Y")?rs.getString(6):"~"%></td>
					<td><%=rs.getString(7).equals("Y")?rs.getString(7):"~"%></td>
					<td><%=rs.getString(8).equals("Y")?rs.getString(8):"~"%></td>
					<td><%=rs.getString(9).equals("Y")?rs.getString(9):"~"%></td>
					<td><%=rs.getString(10)%></td>
					<td><%=w_lasttime%></td>
					
				</tr>
				<%
			}
			%>
		</table>
	</section>
	<%@include file="footer.jsp" %>
</body>
</html>