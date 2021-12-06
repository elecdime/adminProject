
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>GH SHOP</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css">
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
    
    <style type="text/css">

.thumbImg{width: 200px; height: 300px;}

</style>
</head>

<body>
 <div id="seller_wrap">
        <div id="seller_top" class="item1">
            <a>GHSHOP 관리자센터</a>
            <div class="seller_top_right">
                <span>ADNUIN 관리자님</span><span><button>로그아웃</button></span>
            </div>
        </div>
        <!--  left menu -->
        <div id="seller_lnb" class="item2">
            <div class="store"><a href="/">GH SH<span>O</span>P</a></div>
            <ul class="seller_menu">
                <li>
                    <a class="seller_menu_tit">상품관리</a>
                    <ol class="seller_menu_con">
                        <li><a href="'${pageContext.request.contextPath}/aProduct/product'">상품관리</a></li>
                        <li><a href="#">submenu02</a></li>
                    </ol>
                </li>
                <li>
                    <a class="seller_menu_tit">쿠폰관리</a>
                    <ol class="seller_menu_con">
                        <li><a href="${pageContext.request.contextPath}/aEvent/newCoupon">submenu01</a></li>
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
                <a href="" class="ov_listall">전체목록</a>
                <span class="btn_ov01"><span class="ov_txt">등록된 상품</span><span class="ov_num"> 59건</span></span>
            </div>

            <form name="flist" class="local_sch01 local_sch">
                <input type="hidden" name="save_stx" value="">

                <label for="sca" class="sound_only">분류선택</label>
                <select name="sca" id="sca">
                    <option value="">전체분류</option>
                    <option value="">분류1</option>
                    <option value="">분류2</option>
                </select>

                <label for="sfl" class="sound_only">검색대상</label>
                <select name="sfl" id="sfl">
                    <option value="it_name" selected="selected">상품명</option>
                    <option value="it_id">상품코드</option>
                    <option value="it_maker">제조사</option>
                    <option value="it_origin">원산지</option>
                    <option value="it_sell_email">판매자 e-mail</option>
                </select>

                <label for="stx" class="sound_only">검색어</label>
                <input type="text" name="stx" value="" id="stx" class="frm_input">
                <button type="submit" value="검색" class="btn_submit">검색</button>
            </form>



         
            <div id="listdiv">

                <form name="signForm" method="post" onsubmit="return false;">
                    <input type="hidden" name="mode" value="">
  <table class="listTbl fixed">
	<colgroup>
		<col width="40">
		<!-- checkbox -->
		<col width="60">
		<!-- 번호 -->
		<col width="80">
		<!-- 구분 -->
		<col width="100">
		<!-- 아이디 -->
		<col width="150">
		<!-- 이름 -->
		<col width="120">
		<!-- 핸드폰 -->
		<col width="100">
		<!-- 가입일 -->
		<col width="100">
		<!-- 최근방문일 -->
		<col width="70">
		<!-- 적립금 -->
		<col width="70">
		<!-- 적립금 -->
		<col width="70">
		<!-- 통합정보 -->
		<col width="100">
		<!-- 가입일 -->
		<col width="100">
		<!-- 가입일 -->
	</colgroup>
	<tbody>
		<tr align="center" bgcolor="#5e718f">
			<th class="listTitle"><input type="checkbox" name="allcheck"
				value="1" onclick=""></th>
			<th class="listTitle">이미지</th>
			<th class="listTitle">상품번호</th>
	
			<th class="listTitle">상품명</th>
					<th class="listTitle">카테고리</th>
			<th class="listTitle"><a href="" class="link01">제조사</a></th>
			<th class="listTitle"><a href="" class="link01">원산지</a></th>
			<th class="listTitle"><a href="" class="link01">모델명</a></th>
			<th class="listTitle"><a href="" class="link01">제조일</a></th>
			<th class="listTitle"><a href="" class="link01">상품 재고량</a></th>
			<th class="listTitle"><a href="" class="link01">정가</a></th>
			<th class="listTitle"><a href="" class="link01">판매가</a></th>
			<th class="listTitle"><a href="" class="link01">등록일</a></th>
			<th class="listTitle"><a href="" class="link01">수정일</a></th>
			<!-- <th class="listTitle" >주소</th> -->
		</tr>

		<c:forEach var="aProductDTO" items="${productList }">
			<tr>
				<td class="listData"><input type="checkbox" name="" value=""></td>
				
 							
 					<td class="listData">	<img src="${aProductDTO.gdsThumbImg}" class="thumbImg"/>
						</td>	
				<td class="listData"><b><a href="/aProduct/productview?n=${aProductDTO.goodsNo}">${aProductDTO.goodsNo}</a></b>
					</nobr></td>
				<td class="listData">${aProductDTO.goodsNm}</td>
				<td class="listData">${aProductDTO.cateCode}</td>
				<td class="listData">${aProductDTO.makerNm}<nobr>
						</td>
				<td class="listData">${aProductDTO.originNm}</td>
				<td class="listData"><nobr>
						<b><a href="/">${aProductDTO.goodsModelNo}</a></b>
					</nobr></td>
				<td class="listData">${aProductDTO.makeYmd}</td>
				<td class="listData">${aProductDTO.totalStock}</td>
				<td class="listData">${aProductDTO.fixedPrice}</td>
				<td class="listData">${aProductDTO.goodsPrice}</td>
				<td class="listData">${aProductDTO.regDt}</td>
				<td class="listData">${aProductDTO.modDt}</td>
			</tr>
		</c:forEach>
		</tbody>
		
		</table>

		<c:if test="${pageDTO.startPage > pageDTO.pageBlock }">
			<a
				href="${pageContext.request.contextPath}/board/list?pageNum=${pageDTO.startPage-pageDTO.pageBlock}">[이전]</a>
		</c:if>

		<c:forEach var="i" begin="${pageDTO.startPage }"
			end="${pageDTO.endPage }" step="1">
			<a href="${pageContext.request.contextPath}/board/list?pageNum=${i}">${i}
			</a>
		</c:forEach>

		<c:if test="${pageDTO.endPage < pageDTO.pageCount }">
			<a
				href="${pageContext.request.contextPath}/board/list?pageNum=${pageDTO.startPage+pageDTO.pageBlock}">[다음]</a>
		</c:if>
		  <div class="adBtn"><button class="adbtn1" onclick="location.href='${pageContext.request.contextPath}/aEvent/newCoupon'" >상품수정</button></div>
                       <div class="adBtn"><button class="adbtn1" onclick="location.href='${pageContext.request.contextPath}/aProduct/productinsert'" >상품등록</button></div>
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
