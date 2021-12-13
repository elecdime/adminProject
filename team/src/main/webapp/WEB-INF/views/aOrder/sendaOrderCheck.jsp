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
                    <option value="user">구매자</option>               
                    
                </select>

                <label for="stx" class="sound_only">검색어</label>
                <input type="text" name="stx" value="" id="stx" class="frm_input">
                <button type="submit" value="검색" class="btn_submit">검색</button>
            </form>

            <div class="formTitle">발송관리 리스트 <span>검색조건에 해당하는 리스트를 확인 할수 있습니다.</span></div>
<!--             <div class="adBtn"><button class="adbtn2">발송취소</button></div> -->
            
           <c:if test="${search == null }">
				<div id="listdiv">				
			</c:if>
			
			<c:if test="${search != null }">
				<div id="listdiv" style=" width:100%; height:500px; overflow:auto;">	
			</c:if>
			
                <form name="signForm" method="post" onsubmit="return false;">
                    <input type="hidden" name="mode" value="">
					<table class="listTbl fixed">
						<tbody>
							<tr height="25" align="center" bgcolor="#5e718f">
								<th class="listTitle">주문번호</th>
								<th class="listTitle">상품번호</th>
								<th class="listTitle">상품명</th>
								<th class="listTitle">주문자</th>
								<th class="listTitle">주문날짜</th>
								<th class="listTitle">총 결제 금액</th>
								<th class="listTitle">주문상태</th>
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
											<c:when test="${sendaOrderList.orderStat == '5'}">
												<c:set var="orderStat" value="배송 완료"></c:set>
											</c:when>
								
								</c:choose>
							
							

								<tr >
									<td class="listData"><input type="hidden"  id="orderId_<c:out value="${sendaOrderList.orderId}" />" value="<c:out value="${sendaOrderList.orderId}" />">
										<c:out value="【${sendaOrderList.orderId}】" />
									</td>
									<td class="listData" ><c:out value="${sendaOrderList.goodsNo}" /></td>

									<td class="listDataTitle txt-left">							
										<nobr>										
											<b><a href="${pageContext.request.contextPath}/goods_view?n=${sendaOrderList.goodsNo}">
											<c:out value=" ${sendaOrderList.goodsNm}" /></a></b>
										</nobr> 외 	${sendaOrderList.excepCnt}개
									</td>
									<td class="listData" ><a href="${pageContext.request.contextPath}/aMember/memberInfo?memId=${sendaOrderList.memId}">
									<c:out value="${sendaOrderList.memId}" /></a></td>

									<td class="listData"><c:out value="${sendaOrderList.orderDate}" /></td>
									<td class="listData"><c:out
											value="${sendaOrderList.amount} 원" /></td>
									<td class="listData"><c:out value="${orderStat}" /></td>
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


  <script>
        $(document).ready(function() {
            $(".seller_menu_tit").click(function() {
                $(".seller_menu_con").removeClass('on');
                $(this).parent().find(".seller_menu_con").toggleClass('on');
            });
        });
    </script>
	
	
	<script type="text/javascript"> 
	$("button[id ^= 'btnSend']").click(function(){
 			var postCodeId = $(this).next().val();
 			var postCode =$("#"+postCodeId).val();
 			var orderPostId = postCodeId.split("_");
 			var orderId = orderPostId[1];

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
