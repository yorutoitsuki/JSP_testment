/**
 * 
 */
 
 function inputCheck() {
	if(f.mname.value = ""){
		alert("회원 이름을 입력해주세요");
		return f.mname.focus();
	}
	if(f.maddress.value = ""){
		alert("주소를 입력해주세요");
		return f.maddress.focus();
	}
	if(!document.querySelector('input[name="gender"]').checked){
		return f.gender.focus();
	}
	if(f.gender.value = ""){
		alert("성별을 선택해주세요");
		return f.mname.focus();
	}
	if(f.tel.value = ""){
		alert("전화번호를 입력해주세요");
		return f.tel.focus();
	}
	f.submit();
}