<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="org.apache.taglibs.standard.tag.common.xml.ForEachTag"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
		<div id="container">
			<div class="innerContent">
			</div>
        	<div class="search_panel_wrapper Search Search_S">
				<div class="innerContent">	
					<div id="subcateList">
					<div id="subcatedepth1" class="ssSection">
						<div class="ssTitle"><span>카테고리 '대'</span></div><!--ssTitle-->
						<div class="ssCont">
						<c:if test="${param.c != null }"><c:set var="Cparams" value="${param.c}"/></c:if>
							<div class="sBox">
							<a  class="<c:if test="${countMav.cateCode eq CartegoryDTO.cateCode}">on</c:if>"
							href="${pageContext.request.contextPath}/sub?c=&l=&keyword=&s=&e=&sK=">All</a></div>
							<c:forEach items="${menuCategory}" var="CartegoryDTO">
								<c:if test="${empty CartegoryDTO.cateCodeRef}">
									<div class="sBox">
									<a 
									class="<c:if test="${countMav.cateCode eq CartegoryDTO.cateCode}">on</c:if>"
									href="${pageContext.request.contextPath}/sub?c=${CartegoryDTO.cateCode }&l=A&keyword=&s=&e=&sK=">${CartegoryDTO.cateName}</a></div>
								</c:if>
							</c:forEach>
						</div><!--ssCont-->
					</div><!--subcatedepth1-->
					<div id="subcatedepth2" class="ssSection">
						<div class="ssTitle"><span>카테고리 '중'</span></div><!--ssTitle-->
							<c:forEach var="CartegoryDTO" items="${menuCategory}">
								<div class="ssCont">
								<c:if test = "${fn : contains(Cparams, CartegoryDTO.cateCodeRef) and not empty CartegoryDTO.cateCodeRef}">
								<div class="sBox">
								<a class="<c:if test="${countMav.cateCode eq CartegoryDTO.cateCode}">on</c:if>" 
								href="${pageContext.request.contextPath}/sub?c=${CartegoryDTO.cateCode }&l=B&keyword=&s=&e=&sK=" >${CartegoryDTO.cateName}</a></div>
								</c:if>	
								</div><!--ssCont-->
							</c:forEach>
					</div><!--subcatedepth2-->
					</div>
						<form action="${pageContext.request.contextPath}/sub">
						<c:if test="${param.k != null }"><c:set var="Kparams" value="${param.keyword}"/></c:if>
						<c:if test="${param.l != null }"><c:set var="Lparams" value="${param.l}"/></c:if>
								<input type="hidden" name="c" value="${Cparams}">
								<input type="hidden" name="l" value="${Lparams}">
								<input type="hidden" name="keyword" value="${Kparams}">
							<div id="subSearchForm" class="ssSection" style="display: none;">
								<div class="ssTitle">
									<span>가격</span>
								</div>
								<div class="ssCont">
									<input type="text" id="sprice" name="s" maxlength="8" placeholder="최저가 : ${countMav.sprice}" ><span class="tilde">
									~</span><input type="text" id="eprice" name="e" maxlength="8" placeholder="최고가  : ${countMav.eprice}">
								</div>
								<div class="ssTitle">
									<span>결과 내 재검색</span>
								</div>
								<div class="ssCont">
									<input type="text" id="sword" name="sK" value="${countMav.subKeyword}">
									<button class="btn_kwdSC iconfont ftic-search" onclick="">검색하기</button>
								</div>
							</div><!--subSearchForm-->
						</form>
					<span class="btn_dtlSC">상세검색</span>
				</div><!--innerContent-->
			</div><!--search_panel_wrapper-->
			
<script type="text/javascript">
//상세검색 펼침/접기
$(".btn_dtlSC").click(function(){
	if($(this).hasClass("on"))
	{
		$(this).text("상세검색").removeClass("on");
		$("#subSearchForm").stop(true,true).slideUp(400);
		$(".sublist_lmenu>ul").height($(".sublist_lmenu>ul").height()-$("#subSearchForm").height())
	}
	else
	{
		$(this).text("닫기").addClass("on");
		$("#subSearchForm").stop(true,true).slideDown(400);
		setTimeout(chkSize,400)
		function chkSize(){
			$(".sublist_lmenu>ul").height($(".sublist_lmenu>ul").height()+$("#subSearchForm").height())
		}
	}
});
</script>	
	
