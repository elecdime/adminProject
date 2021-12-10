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
    <script src="./js/jquery-3.5.1.min.js"></script>
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
                <span class="btn_ov01"><span class="ov_txt">등록된 쿠폰</span><span class="ov_num"> ${couponCount}</span></span>
            </div>

            <form name="flist" class="local_sch01 local_sch" action="${pageContext.request.contextPath}/aEvent/searchCouponList" method="post">

                <label for="sca" class="sound_only">분류선택</label>
                <select name="searchCulumn" id="sca">
                    <option value="name" selected="selected">쿠폰명</option>
                    <option value="type">쿠폰타입</option>
                    <option value="code">쿠폰번호</option>
                </select>

                <label for="stx" class="sound_only">검색어</label>
                
                <input type="text" name="searchText" id="stx" class="frm_input">
                <button type="submit" value="검색" class="btn_submit">검색</button>
                <div class="formTitle">
	            <span>쿠폰타입으로 검색 : 1 = (할인%), 2 = (할인 금액), 3 = (상품증정) 4 = (배송비무료)</span>
	            </div>
            </form>

            <div class="formTitle">쿠폰 리스트 <span>검색조건에 해당하는 쿠폰 리스트를 확인 할수 있습니다.</span></div>

            <div class="adBtn">
            	<button class="adbtn1" onclick="location.href='${pageContext.request.contextPath}/aEvent/newCoupon'" >쿠폰생성</button>
            	<button class="adbtn1" onclick="location.href='${pageContext.request.contextPath}/aEvent/giveCoupon'" >쿠폰지급</button>
            	<button class="adbtn1" onclick="location.href='${pageContext.request.contextPath}/aEvent/deleteCoupon'" >쿠폰삭제</button>
            	<button class="adbtn1" onclick="location.href='${pageContext.request.contextPath}/aEvent/all_coupon'" >쿠폰현황</button>
            </div>
            
            <div id="listdiv">

                <form name="signForm" method="post" onsubmit="return false;">
                    <input type="hidden" name="mode" value="">

                    <table class="listTbl fixed">
                        <colgroup>
                            <col width="40"><!-- checkbox -->
                            <col width="200"><!-- 번호 -->
                            <col width="80"><!-- 구분 -->
                            <col width="100"><!-- 아이디 -->
                            <col width="150"><!-- 이름 -->
                            <col width="120"><!-- 핸드폰 -->
                            <col width="100"><!-- 가입일 -->
                            <col width="100"><!-- 최근방문일 -->
                        </colgroup>
                        
                        <tbody>
                            <tr align="center" bgcolor="#5e718f">
                                <th class="listTitle">쿠폰번호</th>
                                <th class="listTitle">이름</th>
                                <th class="listTitle">구분</th>
                                <th class="listTitle">혜택</th>
                                <th class="listTitle">증정상품명</th>
                                <th class="listTitle">발급일/사용가능일</th>
                                <th class="listTitle">사용종료일</th>
                                <th class="listTitle">사용가능여부</th>
                                <!-- <th class="listTitle" >주소</th> -->
                            </tr>
                            
                           <!-- jspl -->
                           <c:forEach items="${couponList}" var = "couponList">
                           
                           <c:choose>
	                           <c:when test="${couponList.useable == 't'}">
	                           		<c:set var="useable" value="가능"></c:set>
	                           </c:when>
	                           <c:when test="${couponList.useable == 'f'}">
	                           		<c:set var="useable" value="불가"></c:set>
	                           </c:when>
	                           <c:when test="${couponList.useable == 'i'}">
	                           		<c:set var="useable" value="영구"></c:set>
	                           </c:when>
	                           <c:when test="${couponList.useable == 'u'}">
	                           		<c:set var="useable" value="사용됨
	                           		"></c:set>
	                           </c:when>
                           </c:choose>
                           
                           <c:choose>
	                           <c:when test="${couponList.type == '1'}">
	                           		<c:set var="type" value="할인 (%)"></c:set>
	                           </c:when>
	                           <c:when test="${couponList.type == '2'}">
	                           		<c:set var="type" value="할인 (금액)"></c:set>
	                           </c:when>
	                           <c:when test="${couponList.type == '3'}">
	                           		<c:set var="type" value="상품증정"></c:set>
	                           </c:when>
	                           <c:when test="${couponList.type == '4'}">
	                           		<c:set var="type" value="배송비무료"></c:set>
	                           </c:when>
	                           <c:when test="${couponList.type == '5'}">
	                           		<c:set var="type" value="마일리지적립"></c:set>
	                           </c:when>
                           </c:choose>
                           
                           <c:choose>
	                           <c:when test="${couponList.goodsNm == '0'}">
	                           		<c:set var="goodsNm" value="X"></c:set>
	                           </c:when>
	                           <c:when test="${couponList.goodsNm != '0'}">
	                           		<c:set var="goodsNm" value="${couponList.goodsNm}"></c:set>
	                           </c:when>
                           </c:choose>
                           
                            <tr>
                                <td class="listData">
                                	<c:out value="${couponList.code}" /> 
                                </td>
                                <td class="listData">
                                    <nobr><b><a href="/"><c:out value="${couponList.name}" /></a></b></nobr>
                                </td>
                                <td class="listData"><c:out value="${type}" /></td>
                                <td class="listData"><c:out value="${couponList.benefit}" /></td>
                                <td class="listData" ><c:out value="${goodsNm}" /></td>
                                <td class="listData"><fmt:formatDate value="${couponList.giveDate}" pattern="yyyy-MM-dd"/></td>
                                <td class="listData"><fmt:formatDate value="${couponList.endDate}" pattern="yyyy-MM-dd"/></td>
                                <td class="listData"><c:out value="${useable}" /></td>
                            </tr>
                            
                           </c:forEach>
                        </tbody>
                    </table>
                </form>
                <c:if test="${pageDTO.startPage > pageDTO.pageBlock}">
					<a href="${pageContext.request.contextPath}/aEvent/coupon?pageNum=${pageDTO.startPage-pageDTO.pageBlock}">[이전]</a>
                </c:if>
                <c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage }" step="1">
                	<a href="${pageContext.request.contextPath}/aEvent/coupon?pageNum=${i}">${i}</a>
                </c:forEach>
                <c:if test="${pageDTO.endPage > pageDTO.pageCount}">
                	<a href="${pageContext.request.contextPath}/aEvent/coupon?pageNum=${pageDTO.startPage+pageDTO.pageBlock}">[다음]</a>
                </c:if>
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
