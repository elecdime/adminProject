<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>GH SHOP</title>
 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css">
    
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<style type="text/css">
.originImg {
	width: 500px;
	height: auto;
}

</style>
</head>


<body>


  <%@include file="../inc/head.jsp"%>
        <!--  left menu -->
  <%@include file="../inc/left.jsp"%>


         <%@include file="../inc/content.jsp"%>



<br>


			<div id="listdiv">
				<!-- 카테고리사용법
				insert into goods_category (cateName,cateCode) values('카테고리1','300');

				insert into goods_category (cateName,cateCode,cateCodeRef) values('카테고리3-1','301','300');


				insert into goods_category (cateName,cateCode,cateCodeRef) values('카테고리3-2','302','300');
			 -->

				<form role="form" method="post" autocomplete="off">

					<input type="hidden" name="n" value="${goods.goodsNo}" />

					
			</div>
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
		<col width="100">
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
		<col width="100">
		<col width="100">
		<col width="100">
				<!-- 가입일 -->
	
	</colgroup>
	<tbody>
		<tr align="center" bgcolor="#5e718f">
		
			
			<th class="listTitle">상품번호</th>
	
			<th class="listTitle">상품명</th>
			<th class="listTitle">카테고리</th>
	
			<th class="listTitle"><a href="" class="link01">제조사</a></th>
			
			<th class="listTitle"><a href="" class="link01">원산지</a></th>
			<th class="listTitle"><a href="" class="link01">모델명</a></th>
			<th class="listTitle"><a href="" class="link01">상품가격</a></th>
			<th class="listTitle"><a href="" class="link01">정가</a></th>
			<th class="listTitle"><a href="" class="link01">상품수량</a></th>
			<th class="listTitle"><a href="" class="link01">상품무게</a></th>
			<th class="listTitle"><a href="" class="link01">짧은설명</a></th>
			<th class="listTitle"><a href="" class="link01">상품 설명</a></th>
			<th class="listTitle"><a href="" class="link01">메모</a></th>
			<th class="listTitle"><a href="" class="link01">제조일</a></th>
			<th class="listTitle"><a href="" class="link01">수정</a></th>
			<th class="listTitle"><a href="" class="link01">삭제</a></th>
		
			<!-- <th class="listTitle" >주소</th> -->
		</tr>
			<tr>
			<td class="listData">${goods.goodsNo}</td>
			<td class="listData">${goods.goodsNm}</td>
			<td class="listData">${goods.cateName}</td>
			<td class="listData">${goods.makerNm}</td>
			
			<td class="listData">${goods.originNm}</td>
			
			<td class="listData">${goods.goodsModelNo}</td>
			<td class="listData">${goods.goodsPrice}</td>
			<td class="listData">${goods.fixedPrice}</td>

			<td class="listData">${goods.totalStock}</td>
			<td class="listData">${goods.goodsWeight}</td>

			<td class="listData">${goods.shortDescription}</td>
			<td class="listData"> ${goods.goodsMustInfo}</td>
 			<td class="listData">${goods.memo}</td>		
			<td class="listData">${goods.makeYmd}</td>
			
			<td class="listData">	<button type="button" id="modify_Btn" class="adbtn2">수정</button></td>
			<td class="listData">	 <button type="button" id="delete_Btn" class="adbtn1">삭제</button></td>
		
			</tr>
			</tbody>
						 
			</table>
				
			
			
						
			
	
<em>상품내용</em>
<br>

	 <span >
	 		${goods.goodsDescription}
	 </span>
</div>

		
		



			<!-- 		</div>

					<div class="inputArea">
						<label for="gdsImg">이미지</label> <input type="file" id="gdsImg"
							name="file" />
						<div class="select_img">
							<img src="" />
						</div>

						<script>
					$("#gdsImg").change(function(){
						if(this.files && this.files[0]) {
							var reader = new FileReader;
							reader.onload = function(data) {
								$(".select_img img").attr("src", data.target.result).width(500);								
							}
							reader.readAsDataURL(this.files[0]);
						}
					});
				</script> -->



		</div>

		

			<script>
  			var formObj = $("form[role='form']");
  
  				$("#modify_Btn").click(function(){
 				  formObj.attr("action", "${pageContext.request.contextPath}/aProduct/productupdate");
  					 formObj.attr("method", "get")
  					 formObj.submit();
 					alert("상품 수정시 카테고리 재기입 필수");
  				});
  				$("#delete_Btn").click(function(){
  					 
  					 var con = confirm("정말로 삭제하시겠습니까?");
  					 
  					 if(con) {      
  					  formObj.attr("action", "${pageContext.request.contextPath}/aProduct/deleteproduct");
  					  formObj.submit();
  					 }
  					});
 </script>
		

		</form>

	</div>

	</div>
	</div>
	<!--  seller_wrap  -->



	<script>
// 컨트롤러에서 데이터 받기
var jsonData = JSON.parse('${category}');
console.log(jsonData);

var cate1Arr = new Array();
var cate1Obj = new Object();

// 1차 분류 셀렉트 박스에 삽입할 데이터 준비
for(var i = 0; i < jsonData.length; i++) {
 
 if(jsonData[i].level == "1") {
  cate1Obj = new Object();  //초기화
  cate1Obj.cateCode = jsonData[i].cateCode;
  cate1Obj.cateName = jsonData[i].cateName;
  cate1Arr.push(cate1Obj);
 }
}

// 1차 분류 셀렉트 박스에 데이터 삽입
var cate1Select = $("select.category1")

for(var i = 0; i < cate1Arr.length; i++) {
 cate1Select.append("<option value='" + cate1Arr[i].cateCode + "'>"
      + cate1Arr[i].cateName + "</option>"); 
}

$(document).on("change", "select.category1", function(){

	 var cate2Arr = new Array();
	 var cate2Obj = new Object();
	 
	 // 2차 분류 셀렉트 박스에 삽입할 데이터 준비
	 for(var i = 0; i < jsonData.length; i++) {
	  
	  if(jsonData[i].level == "2") {
	   cate2Obj = new Object();  //초기화
	   cate2Obj.cateCode = jsonData[i].cateCode;
	   cate2Obj.cateName = jsonData[i].cateName;
	   cate2Obj.cateCodeRef = jsonData[i].cateCodeRef;
	   
	   cate2Arr.push(cate2Obj);
	  }
	 }
	 
	 var cate2Select = $("select.category2");
	 
	 /*
	 for(var i = 0; i < cate2Arr.length; i++) {
	   cate2Select.append("<option value='" + cate2Arr[i].cateCode + "'>"
	        + cate2Arr[i].cateName + "</option>");
	 }
	 */
	 
	 cate2Select.children().remove();

	 $("option:selected", this).each(function(){
	  
	  var selectVal = $(this).val();  
	  cate2Select.append("<option value=''>전체</option>");
	  
	  for(var i = 0; i < cate2Arr.length; i++) {
	   if(selectVal == cate2Arr[i].cateCodeRef) {
	    cate2Select.append("<option value='" + cate2Arr[i].cateCode + "'>"
	         + cate2Arr[i].cateName + "</option>");
	   }
	  }
	  
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
</body>
</html>
