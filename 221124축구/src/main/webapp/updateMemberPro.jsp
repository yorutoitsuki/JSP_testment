<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="dbcon.jsp"%>
<%
int player_no = Integer.parseInt(request.getParameter("player_no"));
String player_name = request.getParameter("player_name");
int team_no = Integer.parseInt(request.getParameter("team_no"));
String player_phone = request.getParameter("player_phone");
String player_birth = request.getParameter("player_birth");
String player_email = request.getParameter("player_email");

String player_email2 = request.getParameter("player_email2");
int back_no = Integer.parseInt(request.getParameter("back_no"));

try{
	sql = "update player_tbl set player_name = ?, team_no = ?, ";
	sql += "player_phone = ?, player_birth = to_date(?,'yyyy-mm-dd'), ";
	sql += "player_email = ?, back_no = ? ";
	sql += "where player_no = ?";
	ps = con.prepareStatement(sql);
	ps.setString(1, player_name);
	ps.setInt(2, team_no);
	ps.setString(3, player_phone);
	ps.setString(4, player_birth);
	if(player_email != "") {
		ps.setString(5, player_email + "@" + player_email2);
	}else {
		ps.setString(5, "");
	}
	ps.setInt(6, back_no);
	ps.setInt(7, player_no);
	int result = ps.executeUpdate();
	if(result != 0) {
		%>
		<script>
			alert("수정 성공");
			location.href = "selectMember.jsp";
		</script>
		<%
	}else {
		%>
		<script>
			alert("수정 실패");
			history.back();
		</script>
		<%
	}
}catch(Exception e){
	e.printStackTrace();
}finally{
	%>
	<%@include file="closer.jsp"%>
	<%
}
%>
