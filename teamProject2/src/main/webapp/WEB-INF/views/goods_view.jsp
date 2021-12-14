<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="org.apache.taglibs.standard.tag.common.xml.ForEachTag"%>
<div id="container">
	<div class="goods innerContent">
		<div class="location">
			<h3 class="dn">현재 위치</h3>
			<span>HOME</span>
			<div class="navi">
				<div class="this">
					<a href="#">건강기능식품</a>
					<div>
						<a href="">비타민</a> <a href="">비타민</a> <a href="">비타민</a>
					</div>
				</div>
			</div>
			<div class="navi">
				<div class="this">
					<a href="#">건강가공식품</a>
					<div>
						<a href="">건강가공식품</a> <a href="">건강가공식품</a>

					</div>
				</div>
			</div>
		</div>
		<div class="product-detail">
			<div class="detailArea ">
				<div class="product-image imgArea keyImg">
					<div class="swiper DetailSwipe">
						<span class="icon"> <span class="sale_icon">10%</span>
						</span>
						<div class="swiper-wrapper">
							<div class="swiper-slide">
								<img src="<c:url value="${goodsView.imagePath}"/>" />
							</div>
							<div class="swiper-slide">
								<img src="<c:url value="${goodsView.imagePath}"/>" />
							</div>
							<div class="swiper-slide">
								<img src="<c:url value="${goodsView.imagePath}"/>" />
							</div>
							<div class="swiper-slide">
								<img src="<c:url value="${goodsView.imagePath}"/>" />
							</div>
						</div>
						<div class="swiper-button-next"></div>
						<div class="swiper-button-prev"></div>
					</div>
					<div thumbsSlider="" class="swiper thumbSwipe">
						<div class="swiper-wrapper listImg">
							<div class="swiper-slide">
								<img src="<c:url value="${goodsView.imagePath}"/>" />
							</div>
							<div class="swiper-slide listImg">
								<img src="<c:url value="${goodsView.imagePath}"/>" />
							</div>
							<div class="swiper-slide listImg">
								<img src="<c:url value="${goodsView.imagePath}"/>" />
							</div>
							<div class="swiper-slide listImg">
								<img src="<c:url value="${goodsView.imagePath}"/>" />
							</div>
						</div>
					</div>
				</div>
				<!-- pproduct-image imgArea keyImg -->

				<div class="product-inform">
					<div class="infoArea">
						<div class="prd_title">
							<div class="t1"></div>
							<div class="t2">${goodsView.goodsNm}</div>
							<a href="#" class="icon_detail_sns "> <img
								src="/${pageContext.request.contextPath}/resources/images/share.png"
								alt="sns공유 아이콘">
							</a>
						</div>
						<!-- prd_title  -->
						<div class="priceWrap">
							<div class="discountPriceInfo">
								<div class="title">소비자가</div>
								<div class="listPrice login_need">
									<span>로그인시 볼 수 있습니다.</span>
								</div>
								<div class="listPrice view_price">
									<span>${goodsView.goodsPrice}</span><em>원</em>
								</div>
							</div>
							<div class="priceInfo">
								<div class="title">판매자공급가</div>
								<div class="login_need">
									<button>판매자공급가 보기</button>
									<span>VAT포함</span>
								</div>
								<div class="price view_price">
									<span>9,200</span> <em>원</em> <span class="discountRate">20%</span>
								</div>
							</div>
							<div class="couponInfo"></div>
						</div>
						<!-- priceWrap  -->
						<div class="copybtn-wrap">
							<ul>
								<li>
									<div class="title">
										추천키워드
										<button>키워드복사</button>
									</div>
									<p class="con">#문풍지 보급형 틈새막이 스폰지형 5M 1입 외풍 차단 #문풍지 #문풍지보급형
										#틈새막이 #외풍차단 #바람차단</p>
								</li>
								<li>
									<div class="title">
										스마트스토어 카테고리
										<button>카테고리복사</button>
									</div>
									<p class="con">500026699 생활/건강 > 생활용품 > 생활잡화 > 단열시트</p>
									<p class="caution">*이는 추천하는 카테고리이며, 키워드에 따라 정확하지 않을 수 있습니다.</p>
								</li>
							</ul>
						</div>
						<!-- copybtn-wrap  -->
						<div class="detailimg-down">
							<a href=""> <strong>상품이미지 다운로드 </strong> <span> <em>상품이미지
										(1개)
										<button>다운로드</button>
								</em> <em>상세이미지
										<button>다운로드</button>
								</em>
							</span>
							</a>
						</div>
						<!-- detailimg-down  -->
						<div class="purchaseInfo">
							<ul>
								<li>
									<div class="purchaseInfoBox cardBenefit">
										<div class="title">
											<strong>상품타입</strong>
										</div>
										<div class="content benefitContent">
											<ul>
												<li>
													<button class="b1">준수</button>
												</li>
											</ul>
										</div>
										<button type="button" class="more more_view1">
											<span>더보기</span>
										</button>
									</div>
								</li>
								<li>
									<div class="purchaseInfoBox cardBenefit">
										<div class="title">
											<strong>공급사코드</strong>
										</div>
										<div class="content benefitContent">
											<ul>
												<li><span class="cards">2010014474 </span>
													<div class="icon">
														<img
															src="${pageContext.request.contextPath}/resources/images/diamond.png"
															alt="다이아몬드 아이콘">
													</div> <strong>DIAMOND 3</strong></li>
											</ul>
										</div>
										<button type="button" class="more">
											<span>더보기</span>
										</button>
									</div>
								</li>
							</ul>
						</div>
						<!-- purchaseInfo  -->
						<div class="purchaseInfo">
							<ul>
								<li>
									<div class="purchaseInfoBox">
										<div class="title">
											<strong>출고속도</strong>
										</div>
										<div class="content benefitContent">
											<ul>
												<li class="savingBenefit">
													<button class="b2">우수</button>
													<div class="textWrap">
														<span></span> <strong></strong>
													</div>
												</li>
											</ul>
										</div>
										<button type="button" class="more">
											<span>더보기</span>
										</button>
									</div>
								</li>
								<li>
									<div class="purchaseInfoBox">
										<div class="title">
											<strong>상품출고율</strong>
										</div>
										<div class="content benefitContent">
											<ul>
												<li class="savingBenefit">
													<button class="b3">일반</button>
													<div class="textWrap">
														<span></span> <strong></strong>
													</div>
												</li>
											</ul>
										</div>
										<button type="button" class="more">
											<span>더보기</span>
										</button>
									</div>
								</li>
								<li>
									<div class="purchaseInfoBox">
										<div class="title">
											<strong>문의응답률</strong>
										</div>
										<div class="content benefitContent">
											<ul>
												<li class="savingBenefit">
													<button class="b4">신규</button>
													<div class="textWrap">
														<span></span> <strong></strong>
													</div>
												</li>
											</ul>
										</div>
										<button type="button" class="more">
											<span>더보기</span>
										</button>
									</div>
								</li>
							</ul>
						</div>
						<!-- purchaseInfo  -->
						<div class="optionContent">
							<div class="priceOptionBox">
								<div class="price">
									<div class="spinnerBox">
										<button class="minus disabled">-</button>
										<div class="number">
											<input id="topQuantitySpinner" type="number" value="1"
												min="1" max="20"> <label for="topQuantitySpinner"
												class="blind">스피너 값</label>
										</div>
										<button class="plus">+</button>
									</div>
									<span class="won"><fmt:formatNumber type="currency"
											value="${ goodsView.fixedPrice }" /><em>원</em></span>
								</div>
							</div>
						</div>
						<!-- optionContent  -->
						<div class="btnCart">
							<button type="button" class="buy_wish" onclick="" name="buyBtn">찜</button>
							<div class="btn">
								<c:choose>
									<c:when test="${sessionScope.user.memId == null}">
										<span><button type="button" class="btnSSG btnLineG"
												onclick="MSG()">장바구니</button></span>
										<span><button type="button" class="btnSSG action"
												onclick="MSG()">구매하기</button></span>
									</c:when>
									<c:otherwise>
										<span><button type="button" class="btnSSG btnLineG"
												onclick="insertCart()">장바구니</button></span>
										<span><button type="button" class="btnSSG action"
												name="buyBtn">구매하기</button></span>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
						<!-- btnCart  -->
						<div class="prd-info-2">
							<div class="prd-info-list">
								<dl>
									<dt>배송 불가 기간</dt>
									<dd class="has-btn">
										[사유] 기타 연휴 기간 :
										<div class="desc-box">
											<p class="desc">
												2021-08-13 ~ 2021-08-16 출고일정 : 2021-08-17 12:00 PM시 주문 건까지
												당일 출고되며, 이후 주문건은 2021-08-18 부터 순차적으로 출고될 예정이니다. <span
													class="charge">무료</span>
											</p>

										</div>
										<div class="dropdown-wrap">
											<button type="button" class="ico bic-dropdown fn-btn"
												id="dropdown-btn-2">
												<span>카드혜택, 안내사항</span>
											</button>
										</div>
									</dd>
									<dt>발주마감시간</dt>
									<dd class="has-btn">
										10:30 까지 주문완료시 당일 출고
										<div class="desc-box">
											<p class="desc">
												( 단, 사전통보없이 내부사정에 의해 배송소요 기간이 추가로며칠 더 걸릴경우가 간혹 있으니, 시간이 오래
												지났음에도 배송추적이 되지 않을 경우 1:1문의게시판으로 문의바랍니다.) <span
													class="charge">무료</span>
											</p>

										</div>
										<div class="dropdown-wrap">
											<button type="button" class="ico bic-dropdown fn-btn"
												id="dropdown-btn-2">
												<span>카드혜택, 안내사항</span>
											</button>
										</div>
									</dd>
								</dl>
							</div>
							<!--  prd-info-list -->
						</div>
						<!--  prd-info-2 -->
					</div>
				</div>
				<!-- product-inform -->
			</div>
			<!-- detailArea -->
		</div>
		<!-- product-detail -->
	</div>
	<!-- goods -->




	<div class="sub_proRecommend_wrap innerContent">
		<div class="sub_title">
			<a href=""><strong>다른 고객이 함께 구매한 상품</strong></a>
		</div>
		<div class="item-display-wrap">
			<div class="item-display type-cart clear cboth">
				<div class="swiper proRecommend list innerContent">
					<ul class="swiper-wrapper">
						<c:forEach items="${weekBestList }" var="ListDTO">
							<li class="swiper-slide line_5">
								<div class="space">
									<div class="PJ_goods_border">
										<div class="thumbnail">
											<a href=""></a> <img
												src="<c:url value="${ListDTO.imagePath}"/>"
												alt="5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중"
												title="5088 어골칼슘 폴리감마글루탐산앤비타민d 망간 어골칼슘피지에이60정 할인이벤트 진행중"
												class="middle"> <span class="hot"></span> <span
												class="choice">
												<button href="" type="button"
													class="cart btn-open-layer btn-add-cart14">장바구니</button>
											</span>
										</div>
										<div class="txt">
											<a href=""><strong>${ListDTO.goodsNm}</strong></a>
										</div>
										<div class="desc">
											<div class="type">
												상품타입 <span class="s1">자율</span>
											</div>
											<div class="code">
												상품코드 <span>W4A7D57</span>
											</div>
										</div>
										<div class="price gd-default">
											<span class="cost"> <strong><fmt:formatNumber
														type="currency" value="${ ListDTO.goodsPrice }" /><em
													class="pr_unit">원</em></strong>
											</span> <span class="del">${ ListDTO.fixedPrice }원 </span>
											<div class="dc_per">20%</div>
											<br>
										</div>
										<div class="tag-box">
											<span class="tag-type2">SALE</span> <span class="tag-type3">무료배송</span>
										</div>
									</div>
								</div>
							</li>
						</c:forEach>
					</ul>
				</div>
				<!-- proRecommend -->
				<div class="swiper-button-next swiper-button-next-pro"></div>
				<div class="swiper-button-prev swiper-button-prev-pro"></div>
			</div>
			<!-- item-display -->
		</div>
		<!-- item-display-wrap -->
	</div>
	<!-- sub_proRecommend_wra -->

	<div class="item_goods_sec">
		<div class="detail-contents">


			<!-- 상세이미지 -->
			<div id="detail" class="goods_detail_box">
				<div class="item_goods_tab goods-tab">
					<ul class="innerContent">
						<li class="on"><a href="#detail">상세정보</a></li>
						<li class=""><a href="#info">정보고시</a></li>
						<li class=""><a href="#exchange">배송/교환/반품 안내</a></li>
						<li class=""><a href="#qna">상품문의 <strong>(8)</strong></a></li>
						<li class=""><a href="#reviews">상품평 <strong
								class="crema-product-reviews-count crema-applied">(0)</strong>
						</a></li>
					</ul>
				</div>
				<!-- item_goods_tab -->
				<div class="detailImg innerContent">
					<p class="detailImg_pc">
						<!--상세정보 이미지  -->
						  ${goodsView.goodsDescription}
					</p>
					<!--  detailImg_pc  -->
					<p class="detailImg_mo">
					</p>
					<!--  detailImg_mo  -->
				</div>
				<!--  detailInfo  -->
			</div>
			<!--detail-->

			<!-- 정보고시 -->
			<div id="info" class="goods_detail_box">
				<div class="item_goods_tab goods-tab">
					<ul class="innerContent">
						<li class=""><a href="#detail">상세정보</a></li>
						<li class="on"><a href="#info">정보고시</a></li>
						<li class=""><a href="#exchange">배송/교환/반품 안내</a></li>
						<li class=""><a href="#qna">상품문의 <strong>(8)</strong></a></li>
						<li class=""><a href="#reviews">상품평 <strong
								class="crema-product-reviews-count crema-applied">(0)</strong>
						</a></li>
					</ul>
				</div>
				<!-- item_goods_tab -->
				<div class="detailInfo innerContent">
					<div class="contTit">
						<h3 class="sub-title mt30">물품기본정보</h3>
					</div>
					<div class="contTbl">
						<table class="rowTbl">
							<caption>물품기본정보</caption>
							<tbody>
								<tr>
									<th scope="row" id="iteminfo_title_1">품명</th>
									<td id="iteminfo_text_1">상품 상세정보 별도 표기</td>
								</tr>
								<tr>
									<th scope="row" id="iteminfo_title_2">식품의 유형</th>
									<td id="iteminfo_text_2">상품 상세정보 별도 표기</td>
								</tr>
								<tr>
									<th scope="row" id="iteminfo_title_3">생산자/소재지/수입자</th>
									<td id="iteminfo_text_3">상품 상세정보 별도 표기</td>
								</tr>
								<tr>
									<th scope="row" id="iteminfo_title_4">제조연월일</th>
									<td id="iteminfo_text_4">상품 상세정보 별도 표기</td>
								</tr>
								<tr>
									<th scope="row" id="iteminfo_title_5">유통기한 또는 품질유지기한</th>
									<td id="iteminfo_text_5">상품 상세정보 별도 표기</td>
								</tr>
								<tr>
									<th scope="row" id="iteminfo_title_6">원재료명 및 함량</th>
									<td id="iteminfo_text_6">상품 상세정보 별도 표기</td>
								</tr>
								<tr>
									<th scope="row" id="iteminfo_title_7">영양성분</th>
									<td id="iteminfo_text_7">상품 상세정보 별도 표기</td>
								</tr>
								<tr>
									<th scope="row" id="iteminfo_title_8">기능정보</th>
									<td id="iteminfo_text_8">상품 상세정보 별도 표기</td>
								</tr>
								<tr>
									<th scope="row" id="iteminfo_title_9">섭취량/섭취방법 및 섭취 시 주의사항</th>
									<td id="iteminfo_text_9">상품 상세정보 별도 표기</td>
								</tr>
								<tr>
									<th scope="row" id="iteminfo_title">유전자재조합식품 유무</th>
									<td id="iteminfo_text_9">상품 상세정보 별도 표기</td>
								</tr>
								<tr>
									<th scope="row" id="iteminfo_title">표시광고 사전심의 유무</th>
									<td id="iteminfo_text_9">상품 상세정보 별도 표기</td>
								</tr>
								<tr>
									<th scope="row" id="iteminfo_title">수입식품 여부</th>
									<td id="iteminfo_text_9">상품 상세정보 별도 표기</td>
								</tr>
								<tr>
									<th scope="row" id="iteminfo_title">소비자상담 관련 전화번호</th>
									<td id="iteminfo_text_9">상품 상세정보 별도 표기</td>
								</tr>
								<tr>
									<th scope="row" id="iteminfo_title">주문후 예상 배송기간</th>
									<td id="iteminfo_text_9">상품 상세정보 별도 표기</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!--  contTbl  -->
				</div>
				<!--  detailInfo  -->
			</div>
			<!--info-->

			<!--제품 상세-배송/교환/반품-->
			<div id="exchange" class="goods_detail_box">
				<div class="item_goods_tab goods-tab">
					<ul class="innerContent">
						<li class=""><a href="#detail">상세정보</a></li>
						<li class=""><a href="#info">정보고시</a></li>
						<li class="on"><a href="#exchange">배송/교환/반품 안내</a></li>
						<li class=""><a href="#qna">상품문의 <strong>(8)</strong></a></li>
						<li class=""><a href="#reviews">상품평 <strong
								class="crema-product-reviews-count crema-applied">(0)</strong>
						</a></li>
					</ul>
				</div>
				<!-- item_goods_tab -->
				<div id="prdShip" data-anchor-content="">
					<div class="product-detail__section innerContent">
						<h3 class="sub-title mt30">상품배송안내</h3>
						<ul class="desc-list detail">
							<li>당사이트는 상품별,주문금액별 배송비정책을 채택하고 있습니다.(주문시 상세페이지에서 배송비를
								확인바랍니다.)</li>
							<li>배송은 택배전문회사를 이용배송하며 일부 상품의경우 상점에서 직배송하는 경우도 있습니다. <br>
								1. 상품구입대금 입금확인후 전국 대부분의 지역에서 3~4일내이면 상품을 수령하실 수 있습니다.<br>
								2. (단, 도서산간지역과 일부의 경우는 7~10일 정도 소요 될 수 있습니다.)<br> 3. 각
								배송단계별 진행사항을 메일로 안내드리며, 메일에서 안내드린 송장번호로 현재의 배송진행을 주문배송조회 메뉴에서 직접
								확인해 보실 수 있습니다.
							</li>
						</ul>

						<div class="product-detail__section innerContent">
							<h3 class="sub-title mt50">반품/교환/환불/청약철회 안내</h3>
							<div class="table-default mt15">
								<table class="__se_tbl_ext">
									<caption>교환 및 반품 안내</caption>
									<colgroup>
										<col>
										<col>
									</colgroup>
									<tbody>
										<tr>
											<th scope="row">제품 교환/반품 및 환불</th>
											<td>제품 교환/반품 및 환불은 구입일로 부터 7일이내에 가능하며,상기사항외 배송료는 저희가
												부담합니다.[착불로 택배발송해 주시면 됩니다.]
												<p class="noti-text">주식회사 엠에스코리아 의 고객센터 전화 070-4196-0927
													및 이메일 [ mskorea3118@naver.com ]으로 연락 주시면 친절히 상담해드립니다.</p>
											</td>
										</tr>
										<tr>
											<th scope="row">교환/반품비</th>
											<td>고객의 단순 변심에 따른 타 상품변경시에는 배송료의 일부를 고객님께서 부담하셔야 하며,
												일부상품 특성상 박스및 포장개봉한 제품이나 고객의 부주의로 오염 및 손상된 제품은 반품이 불가능합니다.
												<ul class="desc-list detail">
													<li>또한 상품 신선도관리를 위한 상품은 상품하자를 제외하고는 반품및 교환이 되지 않습니다.</li>
													<li>상품구입시 주의사항을 참조하시기 바랍니다. 신선도관리상품적용 예[토마토,채소류등
														농수산물류]</li>
												</ul>
											</td>
										</tr>
										<tr>
											<th scope="row">청약철회</th>
											<td>주식회사 엠에스코리아 과 재화등의 구매에 관한 계약을 체결한 이용자는 수신확인의 통지를 받은
												날부터 7일 이내에는 청약의 철회를 할 수 있습니다.
												<p class="noti-text mt20">이용자는 재화등을 배송받은 경우 다음 각호의 1에
													해당하는 경우에는 반품 및 교환을 할 수 없습니다.</p>

												<ul class="desc-list detail">
													<li>1. 이용자에게 책임 있는 사유로 재화 등이 멸실 또는 훼손된 경우(다만, 재화 등의
														내용을 확인하기 위하여 포장 등을 훼손한 경우에는 청약철회를 할 수 있습니다)</li>
													<li>2. 이용자의 사용 또는 일부 소비에 의하여 재화 등의 가치가 현저히 감소한 경우</li>
													<li>3. 시간의 경과에 의하여 재판매가 곤란할 정도로 재화등의 가치가 현저히 감소한 경우</li>
													<li>4. 같은 성능을 지닌 재화등으로 복제가 가능한 경우 그 원본인 재화 등의 포장을 훼손한
														경우</li>
												</ul>

												<p class="noti-text">제2항제2호 내지 제4호의 경우에 주식회사 엠에스코리아 이
													사전에 청약철회 등이 제한되는 사실을 소비자가 쉽게 알 수 있는 곳에 명기하거나 시용상품을 제공하는 등의
													조치를 하지 않았다면 이용자의 청약철회등이 제한되지 않습니다.</p>

												<p class="noti-text">이용자는 제1항 및 제2항의 규정에 불구하고 재화등의 내용이
													표시·광고 내용과 다르거나 계약내용과 다르게 이행된 때에는 당해 재화등을 공급받은 날부터 3월이내, 그
													사실을 안 날 또는 알 수 있었던 날부터 30일 이내에 청약철회 등을 할 수 있습니다.</p>
												<p class="noti-text"></p>

											</td>
										</tr>

										<tr>
											<th scope="row">청약철회 등의 효과</th>
											<td>교환/반품 신청 (임의반품 시, 처리불가)
												<ul class="desc-list detail">
													<li>주식회사 엠에스코리아 은 이용자로부터 재화 등을 반환받은 경우 3영업일 이내에 이미
														지급받은 재화등의 대금을 환급합니다. 이 경우 주식회사 엠에스코리아 이 이용자에게 재화등의 환급을 지연한
														때에는 그 지연기간에 대하여 공정거래위원회가 정하여 고시하는 지연이자율을 곱하여 산정한 지연이자를
														지급합니다.</li>
													<li>주식회사 엠에스코리아 은 위 대금을 환급함에 있어서 이용자가 신용카드 또는 전자화폐 등의
														결제수단으로 재화등의 대금을 지급한 때에는 지체없이 당해 결제수단을 제공한 사업자로 하여금 재화등의
														대금의 청구를 정지 또는 취소하도록 요청합니다.</li>
													<li>청약철회등의 경우 공급받은 재화등의 반환에 필요한 비용은 이용자가 부담합니다. 주식회사
														엠에스코리아 은 이용자에게 청약철회등을 이유로 위약금 또는 손해배상을 청구하지 않습니다. 다만 재화등의
														내용이 표시·광고 내용과 다르거나 계약내용과 다르게 이행되어 청약철회등을 하는 경우 재화등의 반환에
														필요한 비용은 주식회사 엠에스코리아 이 부담합니다.</li>
												</ul>
											</td>
										</tr>
									</tbody>
								</table>
								<!--  __se_tbl_ext   -->
							</div>
							<!-- table-default  -->
						</div>
						<!-- product-detail__section  -->

					</div>
					<!-- product-detail__section -->
				</div>
				<!-- prdShip -->
			</div>
			<!--exchange-->

			<!--상품문의-->
			<div id="qna" class="goods_detail_box">
				<div class="item_goods_tab goods-tab">
					<ul class="innerContent">
						<li class=""><a href="#detail">상세정보</a></li>
						<li class=""><a href="#info">정보고시</a></li>
						<li class=""><a href="#exchange">배송/교환/반품 안내</a></li>
						<li class="on"><a href="#qna">상품문의 <strong>(8)</strong></a></li>
						<li class=""><a href="#reviews">상품평 <strong
								class="crema-product-reviews-count crema-applied">(0)</strong>
						</a></li>
					</ul>
				</div>
				<!-- item_goods_tab -->
				<div class="qna_con"></div>
				<!-- qna_con -->
			</div>
			<!--qna-->

			<!--상품평-->
			<div id="reviews" class="goods_detail_box">
				<div class="item_goods_tab goods-tab">
					<ul class="innerContent">
						<li class=""><a href="#detail">상세정보</a></li>
						<li class=""><a href="#info">정보고시</a></li>
						<li class=""><a href="#exchange">배송/교환/반품 안내</a></li>
						<li class=""><a href="#qna">상품문의 <strong>(8)</strong></a></li>
						<li class="on"><a href="#reviews">상품평 <strong
								class="crema-product-reviews-count crema-applied">(0)</strong>
						</a></li>
					</ul>
				</div>
				<!-- item_goods_tab -->
				<div class="reviews_con"></div>
				<!-- reviews_con -->
			</div>
			<input type="hidden" value="${goodsView.goodsNo}" id=goodsNm>
			<c:import url="comment.jsp">
				<c:param name="goodsNo" value="${goodsView.goodsNo}"></c:param>
			</c:import>
		</div>
		<!-- detail-contents -->
	</div>
	<!-- item_goods_sec -->
