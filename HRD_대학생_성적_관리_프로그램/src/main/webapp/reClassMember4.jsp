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
					//각 과목의 이름을 출력, 컬럼이름을 따로 처리해야할 필요 있음
					%>
					<th><%=rsmd.getColumnName(i) %></th>
					<%
				}%>
			</tr>
			<%
			//배열을 절반으로 나눠서 앞쪽은 A 학점 저장, 뒤쪽은 F 학점 저장
			int storeScore[] = new int[(columnLength-2)*2];
			while(rs.next()){//score_tbl 커서를 다음 row로
				for(int i = 3; i <= columnLength; i++) {//score_tbl의 각 컬럼의 점수를 순회
					if(rsmd.getColumnType(i) == Types.NUMERIC ){//컬럼이 number 타입인가 확인
						while(rs2.next()){//학점을 추출하는 while문
							//score_tbl의 각 컬럼의 학점을 grade_tbl과 비교
							if(rs2.getInt(2) <= rs.getInt(i) && rs.getInt(i) <= rs2.getInt(3)){
								if(rs2.getString(1).equals("A")){
									storeScore[i-3] += 1;
									break;//학점이 확인되면 while문에서 탈출
								}else if(rs2.getString(1).equals("F")){
									storeScore[storeScore.length/2 + (i-3)]++;
									break;//학점이 확인되면 while문에서 탈출
								}
							}
						}//학점을 추출하는 while문 종료
						//다음 컬럼으로 진행하기 전에 grade_tbl의 커서를 초기화
						rs2.beforeFirst(); //grade_tbl을 재사용할 준비 완료
					}//타입 확인 if문 끝
				}//score_tbl의 각 컬럼을 순회하는 for문 끝
			}//score_tbl의 커서를 움직이는 while문 끝
			%>
			<tr>
				<th>성적 우수자</th>
				
				<%for(int i = 0; i <= ((storeScore.length)/2) -1; i++) {
					//0~((storeScore.length)/2) -1 까지는 A학점인 학생 수가 저장되어 있음
					%>
					<th><%=storeScore[i] %>명</th>
					<%
				}%>
			</tr>
			<tr>
				<th>재수강 대상자</th>
				<%for(int i = (storeScore.length)/2; i < storeScore.length; i++) {
					//(storeScore.length)/2 부터 끝까지는 F학점인 학생의 수가 저장되어 있음
					%>
					<th><%=storeScore[i] %>명</th>
					<%
				}%>
			</tr>
		</table>
		</section>
		
		
	
	<%@include file="footer.jsp" %>
</body>
</html>