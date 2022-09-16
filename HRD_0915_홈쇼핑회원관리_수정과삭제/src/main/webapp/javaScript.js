/**
 * 
 */
 
 
 
function check() {
	if(f.custno.value == ""){
		alert("회원번호가 없습니다");
		return f.custno.focus();
	}
	if(f.custname.value == ""){
		alert("회원성명이 없습니다");
		return f.custname.focus();
	}
	if(f.phone.value == ""){
		alert("회원전화가 없습니다");
		return f.phone.focus();
	}
	if(f.address.value == ""){
		alert("회원주소가 없습니다");
		return f.address.focus();
	}
	if(f.joindate.value == ""){
		alert("가입일자 없습니다");
		return f.joindate.focus();
	}
	if(f.grade.value == ""){
		alert("고객등급이 없습니다");
		return f.grade.focus();
	}
	else {
		switch(f.grade.value){
			case "A":
			case "a":
			case "B":
			case "b":
			case "C":
			case "c":
			break;
			default:
			alert("존재하지 않는 고객 등급입니다");
			return f.custno.focus();
		}
	}
	if(f.city.value == ""){
		alert("도시코드가 없습니다");
		return f.custno.focus();
	}
	f.submit();
}
 
function goDelete(frm) {
	if(confirm("삭제하시겠습니까?")){
		frm.action = 'deletePro.jsp';
		frm.submit();
	}else{
		return false;
	}
}
 
function check2(btnId) {
	if(f.custno.value == ""){
		alert("회원번호가 없습니다");
		return f.custno.focus();
	}
	if(f.custname.value == ""){
		alert("회원성명이 없습니다");
		return f.custname.focus();
	}
	if(f.phone.value == ""){
		alert("회원전화가 없습니다");
		return f.phone.focus();
	}
	if(f.address.value == ""){
		alert("회원주소가 없습니다");
		return f.address.focus();
	}
	if(f.joindate.value == ""){
		alert("가입일자 없습니다");
		return f.joindate.focus();
	}
	if(f.grade.value == ""){
		alert("고객등급이 없습니다");
		return f.grade.focus();
	}
	else {
		switch(f.grade.value){
			case "A":
			case "a":
			case "B":
			case "b":
			case "C":
			case "c":
			break;
			default:
			alert("존재하지 않는 고객 등급입니다");
			return f.custno.focus();
		}
	}
	if(f.city.value == ""){
		alert("도시코드가 없습니다");
		return f.custno.focus();
	}
	
	if(btnId == 'delete'){
		if(confirm("삭제하시겠습니까?")){
			f.selecter.value = 'delete';
		}else{
			return false;
		}
		
	}
	else if(btnId == 'update'){
		if(confirm("수정하시겠습니까?")){
			f.selecter.value = 'update';
		}else{
			return false;
		}
	}
	
	f.action = 'UpdateDeletePro.jsp';
	f.submit();
	return true;
}
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 