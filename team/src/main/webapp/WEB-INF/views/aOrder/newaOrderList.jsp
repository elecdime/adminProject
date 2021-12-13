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
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
</head>


<body>


  <%@include file="../inc/head.jsp"%>
        <!--  left menu -->
  <%@include file="../inc/left.jsp"%>

        <div id="seller_content" class="item3">
            <div class="local_ov01 local_ov">
<!--                 <a href="" class="ov_listall">전체목록</a> -->
                <span class="btn_ov01"><span class="ov_txt">등록된 상품</span><span class="ov_num"><c:out value="${cnt } 건" /></span></span>
            </div>

            <form name="flist" class="local_sch01 local_sch" >
                <input type="hidden" name="save_stx" value="">

                          

                <label for="sfl" class="sound_only">검색대상</label>
                <select name="sfl" id="sfl">
                    <option value="num" selected="selected">주문번호</option>
                    <option value="name">상품명</option>
                    <option value="user">구매자</option>               
                    
                </select>

                <label for="stx" class="sound_only">검색어</label>
                <input type="text" name="stx" value="" id="stx" class="frm_input">
                <button type="submit" value="검색" class="btn_submit">검색</button>
            </form>

            <div class="formTitle">새주문 리스트 <span>검색조건에 해당하는 리스트를 확인 할수 있습니다.</span></div>
<!--             <div class="adBtn"><button class="adbtn1">상품등록</button><button class="adbtn2">상품수정</button></div> -->
            <div id="listdiv">
                <form name="signForm" method="post" onsubmit="return false;">
                    <input type="hidden" name="mode" value="">
					<table class="listTbl fixed">
						<tbody>
							<tr height="25" align="center" bgcolor="#5e718f">
								<th><input type="checkbox" name="" value="" onclick=""></th>
								<th class="listTitle">주문번호</th>
								<th class="listTitle">상품번호</th>
								<th class="listTitle">상품명</th>
								<th class="listTitle">주문수량</th>
								<th class="listTitle">주문날짜</th>
								<th class="listTitle">구매자 (ID / 이름)</th>
								<th class="listTitle">총 금액</th>
								<th class="listTitle">주문상태</th>
								<th class="listTitle">클레임상태</th>

							</tr>

							<c:forEach items="${aOrderList}" var="aOrderList">

								<tr>
									<td class="listData"><input type="checkbox" name=""
										value=""></td>
									<td class="listData"><c:out value="${aOrderList.orderId}" /></td>
									<td class="listData"><c:out value="${aOrderList.goodsNo}" /></td>

									<td class="listDataTitle txt-left">
										<table width="100%" border="0" cellpadding="0" cellspacing="0">
											<tbody>
												<td class="list_picBox"><a><img
														src="<c:url value="${aOrderList.imagePath}"/>" border="0"
														width="60" height="60" align="absmiddle"></a></td>
											</tbody>
										</table> <nobr>
											<b><a href="/"><c:out value="${aOrderList.goodsNm}" /></a></b>
										</nobr>
									</td>


									<td class="listData"><c:out
											value="${aOrderList.orderCnt} EA" /></td>
									<td class="listData"><c:out value="날짜" /></td>
									<td class="listData"><nobr>
											<b><a href="/"><c:out
														value="${aOrderList.memId} / ${aOrderList.orderNm}" /></a></b>
										</nobr></td>
									<td class="listData"><c:out
											value="${aOrderList.goodsPrice * aOrderList.orderCnt} 원" /></td>
									<td class="listData"><c:out value="주문상태" /></td>
									<td class="listData"><c:out value="클레임상태" /></td>



								</tr>
							</c:forEach>


						</tbody>
					</table>
					
					<!-- 페이징 -->
					<c:if test="${pageDTO.startPage > pageDTO.pageBlock }">
					<a href="${pageContext.request.contextPath}/aOrder/aOrderList?pageNum=${pageDTO.startPage-pageDTO.pageBlock}">[이전]</a>
					</c:if>
					
					<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
						<a href="${pageContext.request.contextPath}/aOrder/aOrderList?pageNum=${i}">${i} </a>
					</c:forEach>
					
					<c:if test="${pageDTO.endPage < pageDTO.pageCount }">
					<a href="${pageContext.request.contextPath}/aOrder/aOrderList?pageNum=${pageDTO.startPage+pageDTO.pageBlock}">[다음]</a>
					</c:if>

				</form>
            </div>
             
            

        </div>
    </div><!--  seller_wrap  -->


    <script>
					$(document).ready(
							function() {
								$(".seller_menu_tit").click(
										function() {
											$(".seller_menu_con").removeClass(
													'on');
											$(this).parent().find(
													".seller_menu_con")
													.toggleClass('on');
										});
							});
				</script>
</body>
</html>
