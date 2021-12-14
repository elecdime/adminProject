function ID_CHK(){ //아이디 중복체크 AJAX 시작
	var id_is_ok = false;
	if($('#userid').val() != ""){//아이디 중복체크 메서드
		$.ajax({
			url : "joinCheck",
			type : "post",
			data : {"id" : $("#userid").val()},
			async: false,
			success : function(result){
					if(result == ''){
						document.getElementById("check_id_msg").innerHTML='사용할 수 있는 아이디 입니다.';
						document.getElementById("check_id_msg").style.color = "blue";
						id_is_ok = true;
					}else{
						document.getElementById("check_id_msg").innerHTML = '사용할 수 없는 아이디 입니다.';
						document.getElementById("check_id_msg").style.color = "red";
					}
				}
		});
	}
	return id_is_ok
	

}//아이디 중복체크 AJAX 끝


//비밀번호 중복체크 시작
function pass_check(){ 
	var pass1 = document.getElementsByName('memPw');
	var pass2 = document.getElementsByName('re_password');

	if(check_bot(pass1, pass2)){
		document.getElementById("check_pass2_msg").innerHTML="비밀번호가 일치합니다.";
		document.getElementById("check_pass2_msg").style.color="blue";
		return true;
	}else{
		document.getElementById("check_pass2_msg").innerHTML='비밀번호가 일치하지 않습니다.';
		document.getElementById("check_pass2_msg").style.color="red";

		return false;
	}
}
//비밀번호 중복체크 시작 끝

// 파라미터의 value값이 빈 값이 아니라면 파라미터 동등비교 함수 시작
function check_bot(value1, value2){
	
	if(value1[0].value != "" && value2[0].value != ""){
		if(value1[0].value == value2[0].value){
			return true;
		} else {
			return false;
		}
	} else{
		return false;
	}
}
// 파라미터의 value값이 빈 값이 아니라면 파라미터 동등비교 함수 시작

// 필수항목 체크 시작
function require(tag1, tag2){
	
	if(tag1 == ''){
		$(tag2).text('필수 정보입니다.');
		$(tag2).css('color', 'red');
		return false;
	}else{
		$(tag2).text('');
		return true;
	}
}
// 필수항목 체크 끝

//필수항목 체크 메세지 시작
function require_msg(check_tag_msg){

}
//필수항목 체크 메세지 끝

//필수 체크박스 체크 시작
function chkBox(tag_id, msg){
	
	if(tag_id.checked != true){
		alert(msg)
		return false;
	}else{
		return true;
	}
	
}
//필수 체크박스 체크 끝

function examineID(item) {
	let id = item.val();
	let regExp = /^[a-z]+[a-z0-9]{5,19}$/g;
	if (id.trim() != '' && regExp.test(id)) {
		console.log(id);
		if(ID_CHK()){
			return true;
		}
	}
	document.getElementById("check_id_msg").innerHTML = '사용할 수 없는 아이디 입니다.';
	document.getElementById("check_id_msg").style.color = "red";
	return false;
}

function examinePass(item) {
	let pass = item.val();
	let regExp = /^[a-z]+[a-z0-9]{5,19}$/g;
	if (pass.trim() != '' && regExp.test(pass)) {
		document.getElementById("check_pass1_msg").innerHTML='사용가능한 비밀번호 입니다.';
		document.getElementById("check_pass1_msg").style.color = "blue";
		return true;
		
	}
	
	document.getElementById("check_pass1_msg").innerHTML='사용할 수 없는 비밀번호입니다.';
	document.getElementById("check_pass1_msg").style.color="red";
	return false;
}


function examineName(item) {
	let name = item.val();
	if (name.trim() != ''){
		return true;
	}
	return false;
}


function examineBirth(item) {
	let birth = item.val();
	if (birth.trim() != ''){
		return true;
	}
	return false;
}

function examinePhone(item) {
	let phone = item.val();
	if (phone.trim() != ''){
		return true;
	}
	return false;
}

function examineEmail(item) {
	let email = item.val();
	if (email.trim() != ''){
		return true;
	}
	return false;
}

function examineEmailCode(item) {
	let emailCode = item.val();
	if (emailCode.trim() != '' && $('#emailExamine').val() == '1'){
		return true;
	}
	return false;
}

function examineAddress(item) {
	let address = item.val();
	if (address.trim() != ''){
		return true;
	}
	return false;
}



// 회원가입 제어 시작
function join() {

	if(examineID($('#userid')) &&
	   examinePass($('#pass')) && 
	   examineName($('#name'))&&
	   examineBirth($('#birthDt'))&&
	   examineEmail($('#email'))&&
	   examineEmailCode($('#emailExamine')) &&
	   examinePhone($('#bcellphone'))&&
	   examineAddress($('#sample6_address'))&&
	   chkBox(document.getElementById('ab_chkAll'),'필수항목을 체크해주세요')){
		alert('통과');
		return true;
		
	}else{
		alert('회원정보를 확인해주세요')
		return false;
	}
	
}
//회원가입 제어 끝

