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
 
function checkInsertSubject() {
	if(f.student_no.value == "") {
		alert("학번을 입력해주세요");
		return f.student_no.focus();
	} 
	if(f.subject_seq.value == "") {
		alert("신청과목을 선택해주세요");
		return f.subject_seq.focus();
	}
	f.submit
}
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 