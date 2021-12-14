<%@page import="org.apache.taglibs.standard.tag.common.xml.ForEachTag"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
							<div class="space">
										<div class="PJ_goods_border">
											<div class="thumbnail">
												<a href="${pageContext.request.contextPath}/goods_view?n=${ListDTO.goodsNo}"></a>
												<img src="<c:url value="${ListDTO.imagePath}"/>" class="middle">
												<span class="hot"></span>
												<span class="choice">
													<button href="" type="button" class="cart btn-open-layer btn-add-cart14">장바구니</button>
												</span>
											</div>
											<div class="txt">
												<a href="${pageContext.request.contextPath}/goods_view?n=${ListDTO.goodsNo}"><strong class="title">${ListDTO.goodsNm}</strong></a>
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
												<span class="cost">
													<strong><fmt:formatNumber type="currency"  value= "${ ListDTO.goodsPrice }" />원<em class="pr_unit"></em></strong>
												</span>
												<span class="del"><fmt:formatNumber type="number"  value= "${ ListDTO.fixedPrice }" />원</span>
												<div class="dc_per">20%</div>
												<br>
											</div>
											<div class="tag-box">
												<span class="tag-type2">SALE</span>
												<span class="tag-type3">무료배송</span>
											</div>
										</div>
									</div>