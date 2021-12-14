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
	<div class="member_tit"><h1 class="sub_tit">아이디 찾기</h1></div>
	<form name="" id="registFrm" method="post" action="${pageContext.request.contextPath}/findIdOk" >
		<div id="formMemberArea" class="resp_member_join">
			<div class="resp_join_table">
				<ul class="required">
					<li class="th">
						<p designelement="text" textindex="25" >이름</p>
					</li>
					<li class="td">
						<input type="text" name="memNm" class="eng_only" placeholder="이름">
						<p id="id_info" class="guide_text"></p>
					</li>
				</ul>
				<ul class="required">
					<li class="th">
						<p designelement="text" textindex="26">생년월일</p>
					</li>
					<li class="td">
						<input type="text" name="birthDt" class="eng_only" placeholder="생년월일">
					</li>
				</ul>
				<ul class="required">
					<li class="th">
						<p designelement="text" textindex="27">이메일</p>
					</li>
					<li class="td">
						<input type="email" name="email" class="eng_only" placeholder="이메일">
						<br><span id="check_pass_msg"></span><br>
					</li>
				</ul>
				

			</div><!--resp_join_table-->
		</div><!--formMemberArea-->
		<div class="btnArea">
			<button type="submit" class="btnSSG btnL action" id="authNoBtn">아이디찾기</button>
			<a href = "${pageContext.request.contextPath}/join">
			<button class="btnSSG btnL action" id="authNoBtn">회원가입</button>
			</a>
		</div><!--btnArea-->
	</form><!--registFrm-->
</div><!-- resp_member_join_wrap -->
</body>
</html>