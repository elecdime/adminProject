<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!-- saved from url=(0129)https://www.gsshop.com/ord/ordsht/ordSht.gs?ec_ord_no=1116795611&m=80fe986d1ce5c6e624061aea4d7a5b01&ordflag=&cartTabId=cart&lseq= -->
<html>
<head>
<meta charset="UTF-8">
<title>GH SHOP</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/layout.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/pay.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/importTrms.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/kakaopayDlp.css">

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/address_daum.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/checkBox.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<body>

<!-- 여기다가 해더를 넣는 곳 -->

<form id="orderPro" method="post" action="orderPro">

	<div class="ordersheet-msg">
		<h3 class="ordersheet-title">주문하실 상품</h3>
		<div class="change-family-normal">
			
		</div>
	</div> 

	<table class="order-tbl type-ordersheet" summary="주문할 상품목록, 상품명/선택사항, 수량, 상품가, 주문금액, 배송비">
		<caption>주문서 상품 리스트</caption>
		<colgroup>
			<col width="*">
			<col width="80">
			<col width="160">
			<col width="160">
			<col width="230">
		</colgroup>
		<thead>
			<tr>
				<th>상품명/선택사항</th>
				<th>수량</th>
				<th>상품가</th>
				<th>주문금액</th>
				
						<th scope="col"><em>배송비</em></th>
					
			</tr>
		</thead>
		
<!-- 상품 한칸의 시작 -->
		<c:set value="0" var="totalOrderPrice"/>
		<c:forEach var="cartDTO" items="${carts }" varStatus = "status">
			<c:set value = "${totalOrderPrice + (cartDTO.goodsPrice*cartDTO.amount)}" var = "totalOrderPrice"/>
			<tbody>
				<tr>
				
					<td class="td-product-block">
						<div class="product-container">
							<div class="product-image">
								<input type = "hidden" name = "cartId" value = "${cartDTO.cartId }">
								<img src="${cartDTO.imagePath}" width="60" height="60" alt="상품">
							</div>
	
							<dl class="product-info-container">
								<dt>
									<a href="" class="product-title">${cartDTO.goodsNm }</a>
								</dt>
							</dl>
						</div>
					</td>
				
					<td class="td-product-quantity">
						<input type="text" name="qty1815265137" id="qty1815265137" readonly class="input-quantity" value="${cartDTO.amount}"title="수량입력란">
					</td>
				
				
					<td class="td-price-condition">
						<p class="set-price">
							<strong><span id="item_prc0">${cartDTO.goodsPrice }</span></strong><span class="set-price-won">원</span>
						</p>
					</td>
				
				
					<td class="td-order-amount">
						<p class="set-price">
							<strong>
								<span id="item_amt0">${cartDTO.goodsPrice*cartDTO.amount }</span></strong><span class="set-price-won">원</span>
						</p>
						
						<p class="family-sale-info" id="item_dcrate0"></p>
					</td>
				
					<td class="td-delivery-condition">
								
									<p class="delivery-condition">무료배송</p>
								
					</td>
				</tr>
				
			</tbody>
		</c:forEach>
<!-- 상품 한칸의 끝 -->

