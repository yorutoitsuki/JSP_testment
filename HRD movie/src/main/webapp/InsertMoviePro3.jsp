<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="DB_connect.jsp" %>
<%	
	String sql2 = "select me_id, me_pass from MOVIE_1";
	Statement stmt2 = con.createStatement();
	ResultSet rs2 = stmt2.executeQuery(sql2);
	String ID = request.getParameter("me_id");
	String PW = request.getParameter("me_pass");
	boolean IdPwCheck = true;
	while(rs2.next()){
		if(rs2.getString(1).equals(ID)){
			if(rs2.getString(2).equals(PW)){
				IdPwCheck = false;
				try{
					String mo_name[] = request.getParameterValues("mo_name");
					for(int i = 0; i < mo_name.length; i++) {
						sql  = "insert into movie_2 values(?,?,?,to_date(?,'yyyy/mm/dd')) ";
						ps = con.prepareStatement(sql);
						ps.setString(1, request.getParameter("me_id"));
						ps.setString(2, request.getParameter("me_pass"));
						ps.setString(3, mo_name[i]);
						ps.setString(4, request.getParameter("rm_date"));
						ps.executeUpdate();
					}
					%>
					<script>
						alert("영화 예매가 완료되었습니다.");
						history.back();
					</script>
					<%
				} catch(Exception e) {
					%>
					<script>
						alert("영화 예매 실패");
						history.back();
					</script>
					<%
				} 	
				finally {
					try{
						if(con != null) {
							con.close();
						}
						if(stmt != null) {
							stmt.close();
						}
						if(ps != null) {
							ps.close();
						}
						if(rs != null) {
							rs.close();
						}
						break;
					}
					catch(Exception e){
						
					}
				
				}
			}
			else{
				%>
				<script>
					alert("비밀번호가 다릅니다");
					history.back();
					history.reload();
				</script>
				<%
				break;
			}
		}
	}
	
	if(IdPwCheck) {
		%>
		<script>
			alert("아이디가 다릅니다");
			history.back();
		</script>
		<%
	}



%>












