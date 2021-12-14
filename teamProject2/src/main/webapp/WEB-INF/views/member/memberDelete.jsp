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
	<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/check.js"></script>

</head>

<body>
					
<div class="resp_member_join_wrap">
	<div class="member_tit"><h1 class="sub_tit">회원탈퇴</h1></div>
	<form name="" id="registFrm" method="post" action="${pageContext.request.contextPath}/deletePro" >
		<div id="formMemberArea" class="resp_member_join">
			<div class="resp_join_table">
				<ul class="required">
					<li class="th">
						<p designelement="text" textindex="25" >아이디</p>
					</li>
					<li class="td">
						<input type="text" name="memId" id="userid" value="" onkeypress="filterKey();" class="eng_only" onpaste="javascript:return false;" placeholder="아이디 ( 공백 없는 영문/숫자 포함 6~20자 )">
						<p id="id_info" class="guide_text"></p>
						<br><span id="check_id_msg"></span><br>
					</li>
				</ul>
				<ul class="required">
					<li class="th">
						<p designelement="text" textindex="26">비밀번호</p>
					</li>
					<li class="td">
						<input type="password" name="memPw" id = "pass" class="eng_only" placeholder="비밀번호 ( 공백 없는 영문/숫자 포함 6~20자 )" onkeyup="pass_check()">
					</li>
				</ul>
				<ul class="required">
					<li class="th">
						<p designelement="text" textindex="27">비밀번호 확인</p>
					</li>
					<li class="td">
						<input type="password" name="re_password" id ="pass2" class="eng_only" placeholder="비밀번호 확인" onkeyup="pass_check()">
						<br><span id="check_pass_msg"></span><br>
					</li>
				</ul>
				
				
				<ul class="required">
					<li class="th">
						<p designelement="text" textindex="22">이름</p>
					</li>
					<li class="td"><input type="text" name="memNm" value="" placeholder="이름" autocomplete="off"></li>
				</ul>


			</div><!--resp_join_table-->
		</div><!--formMemberArea-->
		<div class="btnArea">
			<button type="submit" class="btnSSG btnL action" onclick="" id="authNoBtn">회원탈퇴하기</button>
		</div><!--btnArea-->
	</form><!--registFrm-->
</div><!-- resp_member_join_wrap -->
</body>
</html>