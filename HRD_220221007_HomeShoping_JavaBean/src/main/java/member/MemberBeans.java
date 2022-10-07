/*
 * 자바빈은 JSP 페이지의 디자인 부분과 비지니스 로직(=자바코드) 부분을 분리함으로써
 * 복잡한 JSP코드를 줄이고 프로그램 재사용성을 증가시킨다.
 * 
 * DTO(data transfer object) : 자바빈
 * DAO(data access object) : DB에 접근하여 정보를 가져오고
 * 그 가져온 정보를 DTO에 저장 할 수 있게 하는 객체
 */

package member;
//1. public 클래스
public class MemberBeans {//회원정보
	//2.멤버변수 접근제한자 : private
	private String custno;
	private String custname;
	private String phone;
	private String address;
	private String joindate;
	private String grade;
	private String city;
	
	
	//3.매개변수가 없는 생성자 : 기본 생성자
	
	//4매서드 접근 제한자 : public
	//단, 읽기만 한다면 getter만 만듬
	
	public String getCustno() {
		return custno;
	}
	public void setCustno(String custno) {
		this.custno = custno;
	}
	public String getCustname() {
		return custname;
	}
	public void setCustname(String custname) {
		this.custname = custname;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getJoindate() {
		return joindate;
	}
	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	
}
