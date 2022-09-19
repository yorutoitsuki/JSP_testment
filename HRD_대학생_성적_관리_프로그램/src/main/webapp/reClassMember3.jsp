<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<%@include file="header.jsp" %>
	<%
		sql  = " select  m1.grade,  m2.grade,  m3.grade,  s1.grade,  s2.grade from";
	
		sql += " (select studno, grade from score_tbl, grade_tbl";
		sql += " where loscore <= m_subject1 and m_subject1 <= hiscore) m1";
		
		sql += " join (select studno, grade from score_tbl, grade_tbl";
		sql += " where loscore <= m_subject2 and m_subject2 <= hiscore) m2 using (studno)";
		
		sql += " join (select studno, grade from score_tbl, grade_tbl";
		sql += " where loscore <= m_subject3 and m_subject3 <= hiscore) m3 using (studno) ";
		
		sql += " join (select studno, grade from score_tbl, grade_tbl";
		sql += " where loscore <= s_subject1 and s_subject1 <= hiscore) s1 using (studno)";
		
		sql += " join (select studno, grade from score_tbl, grade_tbl";
		sql += " where loscore <= s_subject2 and s_subject2 <= hiscore) s2 using (studno)";
		
		sql += " order by studno";
		
		rs = stmt.executeQuery(sql);
		/*
		리절트셋메타데이터를 이용하여 grade 테이블의 값을 가져오고
		score 테이블의 각 컬럼을 비교하여 등급을 반환 하는 함수를 만들어서
		처리하면 되나?
		*/
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
				<th>굥야2</th>
			</tr>
			<%
			int m1A = 0; int m2A = 0; int m3A = 0; int s1A = 0; int s2A = 0;
			int m1F = 0; int m2F = 0; int m3F = 0; int s1F = 0; int s2F = 0;
			
			while(rs.next()){
				for(int i = 1; i <= 5; i++) {
					String grade = rs.getString(i);
					switch(i){
					case 1:
						switch(grade){
						case"A": m1A++; break;
						case"F": m1F++; break;
						default: break;
						}
						break;
					case 2:
						switch(grade){
						case"A": m2A++; break;
						case"F": m2F++; break;
						default: break;
						}
						break;
					case 3:
						switch(grade){
						case"A": m3A++; break;
						case"F": m3F++; break;
						default: break;
						}
						break;
					case 4:
						switch(grade){
						case"A": s1A++; break;
						case"F": s1F++; break;
						default: break;
						}
						break;
					case 5:
						switch(grade){
						case"A": s2A++; break;
					 	case"F": s2F++; break;
						default: break;
						}
						break;
					}
				}
			}
			%>
			<tr>
				<th>성적 우수자</th>
				<td><%=m1A %>명</td>
				<td><%=m2A %>명</td>
				<td><%=m3A %>명</td>
				<td><%=s1A %>명</td>
				<td><%=s2A %>명</td>
			</tr>
			<tr>
				<th>재수강 대상자</th>
				<td><%=m1F %>명</td>
				<td><%=m2F %>명</td>
				<td><%=m3F %>명</td>
				<td><%=s1F %>명</td>
				<td><%=s2F %>명</td>
			</tr>
		</table>
		</section>
		
		
	
	<%@include file="footer.jsp" %>
</body>
</html>