</div>
<!-- container -->

<footer id="footer">
	<div class="con1">
		<div class="innerContent">
			<div class="customInfo">
				<h3>고객센터</h3>
				<dl>
					<dt>상담시간</dt>
					<dd>
						<span class="day">(<em>10:00 ~ 17:00</em>, 주말.공휴일 휴무)
						</span>
						<!-- 온라인 고객센터 운영시간으로 변경(하드코딩) -->
						<span aria-label="전화번호" class="phoneNum">070-4196-0927</span>
					</dd>
				</dl>
				<a href="" role="button" class="fbtn">자주묻는 질문</a> <a href=""
					role="button" class="fbtn">1:1문의</a>
			</div>
			<!-- //customInfo -->
			<div class="bankInfo">
				<h3>입금계좌</h3>
				<div>
					<p>
						<img
							src="/${pageContext.request.contextPath}/resources/images/bnk.png">
					</p>
					<p class="banknum">101-2076-9077-04</p>
					<p class="bankname">주식회사엠에스코리아</p>
					<a href="" role="button" class="fbtn">구매안전 서비스 가입확인</a>
				</div>
			</div>
			<!-- //bankInfo -->
			<div class="noticeInfo">
				<div id="noticeTab01" class="tabContentWrap tabON">
					<h3 class="hidden">공지사항</h3>
					<ul class="noticeList">

						<li><a href=""> <span>[긴급][중요]상품명 절대 준수상품 - 키워드 주의
									상품 </span><em>2021.08.20</em>
						</a></li>
						<li><a href=""> <span>[리뉴얼안내]4074_뉴트로웨이 WPC
									500g외1건</span><em>2021.08.20</em>
						</a></li>
						<li><a href=""> <span>발주시간 안내-6월4일자 업데이트</span><em>2021.08.20</em>
						</a></li>
						<li><a href=""> <span>[필독] ★상품명절대준수★ 품목 관련 사항</span><em>2021.08.20</em>
						</a></li>
					</ul>
					<a href="" class="txtLink lineU">더보기</a>
				</div>
			</div>
			<!-- //noticeInfo -->
		</div>
	</div>
	<div class="copyArea">
		<div class="copyLink">
			<ul>
				<li><a href="">회사소개</a></li>
				<li><a href="/etc/terms">서비스 이용약관</a></li>
				<li><a href="/etc/privacy" class="notoM">개인정보처리방침</a></li>
				<li><a href="#">카카톡문의</a></li>
				<li><a href="">입점문의</a></li>
				<li><a href="">오시는 길</a></li>
			</ul>
		</div>
		<div class="copyRight">
			<!-- 20200428 수정 -->
			<div class="copyInfo">
				<em class="noLine">주식회사 엠에스코리아</em> <em>주소: 부산광역시 동래구 사직북로34번길
					36&amp;엠에스코리아</em> <em>대표: 김동훈</em> <em>제휴문의 : 070-4196-0927</em> <em>FAX
					: 051-501-0927</em> <em>개인정보관리책임자 : 김동훈</em> <br> <em
					class="noLine">사업자등록번호 876-81-02200<a href="" class="btn_line">사업자
						정보 확인</a></em> <em> </em> <em class="noLine">통신판매번호 : 제2021-부산동래-0686호</em>
				<em>건강기능식품판매업 : 제2021-0134642호</em> <em>관리자이메일 : <a
					href="mailto:mskorea3118@naver.com">mskorea3118@naver.com</a></em>
			</div>
			<em>
				<p>Copyright © 2021 주식회사 엠에스코리아 . All Rights Reserved.</p>
			</em>
		</div>
		<div class="copySns">
			<ul class="navi-list">
				<li class="navi-item facebook"><a class="navi-name" href=""
					target="_blank"> <svg xmlns="http://www.w3.org/2000/svg"
							viewBox="0 0 24 24" width="24" height="24">
									<title>facebook</title>
									<path
								d="M16,9.6L15.7,12h-2.1v7h-3.1v-7H9V9.6h1.6V8.1c0-2,0.9-3.1,3.4-3.1H16v2.4h-1.3c-1,0-1,0.3-1,1l0,1.2H16z"></path>
								</svg>
				</a></li>
				<li class="navi-item instagram"><a class="navi-name" href=""
					target="_blank"> <svg xmlns="http://www.w3.org/2000/svg"
							viewBox="0 0 24 24" width="24" height="24">
									<title>instagram</title>
									<path
								d="M12,8.4c-2,0-3.6,1.6-3.6,3.6s1.6,3.6,3.6,3.6s3.6-1.6,3.6-3.6S14,8.4,12,8.4z M12,14.4c-1.3,0-2.4-1.1-2.4-2.4s1.1-2.4,2.4-2.4s2.4,1.1,2.4,2.4S13.3,14.4,12,14.4z M16.4,8.2C16.4,8.6,16,9,15.6,9c-0.4,0-0.8-0.4-0.8-0.8s0.4-0.8,0.8-0.8C16,7.4,16.4,7.8,16.4,8.2z M15.3,5.1H8.7c-2,0-3.6,1.6-3.6,3.6v6.6c0,2,1.6,3.6,3.6,3.6h6.6c2,0,3.6-1.6,3.6-3.6V8.7C18.9,6.7,17.3,5.1,15.3,5.1z M17.7,15.3c0,1.3-1.1,2.4-2.4,2.4H8.7c-1.3,0-2.4-1.1-2.4-2.4V8.7c0-1.3,1.1-2.4,2.4-2.4h6.6c1.3,0,2.4,1.1,2.4,2.4V15.3z"></path>
								</svg>
				</a></li>
				<li class="navi-item youtube"><a class="navi-name" href=""
					target="_blank"> <svg xmlns="http://www.w3.org/2000/svg"
							viewBox="0 0 24 24" width="24" height="24">
									<title>youtube</title>
									<path
								d="M10.4,9.7l4,2.3l-4,2.3V9.7L10.4,9.7z M20.9,11.8v0.3c0,0.4,0,2.8-0.4,4.1c-0.2,0.9-1,1.6-1.9,1.9c-1.3,0.3-5.5,0.4-6.5,0.4h-0.3c-1,0-5.2,0-6.5-0.4c-0.9-0.2-1.6-1-1.9-1.9c-0.3-1.1-0.4-3.3-0.4-3.9v-0.4c0-0.7,0.1-2.8,0.4-3.9C3.7,7,4.4,6.2,5.3,6c1.2-0.3,4.9-0.4,6.3-0.4h0.8c1.3,0,5.1,0.1,6.2,0.4c0.9,0.2,1.6,1,1.9,1.9C20.9,9,20.9,11.1,20.9,11.8z M19.4,8.2L19.4,8.2c-0.1-0.5-0.5-0.9-1-1c-1-0.3-4.9-0.3-6.3-0.3c-1.4,0-5.3,0.1-6.3,0.3c-0.5,0.1-0.9,0.5-1,1C4.3,9.4,4.3,12,4.3,12c0,0,0,2.6,0.3,3.8c0.1,0.5,0.5,0.9,1,1c1,0.3,4.9,0.3,6.3,0.3c1.4,0,5.3-0.1,6.3-0.3c0.5-0.1,0.9-0.5,1-1c0.3-1.2,0.3-3.8,0.3-3.8C19.7,12,19.7,9.4,19.4,8.2z"></path>
								</svg>
				</a></li>
				<li class="navi-item blog"><a class="navi-name" href=""
					target="_blank"> <svg xmlns="http://www.w3.org/2000/svg"
							viewBox="0 0 24 24" width="24" height="24">
									<title>blog</title>
									<path
								d="M9.6,9.7v4.7H8v-4.2c0-1.3-0.7-1.4-0.8-1.4h0V7C9.5,7,9.6,9.2,9.6,9.7z M6.6,11.9c0,2.6-2.4,2.7-2.4,2.7c-1,0-1.4-0.7-1.4-0.7v0.6H1V7.2h1.7v2.7c0.7-0.7,1.5-0.7,1.5-0.7C6.5,9.2,6.6,11.9,6.6,11.9z M4.9,11.9c0-0.6-0.5-1.1-1.1-1.1c-0.6,0-1.1,0.5-1.1,1.1c0,0.6,0.5,1.1,1.1,1.1C4.4,13,4.9,12.5,4.9,11.9z M23,9.4v4.9c0,2.6-2.2,2.7-2.5,2.7h-0.7v-1.5h0.4c1.2,0,1.1-1.3,1.1-1.3v-0.4c-0.5,0.6-1.3,0.7-1.5,0.7h0c-2.2,0-2.4-2.2-2.4-2.5v0c0-2.5,2-2.6,2.4-2.6h0c1,0,1.5,0.7,1.5,0.7V9.4H23z M21.4,11.9c0-0.6-0.5-1.1-1.1-1.1c-0.6,0-1.1,0.5-1.1,1.1c0,0.6,0.5,1.1,1.1,1.1C20.9,13,21.4,12.5,21.4,11.9z M16.6,11.9L16.6,11.9c0,2.7-2.9,2.7-2.9,2.7c-2.7,0-2.8-2.2-2.8-2.6v-0.1c0-2.5,2.5-2.6,2.8-2.7l0,0C16.4,9.3,16.6,11.5,16.6,11.9z M14.8,11.9c0-0.6-0.5-1.1-1.1-1.1c-0.6,0-1.1,0.5-1.1,1.1c0,0.6,0.5,1.1,1.1,1.1C14.3,13,14.8,12.5,14.8,11.9z"></path>
								</svg>
				</a></li>
			</ul>
		</div>
	</div>
