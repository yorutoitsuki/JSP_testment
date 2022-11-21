/**
 * 
 */
 
 
 
 
 function inputCheck() {
	if(f.userName.value == "") {
		alert("사용자 명을 입력해주세요");
		return f.userName.focus();
	}
	if(f.userPw.value == "") {
		alert("비밀번호를 입력해주세요");
		return f.userPw.focus();
	}
	if(f.userPw.value != f.userPwCheck.value) {
		alert("패스워드가 일치하지 않습니다.");
		return f.userPwCheck.focus();
	}
	if(f.userPart.value == "") {
		alert("소속부서번호를 입력해주세요");
		return f.userPart.focus();
	}
	if(f.userSort.value == "") {
		alert("사용자구분을 입력해주세요");
		return f.userSort.focus();
	}
	if(f.userDate.value == "") {
		alert("등록일자를 입력해주세요");
		return f.userDate.focus();
	}
	f.submit();
}

function goToView() {
	location.href = "viewUser.jsp";
}
