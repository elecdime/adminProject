<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
        <div id="seller_lnb" class="item2">
            <div class="store"><a href="/">GH SH<span>O</span>P</a></div>
            <ul class="seller_menu">
                <li>
                    <a class="seller_menu_tit">상품관리</a>
                    <ol class="seller_menu_con">
                        <li><a href="${pageContext.request.contextPath}/aProduct/product">상품관리</a></li>
                        <li><a href="${pageContext.request.contextPath}/aProduct/productinsert">상품등록</a></li>
                    </ol>
                </li>
                <li>
                    <a class="seller_menu_tit">쿠폰관리</a>
                    <ol class="seller_menu_con">
                        <li><a href="${pageContext.request.contextPath}/aEvent/coupon">쿠폰리스트</a></li>
                        <li><a href="${pageContext.request.contextPath}/aEvent/all_coupon">지급현황</a></li>
                    </ol>
                </li>
                <li>
                    <a class="seller_menu_tit">회원관리</a>
                    <ol class="seller_menu_con">
                        <li><a href="${pageContext.request.contextPath}/aMember/member">회원리스트</a></li>
                        <li><a href="${pageContext.request.contextPath}/aMember/blackList">블랙리스트</a></li>
                    </ol>
                </li>
                <li>
                    <a class="seller_menu_tit">주문관리</a>
                    <ol class="seller_menu_con">
                        <li><a href="${pageContext.request.contextPath}/aOrder/aOrderList">전체주문목록</a></li>
                        <li><a href="${pageContext.request.contextPath}/aOrder/prepareProductList">재고부족목록</a></li>
                        <li><a href="${pageContext.request.contextPath}/aOrder/sendaOrderCheck">발송 확인</a></li>
                        <li><a href="${pageContext.request.contextPath}/aOrder/deliveryCheck">배송 확인</a></li>
                        <li><a href="${pageContext.request.contextPath}/aOrder/payback">환불신청현황</a></li>
                    </ol>
                </li>
            </ul>
        </div>
