<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="javax.naming.spi.DirStateFactory.Result" %>
<%@page import="java.sql.*" %>
<%
Class.forName("oracle.jdbc.OracleDriver");
Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
request.setCharacterEncoding("UTF-8");

Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
PreparedStatement ps = null;
ResultSet rs = null;
String sql = "";

%>


































