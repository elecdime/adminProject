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



    <div id="seller_wrap">
        <div id="seller_top" class="item1">
            <a>GHSHOP 관리자센터</a>
            <div class="seller_top_right">
                <span>ADNUIN 관리자님</span><span><button>로그아웃</button></span>
            </div>
        </div>
        <div id="seller_lnb" class="item2">
            <div class="store"><a href="/">GH SH<span>O</span>P</a></div>
            <ul class="seller_menu">
                <li>
                    <a class="seller_menu_tit">상품관리</a>
                    <ol class="seller_menu_con">
                        <li><a href="#">submenu01</a></li>
                        <li><a href="#">submenu02</a></li>
                    </ol>
                </li>
                <li>
                    <a class="seller_menu_tit">쿠폰관리</a>
                    <ol class="seller_menu_con">
                        <li><a href="#">submenu01</a></li>
                        <li><a href="#">submenu02</a></li>
                    </ol>
                </li>
                <li>
                    <a class="seller_menu_tit">회원관리</a>
                    <ol class="seller_menu_con">
                        <li><a href="#">submenu01</a></li>
                        <li><a href="#">submenu02</a></li>
                    </ol>
                </li>
                <li>
                    <a class="seller_menu_tit" onclick="">주문관리</a>
                    <ol class="seller_menu_con">
                        <li><a href="./aOrderList">전체주문목록</a></li>
                        <li><a href="./newaOrderList">발주목록</a></li>
                        <li><a href="./sendaOrderCheck">발송확인</a></li>
                        <li><a href="./deliveryCheck">배송현황</a></li>
                        <li><a href="./payback">환불내역</a></li>
                        <li><a href="./exchange">교환내역</a></li>
                    </ol>
                </li>
            </ul>
        </div>

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

            <div class="formTitle">발송관리 리스트 <span>검색조건에 해당하는 리스트를 확인 할수 있습니다.</span></div>
            <div class="adBtn"><button class="adbtn2">발송취소</button></div>
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
								<th class="listTitle">주문자</th>
								<th class="listTitle">주문날짜</th>
								<th class="listTitle">총 결제 금액</th>
								<th class="listTitle">주문상태</th>
								<th class="listTitle">클레임상태</th>
								<th class="listTitle">운송장번호</th>

							</tr>

							<c:forEach items="${sendaOrderList}" var="sendaOrderList">
								<c:choose>
										<c:when test="${sendaOrderList.orderStat == '1'}">
												<c:set var="orderStat" value="결제 완료"></c:set>
											</c:when>
											<c:when test="${sendaOrderList.orderStat == '2'}">
												<c:set var="orderStat" value="상품 준비 중"></c:set>
											</c:when>
											<c:when test="${sendaOrderList.orderStat == '3'}">
												<c:set var="orderStat" value="배송 준비 중"></c:set>
											</c:when>
											<c:when test="${sendaOrderList.orderStat == '4'}">
												<c:set var="orderStat" value="배송 중"></c:set>
											</c:when>
								
								</c:choose>
							
							

								<tr >
									<td class="listData"><input type="checkbox" name=""><input type="hidden" id="chbx_<c:out value="${sendaOrderList.orderId}" />">
									<input type="hidden" value ="orderId_<c:out value="${sendaOrderList.orderId}" />"></td>
									<td class="listData"><input type="hidden"  id="orderId_<c:out value="${sendaOrderList.orderId}" />" value="<c:out value="${sendaOrderList.orderId}" />">
										<c:out value="【${sendaOrderList.orderId}】" />
									</td>
									<td class="listData" ><c:out value="${sendaOrderList.goodsNo}" /></td>

									<td class="listDataTitle txt-left">							
										<nobr>										
											<b><a href="/"><c:out value=" ${sendaOrderList.goodsNm}" /></a></b>
										</nobr> 외 	${sendaOrderList.excepCnt}개
									</td>
									<td class="listData" ><c:out value="${sendaOrderList.memId}" /></td>

									<td class="listData"><c:out value="${sendaOrderList.orderDate}" /></td>
									<td class="listData"><c:out
											value="${sendaOrderList.amount} 원" /></td>
									<td class="listData"><c:out value="${orderStat}" /></td>
									<td class="listData"><c:out value="클레임상태" /></td>
									<td class="listData"><input type="text" id="postNum_<c:out value="${sendaOrderList.orderId}"/>"><br>
									<div class="adBtn">
									<button class="adbtn1" id="btnSend_${sendaOrderList.orderId}" >발송확인</button>
									<input type="hidden" value="postNum_<c:out value="${sendaOrderList.orderId}" />"></div>
									</td>



								</tr>
							</c:forEach>


						</tbody>
					</table>
					
					<!-- 페이징 -->
					<c:if test="${pageDTO.startPage > pageDTO.pageBlock }">
					<a href="${pageContext.request.contextPath}/aOrder/sendaOrderCheck?pageNum=${pageDTO.startPage-pageDTO.pageBlock}">《이전</a>
					</c:if>
					
					<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
						<a href="${pageContext.request.contextPath}/aOrder/sendaOrderCheck?pageNum=${i}">〔${i}〕 </a>
					</c:forEach>
					
					<c:if test="${pageDTO.endPage < pageDTO.pageCount }">
					<a href="${pageContext.request.contextPath}/aOrder/sendaOrderCheck?pageNum=${pageDTO.startPage+pageDTO.pageBlock}">다음》</a>
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
	
	
	<script type="text/javascript"> 
	$("button[id ^= 'btnSend']").click(function(){
 			var postCodeId = $(this).next().val();
 			var postCode =$("#"+postCodeId).val();
 			var orderPostId = postCodeId.split("_");
 			var orderId = orderPostId[1];
//  			var btnId = $("#btnSend_"+orderId).next().val(); 			

// 			alert(postCodeId);
// 			alert(postCode);
// 			alert(orderId);

  			 $.ajax({
  				    url: "sendaOrderCheckPro",
  				    data: {"postCode" : postCode,
  	  				    	"orderId" : orderId},
  				    type: "GET",
  				    success : function(result){
  				      if(result == 1){
  				    	history.go(0);
 					}else{
 						alert('실패');
 						}
  				    }

  			 });
 		});
 	


	</script>
</body>
</html>
