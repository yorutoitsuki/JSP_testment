<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<%@include file="header.jsp"%>
	<%
	sql  = " select syear||'_'||sclass||'_'||sno, sname, gender, ";
	sql += "		nvl(kor,-1),nvl(eng,-1), nvl(math,-1),";
	sql += "		(nvl(kor,0)+nvl(eng,0)+nvl(math,0)),";
	sql += "		round((nvl(kor,-1)+nvl(eng,-1)+nvl(math,-1))/3,1)";
	sql += " from examtbl_1 join EXAMTBL_3";
	sql += " using(syear, sclass, sno)";
	rs = stmt.executeQuery(sql);
	%>

	<section>
		<h2>성적조회</h2>
		<table class="selectTable">
			<tr>
				<th>학년 반 번호</th>
				<th>이름</th>
				<th>성별</th>
				<th>국어</th>
				<th>영어</th>
				<th>수학</th>
				<th>총점</th>
				<th>평균</th>
			</tr>
			<%
			while (rs.next()) {
				String kor = rs.getString(4);
				if(kor.equals("-1")){
					kor = "";
				}
				
				String eng = rs.getString(5);
				if(eng.equals("-1")){
					eng = "";
				}
				
				
				String math = rs.getString(6);
				if(math.equals("-1")){
					math = "";
				}
				
				
				String gender = "";
				switch(rs.getString(3)){
				case"F":
					gender = "여";
					break;
				case"M":
					gender = "남";
					break;
				}
				String avg = rs.getString(8);
				if(avg.equals("0")){
					avg = "";
				}
			%>
			<tr>
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=gender%></td>
				<td><%=kor%></td>
				<td><%=eng%></td>
				<td><%=math%></td>
				<td><%=rs.getString(7)%></td>
				<td><%=avg%></td>
			</tr>
			<%
			}
			sql  = " select sum(nvl(kor,0)),sum(nvl(eng,0)),sum(nvl(math,0)),";
			sql += " round(avg(nvl(kor,0)),1),round(avg(nvl(eng,0)),1),round(avg(nvl(math,0)),1)";
			sql += " from examtbl_3";
			
			rs = stmt.executeQuery(sql);
			rs.next();
			%>
			<tr>
				<td></td>
				<td></td>
				<td>총점수합계</td>
				<td><%=rs.getString(1) %></td>
				<td><%=rs.getString(2) %></td>
				<td><%=rs.getString(3) %></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td>총점수평균</td>
				<td><%=rs.getString(4) %></td>
				<td><%=rs.getString(5) %></td>
				<td><%=rs.getString(6) %></td>
				<td></td>
			</tr>
		</table>
	</section>


	<%@include file="footer.jsp"%>
</body>
</html>