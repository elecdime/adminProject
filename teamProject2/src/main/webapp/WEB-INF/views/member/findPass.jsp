<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<div class="member_tit"><h1 class="sub_tit">비밀번호 찾기</h1></div>
	<form name="" id="registFrm" method="POST" action="${pageContext.request.contextPath}/findPassOk" >
		<div id="formMemberArea" class="resp_member_join">
			<div class="resp_join_table">
			
				<ul class="required">
					<li class="th">
						<p designelement="text" textindex="25" >아이디</p>
					</li>
					<li class="td">
						<input type="text" name="memId" class="eng_only" placeholder="아이디">
						<p id="id_info" class="guide_text"></p>
					</li>
				</ul>
				<ul class="required">
					<li class="th">
						<p designelement="text" textindex="27">이메일</p>
					</li>
					<li class="td">
						<div class="ip_h_cer">
							<input type="email" id = email name="email" placeholder="이메일" onblur = "require($('#email').val(), $('#check_email_msg'))">
							<input type="button" class="btn_h_cer" value="이메일 인증" onclick="mailCode()" >
							<br><span id="check_email_msg"></span><br>
							<div>
							<input type = "text" id = "emailCode" name = "malCode" placeholder = "인증코드" onblur = "mailCodeCheck()">
							<input type = "hidden" id = "emailExamine" value = "0">
							<br><span id="check_emailCk_msg"></span><br>
							</div>
						</div>
					</li>
				</ul>

			</div><!--resp_join_table-->
		</div><!--formMemberArea-->
		<div class="btnArea">
			<button type="submit" class="btnSSG btnL action" id="authNoBtn">다음</button>
		</div><!--btnArea-->
		<div id="shop_login_wrap">
		<div class="loginBtns">
			<a href="${pageContext.request.contextPath}/findId" class="txtLink lineU" role="button">아이디 찾기</a>
			<a href="${pageContext.request.contextPath}/join" class="txtLink lineU" role="button">회원가입</a>
		</div>
		</div>
	</form><!--registFrm-->
</div><!-- resp_member_join_wrap -->
</body>
</html>