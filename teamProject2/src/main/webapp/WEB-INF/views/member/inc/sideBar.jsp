<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
			<!-- 왼쪽메뉴 여기부터 -->
<!--
			<?
			include "../../include/left_mypage.inc.php";
			?>
-->
			
<div id="subpageLNB" class="subpage_lnb">
	<div id="mypageLnbBasic" class="subpage_lnb">
<!-- 		<div style="text-align:center; background:#556FE0; padding:15px;"><span class="menuTitle">마이페이지<span>MYPAGE</span></span></div> -->

				<h3 class="title2">나의 정보</h3>
		<ul class="lnb_sub">
			<li class='off'><a href="${pageContext.request.contextPath}/info"  >회원정보 관리</a></li>
			<li class='off'><a href="${pageContext.request.contextPath}/passChange"  >비밀번호 변경</a></li>
			<li class='off end'><a href="${pageContext.request.contextPath}/memberDelete">회원탈퇴</a></li>
		</ul>

		
		<h3 class="title2">나의 쇼핑</h3>
		<ul class="lnb_sub">
			<li class='off'><a href="${pageContext.request.contextPath}/mysubOrder">주문배송조회</a></li>
			<li class='off'><a href="${pageContext.request.contextPath}/mysubDeleteOrder">주문취소/교환/반품</a></li>
			<li class='off'><a href="${pageContext.request.contextPath}/mysubOrder">장바구니</a></li>
		</ul>

		<h3 class="title2">나의 활동</h3>
		<ul class="lnb_sub">
			<li class='off'><a href="${pageContext.request.contextPath}/mysubOrder">나의 상품후기</a></li>
			<li class='off'><a href="${pageContext.request.contextPath}/mysubOrder">1:1문의</a></li>
		</ul>
	</div>

</div>