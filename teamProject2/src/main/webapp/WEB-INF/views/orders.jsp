<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/common.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/layout.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/main.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/pay.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/importTrms.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/kakaopayDlp.css">

<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="script.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">
	
	$(function() {
		
		var price = commaCheck(${ListDTO.goodsPrice});
		var sumprice = commaCheck(${ListDTO.goodsPrice} * ${goodsCount});
	     
		$("#item_prc0").html(price);
		$("#item_amt0").html(price);
		$("#total_pmt_amt").html(sumprice);
		$("#right_product_amt").html(sumprice);
		$("#right_total_ord_amt").html(sumprice);
		
		var phone = hyphenCheck("${AMemberDTO.phone}");
		$("#phone_num").html(phone);
		
	});
	
	function commaCheck(value){ //숫자를 천단위로 콤마를 찍는 메소드
		return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
    }
	function hyphenCheck(value){
		return value.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");
	}

			
	
	function checkNull(input){ //입력 공백 여부 또는 스페이스바로 공백입력 여부 확인 메소드
		if(input== null||input.replace(/ /gi,"")==""){
			return true;
		}else{
			return false;
		}
	}
	   
	function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
	   
	   function openbasic(){
		   $('#basic_infomation').show();
		   $('#input_infomation').hide();
	   }
	   
	   function openinput(){
		   $('#basic_infomation').hide();
		   $('#input_infomation').show();
	   }
	   
	   function submitOrder(){
		   if($("#basic_infomation").css("display") == "none"){
			   
			   var orderAddr = $("#sample4_roadAddress").val() + $("#sample4_extraAddress").val() + " " + $("#sample4_detailAddress").val();
			   var email = $("#noMemEmail1").val() + "@" + $("#noMemEmail2").val();
			   var goodNum = ${goodsNum};
			   var goodsCount = ${goodsCount};
			   var Pricedot = ${ListDTO.goodsPrice} * ${goodsCount};
			   var Phone = $("#genrlCltTelno0").val() + $("#genrlTxnoTelno0").val() + $("#genrlDtlTelno0").val();
			   
				$.ajax({
					url:"insertOrder" , async: false , type:"post", data:{
						"memId":'<%=(String) session.getAttribute("id")%>',
						"goodsNum":goodNum,
						"goodsCount":goodsCount,
						"orderAddr":orderAddr,
						"orderSub":email,
						"orderZipcode":$("#sample4_postcode").val(),
						"orderPhone":Phone,
						"amount":Pricedot,
						"resipient":$("#resipient").val()
					},
					success: function(){},
					error:function(request,status,error){
						
					}
				});
				
			}else if($("#input_infomation").css("display") == "none"){
				
				var orderAddr = "${AMemberDTO.address}" + " " + "${AMemberDTO.addressSub}" + " " + "${AMemberDTO.addressReference}";
				var goodNum = ${goodsNum};
				var goodsCount = ${goodsCount};
				var Pricedot = ${ListDTO.goodsPrice} * ${goodsCount};
				var orderSub = "${AMemberDTO.email}";
				var orderZipcode = ${AMemberDTO.zipcode};
				var orderPhone = "${AMemberDTO.phone}";
				var resipient = "${AMemberDTO.memNm}";
				
				$.ajax({
					url:"insertOrder" , async: false , type:"post", data:{
						"memId":'<%=(String) session.getAttribute("id")%>',
						"goodsNum":goodNum,
						"goodsCount":goodsCount,
						"orderAddr":orderAddr,
						"orderSub":orderSub,
						"orderZipcode":orderZipcode,
						"orderPhone":orderPhone,
						"amount":Pricedot,
						"resipient":resipient
					},
					success: function(){},
					error:function(request,status,error){
						
					}
				});
		   }
		   
	   }
	   
	</script>


