<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>GH SHOP</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/insertSearch.css">
<script
	src="${pageContext.request.contextPath}/resources/js/checkBox.js"></script>
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/main.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/sub.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/cart.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/member.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<script src="https://kit.fontawesome.com/dd43a0e2b4.js"
	crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/check.js"></script>

</head>

<body>
<header id="header">
	<div id="util">
		<div class="innerContent flex">
			<div class="qbtn">
				<ul>
					<li class="tab01"><a href="${pageContext.request.contextPath}/main.jsp">Home<span
							class="icon_bookmark"></span></a></li>
					<li class="tab02"><a
						href="${pageContext.request.contextPath}/notice.jsp">GH SHOP
							CUSTOMER</a></li>
				</ul>
			</div>
			<div class="util_menu">
				<c:choose>
					<c:when test="${sessionScope.user.memId == null}">
						<ul>
							<li><a href="${pageContext.request.contextPath}/login">로그인</a></li>
							<li><a href="${pageContext.request.contextPath}/join">회원가입</a></li>
							<li onclick="MSG()"><a
								href="${pageContext.request.contextPath}/join">마이페이지</a></li>
							<li onclick="MSG()"><a
								href="${pageContext.request.contextPath}/join">고객센터</a></li>
						</ul>
					</c:when>
					<c:otherwise>
						<ul>
							<li><a href="${pageContext.request.contextPath}/logout">로그아웃</a></li>
							<li><a>${mDTO.memNm}님</a></li>
							<li><a href="${pageContext.request.contextPath}/mypage">마이페이지</a></li>
							<li><a href="${pageContext.request.contextPath}/notice">고객센터</a></li>
						</ul>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</header>
	<div id="container">


		<div class="memw innerContent">
			<div class="member_tit">
				<h1 class="sub_tit">마이페이지</h1>
			</div>
			<!--  member_tit -->


			<div id='mypage_quickinfo'>

				<div class='quickContents_first'>
					<p class="userName">
						<span>${mDTO.memNm}</span>님! 반갑습니다.
					</p>

					<p class="context">회원님을 위한 다양한 맞춤서비스가 제공됩니다.</p>
				</div>
				<div class="quickContentsBox">
					<div class='quickContents'>
						<p class="tit">
							<span class="title">나의 적립금</span>
						</p>
						<p class="txt">
							<span> <?=number_format($mRs_point);?> 원
							</span>
						</p>
					</div>

					<div class='quickContents'>
						<p class="tit">
							<span class="title">나의 쿠폰</span>
						</p>
						<p class="txt">
							<span> <?=number_format($mem_reviewCount);?> 개
							</span>
						</p>
					</div>

					<div class='quickContents'>
						<p class="tit">
							<span class="title">나의 상품문의</span>
						</p>
						<p class="txt">
							<span> <?=number_format($mem_goodsQnaCount);?> 건
							</span>
						</p>
					</div>

					<div class='quickContents quickContents_end'>
						<p class="tit">
							<span class="title">나의 상품후기</span>
						</p>
						<p class="txt">
							<span> <?=number_format($mem_questionCount);?> 건
							</span>
						</p>
					</div>
				</div>
			</div>