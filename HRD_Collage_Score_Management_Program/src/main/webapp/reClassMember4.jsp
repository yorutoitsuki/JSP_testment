<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<%@include file="header.jsp" %>
	<%
		
		
		sql  = "select * from score_tbl";
		rs = stmt.executeQuery(sql);
		ResultSetMetaData rsmd = rs.getMetaData();
		int columnLength = rsmd.getColumnCount();
		
		String sql2  = "select * from grade_tbl";
		Statement stmt2 = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
		ResultSet rs2 = stmt2.executeQuery(sql2);
		
		%>
		<h1>성적조회</h1>
		<section>
			<table class="selectTable">
			<tr>
				<th>과목</th>
				<th>전공1</th>
				<th>전공2</th>
				<th>전공3</th>
				<th>교양1</th>
				<th>교양2</th>
			</tr>
			<tr>
				<th>과목</th>
				<%for(int i = 3; i <= columnLength; i++) {
					%>
					<th><%=rsmd.getColumnName(i) %></th>
					<%
				}%>
			</tr>
			<%
			int storeScore[] = new int[(columnLength-2)*2];
			while(rs.next()){
				for(int i = 3; i <= columnLength; i++) {
					if(rsmd.getColumnType(i) == Types.NUMERIC ){
						while(rs2.next()){
							if(rs2.getInt(2) <= rs.getInt(i) && rs.getInt(i) <= rs2.getInt(3)){
								
								if(rs2.getString(1).equals("A")){
									storeScore[i-3] += 1;
									break;
								}else if(rs2.getString(1).equals("F")){
									storeScore[storeScore.length/2 + (i-3)]++;
									break;
								}
							}
						}
						rs2.beforeFirst();
					}
				}
			}
			%>
			<tr>
				<th>성적 우수자</th>
				
				<%for(int i = 0; i <= ((storeScore.length)/2) -1; i++) {
					%>
					<th><%=storeScore[i] %></th>
					<%
				}%>
			</tr>
			<tr>
				<th>재수강 대상자</th>
				<%for(int i = (storeScore.length)/2; i < storeScore.length; i++) {
					%>
					<th><%=storeScore[i] %></th>
					<%
				}%>
			</tr>
		</table>
		</section>
		
		
	
	<%@include file="footer.jsp" %>
</body>
</html>