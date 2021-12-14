<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<title>GH SHOP</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cart.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/check.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/address_daum.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>

<body>
					
<div class="resp_member_join_wrap">
	<div class="member_tit"><h1 class="sub_tit">회원가입</h1></div>
	<form name="" id="registFrm" method="post" action="${pageContext.request.contextPath}/joinPro" onsubmit = "return join()">
		<div id="formMemberArea" class="resp_member_join">
			<div class="resp_join_table">
				<ul class="required">
					<li class="th">
						<p designelement="text" textindex="25" >아이디</p>
					</li>
					<li class="td">
						<input type="text" name="memId" id="userid" onkeyup="examineID($('#userid'))" class="eng_only" placeholder="아이디 ( 공백 없는 영문/숫자 포함 6~20자 )">
						<p id="id_info" class="guide_text"></p>
						<br><span id="check_id_msg"></span><br>
					</li>
				</ul>
				<ul class="required">
					<li class="th">
						<p designelement="text" textindex="26" >비밀번호</p>
					</li>
					<li class="td">
						<input type="password" name="memPw" id = "pass" class="eng_only" placeholder="비밀번호 ( 공백 없는 영문/숫자 포함 6~20자 )" onkeyup="examinePass($('#pass'))">
						<br><span id="check_pass1_msg"></span><br>
					</li>
				</ul>
				<ul class="required">
					<li class="th">
						<p designelement="text" textindex="27">비밀번호 확인</p>
					</li>
					<li class="td">
						<input type="password" name="re_password" id ="pass2" class="eng_only" placeholder="비밀번호 확인" onkeyup="pass_check()">
						<br><span id="check_pass2_msg"></span><br>
					</li>
				</ul>
				
				
				<ul class="required">
					<li class="th">
						<p designelement="text" textindex="22">이름</p>
					</li>
					<li class="td"><input type="text" id = "name" name="memNm" placeholder="이름" autocomplete="off" onblur = "require($('#name').val(), $('#check_name_msg'))">
					<br><span id="check_name_msg"></span><br>
					</li>
				</ul>
				
				<ul class="required">
					<li class="th">
						<p designelement="text" textindex="22">생년월일</p>
					</li>
					<li class="td"><input type="text" id = "birthDt" name="birthDt" placeholder="생년월일" autocomplete="off" onblur = "require($('#birthDt').val(), $('#check_birthDt_msg'))">
					<br><span id="check_birthDt_msg"></span><br>
					</li>
				</ul>
				
				
				<ul class="required">
					<li class="th">
						<p designelement="text" textindex="28">이메일</p>
					</li>
					<li>
						<div class="ip_h_cer">
							<input type="email" id = email name="email" placeholder="이메일" onblur = "require($('#email').val(), $('#check_email_msg'))">
							<input type="button" class="btn_h_cer" value="이메일 인증" onclick="mailCode()" >
							<br><span id="check_email_msg"></span><br>
							<div>
							<input type = "hidden" id = "emailCode" name = "malCode" placeholder = "인증코드" onblur = "mailCodeCheck()">
							<input type = "hidden" id = "emailExamine" value = "0">
							</div>
							<input type = "checkbox" name = "mal_cert" value = "Y"><span> 이메일 수신에 동의합니다.</span>
							<br><span id="check_emailCk_msg"></span><br>
						</div>
					</li>
				</ul>
				<br>
				<ul class="required" style="display:none;">
					<li class="th">
						<p designelement="text" textindex="21">휴대폰번호</p>
					</li>
				</ul>
				<ul>
					<li>
						<input type="tel" id="bcellphone" name= "phone" placeholder="휴대폰번호" onblur = "require($('#bcellphone').val(), $('#check_phone_number_msg'))">
						<br><span id="check_phone_number_msg"></span><br>
					</li>
				</ul>
				<br>
				<ul class="required">
					<li class="th">
						<p designelement="text">주소</p>
					</li>
					<span style = "font-weight: bold">
						주소	
					</span>
					
					
					<li>
						<div class="ip_h_cer">
							<input type="text" id="sample6_postcode" name = "zipcode" placeholder="우편번호">
							<input type="button" class="btn_h_cer" value="우편번호 찾기" onclick="sample6_execDaumPostcode()" >
						</div>
					</li>
					
					<li class="td">
						<input type="text" id="sample6_address" name = "address" placeholder="주소" onblur = "require($('#sample6_address').val(), $('#check_address_msg'))">
					</li>
					<li class="td">
						<input type="text" id="sample6_detailAddress" name = "addressSub" placeholder="상세주소">
					</li>
					<li class="td">
						<input type="text" id="sample6_extraAddress" name = "addressReference" placeholder="참고항목">
					</li>
					<li>
						<br><span id="check_address_msg"></span><br>
					</li>
				</ul>
				
				
			</div><!--resp_join_table-->
			<div class="resp_login_wrap Mt0">
				<input type="hidden" name="join_type" value="business">
				<div class="mem_agree_area" style="display:block;">

					<ul id="agreeList" class="agree_listbox">
						<li>
							<div><input type="checkbox" name="agree" value="Y" class="pilsu" id="ab_chkAll"><label for="ab_chkAll"><span class="desc" designelement="text" textindex="30">(필수)</span> <span designelement="text" textindex="31">이용약관에 모두 동의합니다.</span></label></div>
							<ul>
								<li><div>서비스 이용약관</div><a class="agree_view" href="" onclick=""><span designelement="text" textindex="32" >내용보기</span></a></li>
								<li><div>개인정보 수집/이용</div><a class="agree_view" href="" onclick=""><span designelement="text" textindex="33">내용보기</span></a></li>

							</ul>
						</li>					
					</ul>
				</div>
			</div><!--resp_login_wrap-->
		</div><!--formMemberArea-->
		<div class="btnArea">
			<button type="submit" class="btnSSG btnL action" id="authNoBtn">회원가입하기</button>
			
			<a href = "${pageContext.request.contextPath}/main">
				<button type="button" class="btnSSG btnR cancel" id="">취소</button>
			</a>
		</div><!--btnArea-->
	</form><!--registFrm-->
</div><!-- resp_member_join_wrap -->


</body>
</html>
