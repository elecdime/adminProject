<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
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
                <a href="${pageContext.request.contextPath}/aMember/member" class="ov_listall">회원메인</a>
                <span class="btn_ov01"><span class="ov_txt">회원의 주문횟수</span><span class="ov_num"> <c:out value="${count}"/> </span></span>
            </div>

            <div class="formTitle">회원 리스트 <span>검색조건에 해당하는 회원 리스트를 확인 할수 있습니다.</span></div>
			
            <div class="adBtn">
            	<button class="adbtn1" onclick="location.href='${pageContext.request.contextPath}/aMember/insertBlack?memId=<c:out value="${MemberDTO.memId}" />'" >회원블랙</button>
            </div>
            <div id="listdiv">
                    <table class="listTbl fixed">
                        <%-- <colgroup>
                            <col width="345"><!-- checkbox -->
                            <col width="100"><!-- 번호 -->
                            <col width="100"><!-- 구분 -->
                            <col width="200"><!-- 아이디 -->
                            <col width="245"><!-- 최근방문일 --> <!--  890 -->
                        </colgroup> --%>
                        <tbody>
                            <tr align="center" bgcolor="#5e718f">
                                <th class="listTitle">아이디</th>
                                <th class="listTitle">이름</th>
                                <th class="listTitle">생년월일</th>
                                <th class="listTitle" colspan="2">전화번호</th>
                            </tr>
                            <tr>
                                <td class="listData">
                                	<c:out value="${MemberDTO.memId}" />
                                </td>
                                <td class="listData">
                                	<c:out value="${MemberDTO.memNm}" /> 
                                </td>
                                <td class="listData">
                                <fmt:formatDate value="${MemberDTO.birthDt}" pattern="yyyy-MM-dd"/>
                                </td>
                                <td class="listData" colspan="2">
                                	<c:out value="${MemberDTO.phone}" />
                                </td>
                            </tr>
                            
                            <tr align="center" bgcolor="#5e718f">
                                <th class="listTitle">이메일</th>
                                <th class="listTitle">memFl</th>
                                <th class="listTitle">zipcode</th>
                                <th class="listTitle">deposit</th>
                            </tr>
                            <tr>
                                
                                <td class="listData">
                                	<c:out value="${MemberDTO.email}" /></td> 
                            	<td class="listData">
                                	<c:out value="${MemberDTO.memberFl}" /></td>
                                
                                <td class="listData">
                                	<c:out value="${MemberDTO.zipcode}" /></td> 
                                
                                <td class="listData">
                                	<c:out value="${MemberDTO.deposit}" /></td> 
                            </tr>
                            
                            <tr align="center" bgcolor="#5e718f">
                                <th class="listTitle" colspan="2">주소</th>
                                <th class="listTitle" >상세주소</th>
                                <th class="listTitle">addressReference</th>
                            </tr>
                            <tr>
                                <td class="listData" colspan="2">
                                	<c:out value="${MemberDTO.address}" /> 
                                </td>
                                <td class="listData">
                                	<c:out value="${MemberDTO.addressSub}" /> 
                                </td>
                                <td>
                                	<c:out value="${MemberDTO.addressReference}" /> 
                                </td>
                            </tr>
                            
                        </tbody>
                    </table>
            </div>
            
            <div id="listdiv" style="width:100%; height:200px; overflow:auto">

                <table class="listTbl fixed">
                	<colgroup>
	                    <col width="245"><!-- checkbox -->
	                    <col width="345"><!-- 번호 -->
	                    <col width="100"><!-- 구분 -->
	                    <col width="200"><!-- 아이디 -->
	                    <col width="100"><!-- 최근방문일 --> <!--  890 -->
                    </colgroup>
                    <tbody>
                    <tr align="center" bgcolor="#5e718f">
                                <th class="listTitle">주문번호</th>
                                <th class="listTitle">주문상품</th>
                                <th class="listTitle">주문상태</th>
                                <th class="listTitle">주문날짜</th>
                                <th class="listTitle">주문금액</th>
                    </tr>
                    	<c:forEach var="orderList" items="${orderList}">
                    	<c:choose>
	                           <c:when test="${orderList.orderStat == '2'}">
	                           		<c:set var="orderStat" value="상품준비중"></c:set>
	                           </c:when>
	                           <c:when test="${orderList.orderStat == '3'}">
	                           		<c:set var="orderStat" value="배송준비중"></c:set>
	                           </c:when>
	                           <c:when test="${orderList.orderStat == '4'}">
	                           		<c:set var="orderStat" value="배송중"></c:set>
	                           </c:when>
	                           <c:when test="${orderList.orderStat == '5'}">
	                           		<c:set var="orderStat" value="배송완료"></c:set>
	                           </c:when>
                           </c:choose>
                    	<tr>
	                        <td class="listData">
	                        <c:out value="${orderList.orderId}" /></td>
	                        <td class="listData">
	                        <c:out value="${orderList.goodsNm} 외 ${orderList.goodsCount} 개"/></td>
	                        <td class="listData">
	                        <c:out value="${orderStat}" /></td>
	                        <td class="listData">
	                        <c:out value="${orderList.orderDate}" /></td>
	                                
	                        <td class="listData">
	                        <c:out value="${orderList.amount}" /></td>
                        </tr>
                        </c:forEach>	
                    </tbody>
            	</table>
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

</body></html>
