/*
 * 커넥션 풀
 * Connection pool은 DB와 연결된 Connection 객체를 미리 생성하여 pool에 저장
 * 필요할 때마다 이 pool에 접근하여 Connection 객체를 사용한 후 다시 반환
 * 객체를 재생성하지 않기 때문에 프로그램 효율과 성능 증가
 */

package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ShoppingDAO {
	/*
	 * 1. 멤버변수 = 필드
	 */
	
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	private String sql = "";
	
	
	/*
	 * 2. 생성자 : 기본생성자 - 멤버변수에 기본값(수:0/0.0, boolean:false, 클래스타입:null)
	 * 을 주어 객체 생성
	 */
	
	/*
	 * 3. 메서드
	 */
	public static Connection getConnection() throws Exception {
		/*
		 * //첫번째 방법, 커낵션 풀을 사용하지 않는 방법 
		 * //오라클 드라이버 로딩
		 * Class.forName("oracle.jdbc.OracleDriver");
		 * 
		 * //2.Connection Connection con =
		 * DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system",
		 * "1234"); return con;
		 */
		
		//2번째 방법 : 커넥션 풀 생성
		Connection con = null;
		try {
			Context init = new InitialContext();//javax.naming
			
			//javax.sql.DataSource
			DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
			
			con = ds.getConnection();
		}catch(Exception e) {
			System.out.println("getConnection() 에러" + e);
		}
		return con;
	}
	
	//1.다음(next) 회원 번호와 가입일(=오늘날짜) 조회 : insert.jsp
	public MemberBeans getMaxCustnoJoindate() {
		MemberBeans beans = null;
		try {
			//1. DB 연결
			con = getConnection();
			
			//2.SQL
			sql  = " select NVL(max(custno),0)+1 as custno, ";
			sql += " to_char(sysdate,'yyyymmdd') as joindate ";
			sql += " from member_tbl_02";
			
			//3. 실행
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			//4. 결과처리
			if(rs.next()) {
				beans = new MemberBeans(); //기본값으로 채워진 객체
				beans.setCustno(rs.getString("custno"));//조회된 회원번호와
				beans.setJoindate(rs.getString("joindate"));//조회된 날짜로 변경
			}
		} catch (Exception e) {
			System.out.println("getMaxCustnoJoindate() 에러 : " + e);
		} finally {
			//5. 연결해제
			try {
				if(con != null) {
					con.close();
				}
				if(ps != null) {
					ps.close();
				}
				if(rs != null) {
					rs.close();
				}
			}catch(Exception e) {
				
			}
		}
		return beans;
	}
	
	//2. 회원등록
	public boolean insertMember(MemberBeans beans) {
		
		return false;
	}
}