</footer>
<!-- footer -->
<button type="button" class="btnTop">
	<span class="hide">TOP</span>
</button>
<div class="rightQuick_main">
	<div class="right_menu_hidden">
		<div class="toggle-right">
			<div class="toggle-click open">
				<div class="toggle-click_img_02"></div>
			</div>
			<div class="toggle_ico">
				<div class="ico_inner">
					<div class="quick_ico_style quick_ico_style_first">
						<div class="quick_ico_img quick_tooltip" quick-title="대량주문안내">
							<a href=""><span class="s1"><img
									src="/${pageContext.request.contextPath}/resources/images/quick_ico_01.png"></span></a>
						</div>
					</div>

					<div class="quick_ico_style photoReview-display display_on">
						<div class="quick_ico_img quick_tooltip" quick-title="QnA">
							<a href=""><span class="s2"><img
									src="/${pageContext.request.contextPath}/resources/images/quick_ico_02.png"></span></a>
						</div>
					</div>
					<div class="view_menu quick_ico_style">
						<div class="quick_ico_img quick_tooltip view_btn"
							quick-title="최저가미준수신고">
							<a href=""><span class="s3"><img
									src="/${pageContext.request.contextPath}/resources/images/quick_ico_03.png"></span></a>
						</div>
					</div>
					<div class="view_menu quick_ico_style">
						<div class="quick_ico_img quick_tooltip view_btn"
							quick-title="필수서식자료">
							<a href=""><span class="s4"><img
									src="/${pageContext.request.contextPath}/resources/images/quick_ico_04.png"></span></a>
						</div>
					</div>
					<div class="sns_on">
						<div class="quick_ico_style">
							<div class="quick_ico_img_add quick_ico_sns quick_tooltip"
								quick-title="인스타그램">
								<a href=""><span><img
										src="/${pageContext.request.contextPath}/resources/images/quick_ico_instagram.png"></span></a>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="right_hidden_inner">
				<div class="right_hidden_width">
					<div class="right_titbox">
						<a href="" class="bmark">+BOOKMARK</a>
						<div class="text">
							<p>첫방문 이신가요?</p>
							<b>B2B배송대행 도매사이트</b>
						</div>
						<a href="" class="goinfo">쇼핑몰안내 바로가기</a>
					</div>
					<div class="right_menu">
						<div class="menu_border border_50" alt="">
							<a href="#">마이페이지</a>
						</div>
						<div class="menu_border border_50" alt="">
							<a href="#">장바구니</a>
						</div>

						<div class="menu_border border_50" alt="">
							<a href="#">관심상품</a>
						</div>

						<div class="menu_border border_50" alt="">
							<a href="#">최근본상품</a>
						</div>

						<div class="menu_border border_50" alt="">
							<a href="#">주문/배송조회</a>
						</div>
						<div class="menu_border border_50" alt="">
							<a href="#">1:1문의</a>
						</div>
						<div class="menu_border border_50" alt="">
							<a href="#">공지사항</a>
						</div>
						<div class="menu_border border_50" alt="">
							<a href="#">예치금</a>
						</div>
						<div class="menu_border border_50" alt="">
							<a href="#">이벤트</a>
						</div>
						<div class="menu_border border_50" alt="">
							<a href="#">품절/단종안내</a>
						</div>
						<div class="menu_border border_50" alt="">
							<a href="#">상세수정공지</a>
						</div>
					</div>
					<div class="right_cs">
						<div class="tle">고객 센터</div>
						<b>070-4196-0927</b>
						<div class="info">
							평일 : AM10:00 ~ PM17:00<br> 점심 : PM12:00 ~ PM1:00<br> 주말
							및 공휴일 휴무 <a href="" class="kakach"><img
								src="/${pageContext.request.contextPath}/resources/images/kakach.jpg"></a>
						</div>
						<div class="tle">계좌 안내</div>
						<div class="info">
							<img
								src="/${pageContext.request.contextPath}/resources/images/qbnk.png">
							<strong>101-2076-9077-04</strong> 예금주：주식회사엠에스코리아
						</div>
						<a href="">문의 게시판</a> <a href="">자주 묻는 질문</a>
					</div>
				</div>
			</div>
		</div>
		<!-- toggle-right -->
	</div>
	<!-- right_menu_hidden -->