<!-- 배송지 입력 시작 -->
		
	</table>
	
	<div class="order-sum-total">
		
		<p class="order-sum-price">
			<span class="sum-total-title">총 주문금액</span>
			<strong><span id="total_pmt_amt">${totalOrderPrice}</span></strong><span class="order-sum-price-won">원</span>
			<span class="sum-delivery-fee">
			
				
					<span id="addChargeAreaPrd" style="display:none;">( 추가배송비 <strong>0</strong>원 )</span>
				
			
			</span>
		</p>
	</div>
	
	<table class="order-tbl middle-info">
		<tbody>
			
			
		</tbody>
	</table>

	<input type = hidden name = "amount" value = "${totalOrderPrice}">
	
	<table class="tbl_list4 deli_info" summary="주문하시는 분, 영문성명, 주민등록번호, 이메일주소, 배송지 선택, 받으시는분, 배송지주소, 전화번호, 휴대폰번호, 남기실 말씀 항목을 입력할 수 있는 배송정보 입력폼">
		<caption>배송정보 입력폼</caption>
		<colgroup>
			<col width="130">
			<col width="*">
		</colgroup>
		<tbody>
                <tr class="last">
            
					<th scope="row" class="vtop"><em><label id="">수취인<sup class="require-icon">*</sup></label></em></th>
					
		    		
					<td class="pdb8">
						<div>
							<input type="text" size="10" name="resipient" id="dlv_send_name" class="input2" style="width:65px">
						</div>
					</td>
		    		
		    	</tr>

				<tr class="bdrB2">
					<th scope="row" class="tit_deli2 al"><em><label for="use_email">이메일주소</label></em></th>
					<td>
						<div>
							<input type="text" id="email" name="email" class="input2" style="width:180px">
						</div>
					</td>
				</tr>
			

		<tr class="last">
			<th scope="row" rowspan="2" valign="top"><em><label for="s_postCode_0">배송지주소<sup class="require-icon">*</sup></label></em></th>
			<td>
				<div>
					<input type="text" id="sample6_postcode" name = "orderZipcode" placeholder="우편번호" class="input2">
					<span class="gs-btn">
					<input type="button" class="bold" value="우편번호 찾기" onclick="sample6_execDaumPostcode()" >
					</span>
				</div>
			</td>
		</tr>
		<tr class="last">
			<td>
            <div id="div_roadNmbaseAddr0">
				<input type="text" id="sample6_address" name="orderAddr" readonly class="input2" style="width:180px" placeholder="주소">
				<input type="text" id="sample6_detailAddress" name="orderSub" class="input2" style="width:180px" placeholder="상세주소">
				<input type="text" id="sample6_extraAddress" name="addressReference" class="input2" style="width:180px" placeholder="참고항목">
			</div>
				
			</td>
		</tr>

			<tr class="last">
		
				<th scope="row"><em><label for="use_sphone">연락처<sup class="require-icon">*</sup></label></em></th>
			
			<td>
				<div>
					<input type="text" id="orderPhone"  class="input2" style="width:180px" name="orderPhone"  placeholder='"-"를 빼고 작성해주세요' >
				</div>
			</td>
		</tr>
	</tbody></table>
</form>
<!-- 배송지 입력 끝 -->
	
<!-- 결제하기 -->
		<div class="tit_order_area">
			<h4 class="tit_order_list">결제하기
			</h4>
		</div>
	    
			<div class="clearfix">

	<section id="purchase-price-info">
			<article class="purchase-price">
				<header>
					<h1>최종 결제금액</h1>
				</header>
				<main>
					<dl class="amount-information">
						<dt class="information-term total-discount-amount">상품금액</dt>
						<dd class="information-define"><strong class="apply-amount" id="right_product_amt">${totalOrderPrice}</strong>원</dd>
					</dl>
					<dl class="amount-information">
						<dt class="information-term total-discount-amount">할인금액</dt>
						<dd class="information-define"><strong class="apply-amount" id="right_discount_amt">0</strong>원</dd>
					</dl>
					
					
					<dl class="amount-information" style="display:none;">
						<dt class="information-term">추가배송비</dt>
						<dd class="information-define"><strong class="apply-amount" id="right_addDlvc_amt"></strong>원</dd>
					</dl>
					
					<dl class="purchase-bill">
						<dt class="blind">최종결제금액</dt>
						<dd class="price-info">
							<span class="price-discount">약 <strong id="right_discount_percent">0%</strong> 할인</span> 
							<span class="price"><strong id="right_total_ord_amt">${totalOrderPrice}</strong>원</span>
						</dd>
					</dl>
				</main>
			</article>
			<article class="purchase-trms" id="jumun">
				<main>
					<button id="btn_order_sheet_payment" class="gui-btn red giant round" onclick = "submit2()"><strong>결제하기</strong></button>
				</main>
			</article>
		</section>
</div>

<!-- 여기다 푸터를 넣는곳 -->	
</body>
</html>