</head>
<body>
	<!-- 여기다가 해더를 넣는 곳 -->

	<form id="ordShtPrdForm" name="ordShtPrdForm" method="post" action="">

		<div class="ordersheet-msg">
			<h3 class="ordersheet-title">주문하실 상품</h3>
			<div class="change-family-normal"></div>
		</div>

		<table class="order-tbl type-ordersheet"
			summary="주문할 상품목록, 상품명/선택사항, 수량, 상품가, 주문금액, 배송비">
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

			<tbody>
				<tr>

					<td class="td-product-block">
						<div class="product-container">
							<div class="product-image">

								<img src="${ListDTO.imagePath}" width="60" height="60"
									alt="${ListDTO.goodsNm}">
							</div>

							<dl class="product-info-container">
								<dt>

									<a href="" class="product-title">${ListDTO.goodsNm}</a>

								</dt>
							</dl>
						</div>
					</td>

					<td class="td-product-quantity"><input type="text"
						name="qty1815265137" id="qty1815265137" readonly=""
						class="input-quantity" value="${goodsCount}" maxlength="3"
						title="수량입력란"></td>


					<td class="td-price-condition">
						<p class="set-price">
							<strong><span id="item_prc0"></span></strong><span
								class="set-price-won">원</span>
						</p>
						<p class="interest-info" id="muijaText0">무이자(6)</p>
						<p class="interest-info" id="juklib_amt0" style="display: none"></p>
					</td>


					<td class="td-order-amount">
						<p class="set-price">
							<strong> <span id="item_amt0"></span></strong><span
								class="set-price-won">원</span>
						</p>

						<p class="family-sale-info" id="item_dcrate0"></p>
					</td>

					<td class="td-delivery-condition">

						<p class="delivery-condition">무료배송</p>

					</td>
				</tr>

			</tbody>

			<!-- 상품 한칸의 끝 -->

		</table>

		<div class="order-sum-total">

			<p class="order-sum-price">
				<span class="sum-total-title">총 주문금액</span> <strong><span
					id="total_pmt_amt"></span></strong><span class="order-sum-price-won">원</span>
				<span class="sum-delivery-fee"> <span id="addChargeAreaPrd"
					style="display: none;">( 추가배송비 <strong>0</strong>원 )
				</span>


				</span>
			</p>
		</div>

		<table class="order-tbl middle-info">
			<tbody>


			</tbody>
		</table>
	</form>

	<!-- 배송지 입력 시작 -->
	<a href="javascript:;" onclick="openbasic()">기본 내용</a> /
	<a href="javascript:;" onclick="openinput()">직접 입력</a>
	<div id=basic_infomation>
		<table class="tbl_list4 deli_info"
			summary="주문하시는 분, 영문성명, 주민등록번호, 이메일주소, 배송지 선택, 받으시는분, 배송지주소, 전화번호, 휴대폰번호, 남기실 말씀 항목을 입력할 수 있는 배송정보 입력폼">
			<caption>배송정보 입력폼</caption>
			<colgroup>
				<col width="130">
				<col width="*">
			</colgroup>
			<tbody>

				<tr class="last">

					<th scope="row" class="vtop"><em><label id="">수취인<sup
								class="require-icon">*</sup></label></em></th>


					<td class="pdb8">
						<div>
							${AMemberDTO.memNm}<br>
						</div>
					</td>

				</tr>

				<tr class="bdrB2">
					<th scope="row" class="tit_deli2 al"><em><label
							for="use_email">이메일주소</label></em></th>
					<td>
						<div>${AMemberDTO.email}</div>
					</td>
				</tr>


				<tr class="last">
					<th scope="row" rowspan="2" valign="top"><em><label
							for="s_postCode_0">배송지주소<sup class="require-icon">*</sup></label></em></th>
					<td>
						<div>
							<label for="zipCode1_0" class="hide">우편번호 첫번째 3자리</label>
							${AMemberDTO.zipcode}
						</div>
					</td>
				</tr>
				<tr class="last">
					<td>
						<div id="div_roadNmbaseAddr0">${AMemberDTO.address}
							${AMemberDTO.addressSub} ${AMemberDTO.addressReference}</div>

					</td>
				</tr>

				<tr class="last">

					<th scope="row"><em><label for="use_sphone">연락처<sup
								class="require-icon">*</sup></label></em></th>

					<td>
						<div id="phone_num"></div>
					</td>
				</tr>
			</tbody>
		</table>

	</div>

	<div id=input_infomation style="display: none;">
		<table class="tbl_list4 deli_info"
			summary="주문하시는 분, 영문성명, 주민등록번호, 이메일주소, 배송지 선택, 받으시는분, 배송지주소, 전화번호, 휴대폰번호, 남기실 말씀 항목을 입력할 수 있는 배송정보 입력폼">
			<caption>배송정보 입력폼</caption>
			<colgroup>
				<col width="130">
				<col width="*">
			</colgroup>
			<tbody>

				<tr class="last">

					<th scope="row" class="vtop"><em><label id="">수취인<sup
								class="require-icon">*</sup></label></em></th>


					<td class="pdb8">
						<div>
							<input type="text" size="10" id="resipient" name="resipient"
								class="input2" style="width: 65px"><br>
						</div>
					</td>

				</tr>

				<tr class="bdrB2">
					<th scope="row" class="tit_deli2 al"><em><label
							for="use_email">이메일주소</label></em></th>
					<td>
						<div>
							<input type="text" id="noMemEmail1" name="noMemEmail1" value=""
								maxlength="40" class="input2" style="width: 120px"><span
								id="emailDeli">@</span> <input type="text" id="noMemEmail2"
								name="noMemEmail2" value="" maxlength="20" class="input2"
								style="width: 80px">
						</div>
					</td>
				</tr>


				<tr class="last">
					<th scope="row" rowspan="2" valign="top"><em><label
							for="s_postCode_0">배송지주소<sup class="require-icon">*</sup></label></em></th>
					<td>
						<div>
							<label for="zipCode1_0" class="hide">우편번호 첫번째 3자리</label> <input
								type="text" id="sample4_postcode" placeholder="우편번호"
								name="zipcode" class="input2" style="width: 55px" readonly>

							<span class="gs-btn" onclick="sample4_execDaumPostcode()">
								<a class="bold"> 우편번호 찾기 </a>
							</span>
						</div>
					</td>
				</tr>
				<tr class="last">
					<td>
						<div id="div_roadNmbaseAddr0">
							<input type="text" id="sample4_roadAddress" placeholder="도로명주소"
								name="address1" class="input2" style="width: 180px" readonly>
							<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소">
							<input type="text" id="sample4_extraAddress" placeholder="상세주소"
								name="address2" class="input2" style="width: 180px" readonly>
							<input type="text" id="sample4_detailAddress" placeholder="참고주소"
								name="address3" class="input2" style="width: 180px">
						</div>

					</td>
				</tr>

				<tr class="last">

					<th scope="row"><em><label for="use_sphone">연락처<sup
								class="require-icon">*</sup></label></em></th>

					<td>
						<div>
							<input type="text" id="genrlCltTelno0" title="연락처 첫번째 3자리 입력란"
								class="input2" style="width: 55px" name="genrlTxnoTelno0"
								maxlength="3" value=""> - <input type="text"
								id="genrlTxnoTelno0" title="연락처 두번째 3 ~ 4자리 입력란" class="input2"
								style="width: 55px" name="genrlTxnoTelno0" maxlength="4"
								value=""> - <input type="text" id="genrlDtlTelno0"
								title="연락처 마지막 4자리 입력란" class="input2" style="width: 55px"
								name="genrlDtlTelno0" maxlength="4" value="">
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<!-- 배송지 입력 끝 -->

	<!-- 결제하기 -->
	<div class="tit_order_area">
		<h4 class="tit_order_list">결제하기</h4>
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
					<dd class="information-define">
						<strong class="apply-amount" id="right_product_amt"></strong>원
					</dd>
				</dl>
				<dl class="amount-information">
					<dt class="information-term total-discount-amount">할인금액</dt>
					<dd class="information-define">
						<strong class="apply-amount" id="right_discount_amt">0</strong>원
					</dd>
				</dl>


				<dl class="amount-information" style="display: none;">
					<dt class="information-term">추가배송비</dt>
					<dd class="information-define">
						<strong class="apply-amount" id="right_addDlvc_amt"></strong>원
					</dd>
				</dl>

				<dl class="purchase-bill">
					<dt class="blind">최종결제금액</dt>
					<dd class="price-info">
						<span class="price-discount">약 <strong
							id="right_discount_percent">0%</strong> 할인
						</span> <span class="price"><strong id="right_total_ord_amt"></strong>원</span>
					</dd>
				</dl>
				</main>
			</article>
			<article class="purchase-trms" id="jumun">
				<main>
				<button id="btn_order_sheet_payment" class="gui-btn red giant round"
					type="button" onclick="submitOrder()">
					<strong>결제하기</strong>
				</button>
				</main>
			</article>
		</section>
	</div>

	<!-- 여기다 푸터를 넣는곳 -->
</body>
</html>