</div>
<!-- rightQuick_main -->


</div>
<!--subLayout -->


<!-- sns 팝업영역 -->
<div class="sns_popupwrap">
	<div class="sns_popup" id="sns_popup">
		<div class="popup_title">
			공유하기<span class="bClose"><img
				src="/${pageContext.request.contextPath}/resources/images/quick_ico_open_02.png"
				alt="sns공유 팝업 닫기 아이콘"></span>
		</div>
		<div class="social">
			<span><img
				src="/${pageContext.request.contextPath}/resources/images/sns_popup_face.gif"
				onclick="" alt="">페이스북</span> <span><img
				src="/${pageContext.request.contextPath}/resources/images/sns_popup_tw.gif"
				onclick="" alt="">트위터</span> <span class=""><a href=""><img
					src="/${pageContext.request.contextPath}/resources/images/sns_popup_ka.png"></a>카카오톡</span>
			<span><a href="#none" class="copytoclipboard"><img
					src="/${pageContext.request.contextPath}/resources/images/sns_popup_url.png"
					alt="URL복사 아이콘">URL 복사</a> <input id="url_text" type="text"></span>
		</div>
	</div>
	<!--sns_popup-->
	<div class="bgbk"></div>
</div>
<!--sns_popupwrap-->

<!-- 레이어팝업 상품타입 팝업영역 -->
<div class="layer-popup layer-popup1">
	<div class="popup-page-body">
		<!--popup-local-->
		<div class="popup-local">
			<!--popup-local-head-->
			<div class="popup-local-head">
				<div class="popup-local-title">
					<h2 class="popup-local-name">상품타입</h2>
				</div>
			</div>
			<!--//popup-local-head-->
			<!--popup-local-body-->
			<div class="popup-local-body">
				<div class="popup-content">
					<!--popup-content-body-->
					<div class="popup-content-body">
						<!--data-display-->
						<div class="data-display">
							<ul class="data-list">
								<li class="data-item">
									<div class="title">상품타입 안내</div>
									<ul class="con">
										<li>가격자율<span class="s1">자율</span> : 마켓 등에서 자유롭게 판매가를
											책정하여 판매할 수 있습니다.
										</li>
										<li>가격준수<span class="s2">준수</span> : 마켓 등에서 일정한 가격이 형성되어
											있는 상품으로, 명성코리아에서 노출되고 있는 소비자가 이상으로 판매하여야 합니다.
										</li>
										<li></li>
									</ul>
								</li>
								<li class="data-item">
									<div class="title">배송타입 안내</div>
									<ul class="con">
										<li>무료배송<span class="s3">무료</span> : 무료배송 상품입니다.
										</li>
										<li>해외배송<span class="s4">해외</span> : 해외에서 구매자에게 배송되는
											상품입니다.
										</li>
										<li></li>
									</ul>
								</li>
							</ul>
						</div>
						<!--//data-display-->
					</div>
					<!--//popup-content-body-->
				</div>
			</div>
			<!--popup-local-body-->
			<!--//popup-body-->
			<button type="button" class="btn popup-close">
				<img
					src="/${pageContext.request.contextPath}/resources/images/quick_ico_open_02.png">
			</button>
		</div>
		<!--//popup-local-->
	</div>
