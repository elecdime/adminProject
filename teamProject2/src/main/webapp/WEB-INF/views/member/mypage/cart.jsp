<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>GH SHOP</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/checkBox.js"></script>
</head>

<body>
<div id="container">			
	<div class="cart_wrap_mo innerContent">
		<!-- 전체선택 버튼 -->
		<div class="goods_chk_all">
			<div class="checkbox" id = "box">
			<input type="checkbox" class="btn_select_all" checked="checked" id = "selectall" value = "selectall">
			<span class="txt" id = "All">전체선택</span>
			</div>
			<div class="btn"><button type="button" class="btn_cle btn_st1" onclick = "CartdeleteAll()">전체삭제</button>
			<input type = "hidden" id = "deleteAll" value = "${user.memId}">
			</div>
		</div>	
		<!-- 전체선택 버튼 -->				
<!-- 리스트 반복문	/////////////////////////////////////////////////////////////////////	 -->
		<!-- 제품리스트 1 -->
		
		<c:set value="0" var="totalPrice"/>	
		<c:forEach var="cartDTO" items="${cartList }" varStatus = "status">
			<c:set value="${totalPrice + cartDTO.goodsPrice }" var="totalPrice"/>	
			<div class="cart_goods_box">				
				<div class="goods_chk">
					<input type="checkbox" checked="checked" name = "product" data-price="${cartDTO.goodsPrice*cartDTO.amount }" value="${cartDTO.cartId }">
				</div><!-- goods_chk -->
				<div class="cart_goods_list">
					<div class="img_area">
						<a href=""><img src="${cartDTO.imagePath }" style="width:90%;" class="goods_thumb"></a>
					</div>
					<div class="option_area">
						<ul>
							<li class="name">${cartDTO.goodsNm }</li>
							<li class="baesong">수량 : <span name="amount">${cartDTO.amount }</span></li>
							<li class="price_mo"><b>${cartDTO.goodsPrice }</b>원</li>
						</ul>
					</div>
				</div><!-- cart_goods_list -->
				<div class="price_total">
					<span class="ptitle">합계 : </span>
					<span class="total_p"><b>${cartDTO.goodsPrice*cartDTO.amount}</b>원</span>
				</div>
				
				<div class="btn_wrap">
					<ul>
						<li><button type="button" class="btn_cle btn_st_1" id = "delete_${cartDTO.cartId }"
						onclick = "CartdeleteOne(this)">삭제</button></li>
					</ul>
				</div>
			</div><!--cart_goods_box 각 제품리스트 -->	
		</c:forEach>
		
		<!-- 제품리스트 1 -->
<!-- 리스트 반복문	/////////////////////////////////////////////////////////////////////	 -->
		<form action="cartOrder" method="post" id = "cartOrderSubmit">
		<div id="cart_order_list">
		<c:forEach var="cartDTO" items="${cartList }" varStatus = "status">
			<input type="hidden" id="cartId${cartDTO.cartId }" name="cartId" value="${cartDTO.cartId }">
		</c:forEach>
		</div>
		</form>
		<!-- 총합계내역 -->
		<div class="price_total_box">
			<div class="baesong_total">
				<div class="con"><span id = "cartListSize"></span>건 </div>
			</div>

			<div class="price_total_wrap">
				<h2 class="title">전체 합계</h2>
				<ul>
					<li class="pnum">
						<div class="tit">상품수</div>
						<div class="con"><b id = "product_amount"></b>개</div>
					</li>
					<li class="price">
						<div class="tit">상품금액</div>
						<div class="con"><b id="product_price">${totalPrice }</b>원</div>
					</li>

				</ul>
				<div class="price_total">
					<div class="tit">전체 주문금액</div>
					<div class="con"><b id="total_price">${totalPrice}</b>원</div>
				</div>
			</div>									
		</div><!-- price_total_all -->	
		<!-- 총합계내역 -->
		
		<!-- 주문 버튼 -->
		<div class="cart_order_btn_wrap">			
			<button type="button" class="all_order" onclick = "submit()">상품주문</button>			
		</div><!-- cart_order_btn_area -->
		<!-- 주문 버튼 -->
	</div><!--cartwrap-->
</div><!--container-->


</body>

</html>
