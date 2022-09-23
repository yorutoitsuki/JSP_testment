
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<%@include file="Header.jsp" %>
	
	<%
		sql  = "select mo_name from movie_3 order by mo_no";
		rs = stmt.executeQuery(sql);
		
		//영화 이름, 날짜 조회하는 SQL
		String sql2 = "select mo_name, to_char(mo_date,'yyyymmdd') from movie_3";
		Statement stmt2 = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
		ResultSet rs2 = stmt2.executeQuery(sql2);
		//영화 이름, 날짜 조회하는 SQL 종료
	%>
	<script type="text/javascript">
		var MovieName = new Array();//영화 이름을 저장할 배열
		var MovieDate = new Array();//영화 날짜를 저장할 배열
		<%
		//rs2 = 영화이름, 영화 날짜가 저장되어 있는 ResultSet
		while(rs2.next()){
			%>
			//각각 영화이름, 날짜를 저장함,
			MovieName.push("<%=rs2.getString(1)%>");
			MovieDate.push("<%=rs2.getString(2)%>");
			<%
		}
		%>
		function checkDate() {//선택된 영화의 날짜와 입력된 날짜를 비교하는 함수
			if(f.mo_name.value == ""){//날짜를 먼저 입력하면 비교할 대상이 없으니깐 return으로 종료
				return;
			}else{
				for(var i = 0; i < MovieName.length; i++){//영화의 이름과 select 된 것들을 대조함
					if(MovieName[i] == f.mo_name.value){//대조한 영화와 같은 이름이면
						if(f.rm_date.value < MovieDate[i]){//입력된 날짜와, 영화의 개봉일과 비교
							checker.innerHTML = "예매할 수 없습니다";
						}
						else{
							checker.innerHTML = "예매 가능합니다";
						}
					}
				}
			}
		}//checkDate() 함수 종료
		
		function movieStart() {//영화 개봉일을 검색하는 함수
			if(f.mo_name.value == ""){
				movid.innerHTML = "";//영화가 선택되지 않았으면 movid 아이디를 가진 태그(HTML)의 내용(inner)에 빈값을 입력
				return;
			}
			for(var i = 0; i < MovieName.length; i++){
				if(MovieName[i] == f.mo_name.value){//같은 영화이름을 찾으면
					movid.innerHTML = MovieDate[i];//movid 아이디를 가진 태그(HTML)의 내용(inner)에 개봉일을 입력
					break;
				}
			}
		}
	</script>
	<section>
		<h1>영화 티켓 예매</h1>
		<form action="InsertMoviePro.jsp" name="f" method="post">
			<table>
				<tr>
					<th>회원아이디</th>
					<td><input name = me_id size="20" maxlength="12"></td>
				</tr>
				<tr>
					<th>회원비밀번호</th>
					<td><input type="password" name = me_pass size="20" maxlength="15"></td>
				</tr>
				<tr>
					<th>영화제목</th>
					<td>
						<select name="mo_name" onchange="movieStart(), checkDate();">
						<!-- onchange, 마우스를 다른곳에 클릭하여 focus가 해제되었을때 값에 변화가 생기면 movieStart() 함수와  checkDate(); 함수를 실행
						여러 함수를 실행할때는 ,(콤마)를 넣어주고 마지막 함수에 ;(세미콜론)을 넣어줘야함-->
							<option value="">영화제목을 선택하세요</option>
						<%while(rs.next()){
							%>
							<option value="<%=rs.getString(1)%>"><%=rs.getString(1) %></option>
							<%
						}
						%>
						</select>
						<span id="movid" ></span>
					</td>
				</tr>
				<tr>
					<th>예매일시</th>
					<td>
						<!-- 위와 같이 onchange를 이용하여 값에 변화가 생길때 마다 checkDate() 함수를 호출 -->
						<input name="rm_date" size="20" onchange="checkDate();"><br>
						<span id="checker" ></span>
					</td>
				</tr>
				<tr>
					<th colspan="2">
						<button type="button" onclick="checkMovie();">영화예매</button>
						<button type="button" onclick="location.href = 'SelectMember.jsp'">조회</button>
					</th>
				</tr>
			</table>
		</form>
		
	</section>
	<%@include file="Footer.jsp" %>
</body>
</html>