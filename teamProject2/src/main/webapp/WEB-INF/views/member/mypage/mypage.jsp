
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../inc/mypage_top.jsp" />

<!-- 회원간단정보 여기부터 -->

<div class="mypage_con">
	<div class="mypage_left">
		<!-- 왼쪽메뉴 여기부터 -->
		<c:import url="../inc/sideBar.jsp" />
		<!-- 왼쪽메뉴 여기까지 -->
	</div>
	<div class="mypage_right">
		<div id='printArea'>
			<!-- 본문 여기부터 -->
			<!-- +++++ mypage contents ++++ -->
			<div class="subpage_container">
				<!-- 전체 메뉴 -->
				<div class="my_index_wrap" style="">


					<!-- 최근 1개월 간 주문/배송 내역 -->
					<div class="title_container2 Bbx">
						<h3 class="title_sub6">
							<span>최근 1개월 간 주문/배송 내역</span>
						</h3>
					</div>
					<div class="my_order_step">
						<ul class="abClear">
							<li class="step1"><a href=""><span>입금 전</span></a></li>
							<li class="step2"><a href=""><span>결제확인</span></a></li>
							<li class="step3"><a href=""><span>상품준비중</span></a></li>
							<li class="step4"><a href=""><span>배송중</span></a></li>
							<li class="step5"><a href=""><span>배송완료</span></a></li>
						</ul>
					</div>
					<!--my_order_step-->

					<div id="summary_contents">
						<div class="titarea3">
							<strong>최근주문내역</strong> <span>고객님의 최근 15일동안 주문하신 내역입니다.</span> <span
								class='btn'><a href="mypage_orderlist.php">전체보기</a></span>
						</div>

						<!--
						<?
						include "../source/mypage_order_list_short.inc.php";
						?>
-->

						<div class="msTbl">
							<table>
								<colgroup>
									<col width="95">
									<!-- 주문번호 -->
									<col>
									<!-- 제 품 명 -->
									<col width="120">
									<!-- 결제금액 -->
									<col width="120">
									<!-- 주문현황 -->
									<col width="120">
									<!-- 주문일자 -->
								</colgroup>
								<thead>
									<tr>
										<th class="mypage_tblTitle">주문번호</th>
										<th class="mypage_tblTitle">제 품 명</th>
										<th class="mypage_tblTitle">결제금액</th>
										<th class="mypage_tblTitle">주문현황</th>
										<th class="mypage_tblTitle">주문일자</th>
									</tr>
								</thead>
								<tbody>
<%-- 								<c:forEach var = "orderDTO" items = "${orderList }"> --%>
<!-- 									<tr align="center"> -->
<!-- 										<td class="pd_5 _detail_td"><a -->
<%-- 											href="${pageContext.request.contextPath}/goods_view?n=${orderDTO.goodsNo}">${orderDTO.orderId}</a> --%>
<!-- 											</td> -->
<!-- 										<td align="center" class="pd_5 gInfo_td"> -->

<!-- 											<div class='tIn_gListInfo'> -->
<!-- 												<div class='gImg'> -->
<!-- 													<a -->
<%-- 														href="${pageContext.request.contextPath}/goods_view?n=${orderDTO.goodsNo}" --%>
<!-- 														title="클릭시 제품의 상세정보를 볼수 있습니다."><img -->
<%-- 														src='${orderDTO.imagePath }' border='0' --%>
<!-- 														width='50' height='50' border='0' -->
<!-- 													></a> -->
<!-- 												</div> -->
<!-- 												<div class='gInfo'> -->
<!-- 													<a -->
<%-- 														href="${pageContext.request.contextPath}/goods_view?n=${orderDTO.goodsNo}" --%>
<%-- 														title="클릭시 제품의 상세정보를 볼수 있습니다." class="g_detail">${orderDTO.goodsNm }</a> <font class="opt_txt"></font> --%>
<!-- 												</div> -->
<!-- 											</div> -->

<!-- 										</td> -->
<%-- 										<td class="pagenumber">${orderDTO.amount }</td> --%>
<%-- 										<td class="pagenumber">${orderDTO.orderStat }</td> --%>
<%-- 										<td class="pagenumber">${orderDTO.orderDate }</td> --%>
<!-- 									</tr> -->
<%-- 									</c:forEach> --%>
									
								</tbody>
							</table>

						</div>

						<div id="summary_contents">
							<div class="titarea3">
								<strong>상품보관함</strong> <span>고객님의 최근 15일동안 주문하신 내역입니다.</span> <span
									class='btn'><a href="mypage_wishlist.php">전체보기</a></span>
							</div>
							<!--
							<?
							include "../source/mypage_wish_list_short.inc.php";
							?>
-->


							<div class="order_list_wrap type2">
								<table class="fixed">
									<colgroup>
										<col width=40>
										<col width=70>
										<col>
										<col width=70>
										<col width=90>
										<col width=64>
									</colgroup>
									<thead>
										<tr>
											<th class="mypage_tblTitle">선택</th>
											<th class="mypage_tblTitle">제품번호</th>
											<th class="mypage_tblTitle">제 품 명</th>
											<th class="mypage_tblTitle">소비자가</th>
											<th class="mypage_tblTitle">판매가</th>
											<th class="mypage_tblTitle">적립금</th>
											<th class="mypage_tblTitle">상태</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td class="seq"><input type="checkbox" name="mark[]"
												value="1"></td>
											<td class="pnum"><a
												href="http://www.msgood4u.com/html/goods/goods_detail.php?g_code=UKA9VK615d557f1996a&s_g_levelcode=020000000&s_g_level1=20">3695</a></td>
											<td align=left>
												<div class="order_list">
													<table width=100% border='0' cellpadding='0'
														cellspacing='0' class="fixed">
														<tr>
															<td width=57><img
																src='/files/goods/020000000/20211006171137_615d5a3930e3b.jpg'
																border='0' width='50' height='50' border='0'
																align=absmiddle></td>
															<td><a
																href="http://www.msgood4u.com/html/goods/goods_detail.php?g_code=UKA9VK615d557f1996a&s_g_levelcode=020000000&s_g_level1=20">히말라야
																	핑크소금4병선물세트</a></td>
														</tr>
													</table>
												</div>
											</td>
											<td class="sprice">0원</td>
											<td class="price">21,000원 <br>
											</td>
											<td class="point_t2"><span class='font_11s'> 105
													점</span></td>
											<td class="delbtn"><a
												href="javascript:checkDelete('1');" class='myord_bt01'><span>삭제</span></a></td>
										</tr>
									</tbody>
								</table>
							</div>
							<iframe name='wish_hiddenFrm'
								style="display: none; width: 100%; height: 200px;"></iframe>
							<script>
function checkDelete(SEQ)
{
	var ans=false;
	ans=confirm("삭제하시겠습니까?");
	if(ans==true) wish_hiddenFrm.location.href=main_html+"shop/orderExe.php?mode=wishlist_delete&seq="+SEQ;
	else return;
}
</script>

						</div>

						<div id="summary_contents">
							<div class="titarea3">
								<strong>상품후기</strong> <span></span> <span class='btn'></span>
							</div>


							<div class="msTbl">
								<table>
									<colgroup>
										<col width='150' />
										<col />
									</colgroup>
									<thead>
										<tr>
											<td>등록일</td>
											<td>제목 / 제품명</td>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td colspan="2" align="center"><div class="noData">상품후기
													내역이 없습니다.</div></td>
										</tr>
									</tbody>
								</table>
							</div>

						</div>

						<c:import url="../inc/mypageBottom.jsp" />