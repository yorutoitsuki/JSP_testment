
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.Date, java.text.SimpleDateFormat" %><!-- import만 , 을 사용해 여러개의 패키지 또는 클래스를 한번에 import 할 수 있다. -->
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<%@include file="Header.jsp" %>
	
	<%
		sql  = "select mo_name from movie_3 order by mo_no";
		rs = stmt.executeQuery(sql);
		
		//영화 이름, 개봉 날짜 조회하는 SQL
		String sql2 = "select mo_name, to_char(mo_date,'yyyymmdd') from movie_3";
		Statement stmt2 = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
		ResultSet rs2 = stmt2.executeQuery(sql2);
		//영화 이름, 개봉 날짜 조회하는 SQL 종료
		
		Date date = new Date();
		SimpleDateFormat format =  new SimpleDateFormat("yyyy-MM-dd");
		//MM : 월, mm : 분, HH : 24시간, hh : 12시간(AM/PM)
		String time = format.format(date);
	%>
	<script type="text/javascript">
		let MovieName = new Array();//영화 이름을 저장할 배열
		let MovieDate = new Array();//영화 날짜를 저장할 배열
		<%
		//rs2 = 영화이름, 영화 날짜가 저장되어 있는 ResultSet
		while(rs2.next()){
			%>
			//각각 영화이름, 날짜를 저장함,
			//영화 이름 사이의 띄어쓰기(빈칸) 때문에 큰 따옴표("")로 묶어줘야함(=> String으로 처리)
			MovieName.push("<%=rs2.getString(1)%>");
			MovieDate.push("<%=rs2.getString(2)%>");
			<%
		}
		%>
		function checkDate() {//선택된 영화의 날짜와 입력된 날짜를 비교하는 함수
			if(f.mo_name.value == ""){//날짜를 먼저 입력하면 비교할 대상이 없으니깐 return으로 종료
				checker.innerHTML = "영화를 선택하세요";
			}else{
				for(let i = 0; i < MovieName.length; i++){//영화의 이름과 select 된 것들을 대조함
					if(MovieName[i] == f.mo_name.value){//대조한 영화와 같은 이름이면
						let inputDate = new Date(f.rm_date.value);//String 값을 Date 값으로 변환 시키고
						let movieDate = new Date(f.rm_date.min);
						if(inputDate < movieDate){//입력된 날짜와, 영화의 개봉일과 비교
							//min 값이 설정되어 있어서 사실상 죽은 코드(Dead Code)
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
			for(let i = 0; i < MovieName.length; i++){
				if(MovieName[i] == f.mo_name.value){//같은 영화이름을 찾으면
					//영화의 개봉일 을 (yyyy-MM-dd)로 변환
					let movieOpen = MovieDate[i].substring(0,4) + "-" + MovieDate[i].substring(4,6) + "-" + MovieDate[i].substring(6);
					movid.innerHTML = movieOpen;//movid 아이디를 가진 태그(HTML)의 내용(inner)에 개봉일을 입력
					f.rm_date.min = movieOpen;
					f.rm_date.value = movieOpen;
					break;
				}
			}
		}
		
		function checkMovieDate() {//영화예매 버튼 눌렀을때 확인하는 함수
			let CanBook = document.getElementById("checker");
			if(CanBook.innerHTML == "예매할 수 없습니다"){
				alert("예매할 수 없는 날짜입니다");
				return f.rm_date.focus();
			}
			
			const regIdPass = /^[a-zA-Z0-9]{3,12}$/;//반드시 슬러쉬(/)로 시작
			const regName = /^[가-힣a-zA-Z]{2,}$/;
			const regTel = /^\d{3}-\d{3,4}-\\d{4}$/
			
			if(f.me_id.value == "") {
				alert("회원 아이디를 입력해주세요");
				return f.me_id.focus();
			} else if (!regIdPass.test(f.me_id.value)){
				alert("회원 아이디는 3~12자의 영어 대소문자와 숫자로만 입력 가능합니다.");
				return f.me_id.select();
			}
			if(f.me_pass.value == ""){
				alert("비밀번호를 입력해주세요");
				return f.me_pass.focus();
			} else if (!regIdPass.test(f.me_pass.value)){
				alert("비밀번호는 3~12자의 영어 대소문자와 숫자로만 입력 가능합니다.");
				return f.me_pass.select();
			}
			
			if(f.mo_name.value == ""){
				alert("영화제목을 선택하세요");
				return f.mo_name.focus();
			}
			if(f.rm_date.value == ""){
				alert("예매날짜를 입력해주세요");
				return f.rm_date.focus();
			}
			f.submit();
		}
		
	</script>
	<section>
		<h1>영화 티켓 예매</h1>
		<form action="InsertMoviePro3.jsp" name="f" method="post">
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
						</select><br>
						<span id="movid" ></span>
					</td>
				</tr>
				<tr>
					<th>예매일시</th>
					<td>
						<!-- 위와 같이 onchange를 이용하여 값에 변화가 생길때 마다 checkDate() 함수를 호출 -->
						<input type="date" min="" max="" name="rm_date" size="20" onchange="checkDate();"><br>
						<span id="checker" ></span>
					</td>
				</tr>
				<tr>
					<th colspan="2">
						<button type="button" onclick="checkMovieDate();">영화예매</button>
						<button type="button" value="<%=format %>" onclick="checkMovieDate();">영화예매</button>
						<button type="button" onclick="location.href = 'SelectMember.jsp'">조회</button>
					</th>
				</tr>
			</table>
		</form>
		
	</section>
	<%@include file="Footer.jsp" %>
</body>
</html>