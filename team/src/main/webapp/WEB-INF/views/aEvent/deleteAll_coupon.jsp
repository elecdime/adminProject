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
                    <a class="seller_menu_tit">menu04</a>
                    <ol class="seller_menu_con">
                        <li><a href="#">submenu01</a></li>
                        <li><a href="#">submenu02</a></li>
                    </ol>
                </li>
            </ul>
        </div>

        <div id="seller_content" class="item3">
            <div class="local_ov01 local_ov">
                <a href="${pageContext.request.contextPath}/aEvent/coupon" class="ov_listall">쿠폰메인</a>
            </div>

            <div class="formTitle">지급 취소 <span>우측의 버튼을 클릭하여 쿠폰 지급을 취소할 수 있습니다.</span></div>

            <div class="adBtn">
            	<button class="adbtn1" onclick="location.href='${pageContext.request.contextPath}/aEvent/newCoupon'" >쿠폰생성</button>
            	<button class="adbtn1" onclick="location.href='${pageContext.request.contextPath}/aEvent/giveCoupon'" >쿠폰지급</button>
            	<button class="adbtn1" onclick="location.href='${pageContext.request.contextPath}/aEvent/deleteCoupon'" >쿠폰삭제</button>
            </div>
            
            <div id="listdiv">

<%--                 <form name="signForm" method="post" action="${pageContext.request.contextPath}/aEvent/deleteAll_couponPro"> --%>
                    <table class="listTbl fixed">
                        <colgroup>
                            <col width="40">
                            <col width="100">
                            <col width="80">
                            <col width="200">
                            <col width="120">
                            <col width="100">
                            <col width="100">
                            <col width="100">
                        </colgroup>
                        
                        <tbody>
                            <tr align="center" bgcolor="#5e718f">
                                <th class="listTitle"><a href="" class="link01">사용자 ID</a></th>
                                 <th class="listTitle">지급코드</th>
                                <th class="listTitle">쿠폰번호</th>
                                <th class="listTitle">쿠폰이름</th>
                                <th class="listTitle">쿠폰타입</th>
                                <th class="listTitle">쿠폰혜택</th>
                                <th class="listTitle">쿠폰상태</th>
                                <th> </th>
                                <!-- <th class="listTitle" >주소</th> -->
                            </tr>
                            
                           
                           
                           <c:forEach items="${all_couponList}" var = "all_couponList">
                           <c:choose>
	                            <c:when test="${all_couponList.useable == 't'}">
	                            	<c:set var="useable" value="가능"></c:set>
	                            </c:when>
	                            <c:when test="${all_couponList.useable == 'f'}">
	                            	<c:set var="useable" value="불가"></c:set>
	                            </c:when>
	                            <c:when test="${all_couponList.useable == 'i'}">
	                            	<c:set var="useable" value="영구"></c:set>
	                            </c:when>
	                            <c:when test="${all_couponList.useable == 'u'}">
	                            	<c:set var="useable" value="사용됨"></c:set>
	                            </c:when>
                           </c:choose>
                           <c:choose>
	                           <c:when test="${all_couponList.type == '1'}">
	                           		<c:set var="type" value="할인 (%)"></c:set>
	                           </c:when>
	                           <c:when test="${all_couponList.type == '2'}">
	                           		<c:set var="type" value="할인 (금액)"></c:set>
	                           </c:when>
	                           <c:when test="${all_couponList.type == '3'}">
	                           		<c:set var="type" value="상품증정"></c:set>
	                           </c:when>
	                           <c:when test="${all_couponList.type == '4'}">
	                           		<c:set var="type" value="배송비무료"></c:set>
	                           </c:when>
	                           <c:when test="${all_couponList.type == '5'}">
	                           		<c:set var="type" value="마일리지적립"></c:set>
	                           </c:when>
                           </c:choose>
                            <tr>
                                <td class="listData">
                                    <nobr><b><a href="/"><c:out value="${all_couponList.memId}" /></a></b></nobr>
                                </td>
                                <td class="listData">
                                	<c:out value="${all_couponList.giveCode}" />
                                </td>
                                <td class="listData">
                                	<c:out value="${all_couponList.coupon_code}" />
                                </td>
                                <td class="listData">
                                	<c:out value="${all_couponList.name}" />
                                </td>
                                <td class="listData">
                                	<c:out value="${type}" />
                                </td>
                                <td class="listData">
                                	<c:out value="${all_couponList.benefit}" />
                                </td>
                                <td class="listData">
                                	<c:out value="${useable}" />
                                </td>
                                <td>
                                	<button id="giveCode<c:out value="${all_couponList.giveCode}" />">X</button>
                                	<input type="hidden" id="giveHidden<c:out value="${all_couponList.giveCode}" />" value="<c:out value="${all_couponList.giveCode}" />">
                                </td>
                                
                            </tr>
                            
                           </c:forEach>
                        </tbody>
                    </table>
					<c:if test="${pageDTO.startPage > pageDTO.pageBlock}">
						<a href="${pageContext.request.contextPath}/aEvent/deleteAll_coupon?pageNum=${pageDTO.startPage-pageDTO.pageBlock}">[이전]</a>
	                </c:if>
	                <c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage }" step="1">
	                	<a href="${pageContext.request.contextPath}/aEvent/deleteAll_coupon?pageNum=${i}">${i}</a>
	                </c:forEach>
	                <c:if test="${pageDTO.endPage > pageDTO.pageCount}">
	                	<a href="${pageContext.request.contextPath}/aEvent/deleteAll_coupon?pageNum=${pageDTO.startPage+pageDTO.pageBlock}">[다음]</a>
	                </c:if>                
                
            </div>
        </div>
    </div><!--  seller_wrap  -->'
				<script>
        			
                	$("button[id ^= 'giveCode']").click(function(){
						var giveCodeStr = $(this).next().val();
						location.href="${pageContext.request.contextPath}/aEvent/deleteAll_couponPro?giveCodeStr="+giveCodeStr;
//  							$.ajax({
//  								async : false,
//  								url: '${pageContext.request.contextPath}/aEvent/deleteAll_couponPro', 
//  								data: {giveCodeStr:giveCodeStr},
//  								type: 'POST',
//  								dataType: 'text',
		
//  							});
					});
                </script>              
                 <script>
        $(document).ready(function() {
            $(".seller_menu_tit").click(function() {
                $(".seller_menu_con").removeClass('on');
                $(this).parent().find(".seller_menu_con").toggleClass('on');
            });
        });
    </script> 
</body></html>
