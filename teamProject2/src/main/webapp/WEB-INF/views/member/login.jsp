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
</head>

<body>
<div id="shop_login_wrap">
	<div class="member_tit"><h1 class="sub_tit">로그인</h1></div>
	<div id="login_box">
		<div class="login_con">
			<div class="mTab">
				<ul>
					<li class="selected"><a>회원로그인</a></li>
				</ul>
			</div><!--  mTab  -->
			<div class="form_wrap">
				<div class="formbox selected">
					<form name="frm_user" id="frm_user" action="${pageContext.request.contextPath}/loginPro" method="POST">
						<div class="tabCont">
							<div class="gLoginInput">
								<div class="mFormBox">
									<div class="column">
										<strong class="title">회원아이디</strong>
										<div class="gridPosition">
											<input type="text" placeholder="아이디를 입력해 주세요." class="fText suffix" title="아이디" name="memId" id="mall_id" value="" tabindex="1" maxlength="20">
										</div>
									</div>
									<div class="column">
										<span class="title">비밀번호</span>
										<div class="gridPosition">
											<input type="password" placeholder="비밀번호를 입력해 주세요." class="fText typePassword" title="비밀번호" name="memPw" id="userpasswd" tabindex="2" maxlength="20">
											<button type="button" class="btnView off">현시하다</button>
										</div>										
									</div>
								</div>
							</div>
							<div class="mButton">
								<button type="submit" class="loginbtn">로그인</button>
							</div>
							<div class="loginBtns">
								<a href="${pageContext.request.contextPath}/findId" class="txtLink lineU" role="button">아이디 찾기</a>
								<a href="${pageContext.request.contextPath}/findPass" class="txtLink lineU" role="button">비밀번호 찾기</a>
								<a href="${pageContext.request.contextPath}/join" class="txtLink lineU" role="button">회원가입</a>
							</div>
						</div>
					</form>
				</div>
			</div><!--  form_wrap  -->
		</div><!--  login_con  -->
	</div><!--  login_box  -->
</div><!--  shop_login_wrap  -->
</body>


</html>