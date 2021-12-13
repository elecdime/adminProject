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
            </div>

            <div class="formTitle">블랙 리스트 등록 <span>선택한 회원을 블랙리스트로 등록할 수 있습니다</span></div>

            <div id="listdiv">
				<div class="formTitle">회원ID : <c:out value="${memId}"/></div>
                <form action="${pageContext.request.contextPath}/aMember/insertBlackPro" method="post">
                <input type="hidden" name="memId" value="<c:out value="${memId}"/>">
                        
                	<table class="listTbl fixed">
                		<tr>
                			<td>블랙사유</td>
                			<td> <textarea rows="5" cols="30" name="blackReason"></textarea> </td>
                		</tr>
                		
                	</table>
                	<div class="adBtn"><input type="submit" value="블랙리스트로 등록" class="adbtn1"></div>
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

</body></html>
