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
	sql  = " select syear||'_'||sclass||'_'||sno, nvl(sname,'-1'), nvl(gender,'-1'),";
	sql += "		nvl(kor,-1),nvl(eng,-1), nvl(math,-1),";
	sql += "		(nvl(kor,0)+nvl(eng,0)+nvl(math,0)),";
	sql += "		round((nvl(kor,0)+nvl(eng,0)+nvl(math,0))/3,1),";
	sql += "		sum(nvl(kor,0)) over(), sum(nvl(eng,0)) over(),  sum(nvl(math,0)) over(),";
	sql += "		round(avg(nvl(kor,0)) over(),1), round(avg(nvl(eng,0)) over(),1), round(avg(nvl(math,0)) over(),1)";
	sql += " from examtbl_1 a full outer join EXAMTBL_3 b";
	sql += " using (syear, sclass, sno)";
	
	
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
			
			String korT = "";
			String engT = "";
			String mathT = "";
			String korA = "";
			String engA = "";
			String mathA = "";
			
			while (rs.next()) {
				String sname = rs.getString(2);
				if(sname.equals("-1")) {
					sname = "";
				}
				
				String gender = "";
				switch(rs.getString(3)){
				case"F":
					gender = "여";
					break;
				case"M":
					gender = "남";
					break;
				case"-1":
					gender = "";
					break;
				}
				
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
				
				String total = rs.getString(7);
				if(total.equals("0")){
					total = "";
				}
				
				String avg = rs.getString(8);
				if(avg.equals("0")){
					avg = "";
				}
				
				korT = rs.getString(9);
				engT = rs.getString(10);
				mathT = rs.getString(11);
				korA = rs.getString(12);
				engA = rs.getString(13);
				mathA = rs.getString(14);
			%>
			<tr>
				<%-- <td><a href="updateStudent.jsp?pk=<%=rs.getString(1)%>"><%=rs.getString(1)%></a></td> --%>
				<td><%=rs.getString(1)%></td>
				<td><%=sname%></td>
				<td><%=gender%></td>
				<td><%=kor%></td>
				<td><%=eng%></td>
				<td><%=math%></td>
				<td><%=total%></td>
				<td><%=avg%></td>
			</tr>
			<%
			}
			%>
			<tr>
				<td></td>
				<td></td>
				<td>총점수합계</td>
				<td><%=korT %></td>
				<td><%=engT %></td>
				<td><%=mathT %></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td>총점수평균</td>
				<td><%=korA %></td>
				<td><%=engA %></td>
				<td><%=mathA %></td>
				<td></td>
			</tr>
		</table>
	</section>


	<%@include file="footer.jsp"%>
</body>
</html>