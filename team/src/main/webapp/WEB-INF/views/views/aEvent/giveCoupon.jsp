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
			<div class="formTitle">쿠폰 지급 <span>유저ID와 쿠폰code를 이용해 해당 유저에게 지급 할 수 있습니다.</span></div>
            <div id="listdiv">

                <form name="signForm" action="${pageContext.request.contextPath}/aEvent/giveCouponPro" method="post">
                    <table class="listTbl fixed">
                        <tbody>
                            <tr align="center" bgcolor="#5e718f">
                            	<td>쿠폰명</td>
                            	<td>
                            		<input type="text" id="searchCoupon" >
                            		<select style="width:300px" name="giveCoupon_code" id="selCoupon">
                            			<c:forEach items="${couponList}" var = "couponList">
                            				<option value="<c:out value="${couponList.code}"/>"><c:out value="${couponList.name}"/></option>
                            		 	</c:forEach>
                            		</select>
                            	</td>
                            </tr>
                            <tr align="center" bgcolor="#5e718f">
                            	<td>지급 사용자</td>
                            	<td>
                            		<input type="text" id="searchMember">
                            		<select style="width:300px" name="memId" id="selMember">
                            				<option value="all" selected="selected">모든사용자</option>
                            			<c:forEach items="${memberList}" var = "memberList">
                            				<option value="<c:out value="${memberList.memId}"/>" id="searchOption"><c:out value="${memberList.memId}"/></option>
                            		 	</c:forEach>
                            		</select>
                            	</td>
                            </tr>
                            
                        </tbody>
                    </table>
                    
                    <div class="adBtn"><input type="submit" value="쿠폰지급" class="adbtn1"></div>
                    
                </form>
            </div>

        </div>
    </div><!--  seller_wrap  -->
	    <script type="text/javascript">
	$(document).ready(function(){
		$("#searchMember").keyup(function(){
			var searchText = $(this).val();
			$("#selMember").empty();
			
			$.getJSON('${pageContext.request.contextPath}/aEvent/giveCouponSearch?searchText='+searchText,function(rdata){
	            $.each(rdata,function(index,item){
	               $('#selMember').append('<option value='+item.memId+'>'+item.memId+'</option>');

	               
	            });
	         });
	      });
	   });

	$(document).ready(function(){
		$("#searchCoupon").keyup(function(){
			var searchText = $(this).val();
			$("#selCoupon").empty();
			
			$.getJSON('${pageContext.request.contextPath}/aEvent/giveCouponSearch_coup?searchText='+searchText,function(rdata){
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
