<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String url = "jdbc:oracle:thin:@localhost:1521:xe";
Class.forName("oracle.jdbc.OracleDriver");
Connection con = DriverManager.getConnection(url,"system","1234");

String sql = "";
Statement sm = con.createStatement();
PreparedStatement ps = null;
ResultSet rs = null;
%>