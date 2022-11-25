<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
try {
	if(con != null) {
		con.close();
	}
	if(sm != null) {
		sm.close();
	}
	if(ps != null) {
		ps.close();
	}
	if(rs != null) {
		rs.close();
	}
}catch(Exception e2) {
	e2.printStackTrace();
}

%>