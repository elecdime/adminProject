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

		<form name="flist" class="local_sch01 local_sch">
			<input type="hidden" name="save_stx" value=""> <label
				for="sfl" class="sound_only">검색대상</label> <select name="sfl"
				id="sfl">
				<option value="num" selected="selected">주문번호</option>
				<option value="name">운송장번호</option>
				<option value="user">구매자</option>

			</select> <label for="stx" class="sound_only">검색어</label> <input type="text"
				name="stx" value="" id="stx" class="frm_input">
			<button type="submit" value="검색" class="btn_submit">검색</button>
		</form>

		<div class="formTitle">
			배송현황 리스트 <span>검색조건에 해당하는 리스트를 확인 할수 있습니다.</span>
		</div>
		<!--             <div class="adBtn"><button class="adbtn1">발송확인</button><button class="adbtn2">발송취소</button></div> -->

		<c:if test="${search == null }">
			<div id="listdiv">
		</c:if>

		<c:if test="${search != null }">
			<div id="listdiv" style="width: 100%; height: 500px; overflow: auto;">
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
						<th class="listTitle">수취인명</th>
						<th class="listTitle">우편번호</th>
						<th class="listTitle">주소</th>
						<th class="listTitle">운송장번호</th>
						<th class="listTitle">배송여부</th>

					</tr>

					<c:forEach items="${aDeliveryList}" var="aDeliveryList">
						<c:choose>
							<c:when test="${aDeliveryList.orderStat == '1'}">
								<c:set var="orderStat" value="결제 완료"></c:set>
							</c:when>
							<c:when test="${aDeliveryList.orderStat == '2'}">
								<c:set var="orderStat" value="상품 준비 중"></c:set>
							</c:when>
							<c:when test="${aDeliveryList.orderStat == '3'}">
								<c:set var="orderStat" value="배송 준비 중"></c:set>
							</c:when>
							<c:when test="${aDeliveryList.orderStat == '4'}">
								<c:set var="orderStat" value="배송 중"></c:set>
							</c:when>
							<c:when test="${aDeliveryList.orderStat == '5'}">
								<c:set var="orderStat" value="배송 완료"></c:set>
							</c:when>

						</c:choose>

						<tr>

							<td class="listData"><input type="hidden"
								id="orderId_<c:out value="${aDeliveryList.orderId}" />"
								value="<c:out value="${aDeliveryList.orderId}" />"> <c:out
									value="【${aDeliveryList.orderId}】" /></td>
							<td class="listData"><c:out value="${aDeliveryList.goodsNo}" /></td>
							<td class="listDataTitle txt-left"><nobr>
									<b><a
										href="${pageContext.request.contextPath}/goods_view?n=${aDeliveryList.goodsNo}">
											<c:out value="${aDeliveryList.goodsNm}" />
									</a></b>
								</nobr></td>
							<td class="listData"><a
								href="${pageContext.request.contextPath}/aMember/memberInfo?memId=${aDeliveryList.memId}">
									<c:out value="${aDeliveryList.memId}" />
							</a></td>
							<td class="listData"><c:out
									value="${aDeliveryList.orderDate}" /></td>
							<td class="listData"><c:out
									value="${aDeliveryList.recipient}" /></td>
							<td class="listData"><c:out
									value="${aDeliveryList.orderZipcode}" /></td>
							<td class="listData"><c:out
									value="${aDeliveryList.orderAddr}" /><br>
							<c:out value="${aDeliveryList.orderSub }" /></td>
							<td class="listData"><input type="hidden" id="postNum_<c:out value="${aDeliveryList.postCode}" />" value="${aDeliveryList.postCode }">
							 <c:out value="${aDeliveryList.postCode }" /></td>
							<td class="listData"><c:out value="${orderStat }" />							
							
							 <c:if test="${aDeliveryList.orderStat == '4'}">
								<div class="adBtn">
									<input type="button" class="adbtn1" id="btnSend_${aDeliveryList.postCode}" value="배송 완료"/>
									<input type="hidden" value="postNum_<c:out value="${aDeliveryList.postCode}" />">
								</div>
							 </c:if>
								
							 </td>

						</tr>
					</c:forEach>


				</tbody>
			</table>

			<!-- 페이징 -->
			<c:if test="${pageDTO.startPage > pageDTO.pageBlock }">
				<a
					href="${pageContext.request.contextPath}/aOrder/sendaOrderCheck?pageNum=${pageDTO.startPage-pageDTO.pageBlock}">《이전</a>
			</c:if>

			<c:forEach var="i" begin="${pageDTO.startPage }"
				end="${pageDTO.endPage }" step="1">
				<a
					href="${pageContext.request.contextPath}/aOrder/sendaOrderCheck?pageNum=${i}">〔${i}〕
				</a>
			</c:forEach>

			<c:if test="${pageDTO.endPage < pageDTO.pageCount }">
				<a
					href="${pageContext.request.contextPath}/aOrder/sendaOrderCheck?pageNum=${pageDTO.startPage+pageDTO.pageBlock}">다음》</a>
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
	$("input[id ^= 'btnSend']").click(function(){
 			var postCodeId = $(this).next().val();
 			var postCode =$("#"+postCodeId).val();
//  			var orderPostId = postCodeId.split("_");
//  			var orderId = orderPostId[1];

//  			alert(postCode);

			var today = new Date();   

  			var year = today.getFullYear(); // 년도
  			var month = today.getMonth() + 1;  // 월
  			var date = today.getDate();  // 날짜
  			var day = today.getDay();  // 요일
  			var hours = today.getHours(); // 시
  			var minutes = today.getMinutes();  // 분
  			var seconds = today.getSeconds();  // 초

// 			var dates = $("div[id ^= 'time']").text();

// 			$("div[id ^= 'time']").next().val(dates);
			
  			 $.ajax({
  				    url: "deliveryCheckPro",
  				    data: {"postCode" : postCode
  	  				    	},
  				    type: "GET",
  				    success : function(result){
  				    	if(result != 0){			
    						history.go(0);	  			
 						}else{
 							alert('실패');
 						}
  				    }

  			 });
//   			alert(postCode);
//   			alert(dates);
 		});
 	


	</script>
    
</body>
</html>
