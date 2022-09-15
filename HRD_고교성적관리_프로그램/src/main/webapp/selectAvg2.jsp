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
	sql  = " select syear, sclass, nvl(tname,'미배치'), ";
	sql += "		k1, e1,  m1, k2 , e2 , m2";
	sql += " from EXAMTBL_2";
	sql += " full outer join ( 	select syear, sclass, nvl(sum(kor),-1) as k1, nvl(sum(eng),-1) as e1, nvl(sum(math),-1) as m1,  ";
	sql += " 		round(avg(nvl(kor,0)),1) as k2 ,round(avg(nvl(eng,0)),1) as e2 ,round(avg(nvl(math,0)),1) as m2";
	sql += " 		from examtbl_3 full outer join EXAMTBL_1 using(syear, sclass) group by (sclass,syear))";
	sql += " using(syear, sclass)";
	rs = stmt.executeQuery(sql);
	%>

	<section>
		<h2>성적조회</h2>
		<table class="selectTable">
			<tr>
				<th>학년</th>
				<th>반</th>
				<th>교사명</th>
				<th>국어총점</th>
				<th>영어총점</th>
				<th>수학총점</th>
				<th>국어평균</th>
				<th>영어평균</th>
				<th>수학평균</th>
			</tr>
			<%
			while (rs.next()) {
				String tname = rs.getString(3);
				if(tname.equals("미배치")){
					tname = "";
				}
				
				String k1 = rs.getString(4);
				if(k1.equals("-1")){
					k1 = "";
				}
				
				String e1 = rs.getString(5);
				if(e1.equals("-1")){
					e1 = "";
				}
				
				String m1 = rs.getString(6);
				if(m1.equals("-1")){
					m1 = "";
				}
			%>
			<tr>
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=tname%></td>
				<td><%=k1%></td>
				<td><%=e1%></td>
				<td><%=m1%></td>
				<td><%=rs.getString(7)%></td>
				<td><%=rs.getString(8)%></td>
				<td><%=rs.getString(9)%></td>
			</tr>
			<%
			}
			%>
		</table>
	</section>


	<%@include file="footer.jsp"%>
</body>
</html>