
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
.thumbImg{width: 100px; height: 100px;}
</style>
</head>

<body>
  <%@include file="../inc/head.jsp"%>
        <!--  left menu -->
  <%@include file="../inc/left.jsp"%>


         <%@include file="../inc/content.jsp"%>

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
                    <option value="num" selected="selected">상품번호</option>
                    <option value="name">상품명</option>
                    <option value="user">카테고리</option>               
                    
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
		
				
 							
 					<td class="listData">	<img src="${aProductDTO.imagePath}" class="thumbImg"/>
						</td>	
				<td class="listData"><b><a href="${pageContext.request.contextPath}/aProduct/productview?n=${aProductDTO.goodsNo}">${aProductDTO.goodsNo}</a></b>
					</nobr></td>
				<td class="listData">${aProductDTO.goodsNm}</td>
				<td class="listData">${aProductDTO.cateName}</td>
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
			
				href="${pageContext.request.contextPath}/aProduct/product?pageNum=${pageDTO.startPage-pageDTO.pageBlock}">[이전]</a>
		</c:if>

		<c:forEach var="i" begin="${pageDTO.startPage }"
			end="${pageDTO.endPage }" step="1">
			<a href="${pageContext.request.contextPath}/aProduct/product?pageNum=${i}">${i}
			</a>
		</c:forEach>

		<c:if test="${pageDTO.endPage < pageDTO.pageCount }">
			<a
				href="${pageContext.request.contextPath}/aProduct/product?pageNum=${pageDTO.startPage+pageDTO.pageBlock}">[다음]</a>
		</c:if>

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