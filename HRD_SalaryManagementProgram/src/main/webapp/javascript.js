/**
 * 
 */
 
 function check() {
	if(f.employee_nam.value == "") {
		alert("사원명을 입력해 주세요")
		return f.employee_nam.focus();
	}
	if(f.dept_no.value == "") {
		alert("부서번호를 입력해 주세요")
		return f.dept_no.focus();
	}
	if(f.employee_status.value == "") {
		alert("입사일자를 입력해 주세요")
		return f.employee_status.focus();
	}
	f.submit();
}
 
 
 
 
 
 
 
 
 