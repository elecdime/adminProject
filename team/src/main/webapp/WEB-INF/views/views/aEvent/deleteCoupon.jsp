<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <a href="${pageContext.request.contextPath}/aEvent/coupon" class="ov_listall">쿠폰메인</a>
            </div>
			<div class="formTitle">쿠폰 삭제 <span>쿠폰code를 선택해 쿠폰을 영구적으로 삭제시킵니다.</span></div>
            <div id="listdiv">

                <form name="signForm" action="${pageContext.request.contextPath}/aEvent/deleteCouponPro" method="post">
                    <table class="listTbl fixed">
                        <tbody>
                            <tr align="center" bgcolor="#5e718f">
                            	<td>삭제 할 쿠폰 코드  </td>
                            	<td>
                            		<input type="text" id="searchCoupon">
                            		<select style="width:300px" name="deleteCoupon_code" id="selCoupon">
                            			<c:forEach items="${couponList}" var = "couponList">
                            				<option value="<c:out value="${couponList.code}"/>"><c:out value="${couponList.name}"/></option>
                            		 	</c:forEach>
                            		</select>
                            	</td>
                            </tr>
                        </tbody>
                    </table>
                    
                    <div class="adBtn"><input type="submit" value="쿠폰삭제" class="adbtn1"></div>
                    
                </form>
            </div>

        </div>
    </div><!--  seller_wrap  -->
	
	<script type="text/javascript">
	$(document).ready(function(){
		$("#searchCoupon").keyup(function(){
			var searchText = $(this).val();
			$("#selCoupon").empty();
			
			$.getJSON('${pageContext.request.contextPath}/aEvent/delCouponSearch?searchText='+searchText,function(rdata){
	            $.each(rdata,function(index,item){
	               $('#selCoupon').append('<option value='+item.code+'>'+item.name+'</option>');

	               
	            });
	         });
	      });
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
