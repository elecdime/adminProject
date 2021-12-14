<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

					<div id="summary_contents">
							<div class="titarea3">
								<strong>개인정보확인</strong>
								<span class='btn'><a href="http://www.msgood4u.com/html/mypage/myinfo.php">수정</a></span>
							</div>

							<div class="myChkInfoWrap">

									<div class="emailBox">
										<span class="f_b">이메일주소</span>
										<span class="pd_l10">${mDTO.email}</span>
										<span class="pd_l10">메일수신동의여부 : <font style='color:#ff7171;'>${mDTO.mal_cert}</font></span>
									</div>
									<div class="hpBox">
										<span class="f_b">휴대폰번호</span>
										<span class="pd_l10">${mDTO.phone}</span>
									</div>

							</div>
					</div>



					<div class="order_intro">
						


						<dl class="info_tip">
							<dt>주문/배송 TIP</dt>
							<dd>
								<ul>
									<li>주문취소는 <strong>입금대기/결제확인 상태의 상품</strong>만 가능합니다.</li>
									<li>일부 <strong>주문취소에 제한이 있는 상품</strong>의 경우, 1:1문의를 이용해주시기 바랍니다.</li>
									<li>교환/반품신청은 배송완료한 날로부터 <strong>00일 이내에 신청 가능</strong>하며, 배송완료 후 00일이 경과한 상품의 경우, 1:1문의를 이용해주시기 바랍니다.</li>
								</ul>
							</dd>
						</dl><!--info_tip-->
					</div><!--order_intro-->
				</div>

			</div><!--subpage_container-->
			<!-- +++++ //mypage contents ++++ -->
			<!-- 본문 여기까지 -->
			</div>
			</div>




		</div><!--mypage-->
	</div><!--mypage_con_wrap-->
</div><!--  container --><!--container-->

</body>

</html>
