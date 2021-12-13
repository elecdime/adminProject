<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>GH SHOP</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>

<body>

   <%@include file="../inc/head.jsp"%>
        <!--  left menu -->
  	<%@include file="../inc/left.jsp"%>

        <div id="seller_content" class="item3">
            <div class="local_ov01 local_ov">
<!--                 <a href="" class="ov_listall">전체목록</a> -->
                <span class="btn_ov01"><span class="ov_txt">상품준비중인 주문</span><span class="ov_num"> <c:out value="${count}"/> 건 </span></span>
            </div>

            <form name="flist" class="local_sch01 local_sch" action="${pageContext.request.contextPath}/aOrder/searchPrepare" method="get">

                <label for="sfl" class="sound_only">검색대상</label>
                <select name="searchCulumn" id="searchCulumn">
                    <option value="orderId" selected="selected">주문번호</option>
                    <option value="memId">아이디</option>               
                    <option value="orderProduct">상품명</option>
                    
                </select>

                <label for="stx" class="sound_only">검색어</label>
                <input type="text" name="searchText" id="searchText" class="frm_input">
                <button type="submit" value="검색" class="btn_submit">검색</button>
            </form>
            <button value="초기화" class="btn_submit" onclick="location.href='${pageContext.request.contextPath}/aOrder/prepareProductList'">검색초기화</button>
            
            <div class="formTitle">상품준비중 리스트 <span>검색조건에 해당하는 주문 리스트를 확인 할수 있습니다.</span></div>
<!--             <div class="adBtn"><button class="adbtn1">상품등록</button><button class="adbtn2">상품수정</button></div> -->
			<c:choose>
				<c:when test="${isSearch == null}">
            	<div id="listdiv">
            	</c:when>
            	<c:when test="${isSearch != null}">
            	<div id="listdiv" style="width:100%; height:440px; overflow:auto">
            	</c:when>
			</c:choose>
                <form name="signForm" method="post" onsubmit="return false;">
                    <input type="hidden" name="mode" value="">
					<table class="listTbl fixed">
						<tbody>
							<tr height="25" align="center" bgcolor="#5e718f">
								<th class="listTitle">주문번호</th>
								<th class="listTitle">상품명</th>
								<th class="listTitle">주문날짜</th>
								<th class="listTitle">구매자 (ID / 이름)</th>
								<th class="listTitle">총 금액</th>
								<th class="listTitle">주문상태</th>
							</tr>
							
							<c:forEach items="${prepareProductList}" var="prepareProductList">
									<c:choose>
											<c:when test="${prepareProductList.orderStat == '1'}">
												<c:set var="orderStat" value="결제 완료"></c:set>
											</c:when>
											<c:when test="${prepareProductList.orderStat == '2'}">
												<c:set var="orderStat" value="상품 준비 중"></c:set>
											</c:when>
											<c:when test="${prepareProductList.orderStat == '3'}">
												<c:set var="orderStat" value="배송 준비 중"></c:set>
											</c:when>
										
										</c:choose>

								<tr>
									<td class="listData"><c:out value="${prepareProductList.orderId}" /></td>

									<td class="listDataTitle txt-left">
									<!-- 	<table width="100%" border="0" cellpadding="0" cellspacing="0">
											<tbody>
												<td class="list_picBox"><a><img
														src="<c:url value="${aOrderList.imagePath}"/>" border="0"
														width="60" height="60" align="absmiddle"></a></td>
											</tbody>
										</table> -->
										 <nobr>
											<b><a><c:out value="${prepareProductList.goodsNm} 외 ${prepareProductList.goodsCount} 개" /></a></b>
										</nobr>
									</td>
									<td class="listData"><c:out value="${prepareProductList.orderDate}" /></td>
									<td class="listData"><nobr>
											<b><a href="/"><c:out
														value="${prepareProductList.memId}" /></a></b>
										</nobr></td>
									<td class="listData"><c:out
											value="${prepareProductList.amount} 원" /></td>
									<td class="listData"><c:out value="${orderStat }" /></td>
								</tr>
							</c:forEach>


						</tbody>
					</table>   
						<c:choose>
						<c:when test="${isSearch == null}">
							<c:if test="${pageDTO.startPage > pageDTO.pageBlock }">
								<a href="${pageContext.request.contextPath}/aOrder/prepareProductList?pageNum=${pageDTO.startPage-pageDTO.pageBlock}">[이전]</a>
							</c:if>
								
							<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
								<a href="${pageContext.request.contextPath}/aOrder/prepareProductList?pageNum=${i}">${i} </a>
							</c:forEach>
								
							<c:if test="${pageDTO.endPage < pageDTO.pageCount }">
								<a href="${pageContext.request.contextPath}/aOrder/prepareProductList?pageNum=${pageDTO.startPage+pageDTO.pageBlock}">[다음]</a>
							</c:if>
						</c:when>
						</c:choose>
				</form>
            </div>
             
            

        </div>
    </div><!--  seller_wrap  -->

	<script>
        $(document).ready(function() {
            $(".seller_menu_tit").click(function() {
                $(".seller_menu_con").removeClass('on');
                $(this).parent().find(".seller_menu_con").toggleClass('on');
            });
        });
    </script>
    
</body>
</html>