//로그인 확인 메세지 
function MSG() {
	alert("로그인 후 이용해 주세요");
}
//로그인 확인 메세지 


//회원정보 수정
// 버튼의 onClick 이벤트를 통해 함수 호출
function doUpdate(item) {
	// 버튼의 id 값에 따라 다른 이벤트 발생
	if($(item).attr('id') === 'member_update_btn') {
		// 수정 버튼일 경우
		let name = $('#change_box_name').text();
		
		// 내용물을 입력폼으로 변경
		$('#change_box_name').html('<input type="text" id="update_name" placeholder="'+name+'">');
		
		// 버튼의 id 값을 변경
		$(item).attr('id','member_update_complete_btn');
	} else {
		// 완료 버튼일 경우
		// 입력된 이름 가지고 오기
		let name = $('#update_name').val();
		// ajax 통신을 하기 위해 메서드 호출
		doUpdateComplete(name);
		
	}
}

// 수정 ajax 통신을 위한 함수
function doUpdateComplete(name) {
	$.ajax({
		type: 'POST', //요청 메소드 방식
		url:'infoUpdate',
		async: false, // ajax 통신이 끝날때까지 기다리기
		data:{
		"memNm" : name,
		"memId" : $("#user_id").text()
		}, //서버가 요청 URL을 통해서 응답하는 내용의 타입
		success : function(result){
			if(result == 1){
				// 다시 수정버튼으로 되돌리는 작업
				$('#member_update_complete_btn').attr('id','member_update_btn');
				// 입력폼에서 텍스트로 되돌리는 작업
				$("#change_box_name").text(name);
			} else {
				alert('수정에 실패 했습니다.');
			}
			
		}	
	});
}
//회원정보 수정


function mailCode(){
	if($('#email').val() == ''){
		$('#check_email_msg').text('필수 정보입니다.');
		$('#check_email_msg').css('color', 'red');
	}else{
		$("#check_email_msg").text('인증코드를 메일로 전송 중입니다');
		$("#check_email_msg").css('color', 'blue');
		
		$.ajax({
			type: 'POST', //요청 메소드 방식
			url:'emailCheck',
			// async: false, // ajax 통신이 끝날때까지 기다리기
			data:{
			"email" : $('#email').val()
			}, //서버가 요청 URL을 통해서 응답하는 내용의 타입
			success : function(result){
				if(result == 'true'){
					$("#check_email_msg2").text('');
					$('#emailCode').attr('type','text');
					$("#check_email_msg").text('');
				} else {
					alert('통신실패');
				}
			}	
		});
	}
}


function mailCodeCheck(){
	if($('#emailCode').val() == ''){
		$('#check_emailCk_msg').text('필수 정보입니다.');
		$('#check_emailCk_msg').css('color', 'red');
	}else{
		$.ajax({
			type: 'POST', //요청 메소드 방식
			url:'emailCodeCheck',
			async: false, // ajax 통신이 끝날때까지 기다리기
			data:{
			"email" : $('#email').val(),			
			"malCode" : $('#emailCode').val()
			}, //서버가 요청 URL을 통해서 응답하는 내용의 타입
			success : function(result){
				if(result  == "true"){
					$("#check_emailCk_msg").text('코드가 일치합니다.');
					$("#check_emailCk_msg").css('color', 'blue');
					$('#email').attr('readonly');
					$('#emailCode').attr('readonly');
					$('#emailExamine').val('1');
				} else {
					$("#check_emailCk_msg").text('코드가 일치하지 않습니다.');
					$("#check_emailCk_msg").css('color', 'red');
					$('#emailExamine').val('0');
				}
			}	
		});
	}
}




//onkeyup으로 달기
function findPassOk(){
	$.ajax({
		type: 'POST', //요청 메소드 방식
		url:'passChecked',
		async: false, // ajax 통신이 끝날때까지 기다리기
		data:{
			"memPw" : $('#pass').val(),
			"memId" : $('#id').val(),
			"email" : $('#email').val()
		}, //서버가 요청 URL을 통해서 응답하는 내용의 타입
		success : function(result){
			if(result  == "true"){
				$("#check_pass1_msg").text('사용가능한 비밀번호 입니다');
				$("#check_pass1_msg").css('color', 'blue');
				$('#passExamine').val('0');
			} else {
				$("#check_pass1_msg").text('이전 비밀번호는 사용할 수 없습니다.');
				$("#check_pass1_msg").css('color', 'red');
				$('#passExamine').val('1');
			}
		}	
	});
	
}

function passExamine(){
	if($('#passExamine').val() == '0'){
		return true;
	}else{
		return false;
	}

}

function passOk(){
	if(passExamine() && pass_check()){
		return true;
	}
	return false;
}
