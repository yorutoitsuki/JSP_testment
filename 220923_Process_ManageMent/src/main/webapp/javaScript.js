/**
 * 
 */

function insertPCheck() {
	if(f.w_workno.value == ""){
		alert("작업지시번호를 입력해주세요");
		return f.w_workno.focus();
	}
	if(f.p_p1.value == ""){
		alert("재료준비를 선택해주세요");
		return f.p_p1.focus();
	}
	if(f.p_p2.value == ""){
		alert("인쇄공정을 선택해주세요");
		return f.p_p2.focus();
	}
	if(f.p_p3.value == ""){
		alert("코팅공정을 선택해주세요");
		return f.p_p3.focus();
	}
	if(f.p_p4.value == ""){
		alert("합지공정을 선택해주세요");
		return f.p_p4.focus();
	}
	if(f.p_p5.value == ""){
		alert("접합공정을 선택해주세요");
		return f.p_p5.focus();
	}
	if(f.p_p6.value == ""){
		alert("포장적재를 선택해주세요");
		return f.p_p6.focus();
	}
	if(f.w_lastdate.value == ""){
		alert("최종작업일자를 입력해주세요");
		return f.w_lastdate.focus();
	}
	if(f.w_lasttime.value == ""){
		alert("최종작업시간을 입력해주세요");
		return f.w_lasttime.focus();
	}
	f.action = "insertProcedurePro.jsp";
	f.submit();
}

function updatePCheck() {
	if(f.w_workno.value == ""){
		alert("작업지시번호를 입력해주세요");
		return f.w_workno.focus();
	}
	if(f.p_p1.value == ""){
		alert("재료준비를 선택해주세요");
		return f.p_p1.focus();
	}
	if(f.p_p2.value == ""){
		alert("인쇄공정을 선택해주세요");
		return f.p_p2.focus();
	}
	if(f.p_p3.value == ""){
		alert("코팅공정을 선택해주세요");
		return f.p_p3.focus();
	}
	if(f.p_p4.value == ""){
		alert("합지공정을 선택해주세요");
		return f.p_p4.focus();
	}
	if(f.p_p5.value == ""){
		alert("접합공정을 선택해주세요");
		return f.p_p5.focus();
	}
	if(f.p_p6.value == ""){
		alert("포장적재를 선택해주세요");
		return f.p_p6.focus();
	}
	if(f.w_lastdate.value == ""){
		alert("최종작업일자를 입력해주세요");
		return f.w_lastdate.focus();
	}
	if(f.w_lasttime.value == ""){
		alert("최종작업시간을 입력해주세요");
		return f.w_lasttime.focus();
	}
	f.action = "updateProcedurePro.jsp";
	f.submit();
}

function resetAlert() {
	alert("정보를 지우고 처음부터 다시 입력합니다");
	f.w_workno.focus();
}
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 