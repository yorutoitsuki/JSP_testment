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
import java.util.ArrayList;
import java.util.Collection;

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
		try {
			//1. DB 연결
			con = getConnection();
			
			//2.SQL
			sql  = " insert into member_tbl_02 values(?,?,?,?,?,?,?)";
			
			//3. 실행
			ps = con.prepareStatement(sql);
			ps.setString(1, beans.getCustno());
			ps.setString(2, beans.getCustname());
			ps.setString(3, beans.getPhone());
			ps.setString(4, beans.getAddress());
			ps.setString(5, beans.getJoindate());
			ps.setString(6, beans.getGrade());
			ps.setString(7, beans.getCity());
			int succed = ps.executeUpdate();
			
			//4. 결과처리
			if(succed == 1) {
				return true;
			}
			else {
				return false;
			}
		} catch (Exception e) {
			System.out.println("getMaxCustnoJoindate() 에러 : " + e);
			return false;
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
	}
	
	public ArrayList<MemberBeans> getMembers() {
		ArrayList<MemberBeans> list =new ArrayList<MemberBeans>();
		
		try {
			con = getConnection();
			sql  = " select custno, custname, phone, address,  ";
			sql += " to_char(joindate,'yyyy-mm-dd') as joindate,  ";
			sql += " decode(grade,'A','VIP','B','일반','C','직원') as grade, city ";
			sql += " from member_tbl_02 order by custno";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				MemberBeans beans = new MemberBeans();
				
				beans.setCustno(rs.getString("CUSTNO"));
				beans.setCustname(rs.getString("CUSTNAME"));
				beans.setPhone(rs.getString("PHONE"));
				beans.setAddress(rs.getString("ADDRESS"));
				beans.setJoindate(rs.getString("JOINDATE"));
				beans.setGrade(rs.getString("GRADE"));
				beans.setCity(rs.getString("CITY"));
				
				list.add(beans);
			}
			
		} catch (Exception e) {
			System.out.println("getMembers() 에러 : " + e);
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
		return list;
		
	}
	public MemberBeans getMember(String custno) {
		MemberBeans beans = new MemberBeans();
		try {
			con = getConnection();
			sql  = " select custno, custname, phone, address, ";
			sql += " to_char(joindate,'yyyy-mm-dd') as joindate, ";
			sql += " grade, city from member_tbl_02 ";
			sql += " where custno = " + custno;
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				beans.setCustno(rs.getString("CUSTNO"));
				beans.setCustname(rs.getString("CUSTNAME"));
				beans.setPhone(rs.getString("PHONE"));
				beans.setAddress(rs.getString("ADDRESS"));
				beans.setJoindate(rs.getString("JOINDATE"));
				beans.setGrade(rs.getString("GRADE"));
				beans.setCity(rs.getString("CITY"));
			}
		} catch (Exception e) {
			System.out.println("getMember() 에러 : " + e);
		}finally {
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
			} catch (Exception e) {
				
			}
		}
		return beans;
	}
	
	public boolean updateMember(MemberBeans beans) {
		try {
			//1. DB 연결
			con = getConnection();
			
			//2.SQL
			sql  = " update MEMBER_TBL_02";
			sql += " set custname = ?,";
			sql += " phone = ?,";
			sql += " address = ?,";
			sql += " grade = ?,";
			sql += " city = ?";
			sql += " where custno = ?";
			//3. 실행
			ps = con.prepareStatement(sql);
			ps.setString(1, beans.getCustname());
			ps.setString(2, beans.getPhone());
			ps.setString(3, beans.getAddress());
			ps.setString(4, beans.getGrade());
			ps.setString(5, beans.getCity());
			ps.setString(6, beans.getCustno());
			
			int succed = ps.executeUpdate();
			
			//4. 결과처리
			if(succed == 1) {
				return true;
			}
			else {
				return false;
			}
		} catch (Exception e) {
			System.out.println("getMaxCustnoJoindate() 에러 : " + e);
			return false;
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
	}
	public ArrayList<SalesBeans> getMembersBuy() {
		ArrayList<SalesBeans> list =new ArrayList<SalesBeans>();
		
		try {
			con = getConnection();
			sql  = " select custno, custname,  decode(grade, 'A','VIP','B','일반','C','직원') as grade,  ";
			sql += " hap from member_tbl_02  join (	select custno, sum(price) as hap ";
			sql += " 		from money_tbl_02 group by (custno)) using (custno) ";
			sql += " order by hap desc ";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				SalesBeans beans = new SalesBeans();
				
				beans.setCustno(rs.getString("CUSTNO"));
				beans.setCustname(rs.getString("CUSTNAME"));
				beans.setGrade(rs.getString("grade"));
				beans.setTotalPrice(rs.getString("hap"));
				
				list.add(beans);
			}
			
		} catch (Exception e) {
			System.out.println("getMembersBuy() 에러 : " + e);
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
		return list;
		
	}
	
	public boolean deleteMember(String custno) {
		try {
			con = getConnection();
			sql  = "delete from MEMBER_TBL_02";
			sql += " where custno = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, custno);
			if(ps.executeUpdate() == 1) {
				return true;
			}else {
				return false;
			}
		} catch (Exception e) {
			System.out.println("deleteMember()오류" + e);
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
		return false;
	}
}
