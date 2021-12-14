<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<div class="formTitle">쿠폰 리스트 <span>검색조건에 해당하는 쿠폰 리스트를 확인 할수 있습니다.</span></div>
            <div id="listdiv">
            

                <form name="signForm" action="${pageContext.request.contextPath}/aEvent/newCouponPro" method="post">
                    <table class="listTbl fixed">
                        <tbody>
                            <tr align="center" bgcolor="#5e718f">
                            	<td>쿠폰 이름   </td> <td><input type="text" id="name"style="width:275px" name="name"> </td>
                            </tr>
                            <tr>
                            	<td>혜택 내용 </td>
								<td> 
								<select name="type">
									<option id="type" value="1">할인(%)</option>
									<option id="type" value="2">할인 (금액)</option>
									<option id="type" value="3">증정</option>
									<option id="type" value="4">배송비무료</option>
									<option id="type" value="5">마일리지적립</option>
								</select>
								<input type="text" id="benefit" placeholder="혜택 내용" name="benefit">
								</td>
                            </tr>
                            <tr> <td>발급일 / 사용가능 시작일 </td> <td><input type="date" name="giveD" id="selGive"></td></tr>
                            <tr> <td>만료일 </td> <td><input type="date" name="endD" id="selEnd"> <input type="checkbox" value="i" name="noEx">만료일없음 </td></tr>
                            <tr> <td colspan="2"><span>혜택내용 작성예시 : 할인(%) - 30, 할인(금액) - 1000, 증정 - 상품코드, 배송비무료 - 작성x, 마일리지적립 - 3000</span></td> </tr>
                        </tbody>
                    </table>
                    
                    
                    <div class="adBtn"><input type="submit" value="쿠폰생성" class="adbtn1"></div>
                    
				<script type="text/javascript">
					document.getElementById('selGive').valueAsDate = new Date();
					document.getElementById('selEnd').valueAsDate = new Date();
				</script>
                    
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
