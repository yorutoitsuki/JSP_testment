<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<%@include file="header.jsp" %>
	<%
		sql  = " select w_workno, P_code, p_name, p_size, p_type, w_quantity, to_char(w_workdate, 'yyyy-mm-dd') ";
		sql += " from tbl_product join tbl_worklist using(P_code) order by w_workno";
		rs = stmt.executeQuery(sql);
		
	%>
	<section>
		<h1>작업지시서 조회</h1>
		<table>
			<tr>
				<th>작업지시번호</th>
				<th>제품코드</th>
				<th>제품명</th>
				<th>제품규격</th>
				<th>제품구분</th>
				<th>수량</th>
				<th>작업시작일</th>
			</tr>
			<%
			while(rs.next()){
				String w_workno = "";
				w_workno += rs.getString(1).substring(0, 4);
				w_workno += "-";
				w_workno += rs.getString(1).substring(4);
				%>
				<tr>
					<td><%=w_workno %></td>
					<td><%=rs.getString(2) %></td>
					<td><%=rs.getString(3) %></td>
					<td><%=rs.getString(4) %></td>
					<td><%=rs.getString(5) %></td>
					<td class="textRight"><%=rs.getString(6) %></td>
					<td><%=rs.getString(7) %></td>
				</tr>
				<%
			}
			%>
		</table>
	</section>
	<%@include file="footer.jsp" %>
</body>
</html>