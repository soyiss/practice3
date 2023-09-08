function addCheck(){
	
	if(frm.resvno.value.length==0){
		alert("예약번호를 입력하세요");
		frm.resvno.focus();
		return false;
	}else if(frm.empno.value.length==0){
		alert("사원번호를 입력하세요");
		frm.empno.focus();
		return false;
	}else if(frm.resvdate.value.length==0){
		alert("근무일자를 입력하세요");
		frm.resvdate.focus();
		return false;
	}else if(frm.seatno.value.length==0){
		alert("좌석번호를 입력하세요");
		frm.seatno.focus();
		return false;
	}else{
		alert("등록이 완료되었습니다.");
		document.frm.submit();
		return true;
	}
	
}

function res(){
	alert("처음부터 다시 작성합니다.");
	document.frm.reset();
}

function search(){
	if(frm2.empno.value.length==0){
		alert("사원번호가 입력되지 않았습니다.");
		frm2.empno.focus();
		return false;
	}else{
		document.frm2.submit();
		return true;
	}
}

function home(){
	window.location='index.jsp';
}

function goList(){
	window.location='list.jsp';
}