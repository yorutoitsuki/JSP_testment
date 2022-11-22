<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbcon.jsp"%>
<%
String memno = request.getParameter("memno");
String mname = request.getParameter("mname");
String maddress = request.getParameter("maddress");
String joindate = request.getParameter("joindate");
String gender = request.getParameter("gender");
String tel = request.getParameter("tel");
int result = 0;
sql = "insert into member_tbl values(?,?,?,to_date(?,'YY-MM-DD'),?,?)";
try{
	ps = con.prepareStatement(sql);
	ps.setString(1, memno);
	ps.setString(2, mname);
	ps.setString(3, maddress);
	ps.setString(4, joindate);
	ps.setString(5, gender);
	ps.setString(6, tel);
	result = ps.executeUpdate();
	if(result != 0) {
		%>
		<script type="text/javascript">
			alert("회원등록이 완료되었습니다.");
			location.href = "index.jsp";
		</script>
		<%
	}else {
		%>
		<script type="text/javascript">
			alert("회원등록 실패.");
			location.href = "insertMember.jsp";
		</script>
		<%
	}
}catch(Exception e) {
	e.printStackTrace();
}finally {
	try{
		if(con != null) {
			con.close();
		}
		if(ps != null) {
			ps.close();
		}
		if(sm != null) {
			sm.close();
		}
		if(rs != null) {
			rs.close();
		}
	}catch(Exception e2){
		e2.printStackTrace();
	}
}

%>