<div class="goods-align">
	<div class="innerContent">
		<span class="tc"> <strong>${pageDTO.getCount()}</strong>개의 상품이 있습니다.</span>
		<form name="frmList" action="${pageContext.request.contextPath}/sub">
			<fieldset>
				<legend>상품 정렬 폼</legend>
								<c:if test="${param.c != null }"><c:set var="Cparams" value="${param.c}"/></c:if>
								<c:if test="${param.l != null }"><c:set var="Lparams" value="${param.l}"/></c:if>
								<c:if test="${param.keyword != null }"><c:set var="Kparams" value="${param.keyword}"/></c:if>
								<c:if test="${param.e != null }"><c:set var="eparams" value="${param.e}"/></c:if>
								<c:if test="${param.s != null }"><c:set var="sparams" value="${param.s}"/></c:if>
								<c:if test="${param.sK != null }"><c:set var="SKparams" value="${param.sK}"/></c:if>
								<c:if test="${param.searchType == null }"><c:set var="searchType" value="${param.searchType}"/></c:if>
								<c:if test="${param.pageSize == null }"><c:set var="pageSizeaaa" value="${param.pageSize}"/></c:if>
								<input type="hidden" name="c" value="${Cparams}">
								<input type="hidden" name="l" value="${Lparams}">
								<input type="hidden" name="keyword" value="${Kparams}">
								<input type="hidden" name="e" value="${eparams}">
								<input type="hidden" name="s" value="${sparams}">
								<input type="hidden" name="sK" value="${SKparams}">
								<input type="hidden" name="searchType" value="${searchType}">
							
				<div class="align">
					<ul>
						<li>
							<input type="radio" id="sort1" class="radio" name="sT" value="orderCnt desc,reviewCnt desc" onchange="this.form.submit()"  >
								<!-- 주문많은순 리뷰많은순 -->
							<label for="sort1" class="<c:if test="${countMav.searchType eq 'orderCnt desc,reviewCnt desc'}">on</c:if>">판매인기순</label>
						</li>
						<li>
							<input type="radio" id="sort3" class="radio" name="sT" value="goodsPrice asc" onchange="this.form.submit()"><!-- 가격오름차순 판매일 내림차순 -->
							<label for="sort3"class="<c:if test="${countMav.searchType eq 'goodsPrice asc'}">on</c:if>">낮은가격순</label>
						</li>
						<li>
							<input type="radio" id="sort4" class="radio" name="sT" value="goodsPrice desc,salesStartYmd desc" onchange="this.form.submit()"><!-- 가격내림차순 판매일 내림차순 -->
							<label for="sort4" class="<c:if test="${countMav.searchType eq 'goodsPrice desc,salesStartYmd desc'}">on</c:if>">높은가격순</label>
						</li>
						<li>
							<input type="radio" id="sort5" class="radio" name="sT" value="reviewCnt desc,salesStartYmd desc" onchange="this.form.submit()"><!--리뷰 내림차순 판매일 내림차순 -->
							<label for="sort5" class="<c:if test="${countMav.searchType eq 'reviewCnt desc,salesStartYmd desc'}">on</c:if>">상품평순</label>
						</li>
						<li>
							<input type="radio" id="sort6" class="radio" name="sT" value="salesStartYmd asc" onchange="this.form.submit()"><!-- 판매일 오름차순 -->
							<label for="sort6" class="<c:if test="${countMav.searchType eq 'salesStartYmd asc'}">on</c:if>">등록일순</label>
						</li>
					</ul>
					<div class="choice">
						<div>
							<select id = "pageSize" name="pageSize" class="tune" onChange="this.form.submit()">
							<c:forEach var="selectA"  begin="10" end="40" step="10">
								<option value="${selectA}" <c:if test="${selectA == param.pageSize }">selected</c:if>>${selectA}개씩보기</option>
							</c:forEach>
<!-- 								<option value="10">10개씩보기</option> -->
<!-- 								<option value="20">20개씩보기</option> -->
<!-- 								<option value="30">30개씩보기</option> -->
<!-- 								<option value="40">40개씩보기</option> -->
							</select>
						</div>
					</div>
				</div>
			</fieldset>
		</form><!--frmList-->
	</div><!--innerContent-->
