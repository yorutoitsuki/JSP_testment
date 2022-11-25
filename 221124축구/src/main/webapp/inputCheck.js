/**
 * 
 */
 
 const reg = /\d{3}-d{4}-d{4}/;
 
 function inputCheck() {
	if(f.player_name.value = "") {
		alert("이름을 입력해주세요");
		return f.player_name.focus();
	}
	if(f.team_no.value = "") {
		alert("소속팀 번호를 입력해주세요");
		return f.team_no.focus();
	}
	if(f.player_phone.value = "") {
		alert("연락처를 입력해주세요");
		return f.player_phone.focus();
	}
	if(!reg.test(f.player_phone.value)){
		alert("연락처의 형식 010-1111-2222을 지켜주세요");
		return f.player_phone.focus();
	}
	if(f.player_birth.value = "") {
		alert("생년월일을 입력해주세요");
		return f.player_birth.focus();
	}
	if(f.back_no.value = "") {
		alert("등번호를 입력해주세요");
		return f.back_no.focus();
	}
	f.submit();
}