</div>






</body>
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>

<script>
$(document).ready(function() {
	$(".icon_detail_sns").click(function() {
		$(".sns_popupwrap").addClass('active');	
	});	
	$(".bClose").click(function() {
		$(".sns_popupwrap").removeClass('active');	
	});	

	$(".more_view1").click(function() {
		$(".layer-popup1").addClass('active');	
	});	
	$(".popup-close").click(function() {
		$(".layer-popup1").removeClass('active');
	});
		
   $("button[name='buyBtn']").click(function(){
       var goodsCount = $("#topQuantitySpinner").val();
       var goodsNum = 1; // ${goodsView.goodsNo}
      	alert("didi")
       $(location).attr("href", "orders?goodsCount=" + goodsCount + "&goodsNum=" + goodsNum );
	   
   });
		

});
</script>

<script>
	var swiper = new Swiper(".thumbSwipe", {
		spaceBetween: 10,
		slidesPerView: 4,
		freeMode: true,
		watchSlidesProgress: true,
	});
	var swiper2 = new Swiper(".DetailSwipe", {
		spaceBetween: 10,
		navigation: {
			nextEl: ".swiper-button-next",
			prevEl: ".swiper-button-prev",
		},
		thumbs: {
			swiper: swiper,
		},
	});
</script>

<script>
//다른사람이 함께 구매한상품 슬라이드
var swiper = new Swiper(".proRecommend", {
	slidesPerView: 1,
	spaceBetween: 20,
	loop: true,
	navigation: {
		nextEl: '.swiper-button-next',
		prevEl: '.swiper-button-prev',
	},
	breakpoints: {
		"@0.00": {
			slidesPerView: 2,
			spaceBetween: 15,
		},
		"@0.75": {
			slidesPerView: 2,
			spaceBetween: 15,
		},
		"@1.00": {
			slidesPerView: 4,
			spaceBetween: 15,
		},
		"@1.50": {
			slidesPerView: 6,
			spaceBetween: 15,
		},
	},
});
</script>







</html>
