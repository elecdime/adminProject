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
<div id="shop_login_wrap">
	<div class="member_tit"><h1 class="sub_tit">비밀번호 재설정</h1></div>
	<div id="login_box">
		<div class="login_con">
			<div class="mTab">
				<ul>
					<li class="selected"><a>비밀번호를 재설정해주세요</a></li>
				</ul>
			</div><!--  mTab  -->
			<div class="formbox selected">
				<form name="frm_user" id="frm_user" action="${pageContext.request.contextPath}/findPassPro" method="POST" onsubmit = "return passOk()">
						<div class="tabCont">
							<div class="gLoginInput">
								<div class="mFormBox">
									<div class="column">
										<strong class="title">비밀번호 재설정</strong>
											<div class="gridPosition">
												<input type = "hidden" value = "${mDTO.memId}" name = "memId" id = "id">
												<input type = "hidden" value = "0" id = "passExamine">
												<input type="password" placeholder="비밀번호를 재설정해주세요" class="fText typePassword" title="비밀번호" name="memPw" id="pass" tabindex="2" maxlength="20" onblur = "findPassOk()" >
												<br><span id="check_pass1_msg"></span><br>
											</div>	
										<br>
										<strong class="title">비밀번호 확인</strong>
											<div class="gridPosition">
												<input type = "password" id = "re_password" name = "re_password" class="fText typePassword" placeholder="비밀번호를 재설정해주세요"onkeyup="pass_check()">
												<br><span id="check_pass2_msg"></span><br>
											</div>
									</div>
										<input type = "hidden" id = "email" name = "email" value = "${mDTO.email}">
								</div>
							</div>
						</div>
					<div class="mButton">
						<button class="loginbtn" type = "submit">확인</button>
					</div>
				</form>
			</div>
		</div>
	
	</div><!--  login_con  -->
	</div><!--  login_box  -->
<!--  shop_login_wrap  -->
</body>


</html>