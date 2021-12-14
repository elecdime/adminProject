
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

				
					<!--my_order_step-->

					<div id="summary_contents">
						<div class="titarea3">
							<strong>주문취소/교환/반품</strong>
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
									<col width="70">
									<!-- 주문현황 -->
									<col width="65">
									<!-- 주문일자 -->
									<col width="65">
									<!-- 주문일자 -->
								</colgroup>
								<thead>
									<tr>
										<th class="mypage_tblTitle">주문번호</th>
										<th class="mypage_tblTitle">제 품 명</th>
										<th class="mypage_tblTitle">결제금액</th>
										<th class="mypage_tblTitle">주문현황</th>
										<th class="mypage_tblTitle">주문일자</th>
										<th class="mypage_tblTitle">주문취소</th>
									</tr>
								</thead>
								<tbody>
									<tr align="center">
										<td class="pd_5 _detail_td"><a
											href="http://www.msgood4u.com/html/mypage/mypage_orderinfo.php?ordernum=1637045421284&page=">1637045421284</a>
											<br>
										<a
											href="http://www.msgood4u.com/html/mypage/mypage_orderinfo.php?ordernum=1637045421284&page="
											class="_detail">[상세보기]</a></td>
										<td align="center" class="pd_5 gInfo_td">

											<div class='tIn_gListInfo'>
												<div class='gImg'>
													<a
														href="http://www.msgood4u.com/html/goods/goods_detail.php?g_code=44MREG6170cde97b497&s_g_levelcode=&s_g_level1=19"
														title="클릭시 제품의 상세정보를 볼수 있습니다."><img
														src='/files/goods/019002000/20211021111817.jpg' border='0'
														width='50' height='50' border='0'
														onerror="this.src = 'https://png.pngtree.com/png-vector/20190926/ourmid/pngtree-groceries-bag-line-icon-vector-png-image_1744058.jpg'"
														align=absmiddle></a>
												</div>
												<div class='gInfo'>
													<a
														href="http://www.msgood4u.com/html/goods/goods_detail.php?g_code=44MREG6170cde97b497&s_g_levelcode=&s_g_level1=19"
														title="클릭시 제품의 상세정보를 볼수 있습니다." class="g_detail">아르채움
														신파라바이오틱스 2.5gx30포</a> <font class="opt_txt"></font>
												</div>
											</div>

										</td>
										<td class="pagenumber">24,500 원</td>
										<td class="pagenumber">주문완료</td>
										<td class="pagenumber">2021.11.16</td>
										<td class="pagenumber">사유확인중</td>
									</tr>
									
								</tbody>
							</table>

						</div>



						<c:import url="../inc/mypageBottom.jsp" />