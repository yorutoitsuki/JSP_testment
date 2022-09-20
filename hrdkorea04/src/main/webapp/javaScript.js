/**
 * 
 */
 
 function checkInsertStudent() {
	if(f.student_name.value == "") {
		alert("이름을 입력해주세요");
		return f.student_name.focus();
	} 
	if(f.student_phone.value == "") {
		alert("연락처를 입력해주세요");
		return f.student_name.focus();
	} 
	if(f.student_birth.value == "") {
		alert("생년월일을 입력해주세요");
		return f.student_name.focus();
	}
	f.submit();
}
 

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 