</div><!--goods-align-->
			<div class="sub_prdlist innerContent">
				<div class="item-display-wrap">
					<div class="item-display type-cart clear cboth">
						<div class="list innerContent">
							<!-- 상품목록 -->
							<ul>
							<c:forEach var="ListDTO" items="${categoryList }">
							<li class="line_4">
							<%@ include file="../include/list.jsp"%>
							</li>
							</c:forEach>
							</ul>
							<!-- 상품목록 끝 -->
							<!-- 페이징 -->
							<!-- c:set var="params" URL을 만들때 사용한다 -->
							<div class="paging">
							<c:set var="params" value=""/>
								<c:if test="${param.c != null }"><c:set var="params" value="${params}&c=${param.c}"/></c:if>
								<c:if test="${param.l != null }"><c:set var="params" value="${params}&l=${param.l}"/></c:if>
								<c:if test="${param.keyword != null }"><c:set var="params" value="${params}&keyword=${param.keyword}"/></c:if>
								<c:if test="${param.s != null }"><c:set var="params" value="${params}&s=${param.s}"/></c:if>
								<c:if test="${param.e != null }"><c:set var="params" value="${params}&e=${param.e}"/></c:if>
								<c:if test="${param.sK != null }"><c:set var="params" value="${params}&sK=${param.sK}"/></c:if>
								<c:if test="${param.sT != null }"><c:set var="params" value="${params}&sT=${param.sT}"/></c:if>
								<c:if test="${pageDTO.startPage > pageDTO.pageBlock}">
									<a href="${pageContext.request.contextPath}/sub?${params}&pageNum=${pageDTO.startPage-pageDTO.pageBlock}">[이전]</a>
								</c:if>
								<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage}" step="1">
									<a href="${pageContext.request.contextPath}/sub?${params}&pageNum=${i}">${i}</a>
								</c:forEach>
								<c:if test="${pageDTO.endPage < pageDTO.pageCount }">
									<a href="${pageContext.request.contextPath}/sub?${params}&pageNum=${pageDTO.startPage+pageDTO.pageBlock}">[다음]</a>
								</c:if>
							</div>
							<!-- //페이징 끝-->
						</div><!-- proslide01 -->
					</div><!-- item-display -->
				</div><!-- item-display-wrap -->
			</div><!-- 건강기능식품 -->

		</div><!-- container -->		
		<footer id="footer">
			<div class="con1">
				<div class="innerContent">
					<div class="customInfo">
						<h3>고객센터</h3>
						<dl>
							<dt>상담시간</dt>
							<dd>
								<span class="day">(<em>10:00 ~ 17:00</em>, 주말.공휴일 휴무)</span><!-- 온라인 고객센터 운영시간으로 변경(하드코딩) -->
								<span aria-label="전화번호" class="phoneNum">070-4196-0927</span>
							</dd>
						</dl>
						<a href="" role="button" class="fbtn">자주묻는 질문</a>
								<a href="" role="button" class="fbtn">1:1문의</a>
					</div><!-- //customInfo -->
					<div class="bankInfo">
						<h3>입금계좌</h3>
						<div>
							<p><img src="/images/bnk.png"></p>
							<p class="banknum">101-2076-9077-04</p>
							<p class="bankname">주식회사엠에스코리아</p>
							<a href="" role="button" class="fbtn">구매안전 서비스 가입확인</a>
						</div>
					</div><!-- //bankInfo -->
					<div class="noticeInfo">
						<div id="noticeTab01" class="tabContentWrap tabON">
							<h3 class="hidden">공지사항</h3>
							<ul class="noticeList">

								<li>
									<a href="">
										<span>[긴급][중요]상품명 절대 준수상품 - 키워드 주의 상품 </span><em>2021.08.20</em>
									</a>
								</li>
								<li>
									<a href="">
										<span>[리뉴얼안내]4074_뉴트로웨이 WPC 500g외1건</span><em>2021.08.20</em>
									</a>
								</li>
								<li>
									<a href="">
										<span>발주시간 안내-6월4일자 업데이트</span><em>2021.08.20</em>
									</a>
								</li>
								<li>
									<a href="">
										<span>[필독] ★상품명절대준수★ 품목 관련 사항</span><em>2021.08.20</em>
									</a>
								</li>
							</ul>
							<a href="" class="txtLink lineU">더보기</a>
						</div>
					</div><!-- //noticeInfo -->
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
						<em class="noLine">주식회사 엠에스코리아</em>
						<em>주소: 부산광역시 동래구 사직북로34번길 36&amp;엠에스코리아</em>
						<em>대표: 김동훈</em>
						<em>제휴문의 : 070-4196-0927</em>
						<em>FAX : 051-501-0927</em>
						<em>개인정보관리책임자 : 김동훈</em>
						<br>
						<em class="noLine">사업자등록번호 876-81-02200<a href="" class="btn_line">사업자 정보 확인</a></em>
						<em>
						</em>
						<em class="noLine">통신판매번호 : 제2021-부산동래-0686호</em>
						<em>건강기능식품판매업 : 제2021-0134642호</em>
						<em>관리자이메일 : <a href="mailto:mskorea3118@naver.com">mskorea3118@naver.com</a></em>
					</div>
					<em>
						<p>Copyright © 2021 주식회사 엠에스코리아 . All Rights Reserved.</p>
					</em>
				</div>
				<div class="copySns">
					<ul class="navi-list">
						<li class="navi-item facebook">
							<a class="navi-name" href="" target="_blank">
								<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24">
									<title>facebook</title>
									<path d="M16,9.6L15.7,12h-2.1v7h-3.1v-7H9V9.6h1.6V8.1c0-2,0.9-3.1,3.4-3.1H16v2.4h-1.3c-1,0-1,0.3-1,1l0,1.2H16z"></path>
								</svg>
							</a>
						</li>
						<li class="navi-item instagram">
							<a class="navi-name" href="" target="_blank">
								<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24">
									<title>instagram</title>
									<path d="M12,8.4c-2,0-3.6,1.6-3.6,3.6s1.6,3.6,3.6,3.6s3.6-1.6,3.6-3.6S14,8.4,12,8.4z M12,14.4c-1.3,0-2.4-1.1-2.4-2.4s1.1-2.4,2.4-2.4s2.4,1.1,2.4,2.4S13.3,14.4,12,14.4z M16.4,8.2C16.4,8.6,16,9,15.6,9c-0.4,0-0.8-0.4-0.8-0.8s0.4-0.8,0.8-0.8C16,7.4,16.4,7.8,16.4,8.2z M15.3,5.1H8.7c-2,0-3.6,1.6-3.6,3.6v6.6c0,2,1.6,3.6,3.6,3.6h6.6c2,0,3.6-1.6,3.6-3.6V8.7C18.9,6.7,17.3,5.1,15.3,5.1z M17.7,15.3c0,1.3-1.1,2.4-2.4,2.4H8.7c-1.3,0-2.4-1.1-2.4-2.4V8.7c0-1.3,1.1-2.4,2.4-2.4h6.6c1.3,0,2.4,1.1,2.4,2.4V15.3z"></path>
								</svg>
							</a>
						</li>
						<li class="navi-item youtube">
							<a class="navi-name" href="" target="_blank">
								<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24">
									<title>youtube</title>
									<path d="M10.4,9.7l4,2.3l-4,2.3V9.7L10.4,9.7z M20.9,11.8v0.3c0,0.4,0,2.8-0.4,4.1c-0.2,0.9-1,1.6-1.9,1.9c-1.3,0.3-5.5,0.4-6.5,0.4h-0.3c-1,0-5.2,0-6.5-0.4c-0.9-0.2-1.6-1-1.9-1.9c-0.3-1.1-0.4-3.3-0.4-3.9v-0.4c0-0.7,0.1-2.8,0.4-3.9C3.7,7,4.4,6.2,5.3,6c1.2-0.3,4.9-0.4,6.3-0.4h0.8c1.3,0,5.1,0.1,6.2,0.4c0.9,0.2,1.6,1,1.9,1.9C20.9,9,20.9,11.1,20.9,11.8z M19.4,8.2L19.4,8.2c-0.1-0.5-0.5-0.9-1-1c-1-0.3-4.9-0.3-6.3-0.3c-1.4,0-5.3,0.1-6.3,0.3c-0.5,0.1-0.9,0.5-1,1C4.3,9.4,4.3,12,4.3,12c0,0,0,2.6,0.3,3.8c0.1,0.5,0.5,0.9,1,1c1,0.3,4.9,0.3,6.3,0.3c1.4,0,5.3-0.1,6.3-0.3c0.5-0.1,0.9-0.5,1-1c0.3-1.2,0.3-3.8,0.3-3.8C19.7,12,19.7,9.4,19.4,8.2z"></path>
								</svg>
							</a>
						</li>
						<li class="navi-item blog">
							<a class="navi-name" href="" target="_blank">
								<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24">
									<title>blog</title>
									<path d="M9.6,9.7v4.7H8v-4.2c0-1.3-0.7-1.4-0.8-1.4h0V7C9.5,7,9.6,9.2,9.6,9.7z M6.6,11.9c0,2.6-2.4,2.7-2.4,2.7c-1,0-1.4-0.7-1.4-0.7v0.6H1V7.2h1.7v2.7c0.7-0.7,1.5-0.7,1.5-0.7C6.5,9.2,6.6,11.9,6.6,11.9z M4.9,11.9c0-0.6-0.5-1.1-1.1-1.1c-0.6,0-1.1,0.5-1.1,1.1c0,0.6,0.5,1.1,1.1,1.1C4.4,13,4.9,12.5,4.9,11.9z M23,9.4v4.9c0,2.6-2.2,2.7-2.5,2.7h-0.7v-1.5h0.4c1.2,0,1.1-1.3,1.1-1.3v-0.4c-0.5,0.6-1.3,0.7-1.5,0.7h0c-2.2,0-2.4-2.2-2.4-2.5v0c0-2.5,2-2.6,2.4-2.6h0c1,0,1.5,0.7,1.5,0.7V9.4H23z M21.4,11.9c0-0.6-0.5-1.1-1.1-1.1c-0.6,0-1.1,0.5-1.1,1.1c0,0.6,0.5,1.1,1.1,1.1C20.9,13,21.4,12.5,21.4,11.9z M16.6,11.9L16.6,11.9c0,2.7-2.9,2.7-2.9,2.7c-2.7,0-2.8-2.2-2.8-2.6v-0.1c0-2.5,2.5-2.6,2.8-2.7l0,0C16.4,9.3,16.6,11.5,16.6,11.9z M14.8,11.9c0-0.6-0.5-1.1-1.1-1.1c-0.6,0-1.1,0.5-1.1,1.1c0,0.6,0.5,1.1,1.1,1.1C14.3,13,14.8,12.5,14.8,11.9z"></path>
								</svg>
							</a>
						</li>
					</ul>
				</div>				
			</div>
		</footer><!-- footer -->
		<button type="button" class="btnTop"><span class="hide">TOP</span></button>
		<div class="rightQuick_main">
			<div class="right_menu_hidden" >
				<div class="toggle-right">
					<div class="toggle-click open">
						<div class="toggle-click_img_02"></div>
					</div>
					<div class="toggle_ico">
						<div class="ico_inner">
							<div class="quick_ico_style quick_ico_style_first">
								<div class="quick_ico_img quick_tooltip" quick-title="대량주문안내">
									<a href=""><span class="s1"><img src="/images/quick_ico_01.png"></span></a>
								</div>
							</div>
							
							<div class="quick_ico_style photoReview-display display_on">
								<div class="quick_ico_img quick_tooltip" quick-title="QnA"> 
									<a href=""><span class="s2"><img src="/images/quick_ico_02.png"></span></a>
								</div>
							</div>
							<div class="view_menu quick_ico_style">
								<div class="quick_ico_img quick_tooltip view_btn" quick-title="최저가미준수신고">
									<a href=""><span class="s3"><img src="/images/quick_ico_03.png"></span></a>
								</div>															
							</div>
							<div class="view_menu quick_ico_style">
								<div class="quick_ico_img quick_tooltip view_btn" quick-title="필수서식자료">
									<a href=""><span class="s4"><img src="/images/quick_ico_04.png"></span></a>
								</div>								
							</div>
							<div class="sns_on">
								<div class="quick_ico_style">
									<div class="quick_ico_img_add quick_ico_sns quick_tooltip" quick-title="인스타그램">
										<a href=""><span><img src="/images/quick_ico_instagram.png"></span></a>
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
									평일 : AM10:00 ~ PM17:00<br>
									점심 : PM12:00 ~ PM1:00<br>
									주말 및 공휴일 휴무
									<a href="" class="kakach"><img src="/images/kakach.jpg"></a>
								</div>
								<div class="tle">계좌 안내</div>
								<div class="info">
									<img src="/images/qbnk.png">
									<strong>101-2076-9077-04</strong>
									예금주：주식회사엠에스코리아
								</div>
								<a href="">문의 게시판</a>
								<a href="">자주 묻는 질문</a>								
							</div>
						</div>
					</div>
				</div><!-- toggle-right -->
			</div><!-- right_menu_hidden -->
		</div><!-- rightQuick_main -->
	</div><!-- mainLayout -->
</body>
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</html>








