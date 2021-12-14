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
</head>

<body>
<div id="shop_login_wrap">
	<div class="member_tit"><h1 class="sub_tit">아이디찾기</h1></div>
	<div id="login_box">
		<div class="login_con">
			<div class="mTab">
				<ul>
					<li class="selected"><a>고객님의 정보와 일치하는 아이디 목록입니다.</a></li>
				</ul>
			</div><!--  mTab  -->
			
				<div class="formbox selected">
						<div class="tabCont">
							<div class="gLoginInput">
								<div class="mFormBox">
									<div class="column">
										<strong class="title">회원아이디</strong>
										<div class="gridPosition">
											${mDTO.memId}
										</div>
									</div>

								</div>
							</div>
							<div class="mButton">
								<a href = "${pageContext.request.contextPath}/login">
								<button class="loginbtn">로그인하러가기</button>
								</a>
								<a href = "${pageContext.request.contextPath}/findPass">
								<button class="loginbtn">
									비밀번호찾기
								</button>
								</a>
							</div>
						</div>
				</div>

		</div><!--  login_con  -->
	</div><!--  login_box  -->
</div><!--  shop_login_wrap  -->
</body>


</html>