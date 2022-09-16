/**
 * 
 */
 
 
 function check() {
	if(f.sname.value == ""){
		alert("학생이름을 입력해주세요");
		return f.sname.focus();
	}
	if(f.address.value == ""){
		alert("학생주소를 입력해주세요");
		return f.address.focus();
	}
	if(f.gender.value == ""){
		alert("학생성별을 입력해주세요");
		return f.gender.focus();
	}
	if(f.tel.value == ""){
		alert("전화번호를 입력해주세요");
		return f.tel.focus();
	}
	if(f.idnum.value == ""){
		alert("주민번호를 입력해주세요");
		return f.idnum.focus();
	}
	f.submit();
}

function checkScore() {
	if(f.studno.value == ""){
		alert("학번을 입력해주세요");
		return f.studno.focus();
	}
	if(f.syear.value == ""){
		alert("학년을 입력해주세요");
		return f.syear.focus();
	}
	if(f.m_subject1.value == ""){
		alert("전공1을 입력해주세요");
		return f.m_subject1.focus();
	}
	if(f.m_subject2.value == ""){
		alert("전공2를 입력해주세요");
		return f.m_subject2.focus();
	}
	if(f.m_subject3.value == ""){
		alert("전공3을 입력해주세요");
		return f.m_subject3.focus();
	}
	if(f.s_subject1.value == ""){
		alert("교양1을 입력해주세요");
		return f.s_subject1.focus();
	}
	if(f.s_subject2.value == ""){
		alert("교양2를 입력해주세요");
		return f.s_subject2.focus();
	}
	f.submit();
}
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 