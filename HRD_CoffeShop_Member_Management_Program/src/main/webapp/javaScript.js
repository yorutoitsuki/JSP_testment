

function insertMemberCheck() {
	if(f.custname.value == ""){
		alert("회원 성명이 입력되지 않았습니다");
		return f.custname.focus();
	}
	if(f.gender.value == ""){
		alert("성별이 선택되지 않았습니다");
		return f.gender.focus();
	}
	if(f.phone.value == ""){
		alert("회원전화가 입력되지 않았습니다");
		return f.phone.focus();
	}
	if(f.address.value == ""){
		alert("주소가 입력되지 않았습니다");
		return f.address.focus();
	}
	if(f.grade.value == ""){
		alert("고객등급이 입력되지 않았습니다");
		return f.grade.focus();
	}
	else{
		switch(f.grade.value){
			case "a":
			case "A":
			case "b":
			case "B":
			case "c":
			case "C":
				break;
			default:
				alert("옳바른 고객등급을 입력해주세요");
				return f.grade.focus();
		}
	}
	if(f.city.value == ""){
		alert("거주도시가 입력되지 않았습니다");
		return f.city.focus();
	}
	f.submit();
}


function resetButton() {
	alert("모든 항목의 정보를 지웠습니다. 다시 입력해주세요.");
	f.reset();
	return f.custname.focus();
}

function insertCoffeCheck() {
	if(f.pcode.value == ""){
		alert("상품코드를 입력해주세요");
		return f.pcode.focus();
	}
	if(f.pname.value == ""){
		alert("상품명을 입력해주세요");
		return f.pname.focus();
	}
	if(f.pcost.value == ""){
		alert("상품단가를 입력해주세요");
		return f.pcost.focus();
	}
	f.submit();
}

function deleteCoffe(){
	if(f.pcode.value == ""){
		alert("상품코드를 입력해주세요");
		return f.pcode.focus();
	}
	if(confirm("삭제 하시겠습니까?")){
		indicator.value = "delete";
		f.submit();
	}
}

















