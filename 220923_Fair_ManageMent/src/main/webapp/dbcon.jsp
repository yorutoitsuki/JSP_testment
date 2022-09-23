<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%request.setCharacterEncoding("UTF-8"); %>
<%
	String url = "jdbc:oracle:thin:@//localhost:1521/xe";
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection(url,"system","1234");
	Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
	
	PreparedStatement ps = null;
	String sql = "";
	ResultSet rs = null;
%>